tell application "BBEdit"
	activate
	#擇一pattern據以分割章節
	set pType to choose from list {"第n章", "第x01章", "第x1章", "第1章", "第n卷", "卷n"} with title "據以切割章節的標題格式？" default items {"第n章"}
	if pType = {"第n章"} then
		set pattern to "^([第卷 |0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[章節卷折部集回話][^。」”\\r]*?)$"
	else if pType = {"第x01章"} then
		set pattern to "^([第 |0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[零0○〇][一1][章節折部集話回][^。」”\\r]*?)$"
	else if pType = {"第x1章"} then
		set pattern to "^([第 |0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[一1][章節折部集話回][^。」”\\r]*?)$"
	else if pType = {"第1章"} then
		set pattern to "^([第卷 |0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[卷部][^\\r]*?[第序一1]+?[章話幕][^。」”\\r]*?)$"
	else if pType = {"第n卷"} then
		set pattern to "^([第卷 |0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[節卷折部集話回][^。」”\\r]*?)$"
	else if pType = {"卷n"} then
		set pattern to "^([（\\(<【《第卷]*[0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[）\\)>】》 \\.\\-、]*[^。！？」”\\r]*?)$"
	else
		return
	end if
	(*
	set msg to "據以切割章節的標題格式？"
	display dialog msg buttons {"第n章", "", "取消"} default button "取消" cancel button "取消"
	if button returned of result = "第n章" then
		#章節的標題
		display dialog msg buttons {"逐章", "逐卷", "x01章"} default button "逐章"
		if button returned of result = "逐章" then
			set pattern to "^([第卷 |0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[章節卷折部集話回][^。」”\\r]*?)$"
			set pType to "逐章"
		else if button returned of result = "逐卷" then
			##卷等非章的標題
			set pattern to "^([第卷 |0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[節卷折部集話回][^。」”\\r]*?)$"
			set pType to "逐卷"
		else if button returned of result = "x01章" then
			set pattern to "^([第 |0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[零0○〇][一1][章節折部集話回][^。」”\\r]*?)$"
			set pType to "x01章"
		else
			return
		end if
	else if button returned of result = "卷n" then
		#只有數字結尾的標題
		set pattern to "^([（\\(<【《第卷]*[0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[）\\)>】》 \\.\\-、]*[^。！？」”\\r]*?)$"
		set pType to "卷n"
	else
		return
	end if
	*)
	
	#自訂格式
	--set pattern to "^([第]*[0-9|1234567890一二三四五六七八九十百○〇零廿卅]+[節卷折部集話回][^。」”\\r]*?)$"
	
	
	#先算共有幾個章節
	set countFound to 0
	set endFound to false
	set fromTop to true
	select insertion point before line 1 of text window 1
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
		set selection to (the clipboard) & "
"
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
		if pType = {"卷n"} then
			set t to ""
		else
			find "^(.+)$" searching in line 1 of text window 1 options {search mode:grep, starting at top:true} with selecting match
			set t to " " & selection as string
		end if
		#檔案名稱是標題冠數值，即 n+t.txt，這是為了正確排序
		try
			set name of document 1 to n & t & ".txt"
		end try
		select insertion point before line 1 of text window 1
	end repeat
	
end tell
