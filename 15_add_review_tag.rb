# usage: `ruby 15_add_review_tag.rb`
#
# add a 'needs-review' tag to all bookmarks
# in the CSV files created by 10_build_list.rb
#
# run that script to completion before using this one.
#
# this is a separate script because this should be an optional step

require 'csv'

Dir['10_*.csv'].each do |file|
  input = CSV.read(file, headers: true)
  out = CSV.open(file.gsub(/10/, '15'), 'wb')

  input.each do |row|
    tags = row['tags'].to_s.split(',')
    tags << 'needs-review'
    row['tags'] = tags.join(',')
    out << row
  end
end
