tell application "BBEdit"
	activate
	
	#直排及簡繁
	replace "★☆★☆★☆輕小說文庫\\(Www\\.WenKu8\\.com\\)☆★☆★☆★" using "" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "([^裡外上兩三四東西南北])面(包|糰|餅)([^慘圍裹抄括含])" using "\\1麵\\2\\3" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "十捲" using "十卷" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "(千鈞一)發|([金銀黑白長短頭捲毛])發([^出生抖球言揮現展])|([^出爆])發([量型])" using "\\1\\2髮\\3" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "(^|[^[0-9|a-z|\\-:,\\.\\\\/月])([0-9]{1,2}[a-z|\\.'′]{0,1})([^0-9|a-z|\\.\\-:,\\\\/月])|(^|[^[0-9|a-z|\\-:\\.\\\\/'])([a-z]{1,1}[0-9|\\.\\+\\-′']{0,1})([^0-9|a-z|\\.\\-:：\\\\/])" using "\\1\\4[\\2\\5]\\3\\6" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	replace "(^|[^[0-9|a-z|\\-:,\\.\\\\/月])([0-9]{1,2}[a-z|\\.'′]{0,1})([^0-9|a-z|\\.\\-:,\\\\/月])|(^|[^[0-9|a-z|\\-:\\.\\\\/'])([a-z]{1,1}[0-9|\\.\\+\\-′']{0,1})([^0-9|a-z|\\.\\-:：\\\\/])" using "\\1\\4[\\2\\5]\\3\\6" searching in text 1 of text window 1 options {search mode:grep, starting at top:true, wrap around:false, backwards:false, case sensitive:false, match words:false, extend selection:false}
	
	select insertion point before line 1 of text window 1
	
end tell

