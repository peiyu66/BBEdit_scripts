tell application "BBEdit"
	activate
	#簡繁誤轉
	replace "★☆★☆★☆輕小說文庫\\(Www\\.WenKu8\\.com\\)☆★☆★☆★" using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "([春義和龍吃碗肉乾泡煮炒利麥杯拉素])面|([^裡外上兩三四東西南北])面([食碗粉團糰糊包條餅館疙])([^慘圍裹抄括含])" using "\\1\\2麵\\3\\4" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "([裡外上兩三四東西南北])麵|麵(無表情|孔|面)" using "\\1面\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "(干鈞一)發|([金銀黑白長短頭捲毛秀])發([^出生抖球言揮現展洩])|([^出爆])發([梢量型])" using "\\1\\2髮\\3" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "(萬里無|風|積|積雨|叢|飛機|浮|烏|陰|黑|白|煙消|九霄|的|多|星|朵|山)云([^云])|云(消|散|層|集|端|覆雨|見日|彩|朵|吐霧)" using "\\1雲\\2\\3" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "輕松" using "輕鬆" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "十捲" using "十卷" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "几乎" using "幾乎" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	
	#全型空格改為半型空格、2個空格合併為1個空格
	replace "　" using " " searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "　　" using "  " searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^　　" using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^　" using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "　　$" using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "　$" using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	# 先還原數字直排
	replace "\\[([a-z|0-9|\\.]+)\\]" using "\\1" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	
	repeat 3 times --移除每行首行末的空格
		replace "^  " using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
		replace "^ " using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
		replace "  $" using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
		replace " $" using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	
	repeat 5 times --以逗號結束者視為本文內斷折行，接回下句
		replace "^(.+[，、「])[\\r]+(.+)$" using "\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	
	repeat 15 times --以句號結束者視為本文，移除其單行之內的多餘空格或折行
		--replace "^([^。」？！”]+)\\r(.+[。！？」])$" using "\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
		replace "^([^a-z|0-9|　\\]+?) ([^a-z|0-9]+?[。！？」])$" using "\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	
	repeat 5 times --移除2行以上的空行，使各行中間只空一行
		replace "\\r\\r\\r" using "\\r\\r" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	
	#相鄰兩行中間插入空行，使各行中間只空一行
	repeat 3 times
		replace "^(.+)\\r(.+)" using "\\1\\r\\r\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	
	#改用全型標點
	replace "\"(.+?)\"" using "「\\1」" searching in text 1 of text window 1 options {search mode:grep, starting at top:true}
	replace "“" using "「" searching in text 1 of text window 1 options {starting at top:true}
	replace "”" using "」" searching in text 1 of text window 1 options {starting at top:true}
	replace "‘" using "『" searching in text 1 of text window 1 options {starting at top:true}
	replace "’" using "』" searching in text 1 of text window 1 options {starting at top:true}
	replace "\\(" using "（" searching in text 1 of text window 1 options {starting at top:true}
	replace "\\)" using "）" searching in text 1 of text window 1 options {starting at top:true}
	replace "\\[" using "[" searching in text 1 of text window 1 options {starting at top:true}
	replace "\\]" using "]" searching in text 1 of text window 1 options {starting at top:true}
	replace "?" using "？" searching in text 1 of text window 1 options {starting at top:true}
	replace "!" using "！" searching in text 1 of text window 1 options {starting at top:true}
	replace ":" using "：" searching in text 1 of text window 1 options {starting at top:true}
	replace "^(.*?)＂(.+?)＂(.*?)$" using "\\1『\\2』\\3" searching in text 1 of text window 1 options {starting at top:true}
	--直排時用~~才能轉向
	replace "～" using "~" searching in text 1 of text window 1 options {starting at top:true}
	repeat 5 times
		replace "([^0-9]),|,([^0-9])" using "\\1，\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true}
		--時分秒還是要用半型冒號
		replace "(^|[：:])([0-9]{2})：([0-9]{2})($|[：:])" using "\\1\\2:\\3\\4" searching in text 1 of text window 1 options {search mode:grep, starting at top:true}
	end repeat
	
	repeat 5 times --去章節篇前多餘空行
		replace "^\\r\\r\\r([第]+[0-9|1234567890一二三四五六七八九十百○〇零廿卅卌０１２３４５６７８９]+[章節篇卷折集話回條])([^。」”\\r]*)$" using "\\r\\r\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
		replace "^\\r\\r\\r([卷][0-9|1234567890一二三四五六七八九十百○〇零廿卅卌０１２３４５６７８９]+)([^。」？！”\\r]*)$" using "\\r\\r\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
		replace "^\\r\\r\\r([0-9|1234567890一二三四五六七八九十百○〇零廿卅卌０１２３４５６７８９]+[章節篇卷折集話])([^。」！？”\\r]*)$" using "\\r\\r\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
		replace "^\\r\\r\\r([（\\(<【《][0-9|1234567890一二三四五六七八九十百○〇零廿卅卌０１２３４５６７８９]+[）\\)>】》])([^。」！？”\\r]*)$" using "\\r\\r\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	
	#先全部縮排
	replace "^([^\\r]+)$" using "　　\\1" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	
	#章節前空行及凸排
	#第幾章節的標題
	replace "^　　([第]+[0-9|1234567890一二三四五六七八九十百○〇零廿卅卌０１２３４５６７８９]+[章節篇卷折部集話回條])([^。」”\\r]*)$" using "\\r\\r\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	#卷開頭的標題
	replace "^　　([卷|段][0-9|1234567890一二三四五六七八九十百○〇零廿卅卌０１２３４５６７８９]+)([^。」？！”\\r]*)$" using "\\r\\r\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	#數字開頭的章節
	replace "^　　([0-9|1234567890一二三四五六七八九十百○〇零廿卅卌０１２３４５６７８９]+[章節篇卷折集話、])([^。」！？”\\r]*)$" using "\\r\\r\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	#只有數字開頭的標題
	replace "^　　([（\\(<【《]*[0-9|1234567890一二三四五六七八九十百○〇零廿卅卌０１２３４５６７８９]+[）\\)>】》 \\.\\-、 \\r]+)([^，。！？」”\\r秒分小天]*)$" using "\\r\\r\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	
	#移除文開頭的空行及縮排
	repeat 5 times
		replace "^([\\r　]*)" using "" searching in lines 1 thru 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	end repeat
	
	#特別凸排
	replace "^　　(作者|序|前言|引子|楔子|結語|後記|文案|篇後語|[<])([^。”\\r！？]+)$" using "\\r\\1\\2" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^　　([^。”\\r！？]*簡介[^。”\\r！？]*?)$" using "\\r\\1\\r" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "^　　([^。”\\r！？]*篇後語[^”\\r！？]*?)$" using "\\r\\1\\r" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	
	#英數字直排
	replace "(?s)^(\\x{3000}\\x{3000})(台版|網譯版|翻譯|圖源|錄入|掃圖|校對|轉自|初校|修圖|二校|排版|出資|資源|論壇|發佈|發布|潤色)(.+?)(\\x{3000}\\x{3000}|[第\\[\\<【])(?!台版|網譯版|翻譯|圖源|錄入|掃圖|校對|轉自|初校|修圖|二校|排版|出資|資源|論壇|發佈|發布|潤色)" using "\\1\\2\\3\\r\\r\\4\\5" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "(^|[^[0-9|a-z|\\-:,\\.\\\\\\/月<])([0-9]{1,2}[a-z|\\.'′]{0,1})([^0-9|a-z|\\.\\-:,\\\\\\/月>])|(^|[^[0-9|a-z|\\-:\\.\\\\\\/'<])([a-z]{1,1}[0-9|\\.\\+\\-′']{0,1})([^0-9|a-z|\\.\\-:：\\\\\\/>'])" using "\\1\\4[\\2\\5]\\3\\6" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	
	
	select insertion point before line 1 of text window 1
	
end tell


