FasdUAS 1.101.10   ��   ��    k             l     ��  ��    > 8 http://macscripter.net/viewtopic.php?pid=125444#p125444     � 	 	 p   h t t p : / / m a c s c r i p t e r . n e t / v i e w t o p i c . p h p ? p i d = 1 2 5 4 4 4 # p 1 2 5 4 4 4   
  
 l     ��������  ��  ��        l      ��  ��    Assumes that the CSV text adheres to the convention:
   Records are delimited by LFs or CRLFs (but CRs are also allowed here).
   The last record in the text may or may not be followed by an LF or CRLF (or CR).
   Fields in the same record are separated by commas (unless specified differently by parameter).
   The last field in a record must not be followed by a comma.
   Trailing or leading spaces in unquoted fields are not ignored (unless so specified by parameter).
   Fields containing quoted text are quoted in their entirety, any space outside them being ignored.
   Fields enclosed in double-quotes are to be taken verbatim, except for any included double-quote pairs, which are to be translated as double-quote characters.
       
   No other variations are currently supported.      �  0   A s s u m e s   t h a t   t h e   C S V   t e x t   a d h e r e s   t o   t h e   c o n v e n t i o n : 
       R e c o r d s   a r e   d e l i m i t e d   b y   L F s   o r   C R L F s   ( b u t   C R s   a r e   a l s o   a l l o w e d   h e r e ) . 
       T h e   l a s t   r e c o r d   i n   t h e   t e x t   m a y   o r   m a y   n o t   b e   f o l l o w e d   b y   a n   L F   o r   C R L F   ( o r   C R ) . 
       F i e l d s   i n   t h e   s a m e   r e c o r d   a r e   s e p a r a t e d   b y   c o m m a s   ( u n l e s s   s p e c i f i e d   d i f f e r e n t l y   b y   p a r a m e t e r ) . 
       T h e   l a s t   f i e l d   i n   a   r e c o r d   m u s t   n o t   b e   f o l l o w e d   b y   a   c o m m a . 
       T r a i l i n g   o r   l e a d i n g   s p a c e s   i n   u n q u o t e d   f i e l d s   a r e   n o t   i g n o r e d   ( u n l e s s   s o   s p e c i f i e d   b y   p a r a m e t e r ) . 
       F i e l d s   c o n t a i n i n g   q u o t e d   t e x t   a r e   q u o t e d   i n   t h e i r   e n t i r e t y ,   a n y   s p a c e   o u t s i d e   t h e m   b e i n g   i g n o r e d . 
       F i e l d s   e n c l o s e d   i n   d o u b l e - q u o t e s   a r e   t o   b e   t a k e n   v e r b a t i m ,   e x c e p t   f o r   a n y   i n c l u d e d   d o u b l e - q u o t e   p a i r s ,   w h i c h   a r e   t o   b e   t r a n s l a t e d   a s   d o u b l e - q u o t e   c h a r a c t e r s . 
               
       N o   o t h e r   v a r i a t i o n s   a r e   c u r r e n t l y   s u p p o r t e d .        l     ��������  ��  ��        i         I      �� ���� 0 	csvtolist 	csvToList      o      ���� 0 csvtext csvText   ��  o      ���� 0 implementation  ��  ��    k    <       l     ��  ��   YS The 'implementation' parameter must be a record. Leave it empty ({}) for the default assumptions: ie. comma separator, leading and trailing spaces in unquoted fields not to be trimmed. Otherwise it can have a 'separator' property with a text value (eg. {separator:tab}) and/or a 'trimming' property with a boolean value ({trimming:true}).     �    �   T h e   ' i m p l e m e n t a t i o n '   p a r a m e t e r   m u s t   b e   a   r e c o r d .   L e a v e   i t   e m p t y   ( { } )   f o r   t h e   d e f a u l t   a s s u m p t i o n s :   i e .   c o m m a   s e p a r a t o r ,   l e a d i n g   a n d   t r a i l i n g   s p a c e s   i n   u n q u o t e d   f i e l d s   n o t   t o   b e   t r i m m e d .   O t h e r w i s e   i t   c a n   h a v e   a   ' s e p a r a t o r '   p r o p e r t y   w i t h   a   t e x t   v a l u e   ( e g .   { s e p a r a t o r : t a b } )   a n d / o r   a   ' t r i m m i n g '   p r o p e r t y   w i t h   a   b o o l e a n   v a l u e   ( { t r i m m i n g : t r u e } ) .   ! " ! r      # $ # l     %���� % b      & ' & o     ���� 0 implementation   ' K     ( ( �� ) *�� 0 	separator   ) m     + + � , ,  , * �� -���� 0 trimming   - m    ��
�� boovfals��  ��  ��   $ K       . . �� / 0�� 0 	separator   / o      ���� 0 	separator   0 �� 1���� 0 trimming   1 o      ���� 0 trimming  ��   "  2 3 2 l   ��������  ��  ��   3  4 5 4 h    �� 6�� 0 o   6 l      7 8 9 7 k       : :  ; < ; j     �� =�� 0 qdti   = I     �� >���� 0 gettextitems getTextItems >  ? @ ? o    ���� 0 csvtext csvText @  A�� A m     B B � C C  "��  ��   <  D E D j    �� F�� 0 currentrecord currentRecord F J    ����   E  G H G j    �� I��  0 possiblefields possibleFields I m    ��
�� 
msng H  J�� J j    �� K�� 0 
recordlist 
recordList K J    ����  ��   8   Lists for fast access.    9 � L L .   L i s t s   f o r   f a s t   a c c e s s . 5  M N M l   ��������  ��  ��   N  O P O l   �� Q R��   Q Q K o's qdti is a list of the CSV's text items, as delimited by double-quotes.    R � S S �   o ' s   q d t i   i s   a   l i s t   o f   t h e   C S V ' s   t e x t   i t e m s ,   a s   d e l i m i t e d   b y   d o u b l e - q u o t e s . P  T U T l   �� V W��   V R L Assuming the convention mentioned above, the number of items is always odd.    W � X X �   A s s u m i n g   t h e   c o n v e n t i o n   m e n t i o n e d   a b o v e ,   t h e   n u m b e r   o f   i t e m s   i s   a l w a y s   o d d . U  Y Z Y l   �� [ \��   [ S M Even-numbered items (if any) are quoted field values and don't need parsing.    \ � ] ] �   E v e n - n u m b e r e d   i t e m s   ( i f   a n y )   a r e   q u o t e d   f i e l d   v a l u e s   a n d   d o n ' t   n e e d   p a r s i n g . Z  ^ _ ^ l   �� ` a��   ` R L Odd-numbered items are everything else. Empty strings in odd-numbered slots    a � b b �   O d d - n u m b e r e d   i t e m s   a r e   e v e r y t h i n g   e l s e .   E m p t y   s t r i n g s   i n   o d d - n u m b e r e d   s l o t s _  c d c l   �� e f��   e R L (except at the beginning and end) indicate escaped quotes in quoted fields.    f � g g �   ( e x c e p t   a t   t h e   b e g i n n i n g   a n d   e n d )   i n d i c a t e   e s c a p e d   q u o t e s   i n   q u o t e d   f i e l d s . d  h i h l   ��������  ��  ��   i  j k j r    # l m l n   ! n o n 1    !��
�� 
txdl o 1    ��
�� 
ascr m o      ���� 	0 astid   k  p q p r   $ - r s r l  $ + t���� t I  $ +�� u��
�� .corecnte****       **** u n  $ ' v w v o   % '���� 0 qdti   w o   $ %���� 0 o  ��  ��  ��   s o      ���� 0 	qdticount 	qdtiCount q  x y x r   . 1 z { z m   . /��
�� boovfals { o      ���� "0 quoteinprogress quoteInProgress y  | } | P   2 ~ �� ~ Y   7 ��� � � � � l  A � � � � k   A � �  � � � r   A I � � � n   A G � � � 4   D G�� �
�� 
cobj � o   E F���� 0 i   � n  A D � � � o   B D���� 0 qdti   � o   A B���� 0 o   � o      ���� 0 thisbit thisBit �  ��� � Z   J � � ��� � G   J Y � � � l  J Q ����� � ?   J Q � � � l  J O ����� � I  J O�� ���
�� .corecnte****       **** � o   J K���� 0 thisbit thisBit��  ��  ��   � m   O P����  ��  ��   � l  T W ����� � =  T W � � � o   T U���� 0 i   � o   U V���� 0 	qdticount 	qdtiCount��  ��   � k   \� � �  � � � l  \ \�� � ���   � T N This is either a non-empty string or the last item in the list, so it doesn't    � � � � �   T h i s   i s   e i t h e r   a   n o n - e m p t y   s t r i n g   o r   t h e   l a s t   i t e m   i n   t h e   l i s t ,   s o   i t   d o e s n ' t �  � � � l  \ \�� � ���   � K E represent a quoted quote. Check if we've just been dealing with any.    � � � � �   r e p r e s e n t   a   q u o t e d   q u o t e .   C h e c k   i f   w e ' v e   j u s t   b e e n   d e a l i n g   w i t h   a n y . �  � � � Z   \ � � � ��� � l  \ ] ����� � o   \ ]���� "0 quoteinprogress quoteInProgress��  ��   � k   ` � � �  � � � l  ` `�� � ���   � M G All the parts of a quoted field containing quoted quotes have now been    � � � � �   A l l   t h e   p a r t s   o f   a   q u o t e d   f i e l d   c o n t a i n i n g   q u o t e d   q u o t e s   h a v e   n o w   b e e n �  � � � l  ` `�� � ���   � A ; passed over. Coerce them together using a quote delimiter.    � � � � v   p a s s e d   o v e r .   C o e r c e   t h e m   t o g e t h e r   u s i n g   a   q u o t e   d e l i m i t e r . �  � � � r   ` e � � � m   ` a � � � � �  " � n      � � � 1   b d��
�� 
txdl � 1   a b��
�� 
ascr �  � � � r   f y � � � c   f w � � � l  f u ����� � n   f u � � � 7  i u�� � �
�� 
cobj � o   m o���� 0 a   � l  p t ����� � \   p t � � � o   q r���� 0 i   � m   r s���� ��  ��   � n  f i � � � o   g i���� 0 qdti   � o   f g���� 0 o  ��  ��   � m   u v��
�� 
TEXT � o      ���� 0 	thisfield 	thisField �  � � � l  z z�� � ���   � C = Replace the reconstituted quoted quotes with literal quotes.    � � � � z   R e p l a c e   t h e   r e c o n s t i t u t e d   q u o t e d   q u o t e s   w i t h   l i t e r a l   q u o t e s . �  � � � r   z � � � � m   z } � � � � �  " " � n      � � � 1   ~ ���
�� 
txdl � 1   } ~��
�� 
ascr �  � � � r   � � � � � n  � � � � � 2  � ���
�� 
citm � o   � ����� 0 	thisfield 	thisField � o      ���� 0 	thisfield 	thisField �  � � � r   � � � � � m   � � � � � � �  " � n      � � � 1   � ���
�� 
txdl � 1   � ���
�� 
ascr �  � � � l  � ��� � ���   � \ V Store the field in the "current record" list and cancel the "quote in progress" flag.    � � � � �   S t o r e   t h e   f i e l d   i n   t h e   " c u r r e n t   r e c o r d "   l i s t   a n d   c a n c e l   t h e   " q u o t e   i n   p r o g r e s s "   f l a g . �  � � � r   � � � � � c   � � � � � o   � ����� 0 	thisfield 	thisField � m   � ���
�� 
TEXT � n       � � �  ;   � � � n  � � � � � o   � ����� 0 currentrecord currentRecord � o   � ����� 0 o   �  ��� � r   � � � � � m   � ���
�� boovfals � o      ���� "0 quoteinprogress quoteInProgress��   �    l  � ����� ?   � � o   � ����� 0 i   m   � ��� ��  ��   �~ k   � �  l  � ��}	
�}  	 N H The preceding, even-numbered item is a complete quoted field. Store it.   
 � �   T h e   p r e c e d i n g ,   e v e n - n u m b e r e d   i t e m   i s   a   c o m p l e t e   q u o t e d   f i e l d .   S t o r e   i t . �| r   � � n   � � 4   � ��{
�{ 
cobj l  � ��z�y \   � � o   � ��x�x 0 i   m   � ��w�w �z  �y   n  � � o   � ��v�v 0 qdti   o   � ��u�u 0 o   n        ;   � � n  � � o   � ��t�t 0 currentrecord currentRecord o   � ��s�s 0 o  �|  �~  ��   �  l  � ��r�q�p�r  �q  �p    l  � ��o �o  60 Now parse this item's field-separator-delimited text items, which are either non-quoted fields or stumps from the removal of quoted fields. Any that contain line breaks must be further split to end one record and start another. These could include multiple single-field records without field separators.     �!!`   N o w   p a r s e   t h i s   i t e m ' s   f i e l d - s e p a r a t o r - d e l i m i t e d   t e x t   i t e m s ,   w h i c h   a r e   e i t h e r   n o n - q u o t e d   f i e l d s   o r   s t u m p s   f r o m   t h e   r e m o v a l   o f   q u o t e d   f i e l d s .   A n y   t h a t   c o n t a i n   l i n e   b r e a k s   m u s t   b e   f u r t h e r   s p l i t   t o   e n d   o n e   r e c o r d   a n d   s t a r t   a n o t h e r .   T h e s e   c o u l d   i n c l u d e   m u l t i p l e   s i n g l e - f i e l d   r e c o r d s   w i t h o u t   f i e l d   s e p a r a t o r s . "#" r   � �$%$ I   � ��n&�m�n 0 gettextitems getTextItems& '(' o   � ��l�l 0 thisbit thisBit( )�k) o   � ��j�j 0 	separator  �k  �m  % n     *+* o   � ��i�i  0 possiblefields possibleFields+ o   � ��h�h 0 o  # ,-, r   � �./. l  � �0�g�f0 I  � ��e1�d
�e .corecnte****       ****1 n  � �232 o   � ��c�c  0 possiblefields possibleFields3 o   � ��b�b 0 o  �d  �g  �f  / o      �a�a (0 possiblefieldcount possibleFieldCount- 454 Y   ��6�`78�_6 k   ��99 :;: r   � �<=< n   � �>?> 4   � ��^@
�^ 
cobj@ o   � ��]�] 0 j  ? n  � �ABA o   � ��\�\  0 possiblefields possibleFieldsB o   � ��[�[ 0 o  = o      �Z�Z 0 	thisfield 	thisField; C�YC Z   ��DE�XFD l  � �G�W�VG ?   � �HIH l  � �J�U�TJ I  � ��SKL
�S .corecnte****       ****K o   � ��R�R 0 	thisfield 	thisFieldL �QM�P
�Q 
koclM m   � ��O
�O 
cpar�P  �U  �T  I m   � ��N�N �W  �V  E k   ��NN OPO l  � ��MQR�M  Q P J This "field" contains one or more line endings. Split it at those points.   R �SS �   T h i s   " f i e l d "   c o n t a i n s   o n e   o r   m o r e   l i n e   e n d i n g s .   S p l i t   i t   a t   t h o s e   p o i n t s .P TUT r   �VWV n  �XYX 2  ��L
�L 
cparY o   � ��K�K 0 	thisfield 	thisFieldW o      �J�J 0 thesefields theseFieldsU Z[Z l �I\]�I  \ � � With each of these end-of-record fields except the last, complete the field list for the current record and initialise another. Omit the first "field" if it's just the stub from a preceding quoted field.   ] �^^�   W i t h   e a c h   o f   t h e s e   e n d - o f - r e c o r d   f i e l d s   e x c e p t   t h e   l a s t ,   c o m p l e t e   t h e   f i e l d   l i s t   f o r   t h e   c u r r e n t   r e c o r d   a n d   i n i t i a l i s e   a n o t h e r .   O m i t   t h e   f i r s t   " f i e l d "   i f   i t ' s   j u s t   t h e   s t u b   f r o m   a   p r e c e d i n g   q u o t e d   f i e l d .[ _`_ Y  pa�Hbc�Ga k  kdd efe r  ghg n  iji 4  �Fk
�F 
cobjk o  �E�E 0 k  j o  �D�D 0 thesefields theseFieldsh o      �C�C 0 	thisfield 	thisFieldf lml Z Uno�B�An l @p�@�?p G  @qrq G  .sts G  &uvu l w�>�=w ?  xyx o  �<�< 0 k  y m  �;�; �>  �=  v l !$z�:�9z ?  !${|{ o  !"�8�8 0 j  | m  "#�7�7 �:  �9  t l ),}�6�5} = ),~~ o  )*�4�4 0 i   m  *+�3�3 �6  �5  r l 1>��2�1� ?  1>��� l 1<��0�/� I 1<�.��-
�. .corecnte****       ****� I  18�,��+�, 0 trim  � ��� o  23�*�* 0 	thisfield 	thisField� ��)� m  34�(
�( boovtrue�)  �+  �-  �0  �/  � m  <=�'�'  �2  �1  �@  �?  o r  CQ��� I  CJ�&��%�& 0 trim  � ��� o  DE�$�$ 0 	thisfield 	thisField� ��#� o  EF�"�" 0 trimming  �#  �%  � n      ���  ;  OP� n JO��� o  KO�!�! 0 currentrecord currentRecord� o  JK� �  0 o  �B  �A  m ��� r  Vb��� n V[��� o  W[�� 0 currentrecord currentRecord� o  VW�� 0 o  � n      ���  ;  `a� n [`��� o  \`�� 0 
recordlist 
recordList� o  [\�� 0 o  � ��� r  ck��� J  ce��  � n     ��� o  fj�� 0 currentrecord currentRecord� o  ef�� 0 o  �  �H 0 k  b m  �� c \  ��� l ���� I ���
� .corecnte****       ****� o  	�� 0 thesefields theseFields�  �  �  � m  �� �G  ` ��� l qq����  � � � With the last end-of-record "field", just complete the current field list if the field's not the stub from a following quoted field.   � ���
   W i t h   t h e   l a s t   e n d - o f - r e c o r d   " f i e l d " ,   j u s t   c o m p l e t e   t h e   c u r r e n t   f i e l d   l i s t   i f   t h e   f i e l d ' s   n o t   t h e   s t u b   f r o m   a   f o l l o w i n g   q u o t e d   f i e l d .� ��� r  qu��� n  qs���  ;  rs� o  qr�� 0 thesefields theseFields� o      �� 0 	thisfield 	thisField� ��� Z v������ l v���
�	� G  v���� l vy���� A  vy��� o  vw�� 0 j  � o  wx�� (0 possiblefieldcount possibleFieldCount�  �  � l |����� ?  |���� l |����� I |�� ���
�  .corecnte****       ****� o  |}���� 0 	thisfield 	thisField��  �  �  � m  ������  �  �  �
  �	  � r  ����� I  ��������� 0 trim  � ��� o  ������ 0 	thisfield 	thisField� ���� o  ������ 0 trimming  ��  ��  � n      ���  ;  ��� n ����� o  ������ 0 currentrecord currentRecord� o  ������ 0 o  �  �  �  �X  F k  ���� ��� l ��������  � � � This is a "field" not containing a line break. Insert it into the current field list if it's not just a stub from a preceding or following quoted field.   � ���2   T h i s   i s   a   " f i e l d "   n o t   c o n t a i n i n g   a   l i n e   b r e a k .   I n s e r t   i t   i n t o   t h e   c u r r e n t   f i e l d   l i s t   i f   i t ' s   n o t   j u s t   a   s t u b   f r o m   a   p r e c e d i n g   o r   f o l l o w i n g   q u o t e d   f i e l d .� ���� Z ��������� l �������� G  ����� G  ����� l �������� F  ����� l �������� ?  ����� o  ������ 0 j  � m  ������ ��  ��  � l �������� G  ����� l �������� A  ����� o  ������ 0 j  � o  ������ (0 possiblefieldcount possibleFieldCount��  ��  � l �������� = ����� o  ������ 0 i  � o  ������ 0 	qdticount 	qdtiCount��  ��  ��  ��  ��  ��  � l �������� F  ����� l �������� = ����� o  ������ 0 j  � m  ������ ��  ��  � l �������� = ����� o  ������ 0 i  � m  ������ ��  ��  ��  ��  � l �������� ?  ����� l �������� I �������
�� .corecnte****       ****� I  ��������� 0 trim  � ��� o  ������ 0 	thisfield 	thisField� ���� m  ����
�� boovtrue��  ��  ��  ��  ��  � m  ������  ��  ��  ��  ��  � r  ����� I  ��������� 0 trim  � ��� o  ������ 0 	thisfield 	thisField� ���� o  ������ 0 trimming  ��  ��  � n      ���  ;  ��� n ��   o  ������ 0 currentrecord currentRecord o  ������ 0 o  ��  ��  ��  �Y  �` 0 j  7 m   � ����� 8 o   � ����� (0 possiblefieldcount possibleFieldCount�_  5  l ����������  ��  ��   �� l ������   I C Otherwise, this item IS an empty text representing a quoted quote.    � �   O t h e r w i s e ,   t h i s   i t e m   I S   a n   e m p t y   t e x t   r e p r e s e n t i n g   a   q u o t e d   q u o t e .��   � 	 l ��
����
 o  ������ "0 quoteinprogress quoteInProgress��  ��  	  l ������   Z T It's another quote in a field already identified as having one. Do nothing for now.    � �   I t ' s   a n o t h e r   q u o t e   i n   a   f i e l d   a l r e a d y   i d e n t i f i e d   a s   h a v i n g   o n e .   D o   n o t h i n g   f o r   n o w .  l ������ ?  �� o  ������ 0 i   m  ������ ��  ��   �� k  �  l ������   K E It's the first quoted quote in a quoted field. Note the index of the    � �   I t ' s   t h e   f i r s t   q u o t e d   q u o t e   i n   a   q u o t e d   f i e l d .   N o t e   t h e   i n d e x   o f   t h e  l ������   T N preceding even-numbered item (the first part of the field) and flag "quote in    �   �   p r e c e d i n g   e v e n - n u m b e r e d   i t e m   ( t h e   f i r s t   p a r t   o f   t h e   f i e l d )   a n d   f l a g   " q u o t e   i n !"! l ����#$��  # R L progress" so that the repeat idles past the remaining part(s) of the field.   $ �%% �   p r o g r e s s "   s o   t h a t   t h e   r e p e a t   i d l e s   p a s t   t h e   r e m a i n i n g   p a r t ( s )   o f   t h e   f i e l d ." &'& r  �()( \  �*+* o  � ���� 0 i  + m   ���� ) o      ���� 0 a  ' ,��, r  -.- m  ��
�� boovtrue. o      ���� "0 quoteinprogress quoteInProgress��  ��  ��  ��   � %  Parse odd-numbered items only.    � �// >   P a r s e   o d d - n u m b e r e d   i t e m s   o n l y .�� 0 i   � m   : ;����  � o   ; <���� 0 	qdticount 	qdtiCount � m   < =����   ����
�� conscase��  ��   } 010 l ��������  ��  ��  1 232 l ��45��  4 F @ At the end of the repeat, store any remaining "current record".   5 �66 �   A t   t h e   e n d   o f   t h e   r e p e a t ,   s t o r e   a n y   r e m a i n i n g   " c u r r e n t   r e c o r d " .3 787 Z .9:����9 l ;����; > <=< n >?> o  ���� 0 currentrecord currentRecord? o  ���� 0 o  = J  ����  ��  ��  : r  *@A@ n #BCB o  #���� 0 currentrecord currentRecordC o  ���� 0 o  A n      DED  ;  ()E n #(FGF o  $(���� 0 
recordlist 
recordListG o  #$���� 0 o  ��  ��  8 HIH r  /4JKJ o  /0���� 	0 astid  K n     LML 1  13��
�� 
txdlM 1  01��
�� 
ascrI NON l 55��������  ��  ��  O P��P L  5<QQ n 5;RSR o  6:���� 0 
recordlist 
recordListS o  56���� 0 o  ��    TUT l     ��������  ��  ��  U VWV l     ��XY��  X > 8 Get the possibly more than 4000 text items from a text.   Y �ZZ p   G e t   t h e   p o s s i b l y   m o r e   t h a n   4 0 0 0   t e x t   i t e m s   f r o m   a   t e x t .W [\[ i    ]^] I      ��_���� 0 gettextitems getTextItems_ `a` o      ���� 0 txt  a b��b o      ���� 	0 delim  ��  ��  ^ k     Vcc ded r     fgf n    hih 1    ��
�� 
txdli 1     ��
�� 
ascrg o      ���� 	0 astid  e jkj r    lml o    ���� 	0 delim  m n     non 1    
�
� 
txdlo 1    �~
�~ 
ascrk pqp r    rsr l   t�}�|t I   �{u�z
�{ .corecnte****       ****u n   vwv 2   �y
�y 
citmw o    �x�x 0 txt  �z  �}  �|  s o      �w�w 0 ticount tiCountq xyx r    z{z J    �v�v  { o      �u�u 0 	textitems 	textItemsy |}| Y    M~�t��~ k   % H�� ��� r   % *��� [   % (��� o   % &�s�s 0 i  � m   & '�r�r�� o      �q�q 0 j  � ��� Z  + 8���p�o� l  + .��n�m� ?   + .��� o   + ,�l�l 0 j  � o   , -�k�k 0 ticount tiCount�n  �m  � r   1 4��� o   1 2�j�j 0 ticount tiCount� o      �i�i 0 j  �p  �o  � ��h� r   9 H��� b   9 F��� o   9 :�g�g 0 	textitems 	textItems� n   : E��� 7  ; E�f��
�f 
citm� o   ? A�e�e 0 i  � o   B D�d�d 0 j  � o   : ;�c�c 0 txt  � o      �b�b 0 	textitems 	textItems�h  �t 0 i   m    �a�a � o     �`�` 0 ticount tiCount� m     !�_�_�} ��� r   N S��� o   N O�^�^ 	0 astid  � n     ��� 1   P R�]
�] 
txdl� 1   O P�\
�\ 
ascr� ��� l  T T�[�Z�Y�[  �Z  �Y  � ��X� L   T V�� o   T U�W�W 0 	textitems 	textItems�X  \ ��� l     �V�U�T�V  �U  �T  � ��� l     �S���S  � 9 3 Trim any leading or trailing spaces from a string.   � ��� f   T r i m   a n y   l e a d i n g   o r   t r a i l i n g   s p a c e s   f r o m   a   s t r i n g .� ��R� i    ��� I      �Q��P�Q 0 trim  � ��� o      �O�O 0 txt  � ��N� o      �M�M 0 trimming  �N  �P  � k     r�� ��� Z     o���L�K� l    ��J�I� o     �H�H 0 trimming  �J  �I  � k    k�� ��� Y    0��G���F� Z    +���E�� l   ��D�C� C   ��� o    �B�B 0 txt  � 1    �A
�A 
spac�D  �C  � r    '��� n    %��� 7   %�@��
�@ 
ctxt� m    !�?�? � m   " $�>�>��� o    �=�= 0 txt  � o      �<�< 0 txt  �E  �  S   * +�G 0 i  � m    �;�; � \    ��� l   ��:�9� I   �8��7
�8 .corecnte****       ****� o    	�6�6 0 txt  �7  �:  �9  � m    �5�5 �F  � ��� Y   1 ]��4���3� Z   A X���2�� l  A D��1�0� D   A D��� o   A B�/�/ 0 txt  � 1   B C�.
�. 
spac�1  �0  � r   G T��� n   G R��� 7  H R�-��
�- 
ctxt� m   L N�,�, � m   O Q�+�+��� o   G H�*�* 0 txt  � o      �)�) 0 txt  �2  �  S   W X�4 0 i  � m   4 5�(�( � \   5 <��� l  5 :��'�&� I  5 :�%��$
�% .corecnte****       ****� o   5 6�#�# 0 txt  �$  �'  �&  � m   : ;�"�" �3  � ��!� Z  ^ k��� �� l  ^ a���� =  ^ a��� o   ^ _�� 0 txt  � 1   _ `�
� 
spac�  �  � r   d g��� m   d e�� ���  � o      �� 0 txt  �   �  �!  �L  �K  � ��� l  p p����  �  �  � ��� L   p r�� o   p q�� 0 txt  �  �R       ������  � ���� 0 	csvtolist 	csvToList� 0 gettextitems getTextItems� 0 trim  � � ������ 0 	csvtolist 	csvToList� ��� �  ��
� 0 csvtext csvText�
 0 implementation  �  � �	��������� �������������	 0 csvtext csvText� 0 implementation  � 0 	separator  � 0 trimming  � 0 o  � 	0 astid  � 0 	qdticount 	qdtiCount� "0 quoteinprogress quoteInProgress� 0 i  �  0 thisbit thisBit�� 0 a  �� 0 	thisfield 	thisField�� (0 possiblefieldcount possibleFieldCount�� 0 j  �� 0 thesefields theseFields�� 0 k  � �� +������ 6��������� ���� ��� ��� ����������������� 0 	separator  �� 0 trimming  �� �� 0 o  � �����������
�� .ascrinit****      � ****� k     ��  ;��  D��  G    J����  ��  ��  � ���������� 0 qdti  �� 0 currentrecord currentRecord��  0 possiblefields possibleFields�� 0 
recordlist 
recordList�  B�������������� 0 gettextitems getTextItems�� 0 qdti  �� 0 currentrecord currentRecord
�� 
msng��  0 possiblefields possibleFields�� 0 
recordlist 
recordList�� *b   �l+ �Ojv�O�Ojv�
�� 
ascr
�� 
txdl�� 0 qdti  
�� .corecnte****       ****
�� 
cobj
�� 
bool
�� 
TEXT
�� 
citm�� 0 currentrecord currentRecord�� 0 gettextitems getTextItems��  0 possiblefields possibleFields
�� 
kocl
�� 
cpar�� 0 trim  �� 0 
recordlist 
recordList�=����f�%E[�,E�Z[�,E�ZO��K S�O��,E�O��,j 
E�OfE�O�g��k�lh ��,�/E�O�j 
j
 �� �&�� E���,FO��,[�\[Z�\Z�k2�&E�Oa ��,FO�a -E�Oa ��,FO��&�a ,6FOfE�Y �k ��,�k/�a ,6FY hO*��l+ �a ,FO�a ,j 
E�Ok�kh �a ,�/E�O�a a l 
k ��a -E�O kk�j 
kkh ��/E�O�k
 �k�&
 �k �&
 *�el+ j 
j�& *��l+ �a ,6FY hO�a ,�a ,6FOjv�a ,F[OY��O�6E�O��
 �j 
j�& *��l+ �a ,6FY hY L�k	 ��
 �� �&�&
 �k 	 �k �&�&
 *�el+ j 
j�& *��l+ �a ,6FY h[OY��OPY � hY �k �kE�OeE�Y h[OY�/VO�a ,jv �a ,�a ,6FY hO���,FO�a ,E� ��^�������� 0 gettextitems getTextItems�� ����   ������ 0 txt  �� 	0 delim  ��   ���������������� 0 txt  �� 	0 delim  �� 	0 astid  �� 0 ticount tiCount�� 0 	textitems 	textItems�� 0 i  �� 0 j   ������������
�� 
ascr
�� 
txdl
�� 
citm
�� .corecnte****       ****�������� W��,E�O���,FO��-j E�OjvE�O 1k��h ��E�O�� �E�Y hO��[�\[Z�\Z�2%E�[OY��O���,FO�� ����������� 0 trim  �� ����   ������ 0 txt  �� 0 trimming  ��   �������� 0 txt  �� 0 trimming  �� 0 i   ���������
�� .corecnte****       ****
�� 
spac
�� 
ctxt������ s� l +k�j  kkh �� �[�\[Zl\Zi2E�Y [OY��O +k�j  kkh �� �[�\[Zk\Z�2E�Y [OY��O��  �E�Y hY hO�ascr  ��ޭ