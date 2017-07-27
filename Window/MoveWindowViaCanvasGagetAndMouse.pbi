;   Description: Adds support to move borderless windows with CanvasGadget via mouse
;        Author: Danilo, Bisonte
;          Date: 2017-05-14
;            OS: Windows, Linux, Mac
; English-Forum: 
;  French-Forum: 
;  German-Forum: http://www.purebasic.fr/german/viewtopic.php?f=8&t=30154
; -----------------------------------------------------------------------------

;: Module   : CanvasWindowMover (CWMove)
;: TargetOS : Windows/Linux/MacOS
;:
;: Original by         : danilo
;: converted to module : Bisonte
;:
;: This Module shows the excellent solution from Danilo
;: to move a borderless window by leftbutton down and
;: moving the mouse. In a crossplatform way !!!
;: The original post from Danilo is in this thread :
;: http://www.purebasic.fr/english/viewtopic.php?p=429066
;:
;: RegisterCWMove(Gadget) : Create your canvasgadget and register it. So the window
;:                          the canvas is placed on, can be moved with it.
;: FreeCWMove(Gadget)     : If you want to free your gadget you have to free the
;:                          movement - registration first to avoid conflicts with
;:                          gadgetcreations after that.
;:
DeclareModule CWMove

  EnableExplicit

  Declare.i RegisterWMove(Gadget)
  Declare.i FreeWMove(Gadget)

EndDeclareModule
Module CWMove

  Structure s_movement
    MouseDown.i
    OffSetx.i
    OffSety.i
  EndStructure

  Global NewMap CM.s_movement()

  ;: Private
  Procedure CanvasWindowMovement()

    Protected Key.s = Str(GadgetID(EventGadget()))

    If FindMapElement(CM(), Key)

      With CM(Key)

        Select EventType()
          Case #PB_EventType_LeftButtonDown
            \MouseDown = #True
            \OffsetX = GetGadgetAttribute(EventGadget(), #PB_Canvas_MouseX)
            \OffsetY = GetGadgetAttribute(EventGadget(), #PB_Canvas_MouseY)

          Case #PB_EventType_LeftButtonUp
            \MouseDown = #False

          Case #PB_EventType_MouseMove
            If \MouseDown And GetGadgetAttribute(EventGadget(), #PB_Canvas_Buttons) & #PB_Canvas_LeftButton
              ResizeWindow(EventWindow(), DesktopMouseX() - \OffsetX, DesktopMouseY() - \OffsetY, #PB_Ignore, #PB_Ignore)
            EndIf

        EndSelect

      EndWith

    EndIf

  EndProcedure

  ;: Public
  Procedure.i RegisterWMove(Gadget)

    Protected Key.s, Result = #False

    If IsGadget(Gadget)

      Key = Str(GadgetID(Gadget))

      If GadgetType(Gadget) = #PB_GadgetType_Canvas
        CM(Key)\MouseDown = #False
        CM(Key)\OffSetx = 0
        CM(Key)\OffSety = 0
        BindGadgetEvent(Gadget, @CanvasWindowMovement())
        Result = #True
      EndIf
    EndIf

    ProcedureReturn Result

  EndProcedure
  Procedure.i FreeWMove(Gadget)
    If IsGadget(Gadget)
      If FindMapElement(CM(), Str(GadgetID(Gadget)))
        UnbindGadgetEvent(Gadget, @CanvasWindowMovement())
        DeleteMapElement(CM(), Str(GadgetID(Gadget)))
      EndIf
    EndIf
  EndProcedure

EndModule

;-Example
CompilerIf #PB_Compiler_IsMainFile
  
  EnableExplicit
  
    UseModule CWMove
  
    Define Window, Canvas, Event, Quit
  
    Window = OpenWindow(#PB_Any, 0, 0, 300, 300, "Test", #PB_Window_ScreenCentered|#PB_Window_BorderLess)
    SetWindowColor(Window, RGB(0, 0, 0))
  
    Canvas = CanvasGadget(#PB_Any, 1, 1, WindowWidth(Window) - 2, 40)
  
    If StartDrawing(CanvasOutput(Canvas))
      Box(0, 0, OutputWidth(), OutputHeight(), RGB(128, 128, 128))
      DrawText(5, 5, "Move window with mouse in here", RGB(0, 0, 0), RGB(128, 128, 128))
      StopDrawing()
    EndIf
  
    CWMove::RegisterWMove(Canvas)
  
    AddKeyboardShortcut(Window, #PB_Shortcut_Escape, 59999)
  
    Repeat
  
      Event = WaitWindowEvent()
  
      Select Event
  
        Case #PB_Event_CloseWindow
          Break
  
        Case #PB_Event_Menu
  
          Select EventMenu()
  
            Case 59999
              Break
  
          EndSelect
  
      EndSelect
  
    ForEver
  
    CWMove::FreeWMove(Canvas)
    FreeGadget(Canvas)
    
CompilerEndIf
