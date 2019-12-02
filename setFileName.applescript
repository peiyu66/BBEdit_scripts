tell application "BBEdit"
	activate
	set n to ""
	set t to ""
	set d to active document of text window 1
	if (d's on disk) then
		set fName to name of d as string
		set AppleScript's text item delimiters to "."
		set fNameItems to every text item of fName
		set AppleScript's text item delimiters to " "
		set fNameItems to every text item of item 1 of fNameItems
		set AppleScript's text item delimiters to ""
		set fn to item 1 of fNameItems
		try
			set fNumber to fn as number
			set n to fn & " "
		end try
	end if
	if n = "" then
		#把章節的中文數字提到第1行轉換成阿拉伯數字
		set n to ""
		set foundResult to find "[0-9|1234567890一二三四五六七八九十百○〇零廿卅]+" searching in line 1 of text window 1 options {search mode:grep, starting at top:true, showing results:false, returning results:false} with selecting match
		if foundResult's found then
			copy selection
			select insertion point before line 1 of text window 1
			set selection to (the clipboard) & return
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
			set n to (selection as string) & " "
			delete line 1 of text window 1
		end if
	end if
	#取章節標題為t
	#find "^(.+)$" searching in line 1 of text window 1 options {search mode:grep, starting at top:true} with selecting match
	find "^(.*[^\\.\\r])" searching in line 1 of text window 1 options {search mode:grep, starting at top:true} with selecting match
	set t to selection as string
	#檔案名稱是標題冠數值，即 n+t.txt，這是為了正確排序
	
	set new_name to (n & t & ".txt")
	
	if (d's on disk) then
		set the_file to d's file
		tell application "Finder"
			set name of file the_file to new_name
		end tell
	else -- it's a document that has never been saved
		set name of d to new_name
	end if
	select insertion point before line 1 of text window 1
	
	
end tell
