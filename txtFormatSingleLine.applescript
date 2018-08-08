tell application "BBEdit"
	activate
	replace "　" using " " searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "　　" using "  " searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	repeat 30 times
		replace "^  " using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
		replace "^ " using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	repeat 10 times
		replace "^(.*) (.*) (.*) (.*) (.*)。" using "\\1\\2\\3\\4\\5。" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	repeat 10 times
		replace "^(.*) (.*)。" using "\\1\\2。" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	repeat 10 times
		replace "\\r\\r\\r\\r\\r" using "\\r\\r\\r\\r" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	repeat 5 times
		replace "^(.+)\\r(.+)" using "\\1\\r\\r\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	replace "\"(.+?)\"" using "「\\1」" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "“" using "「" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "”" using "」" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "‘" using "『" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "’" using "』" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "?" using "？" searching in text 1 of text window 1 options {starting at top:true}
	replace "!" using "！" searching in text 1 of text window 1 options {starting at top:true}
	replace "," using "，" searching in text 1 of text window 1 options {starting at top:true}
	replace "^第([0-9|一二三四五六七八九十百○零]+)([^。！」”]+)$" using "\\r\\r\\r第\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^\\r\\r\\r\\r第([0-9|一二三四五六七八九十百○零]+)([^。！」”]+)$" using "\\r\\r\\r第\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^\\r\\r\\r\\r第([0-9|一二三四五六七八九十百○零]+)([^。！」”]+)$" using "\\r\\r\\r第\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^\\r\\r\\r\\r第([0-9|一二三四五六七八九十百○零]+)([^。！」”]+)$" using "\\r\\r\\r第\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "(?s)^\\r\\r(.*)$" using "\\1" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "(?s)^\\r(.*)$" using "\\1" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "(?s)^\\r(.*)$" using "\\1" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^(.+)\\r(.+)$" using "\\1\\r\\r\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	select insertion point before line 1 of text window 1
end tell