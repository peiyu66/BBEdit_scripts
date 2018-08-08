tell application "BBEdit"
	activate
	replace "\\r\\r\\r" using "\\r\\r" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "\\r\\r" using "<r><r>" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "\\r" using "<r>" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "<r><r>" using "<r>\\r" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^(\\d+<r>)" using "<r>" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	sort lines text 1 of text document 1 output options {replacing target:true}
	add line numbers text 1 of text document 1
	replace "<r>" using "\\r" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "\\r\\r\\r" using "\\r" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	select insertion point before line 1 of text window 1
	set properties of text document 1 to {line breaks:DOS, encoding:1.970562616E+9}
	save text document 1
end tell