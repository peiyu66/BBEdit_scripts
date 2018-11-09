tell application "BBEdit"
	activate
	
	#全型空格改為半型空格、2個空格合併為1個空格
	replace "　" using " " searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "　　" using "  " searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^　　" using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^　" using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "　　$" using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "　$" using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	
	repeat 3 times --移除每行首行末的空格
		replace "^  " using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
		replace "^ " using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
		replace "  $" using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
		replace " $" using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	
	repeat 5 times --以逗號結束者視為本文內斷折行，接回下句
		replace "^(.+[，、「])[\\r]+(.+)$" using "\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	
	repeat 5 times --以句號結束者視為本文，移除其單行之內的多餘空格或折行
		--replace "^([^。」？！”]+)\\r(.+[。！？」])$" using "\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
		replace "^(.+) (.+[。！？」])$" using "\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	
	repeat 5 times --移除2行以上的空行，使各行中間只空一行
		replace "\\r\\r\\r" using "\\r\\r" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	
	#相鄰兩行中間插入空行，使各行中間只空一行
	repeat 3 times
		replace "^(.+)\\r(.+)" using "\\1\\r\\r\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	
	#改用全型標點
	replace "\"(.+?)\"" using "「\\1」" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "“" using "「" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "”" using "」" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "‘" using "『" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "’" using "』" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "?" using "？" searching in text 1 of text window 1 options {starting at top:true}
	replace "!" using "！" searching in text 1 of text window 1 options {starting at top:true}
	replace "," using "，" searching in text 1 of text window 1 options {starting at top:true}
	replace ":" using "：" searching in text 1 of text window 1 options {starting at top:true}
	
	repeat 5 times --去章節前多餘空行
		replace "^\\r\\r\\r([第]+[0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[章節卷折集話回])([^。」”\\r]*)$" using "\\r\\r\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
		replace "^\\r\\r\\r([卷][0-9|1234567890一二三四五六七八九十百○〇零廿卅]+)([^。」？！”\\r]*)$" using "\\r\\r\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
		replace "^\\r\\r\\r([0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[章節卷折集話])([^。」！？”\\r]*)$" using "\\r\\r\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
		replace "^\\r\\r\\r([（\\(<【《][0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[）\\)>】》])([^。」！？”\\r]*)$" using "\\r\\r\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	
	#先全部縮排
	replace "^([^\\r]+)$" using "　　\\1" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	
	#章節前空行及凸排
	#第幾章節的標題
	replace "^　　([第]+[0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[章節卷折部集話回])([^。」”\\r]*)$" using "\\r\\r\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	#卷開頭的標題
	replace "^　　([卷|段][0-9|1234567890一二三四五六七八九十百○〇零廿卅]+)([^。」？！”\\r]*)$" using "\\r\\r\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	#數字開頭的章節
	replace "^　　([0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[章節卷折集話])([^。」！？”\\r]*)$" using "\\r\\r\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	#只有數字開頭的標題
	replace "^　　([（\\(<【《]*[0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[）\\)>】》 \\.\\-、]*)([^，。！？」”\\r]*)$" using "\\r\\r\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	
	#移除文開頭的空行及縮排
	repeat 5 times
		replace "^([\\r　]*)" using "" searching in lines 1 thru 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	
	#特別凸排
	replace "^　　(作者[^。”\\r！？]+)$" using "\\1" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^　　([^。”\\r！？]*簡介[^。”\\r！？]*)$" using "\\r\\1" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^　　(序[^。”\\r！？]*)$" using "\\r\\1" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^　　(前言[^。”\\r！？]*)$" using "\\r\\1" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^　　(引子[^。”\\r！？]*)$" using "\\r\\1" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^　　(楔子[^。”\\r！？]*)$" using "\\r\\1" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^　　(結語[^。”\\r！？]*)$" using "\\r\\1" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^　　(後記[^。”\\r！？]*)$" using "\\r\\1" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^　　([<【《][^。”\\r！？]+)$" using "\\1" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	--replace "^　　([^，;。”\\r！？：「」—…]+?)$" using "\\1" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	
	select insertion point before line 1 of text window 1
end tell
