;   Description: Sets the state of a StatusBarProgress fast without animation
;        Author: Sicro
;          Date: 2011-09-18
;            OS: Windows
; English-Forum: 
;  French-Forum: 
;  German-Forum: http://www.purebasic.fr/german/viewtopic.php?p=295657#p295657
; -----------------------------------------------------------------------------

CompilerIf #PB_Compiler_OS <> #PB_OS_Windows
  CompilerError "Supported OS are only: Windows"
CompilerEndIf

Procedure SetStatusBarProgressStateFast(StatusBar, Field, State, Style = 0, MinState = 0, MaxState = 100)
  
  If State < MaxState
    StatusBarProgress(StatusBar, Field, State + 1, Style, MinState, MaxState)
    StatusBarProgress(StatusBar, Field, State,     Style, MinState, MaxState)
  Else
    StatusBarProgress(StatusBar, Field, MaxState + 1, Style, MinState, MaxState + 1)
    StatusBarProgress(StatusBar, Field, MaxState,     Style, MinState, MaxState)
  EndIf
  
EndProcedure

;-Example
CompilerIf #PB_Compiler_IsMainFile
  
  ;#StatusBarProgressState = 100
  #StatusBarProgressState = 50
  
  If OpenWindow(0, 0, 0, 340, 50, "StatusBarProgress", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
    If Not CreateStatusBar(0, WindowID(0)): End: EndIf
    AddStatusBarField(340)
    StatusBarProgress(0, 0, 0, 0, 0, 100)
  
    AddWindowTimer(0,1,2000)
  
    Repeat
      Event = WaitWindowEvent()
  
      If Event = #PB_Event_Timer
        SetStatusBarProgressStateFast(0, 0, #StatusBarProgressState, 0, #PB_Ignore, 100)
      EndIf
    Until Event = #PB_Event_CloseWindow
  EndIf
  
CompilerEndIf
