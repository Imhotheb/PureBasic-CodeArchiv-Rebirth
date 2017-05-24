;   Description: Hide/Change Cursor over Gadgets without OS-API
;        Author: ChrisR
;          Date: 2017-03-23
;            OS: Windows, Linux, Mac
; English-Forum: http://www.purebasic.fr/english/viewtopic.php?f=12&t=68169
;  French-Forum: 
;  German-Forum: 
; -----------------------------------------------------------------------------

Enumeration FormGadget
  #WinMain
  #CanvaButton
  #Button
  #CanvaCheckBox
  #CheckBox
EndEnumeration

OpenWindow(#WinMain, 0, 0, 220, 130, "Change Cursor over Gadgets", #PB_Window_SystemMenu)
CanvasGadget(#CanvaButton, 30, 30, 160, 25, #PB_Canvas_Container)
SetGadgetAttribute(#CanvaButton, #PB_Canvas_Cursor, #PB_Cursor_Hand)
ButtonGadget(#Button, 0, 0, 160, 25, "ClickMe for Busy Cursor")
CloseGadgetList()
CanvasGadget(#CanvaCheckBox, 20, 80, 180, 25, #PB_Canvas_Container)
If StartDrawing(CanvasOutput(#CanvaCheckBox))   ;Opaque background on: CheckBoxGadget, FrameGadget, HyperlinkGadget, OptionGadget, TextGadget, And TrackBarGadget
  Box(0, 0, OutputWidth(), OutputHeight(), $F0F0F0)   ;#PB_OS_MacOS: $C0C0C0
  StopDrawing()
EndIf
SetGadgetAttribute(#CanvaCheckBox, #PB_Canvas_Cursor, #PB_Cursor_Hand)
CheckBoxGadget(#CheckBox, 0, 0, 180, 25, "To show Cursor on other Gadgets", #PB_CheckBox_ThreeState)
CloseGadgetList()

Repeat
  Select WaitWindowEvent()
    Case #PB_Event_CloseWindow
      End

    Case #PB_Event_Gadget
      Select EventGadget()
        Case #Button
          Select GetGadgetAttribute(#CanvaButton, #PB_Canvas_Cursor)
            Case #PB_Cursor_Hand
              SetGadgetText(#Button, "ClickMe for Invisible Cursor")
              SetGadgetAttribute(#CanvaButton, #PB_Canvas_Cursor, #PB_Cursor_Busy)
              SetGadgetState(#CheckBox, #PB_Checkbox_Checked)
              SetGadgetAttribute(#CanvaCheckBox, #PB_Canvas_Cursor, #PB_Cursor_Busy)
            Case #PB_Cursor_Busy
              SetGadgetText(#Button, "ClickMe for Hand Cursor")
              SetGadgetAttribute(#CanvaButton, #PB_Canvas_Cursor, #PB_Cursor_Invisible)
              SetGadgetState(#CheckBox, #PB_Checkbox_Inbetween)
              SetGadgetAttribute(#CanvaCheckBox, #PB_Canvas_Cursor, #PB_Cursor_Invisible)
            Case #PB_Cursor_Invisible
              SetGadgetText(#Button, "ClickMe for Busy Cursor")
              SetGadgetAttribute(#CanvaButton, #PB_Canvas_Cursor, #PB_Cursor_Hand)
              SetGadgetState(#CheckBox, #PB_Checkbox_Unchecked)
              SetGadgetAttribute(#CanvaCheckBox, #PB_Canvas_Cursor, #PB_Cursor_Hand)
          EndSelect
      EndSelect
  EndSelect
ForEver
