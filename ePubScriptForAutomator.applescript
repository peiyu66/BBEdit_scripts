on run {input, parameters}
  --把Automator製作的橫排ePub轉為中文直排，特別是其中[]內的英數字為單行內直排
	repeat with f in input
		set fpath to f as string
		tell application "BBEdit"
			activate
			--display dialog fpath
			replace "<spine toc=\"ncx\">" using "<spine page-progression-direction=\"rtl\" toc=\"ncx\">" searching in {file fpath} options {starting at top:true, showing results:false} with saving without text files only
			replace "<dc:language>en</dc:language>" using "<dc:language>zh_TW</dc:language>" searching in {file fpath} options {starting at top:true, showing results:false} with saving without text files only
			replace "audio { width: 100% }" using "audio { width: 100% }\\rhtml {\\r	writing-mode: vertical-rl;\\r	-webkit-writing-mode: vertical-rl;\\r	-epub-writing-mode: vertical-rl;\\r	}\\r.number {-webkit-text-combine: horizontal;}" searching in {file fpath} options {starting at top:true, showing results:false} with saving without text files only
			
			replace "\\[([0-9|a-z|\\.′']+)\\]" using "<span class=\"number\">\\1</span>" searching in {file fpath} options {search mode:grep, starting at top:true, showing results:false} with saving without text files only
			
			replace "; font: 12.0px Helvetica" using "" searching in {file fpath} options {starting at top:true, showing results:false} with saving without text files only
			set the dt to (do shell script "date '+%Y%m%d%H%M%S'")
			replace "<meta name=\"dtb:uid\" content=\"123456789X\">" using "<meta name=\"dtb:uid\" content=\"" & dt & "peiyu\">" searching in {file fpath} options {starting at top:true, showing results:false} with saving without text files only
			replace "<dc:identifier id=\"BookId\" opf:scheme=\"ISBN\">123456789X</dc:identifier>" using "<dc:identifier id=\"BookId\" opf:scheme=\"ISBN\">" & dt & "peiyu</dc:identifier>" searching in {file fpath} options {starting at top:true, showing results:false} with saving without text files only
		end tell
	end repeat
end run
