tell application "BBEdit"
	activate
	repeat 18 times
		replace "(?s)^([第]+[0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[章節卷折部集話回])(.*?)^([第]+[0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[章節卷折部集話回])" using "\\1\\2<t>\\3" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
		try
			find "(?s)<t>(.+)" searching in text 1 of text window 1 options {search mode:grep, starting at top:true} with selecting match
			set sel to (get selection)
			if not sel = {} then
				cut selection
				select insertion point before line 1 of text window 1
				make new text document at project window 1
				paste
				replace "<t>" using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
			end if
		end try
		find "^(.+)$" searching in text 1 of text window 1 options {search mode:grep, starting at top:true} with selecting match
		copy selection
		try
			set name of document 1 to (the clipboard) & ".txt"
		end try
		select insertion point before line 1 of text window 1
	end repeat
	
end tell
