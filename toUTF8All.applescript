tell application "BBEdit"
	activate
	count text documents
	repeat with x from 1 to the result
		set properties of text document x to {line breaks:DOS, encoding:1.970562616E+9}
		save text document x
	end repeat
end tell