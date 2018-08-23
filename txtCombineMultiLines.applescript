tell application "BBEdit"
	activate
	repeat 15 times
		replace "^(.+)\\r(.+)" using "\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	repeat 10 times
		replace "^([^第\\r].+[^，。！？」\"…——c.])$\\r\\r^(.*[，。！？」\"])\\r\\r" using "\\1\\2\\r\\r" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	select insertion point before line 1 of text window 1
end tell
