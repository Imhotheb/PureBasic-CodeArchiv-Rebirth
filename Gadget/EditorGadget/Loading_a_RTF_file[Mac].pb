;   Description: Loading a RTF file
;        Author: wilbert
;          Date: 2012-09-17
;            OS: Mac
; English-Forum: http://www.purebasic.fr/english/viewtopic.php?p=390956#p390956
;  French-Forum: 
;  German-Forum: 
; -----------------------------------------------------------------------------

CompilerIf #PB_Compiler_OS<>#PB_OS_MacOS
  CompilerError "MacOs only!"
CompilerEndIf

If OpenWindow(0, 0, 0, 320, 150, "EditorGadget", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
  
  EditorGadget(0, 10, 10, 300, 130)
  
  AttributedString = CocoaMessage(0, 0, "NSAttributedString alloc")
  CocoaMessage(@AttributedString, AttributedString, "initWithPath:$", @"filename.rtf", "documentAttributes:", #Null)
  If AttributedString
    TextStorage = CocoaMessage(0, GadgetID(0), "textStorage")
    CocoaMessage(0, TextStorage, "setAttributedString:", AttributedString)
    CocoaMessage(0, AttributedString, "release")
  EndIf
  
  Repeat : Until WaitWindowEvent() = #PB_Event_CloseWindow
  
EndIf
