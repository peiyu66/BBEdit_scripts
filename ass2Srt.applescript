tell application "BBEdit"
	activate
	replace "^((?!\\d\\:\\d\\d\\:\\d\\d\\.\\d\\d\\,\\d\\:\\d\\d\\:\\d\\d\\.\\d\\d).)*$
" using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "{(.*?)}" using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^(.+)(\\d\\:\\d\\d\\:\\d\\d\\.\\d\\d)\\,(\\d\\:\\d\\d\\:\\d\\d\\.\\d\\d)(.+)\\,(.+)$" using "<r>0\\2 --> 0\\3<r>\\5<r>" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	--replace "<r><r>" using "<r>\\r" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	--replace "^(\\d+<r>)" using "<r>" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	sort lines text 1 of text document 1 output options {replacing target:true}
	add line numbers text 1 of text document 1
	replace "<r>" using "\\r" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "\\r\\r\\r" using "\\r" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	select insertion point before line 1 of text window 1
	set properties of text document 1 to {line breaks:DOS, encoding:1.970562616E+9}
	--set d to active document of text window 1
	--if (d's on disk) then
	--set the_file to d's file
	--set fName to name of d as string
	--set new_name to (fName & ".srt")
	--tell application "Finder"
	--set name of file the_file to new_name
	--end tell
	--end if
	--save text document 1
end tell