tell application "BBEdit"
	activate
	tell application "Finder" to set rPath to (container of (path to me)) as text
	repeat with i from 1 to count of text documents
		select text document i
		run script file rPath & "txtFormatIndent.applescript"
		run script file rPath & "setFileName.applescript"
	end repeat
end tell