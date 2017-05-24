;   Description: Allows only characters for numbers (0 to 9 and dot)
;        Author: Keya
;          Date: 2017-02-28
;            OS: Windows, Linux, Mac
; English-Forum: http://www.purebasic.fr/english/viewtopic.php?f=12&t=67986
;  French-Forum: 
;  German-Forum: 
; -----------------------------------------------------------------------------

;##### CARET FUNCTIONS ##########################################################################
;// Special thanks to Shardik for his excellent caret/selection-related code which is the basis for this:
;// http://www.purebasic.fr/english/viewtopic.php?f=13&t=51950&start=3

CompilerIf #PB_Compiler_OS = #PB_OS_MacOS
  CompilerIf #PB_Compiler_Version < 470 Or (#PB_Compiler_Version >= 500 And Subsystem("Carbon"))
    ImportC ""
      GetControlData(ControlRef.L, ControlPartCode.L, TagName.L, BufferSize.L, *Buffer, *ActualSize)
      SetControlData(ControlRef.L, ControlPartCode.L, TagName.L, BufferSize.L, *Buffer)
    EndImport
    #kControlEditTextPart = 5
    #kControlEditTextSelectionTag = $73656C65 ;'sele'
    Structure ControlEditTextSelectionRec
      SelStart.W
      SelEnd.W
    EndStructure
  CompilerElse
    Global NSRangeZero.NSRange
    Procedure.i TextEditor(Gadget.i)
      Protected TextField.i = GadgetID(Gadget)
      Protected Window.i = CocoaMessage(0, TextField, "window")
      ProcedureReturn CocoaMessage(0, Window, "fieldEditor:", #YES, "forObject:", TextField)
    EndProcedure
  CompilerEndIf
CompilerEndIf


Procedure SetStringGadgetSelection(GadgetID.i, Start.i, Length.i=0)
  SetActiveGadget(gadgetid)
  CompilerSelect #PB_Compiler_OS
    CompilerCase #PB_OS_Windows
      SendMessage_(GadgetID(GadgetID), #EM_SETSEL, Start-1, Start-1)
    CompilerCase #PB_OS_Linux
      gtk_editable_select_region_(GadgetID(gadgetid), Start-1, Start-1)
    CompilerCase #PB_OS_MacOS
      CompilerIf #PB_Compiler_Version < 470 Or (#PB_Compiler_Version >= 500 And Subsystem("Carbon"))
        Protected TextSelection.ControlEditTextSelectionRec
        TextSelection\selStart = Start - 1
        TextSelection\selEnd = Start -1
        SetControlData(GadgetID(GadgetID), #kControlEditTextPart, #kControlEditTextSelectionTag, SizeOf(ControlEditTextSelectionRec), @TextSelection)
      CompilerElse
        Protected Range.NSRange\location = Start - 1 : Range\length = 0
        CocoaMessage(0, TextEditor(GadgetID), "setSelectedRange:@", @Range)
      CompilerEndIf
  CompilerEndSelect
EndProcedure


Procedure.i GetCaretPosition(GadgetID.i)
  Protected Start.i = 0
  Protected Stop.i = 0
  CompilerSelect #PB_Compiler_OS
    CompilerCase #PB_OS_Windows
      SendMessage_(GadgetID(GadgetID.i), #EM_GETSEL, @Start.i, @Stop.i)
      ProcedureReturn Stop + 1
    CompilerCase #PB_OS_Linux
      Stop = gtk_editable_get_position_(GadgetID(gadgetid))
      ProcedureReturn Stop + 1
    CompilerCase #PB_OS_MacOS
      CompilerIf #PB_Compiler_Version < 470 Or (#PB_Compiler_Version >= 500 And Subsystem("Carbon"))
        Protected TextSelection.ControlEditTextSelectionRec
        GetControlData(GadgetID(GadgetID), #kControlEditTextPart, #kControlEditTextSelectionTag, SizeOf(ControlEditTextSelectionRec), @TextSelection.ControlEditTextSelectionRec, 0)
        ProcedureReturn TextSelection\End + 1
      CompilerElse
        Protected Range.NSRange
        CocoaMessage(@Range, TextEditor(GadgetID), "selectedRange")
        ProcedureReturn Range\location + Range\length + 1
      CompilerEndIf
  CompilerEndSelect
EndProcedure


;##### STRING FILTER ###############################################################################

;RestrictChars - Takes an input string like "123ab45" and returns "12345"
Procedure RestrictChars(*pchr.Ascii, slen)
  If slen
  *pout.Ascii = *pchr
  For i = 1 To slen
    Select *pchr\a
      Case '0' To '9'  ;Allow 0-9
        *pchr+SizeOf(Character): *pout+SizeOf(Character)
      Case '.':        ;Allow only one instance of a '.' period character
        dotcnt+1
        If dotcnt=1
          *pchr+SizeOf(Character): *pout+SizeOf(Character)
        Else
          Goto BadChar
        EndIf
      Default:         ;Block all other characters
        BadChar:
        *pchr+SizeOf(Character): changed=1
    EndSelect
    *pout\a = *pchr\a
  Next
  EndIf
  ProcedureReturn changed
EndProcedure


;StringFilter - called when #PB_EventType_Change triggers in the StringGadget
Procedure StringFilter(gadget)
  Static Changing
  If Not Changing
    Changing=1
    sTxt$ = GetGadgetText(gadget)
    lastcaretpos = GetCaretPosition(gadget)
    If RestrictChars(@sTxt$, Len(sTxt$))
      SetGadgetText(gadget, sTxt$)
      SetStringGadgetSelection(gadget, lastcaretpos-1)  ;must be called from the Dialog loop (which this is)
    EndIf
    Changing=0
  EndIf
EndProcedure

;-Example
CompilerIf #PB_Compiler_IsMainFile
  #Dlg1=0
  #String1=1
  
  Procedure Dlg1_Events(event)
    Select event
  
      ;#####################
      Case #PB_Event_Gadget
        If EventGadget() = #String1 And EventType() = #PB_EventType_Change
          StringFilter(#String1)
        EndIf
      ;#####################
  
    EndSelect
    ProcedureReturn #True
  EndProcedure
  
  
  Procedure OpenDlg1(x = 0, y = 0, width = 308, height = 148)
    OpenWindow(#Dlg1, x, y, width, height, "Restricted Characters", #PB_Window_SystemMenu | #PB_Window_MinimizeGadget | #PB_Window_ScreenCentered)
    StringGadget(#String1, 52, 60, 200, 24, "")
    TextGadget(69, 30,30, 200,30, "Allowed chars: 0-9 and one '.'")
  EndProcedure
  
  OpenDlg1()
  
  Repeat
    Define event.i = WaitWindowEvent()
    Dlg1_Events(event)
  Until event = #PB_Event_CloseWindow
CompilerEndIf
