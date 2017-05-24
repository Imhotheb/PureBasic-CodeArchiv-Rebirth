;   Description: Sets the state of a ProgressBarGadget fast without animation
;        Author: Sicro
;          Date: 2011-09-17
;            OS: Windows
; English-Forum: 
;  French-Forum: 
;  German-Forum: http://www.purebasic.fr/german/viewtopic.php?p=295616#p295616
; -----------------------------------------------------------------------------

CompilerIf #PB_Compiler_OS <> #PB_OS_Windows
  CompilerError "Supported OS are only: Windows"
CompilerEndIf

Procedure SetProgressBarStateFast(Gadget, State)
  
  MaxState = GetGadgetAttribute(Gadget, #PB_ProgressBar_Maximum)
  
  If State < MaxState
    SetGadgetState(Gadget, State + 1)
    SetGadgetState(Gadget, State)
  Else
    SetGadgetAttribute(Gadget, #PB_ProgressBar_Maximum, MaxState + 1)
    SetGadgetState(Gadget, MaxState + 1)
    SetGadgetAttribute(Gadget, #PB_ProgressBar_Maximum, MaxState)
  EndIf
  
EndProcedure

;-Example
CompilerIf #PB_Compiler_IsMainFile
  
  ;#ProgressBarState = 100
  #ProgressBarState = 50
  
  If OpenWindow(0, 0, 0, 570, 100, "ProgressBarGadget", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
    ProgressBarGadget(0,  35, 35, 500,  30, 0, 100)
    
    AddWindowTimer(0, 1, 2000)
    
    Repeat
      Event = WaitWindowEvent()
      
      If Event = #PB_Event_Timer
        SetProgressBarStateFast(0, #ProgressBarState)
        RemoveWindowTimer(0, 1)
      EndIf
    Until Event = #PB_Event_CloseWindow
  EndIf
  
CompilerEndIf
