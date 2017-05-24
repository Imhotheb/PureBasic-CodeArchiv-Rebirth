;   Description: Translates strings to keyboard events and executes them
;        Author: Sicro
;          Date: 2007-04-28
;            OS: Windows
; English-Forum: 
;  French-Forum: 
;  German-Forum: http://www.purebasic.fr/german/viewtopic.php?p=149551#p149551
; -----------------------------------------------------------------------------

CompilerIf #PB_Compiler_OS <> #PB_OS_Windows
  CompilerError "Supported OS are only: Windows"
CompilerEndIf

Procedure SendKeys(Keys.s)
  
  Protected i.l, KeyCode.w, VirtualKey.b, KeysState.b

  For i = 1 To Len(Keys)
    
    KeyCode = VkKeyScan_(Asc(Mid(Keys,i,1)))
    VirtualKey = KeyCode & $FF
    KeysState = (KeyCode >> 8) & $FF

    Select KeysState
      Case 1 ; Umschalt-Taste wird benoetigt
        keybd_event_(#VK_SHIFT,1,0,0)
      Case 6 ; "Alt Groß"-Taste wird benoetigt
        keybd_event_(#VK_RMENU,1,0,0)
    EndSelect

    keybd_event_(VirtualKey,1,0,0)
    keybd_event_(VirtualKey,1,#KEYEVENTF_KEYUP,0)

    Select KeysState
      Case 1 ; Umschalt-Taste wieder loslassen
        keybd_event_(#VK_SHIFT,1,#KEYEVENTF_KEYUP,0)
      Case 6 ; "Alt Groß"-Taste wieder loslassen
        keybd_event_(#VK_RMENU,1,#KEYEVENTF_KEYUP,0)
    EndSelect
    
  Next
  
EndProcedure

;-Example
CompilerIf #PB_Compiler_IsMainFile
  
  SendKeys("Hello World")
  
CompilerEndIf
