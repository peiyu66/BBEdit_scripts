tell application "BBEdit"
	activate
	
	#���Ƥ�²�c
	replace "���������������p����w\\(Www\\.WenKu8\\.com\\)������������" using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "([^�̥~�W��T�|�F��n�_])��(�]|�{|��)([^�G��q�۬A�t])" using "\\1��\\2\\3" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "�Q��" using "�Q��" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "(�d�v�@)�o|([���ȶ¥ժ��u�Y����])�o([^�X�ͧݲy�����{�i])|([^�X�z])�o([�q��])" using "\\1\\2�v\\3" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "(^|[^[0-9|a-z|\\-:,\\.\\\\/��])([0-9]{1,2}[a-z|\\.'��]{0,1})([^0-9|a-z|\\.\\-:,\\\\/��])|(^|[^[0-9|a-z|\\-:\\.\\\\/'])([a-z]{1,1}[0-9|\\.\\+\\-��']{0,1})([^0-9|a-z|\\.\\-:�G\\\\/])" using "\\1\\4[\\2\\5]\\3\\6" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "(^|[^[0-9|a-z|\\-:,\\.\\\\/��])([0-9]{1,2}[a-z|\\.'��]{0,1})([^0-9|a-z|\\.\\-:,\\\\/��])|(^|[^[0-9|a-z|\\-:\\.\\\\/'])([a-z]{1,1}[0-9|\\.\\+\\-��']{0,1})([^0-9|a-z|\\.\\-:�G\\\\/])" using "\\1\\4[\\2\\5]\\3\\6" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	
	select insertion point before line 1 of text window 1
	
end tell

