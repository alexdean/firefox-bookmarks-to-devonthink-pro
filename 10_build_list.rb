# usage: `ruby 10_build_list.rb your-bookmarks.json`
#
# consumes a firefox JSON bookmarks file and produces CSV representations of the bookmarks
# HTTP bookmarks are checked for validity


require 'json'
require 'csv'
require 'logger'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
require 'net/http'

$log = Logger.new($stdout)
$log.level = Logger::INFO

# key: guid of bookmark
# value: last modified time of bookmark
#
# used to resume a previously-interrupted execution of this script
#
# bookmarks in the file which have not changed since the last time we saw them
# will not be re-checked for validity
$seen = {}

Dir['10_*.csv'].each do |file|
  CSV.foreach(file, headers: true) do |row|
    $seen[row['guid']] = row['lastModified'].to_i
  end
end

# key: 'http', 'ftp', or 'discard'.
# value: a CSV object accepting rows of the specified type
#
# separate output files allows several things
#
#   - discards are easy to review as a group. not intermixed with valid bookmarks
#   - subsequent steps can deal only with valid bookmarks, without needing code
#     to separate valid records from invalid ones
#
# @see handle_place for info on how bookmarks are assigned a type
$outs = Hash.new do |hash, key|
  hash[key] = CSV.open("10_out_#{key}.csv", "ab") # , col_sep: '---'
  hash[key] << header_row
end

def header_row
  %w(
    guid
    lastModified
    dateAdded
    title
    comment
    tags
    uri
    error
  )
end

def handle_record(record)
  case record['type']
  when 'text/x-moz-place-container'
    handle_place_container(record)
  when 'text/x-moz-place'
    handle_place(record)
  when 'text/x-moz-place-separator'
  else
    raise "unknown record type:#{record['type']}"
  end
end

def handle_place_container(record)
  record['children'].each do |child|
    handle_record(child)
  end
end

def handle_place(record)
  # ftp
  # file
  # javascript
  # place
  # about

  lastModified = record['lastModified'].to_i/1000000

  $log.debug {"$seen[#{record['guid']}]:#{$seen[record['guid']]}, record['lastModified']:#{record['lastModified']}"}
  if $seen[record['guid']] && lastModified <= $seen[record['guid']]
    $log.info "(not modified): #{record['uri']}"
    return
  else
    $log.debug { "processing" }
  end

  type = nil
  url_error = nil

  if record['uri'][0..3] == 'http'
    type = 'http'
    final_url, url_error = verify(record['uri'])
  elsif record['uri'][0..2] == 'ftp'
    type = 'ftp'
    final_url = record['uri']
  end

  if type == nil || url_error
    type = 'discard'
  end

  comment = ''
  if record['annos'] && record['annos'].size > 0
    comment = record['annos']
      .select {|a| a['name'] == 'bookmarkProperties/description'}
      .select {|a| a['value'].to_s != '' }
      .map {|a| a['value'] }
      .join("\n")
  end

  $log.info "(#{type}): #{final_url}"


  $seen[record['guid']] = lastModified

  $outs[type] << [
    record['guid'],
    lastModified,
    record['dateAdded'].to_i/1000000,
    record['title'],
    comment,
    record['tags'],
    final_url,
    url_error
  ]
end

# check the uri_str using an HTTP HEAD request to verify that it refers to a valid resource
#
# redirects are followed recurively, up to the specified `limit`.
#
# @return [url, error code]
def verify(uri_str, limit = 10)
  # You should choose a better exception.
  if limit == 0
    $log.error 'too many HTTP redirects'
    return [nil, 'too many redirects']
  end

  $log.info "checking #{uri_str}"

  begin
    uri = URI(uri_str)
    http = Net::HTTP.start(uri.host, uri.port,
      use_ssl: uri.scheme == 'https'
    )
    request = Net::HTTP::Head.new uri
    response = http.request request

    case response
    when Net::HTTPSuccess then
      [response.uri.to_s, nil]
    when Net::HTTPRedirection then
      location = response['location']
      if location[0..3] != 'http'
        location = "#{uri.scheme}://#{uri.host}:#{uri.port}#{location}"
      end
      $log.warn "   #{uri_str} -> #{location}"
      verify(location, limit - 1)
    when Net::HTTPNotFound then
      [response.uri.to_s, response.code]
    else
      $log.error "#{uri_str}: #{response.class} response"
      [response.uri.to_s, "response: #{response.class}"]
    end
  rescue => e
    if response
      uri = response.uri.to_s
    else
      uri = uri_str
    end
    $log.error "#{uri} #{e.message} (#{e.class})"
    [uri, e.class.to_s]
  end
end

def usage
  "Usage: #{__FILE__} your-bookmarks.json"
end

if ARGV[0].nil?
  puts usage
  exit
end

if !File.exist?(ARGV[0])
  puts usage
  puts "  ''your-bookmarks.json' should be a JSON bookmarks backup exported from Firefox."
  exit
end

data = JSON.parse(File.read(ARGV[0]))

data['children'].each do |record|
  handle_record(record)
end

# puts data.size

# types
#   folders:
#     "type": "text/x-moz-place-container"
#     these have "children"
#     guid
#   bookmarks:
#     "type": "text/x-moz-place"
#     guid
#     dateAdded
#     maybe title
#     uri
#     tags (csv string)
#     "annos" array. contains entries
#       "name": "bookmarkProperties/description"
#       these have a "value" with a description
#       but value may be an empty string

# date added
# date modified

# check if url is still valid.
# use HEAD. 200 is ok. resolve 3xx's.

