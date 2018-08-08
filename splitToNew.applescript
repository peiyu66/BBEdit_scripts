tell application "BBEdit"
	activate
	try
		set selection to "<t>"
		find "(?s)<t>(.+)" searching in text 1 of text window 1 options {search mode:grep, starting at top:true} with selecting match
		set sel to (get selection)
		if not sel = {} then
			cut selection
			make new text document at project window 1
			paste
			replace "<t>" using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
		end if
	end try
	select insertion point before line 1 of text window 1
	find "^(.+)$" searching in text 1 of text window 1 options {search mode:grep, starting at top:true} with selecting match
	copy selection
	try
		set name of document 1 to (the clipboard) & ".txt"
	end try
end tell