Run("notepad.exe")
WinWait("[CLASS:Notepad]", "")
ControlSend("[CLASS:Notepad]", "", "[CLASS:Edit]", "This is some text.")

WinMenuSelectItem("[CLASS:Notepad]", "", "&File", "Save")
WinWait("[CLASS:#32770]", "Save")
WinActivate("[CLASS:#32770]", "Save")
ControlSend ("[CLASS:#32770]", "", "[CLASS:Edit]", "e:\test.txt")
ControlClick("[CLASS:#32770]", "", "[CLASS:Button; INSTANCE:2]")

If WinWait("[CLASS:#32770; TITLE:Confirm Save As]", "", 3) <> 0 Then
   ControlClick("[CLASS:#32770; TITLE:Confirm Save As]", "", "[CLASS:Button; INSTANCE:1]")
EndIf

WinClose("[CLASS:Notepad]", "")
WinWaitClose("[CLASS:Notepad]", "")
