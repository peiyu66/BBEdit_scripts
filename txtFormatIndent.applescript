tell application "BBEdit"
	activate
	
	#�����Ů�אּ�b���Ů�B2�ӪŮ�X�֬�1�ӪŮ�
	replace "�@" using " " searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "�@�@" using "  " searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^�@�@" using "  " searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^�@" using "  " searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	
	repeat 30 times --�����C��e�Ů�
		replace "^  " using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
		replace "^ " using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	
	repeat 10 times --������椧��2�ӥH�W���Ů�
		replace "^(.*) (.*) (.*) (.*) (.*)�C" using "\\1\\2\\3\\4\\5�C" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	
	repeat 10 times --�H�y�������̵�������A�������椧�����h�l�Ů�
		replace "^(.*) (.*)�C" using "\\1\\2�C" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	
	repeat 10 times --����2��H�W���Ŧ�A�ϦU�椤���u�Ť@��
		replace "\\r\\r\\r" using "\\r\\r" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	
	repeat 5 times --�۾F��椤�����J�Ŧ�A�ϦU�椤���u�Ť@��
		replace "^(.+)\\r(.+)" using "\\1\\r\\r\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	
	#��Υ������I
	replace "\"(.+?)\"" using "�u\\1�v" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "��" using "�u" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "��" using "�v" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "��" using "�y" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "��" using "�z" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "?" using "�H" searching in text 1 of text window 1 options {starting at top:true}
	replace "!" using "�I" searching in text 1 of text window 1 options {starting at top:true}
	replace "," using "�A" searching in text 1 of text window 1 options {starting at top:true}
	
	repeat 10 times --�h���`�e�h�l�Ŧ�
		replace "^\\r\\r\\r([��]*[0-9|�@�G�T�|�����C�K�E�Q�ʡ��s]+[���`����])([^�C�v��\\r]*)$" using "\\r\\r\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	
	#�������Y��
	replace "^([^\\r]+)$" using "�@�@\\1" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	#������}�Y���Ŧ���Y�ơA�M�᳹�`�e�Ŧ�ΥY��
	select insertion point before line 1 of text window 1
	set selection to "<top>"
	replace "^(?s)<top>([\\r]*)([�@]*)([^�@\\r]+)$" using "\\3" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^�@�@(�@�̡G[^�C��\\r�I�H]+)$" using "\\1" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^�@�@([^�C��\\r�I�H]*²���G[^�C��\\r�I�H]*)$" using "\\r\\1" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^�@�@(���y�G[^�C��\\r�I�H]+)$" using "\\r\\1" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^�@�@([��]*[0-9|�@�G�T�|�����C�K�E�Q�ʡ��s]+[���`����])([^�C�v��\\r]*)$" using "\\r\\r\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	
	select insertion point before line 1 of text window 1
end tell