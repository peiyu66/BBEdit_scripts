tell application "BBEdit"
	activate
	#擇一pattern據以分割章節
	#第幾章節開頭的標題
	set pattern to "^([第]+[0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[章節卷折部集話回][^。」”\\r]*?)$"
	#數字開頭的章節
	--set pattern to "^([0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[章節卷折集話][^。」！？”\\r]*?)$"
	#只有數字開頭的標題
	--set pattern to "^([（\\(<【《]*[0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[）\\)>】》 \\.\\-、]*[^。！？」”\\r]*?)$"
	
	
	#先算共有幾個章節
	set countFound to 0
	set endFound to false
	set fromTop to true
	repeat while not endFound
		set s to (find pattern searching in text 1 of text window 1 options {search mode:grep, starting at top:fromTop, showing results:false, returning results:false} with selecting match)
		if found of s then
			set countFound to countFound + 1
			set fromTop to false
		else
			set endFound to true
		end if
	end repeat
	
	#開始切割，首章節不必算入次數
	repeat countFound - 1 times
		replace "(?s)" & pattern & "(.*?)" & pattern using "\\1\\2<t>\\3" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
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
		
		#把章節的中文數字提到第1行轉換成阿拉伯數字
		find "[0-9|1234567890一二三四五六七八九十百○〇零廿卅]+" searching in line 1 of text window 1 options {search mode:grep, starting at top:true, showing results:false, returning results:false} with selecting match
		copy selection
		select insertion point before line 1 of text window 1
		set selection to (the clipboard) & "\r"
		#轉換數值
		replace "^[十]$" using "10" searching in line 1 of text window 1 options {search mode:grep, starting at top:false}
		replace "一([十百])" using "1\\1" searching in line 1 of text window 1 options {search mode:grep, starting at top:false}
		replace "^[十百]" using "1" searching in line 1 of text window 1 options {search mode:grep, starting at top:false}
		replace "[十]$" using "0" searching in line 1 of text window 1 options {search mode:grep, starting at top:false}
		replace "[百]$" using "00" searching in line 1 of text window 1 options {search mode:grep, starting at top:false}
		replace "[十百]" using "" searching in line 1 of text window 1 options {search mode:grep, starting at top:false}
		replace "一" using "1" searching in line 1 of text window 1 options {search mode:grep, starting at top:true}
		replace "[二廿]" using "2" searching in line 1 of text window 1 options {search mode:grep, starting at top:true}
		replace "[三卅]" using "3" searching in line 1 of text window 1 options {search mode:grep, starting at top:true}
		replace "四" using "4" searching in line 1 of text window 1 options {search mode:grep, starting at top:true}
		replace "五" using "5" searching in line 1 of text window 1 options {search mode:grep, starting at top:true}
		replace "六" using "6" searching in line 1 of text window 1 options {search mode:grep, starting at top:true}
		replace "七" using "7" searching in line 1 of text window 1 options {search mode:grep, starting at top:true}
		replace "八" using "8" searching in line 1 of text window 1 options {search mode:grep, starting at top:true}
		replace "九" using "9" searching in line 1 of text window 1 options {search mode:grep, starting at top:true}
		replace "[○〇零]" using "0" searching in line 1 of text window 1 options {search mode:grep, starting at top:true}
		replace "^([\\d][\\d])$" using "0\\1" searching in line 1 of text window 1 options {search mode:grep, starting at top:true}
		replace "^([\\d])$" using "00\\1" searching in line 1 of text window 1 options {search mode:grep, starting at top:true}
		#轉換完畢，取數值為n
		find "([\\d]+$)" searching in line 1 of text window 1 options {search mode:grep, starting at top:true} with selecting match	
		set n to selection as string
		delete line 1 of text window 1
		#取章節標題為t
		find "^(.+)$" searching in line 1 of text window 1 options {search mode:grep, starting at top:true} with selecting match
		set t to selection as string
		#檔案名稱是標題冠數值，即 n+t.txt，這是為了正確排序
		try
			set name of document 1 to n & " " & t & ".txt"
		end try
		select insertion point before line 1 of text window 1
	end repeat
	
end tell
