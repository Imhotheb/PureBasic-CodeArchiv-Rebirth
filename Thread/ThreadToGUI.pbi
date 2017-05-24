;   Description: Supports the thread-safe manipulation of windows and gadgets
;        Author: mk-soft
;          Date: 2017-01-20
;            OS: Windows, Linux, Mac
; English-Forum: 
;  French-Forum: 
;  German-Forum: http://www.purebasic.fr/german/viewtopic.php?f=8&t=29728
; -----------------------------------------------------------------------------

;-TOP

; Comment: Thread To GUI
; Author : mk-soft
; Version: v1.08
; Created: 16.07.2016
; Updated: 09.11.2016
; Link En:
; Link De:

; ***************************************************************************************

;- Begin Declare Module

CompilerIf #PB_Compiler_Thread = 0
  CompilerError "Use Compileroption Threadsafe!"
CompilerEndIf

DeclareModule ThreadToGUI

  ;-Public

  ;- Init
  Declare BindEventGUI(EventCustomValue)
  Declare UnBindEventGUI()
  ; Main
  Declare DoWait(Semaphore = 0)
  ; Windows
  Declare DoDisableWindow(Window, State)
  Declare DoHideWindow(Window, State, Flags)
  Declare DoSetActiveWindow(Window)
  Declare DoSetWindowColor(Window, Color)
  Declare DoSetWindowData(Window, Value)
  Declare DoSetWindowState(Window, State)
  Declare DoSetWindowTitle(Window, Text.s)
  ; Menus
  Declare DoDisableMenuItem(Menu, MenuItem, State)
  Declare DoSetMenuItemState(Menu, MenuItem, State)
  Declare DoSetMenuItemText(Menu, MenuItem, Text.s)
  Declare DoSetMenuTitleText(Menu, Index, Text.s)
  ; Gadgets
  Declare DoAddGadgetColumn(Gadget, Postion, Text.s, Width)
  Declare DoAddGadgetItem(Gadget, Position, Text.s, ImageID = 0, Flags = #PB_Ignore)
  Declare DoClearGadgetItems(Gadget)
  Declare DoDisableGadget(Gadget, State)
  Declare DoHideGadget(Gadget, State)
  Declare DoSetActiveGadget(Gadget)
  Declare DoSetGadgetAttribute(Gadget, Attribute, Value)
  Declare DoSetGadgetColor(Gadget, ColorType, Color)
  Declare DoSetGadgetData(Gadget, Value)
  Declare DoSetGadgetFont(Gadget, FontID)
  Declare DoSetGadgetItemAttribute(Gadget, Item, Attribute, Value, Column = 0)
  Declare DoSetGadgetItemColor(Gadget, Item, ColorType, Color, Column = 0)
  Declare DoSetGadgetItemData(Gadget, Item, Value)
  Declare DoSetGadgetItemImage(Gadget, Item, ImageID)
  Declare DoSetGadgetItemState(Gadget, Postion, State)
  Declare DoSetGadgetItemText(Gadget, Postion, Text.s, Column = 0)
  Declare DoSetGadgetState(Gadget, State)
  Declare DoSetGadgetText(Gadget, Text.s)
  Declare DoResizeGadget(Gadget, x, y, Width, Height)
  Declare DoRemoveGadgetColumn(Gadget, Column)
  Declare DoRemoveGadgetItem(Gadget, Position)
  Declare DoGadgetToolTip(Gadget, Text.s)
  ; Statusbar
  Declare DoStatusBarImage(StatusBar, Field, ImageID, Appearance = 0)
  Declare DoStatusBarProgress(StatusBar, Field, Value, Appearance = 0, Min = #PB_Ignore, Max = #PB_Ignore)
  Declare DoStatusBarText(StatusBar, Field, Text.s, Appearance = 0)
  ; Toolbar
  Declare DoDisableToolBarButton(ToolBar, ButtonID, State)
  Declare DoSetToolBarButtonState(ToolBar, ButtonID, State)
  ; Systray
  Declare DoChangeSysTrayIcon(SysTrayIcon, ImageID)
  Declare DoSysTrayIconToolTip(SysTrayIcon, Text.s)
  ; SendEvent
  Declare SendEvent(Event, Window = 0, Object = 0, EventType = 0, pData = 0, Semaphore = 0)
  Declare SendEventData(*MyEvent)
  Declare DispatchEvent(*MyEvent, result)

EndDeclareModule

;- Begin Module

Module ThreadToGUI

  EnableExplicit

  ;-- Const
  Enumeration Command ; Main
    #BeginOfMain
    #WaitOnSignal
    #EndOfMain
  EndEnumeration

  Enumeration Command ; Windows
    #BeginOfWindows
    #DisableWindow
    #HideWindow
    #SetActiveWindow
    #SetWindowColor
    #SetWindowData
    #SetWindowState
    #SetWindowTitle
    #EndOfWindows
  EndEnumeration

  Enumeration Command ; Menu
    #BeginOfMenu
    #DisableMenuItem
    #SetMenuItemState
    #SetMenuItemText
    #SetMenuTitleText
    #EndOfMenu
  EndEnumeration

  Enumeration Command ; Gadgets
    #BeginOfGadgets
    #AddGadgetColumn
    #AddGadgetItem
    #ClearGadgetItems
    #DisableGadget
    #HideGadget
    #SetActiveGadget
    #SetGadgetAttribute
    #SetGadgetColor
    #SetGadgetData
    #SetGadgetFont
    #SetGadgetItemAttribute
    #SetGadgetItemColor
    #SetGadgetItemData
    #SetGadgetItemImage
    #SetGadgetItemState
    #SetGadgetItemText
    #SetGadgetState
    #SetGadgetText
    #ResizeGadget
    #RemoveGadgetColumn
    #RemoveGadgetItem
    #GadgetToolTip
    #EndOfGadgets
  EndEnumeration

  Enumeration Command ; Statusbar
    #BeginOfStatusbar
    #StatusBarImage
    #StatusBarProgress
    #StatusBarText
    #EndOfStatusbar
  EndEnumeration

  Enumeration Command ; ToolBar
    #BeginOfToolbar
    #DisableToolBarButton
    #SetToolBarButtonState
    #EndOfToolbar
  EndEnumeration

  Enumeration Command ; Systray
    #BeginOfSystray
    #ChangeSysTrayIcon
    #SysTrayIconToolTip
    #EndOfSystray
  EndEnumeration

  ;-- Structure DoCommand
  Structure udtParam
    Command.i
    Object.i
    Param1.i
    Param2.i
    Param3.i
    Parma4.i
    Param5.i
    Text.s
  EndStructure
  ;-- Structure SendEvent
  Structure udtSendEvent
    Signal.i
    Result.i
    *pData
  EndStructure

  ;-- Global
  Global DoEvent

  ; -----------------------------------------------------------------------------------

  ;-- Functions

  Procedure PostEventCB()

    Protected *data.udtParam

    *data = EventData()

    With *data
      Select \Command
        Case #WaitOnSignal
          SignalSemaphore(\Param1)

        Case #BeginOfWindows To #EndOfWindows
          If IsWindow(\Object)
            Select \Command
              Case #DisableGadget
                DisableWindow(\Object, \Param1)
              Case #HideGadget
                HideWindow(\Object, \Param1, \Param2)
              Case #SetActiveGadget
                SetActiveWindow(\Object)
              Case #SetWindowColor
                SetWindowColor(\Object, \Param1)
              Case #SetWindowData
                SetWindowData(\Object, \Param1)
              Case #SetWindowState
                SetWindowState(\Object, \Param1)
              Case #SetWindowTitle
                SetWindowTitle(\Object, \Text)
            EndSelect
          EndIf

        Case #BeginOfMenu To #EndOfMenu
          If IsMenu(\Object)
            Select \Command
              Case #DisableMenuItem
                DisableMenuItem(\Object, \Param1, \Param2)
              Case #SetMenuItemState
                SetMenuItemState(\Object, \Param1, \Param2)
              Case #SetMenuItemText
                SetMenuItemText(\Object, \Param1, \Text)
              Case #SetMenuTitleText
                SetMenuTitleText(\Object, \Param1, \Text)
            EndSelect
          EndIf

        Case #BeginOfGadgets To #EndOfGadgets
          If IsGadget(\Object)
            Select \Command
              Case #AddGadgetColumn
                AddGadgetColumn(\Object, \Param1, \Text.s, \Param3)
              Case #AddGadgetItem
                If \Parma4 = #PB_Ignore
                  AddGadgetItem(\Object, \Param1, \Text.s, \Param3)
                Else
                  AddGadgetItem(\Object, \Param1, \Text.s, \Param3, \Parma4)
                EndIf
              Case #ClearGadgetItems
                ClearGadgetItems(\Object)
              Case #DisableGadget
                DisableGadget(\Object, \Param1)
              Case #HideGadget
                HideGadget(\Object, \Param1)
              Case #SetActiveGadget
                SetActiveGadget(\Object)
              Case #SetGadgetAttribute
                SetGadgetAttribute(\Object, \Param1, \Param2)
              Case #SetGadgetColor
                SetGadgetColor(\Object, \Param1, \Param2)
              Case #SetGadgetData
                SetGadgetData(\Object, \Param1)
              Case #SetGadgetFont
                SetGadgetFont(\Object, \Param1)
              Case #SetGadgetItemAttribute
                SetGadgetItemAttribute(\Object, \Param1, \Param2, \Param3, \Parma4)
              Case #SetGadgetItemColor
                SetGadgetItemColor(\Object, \Param1, \Param2, \Param3, \Parma4)
              Case #SetGadgetItemData
                SetGadgetItemData(\Object, \Param1, \Param2)
              Case #SetGadgetItemImage
                SetGadgetItemImage(\Object, \Param1, \Param2)
              Case #SetGadgetItemState
                SetGadgetItemState(\Object, \Param1, \Param2)
              Case #SetGadgetItemText
                SetGadgetItemText(\Object, \Param1, \Text.s, \Param3)
              Case #SetGadgetState
                SetGadgetState(\Object, \Param1)
              Case #SetGadgetText
                SetGadgetText(\Object, \Text.s)
              Case #ResizeGadget
                ResizeGadget(\Object, \Param1, \Param2, \Param3, \Parma4)
              Case #RemoveGadgetColumn
                RemoveGadgetColumn(\Object, \Param1)
              Case #RemoveGadgetItem
                RemoveGadgetItem(\Object, \Param1)
              Case #GadgetToolTip
                GadgetToolTip(\Object, \Text)
            EndSelect
          EndIf

        Case #BeginOfStatusbar To #EndOfStatusbar
          If IsStatusBar(\Object)
            Select \Command
              Case #StatusBarImage
                StatusBarImage(\Object, \Param1, \Param2, \Param3)
              Case #StatusBarProgress
                StatusBarProgress(\Object, \Param1, \Param2, \Param3, \Parma4, \Param5)
              Case #StatusBarText
                StatusBarText(\Object, \Param1, \Text, \Param3)
            EndSelect
          EndIf

        Case #BeginOfToolbar To #EndOfToolbar
          If IsToolBar(\Object)
            Select \Command
              Case #DisableToolBarButton
                DisableToolBarButton(\Object, \Param1, \Param2)
              Case #SetToolBarButtonState
                SetToolBarButtonState(\Object, \Param1, \Param2)
            EndSelect
          EndIf

        Case #BeginOfSystray To #EndOfSystray
          If IsSysTrayIcon(\Object)
            Select \Command
              Case #ChangeSysTrayIcon
                ChangeSysTrayIcon(\Object, \Param1)
              Case #SysTrayIconToolTip
                SysTrayIconToolTip(\Object, \Text)
            EndSelect
          EndIf

      EndSelect

      FreeStructure(*data)

    EndWith

  EndProcedure

  ; -----------------------------------------------------------------------------------

  ;- Public

  Procedure BindEventGUI(EventCustomValue)
    If Not DoEvent
      BindEvent(EventCustomValue, @PostEventCB())
      DoEvent = EventCustomValue
    EndIf
  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure UnbindEventGUI()
    If DoEvent
      UnbindEvent(DoEvent, @PostEventCB())
      DoEvent = 0
    EndIf
  EndProcedure

  ; -----------------------------------------------------------------------------------

  ;-- Speziale main command

  Procedure DoWait(Semaphore = 0)
    Protected *data.udtParam, signal

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      If Semaphore = 0
        signal = CreateSemaphore()
      Else
        signal = Semaphore
      EndIf
      \Command = #WaitOnSignal
      \Param1 = signal
      PostEvent(DoEvent, 0, 0, 0, *data)
      WaitSemaphore(\Param1)
      If Semaphore = 0
        FreeSemaphore(signal)
      EndIf
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  ;-- Windows commands

  Procedure DoDisableWindow(Window, State)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #DisableWindow
      \Object = Window
      \Param1 = State
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoHideWindow(Window, State, Flags)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #HideWindow
      \Object = Window
      \Param1 = State
      \Param2 = Flags
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetActiveWindow(Window)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetActiveWindow
      \Object = Window
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetWindowColor(Window, Color)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetWindowColor
      \Object = Window
      \Param1 = Color
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetWindowData(Window, Value)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetWindowData
      \Object = Window
      \Param1 = Value
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetWindowState(Window, State)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetWindowState
      \Object = Window
      \Param1 = State
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetWindowTitle(Window, Text.s)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetWindowTitle
      \Object = Window
      \Text = Text
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  ;-- Menu commands

  Procedure DoDisableMenuItem(Menu, MenuItem, State)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #DisableMenuItem
      \Object = Menu
      \Param1 = MenuItem
      \Param2 = State
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetMenuItemState(Menu, MenuItem, State)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetMenuItemState
      \Object = Menu
      \Param1 = MenuItem
      \Param2 = State
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetMenuItemText(Menu, MenuItem, Text.s)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetMenuItemText
      \Object = Menu
      \Param1 = MenuItem
      \Text = Text
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetMenuTitleText(Menu, Index, Text.s)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetMenuTitleText
      \Object = Menu
      \Param1 = Index
      \Text = Text
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------


  ;-- Gadget commands

  Procedure DoAddGadgetColumn(Gadget, Position, Text.s, Width)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #AddGadgetColumn
      \Object = Gadget
      \Param1 = Position
      \Text = Text
      \Param3 = Width
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoAddGadgetItem(Gadget, Position, Text.s, ImageID = 0, Flags = #PB_Ignore)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #AddGadgetItem
      \Object = Gadget
      \Param1 = Position
      \Text = Text
      \Param3 = ImageID
      \Parma4 = Flags
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoClearGadgetItems(Gadget)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #ClearGadgetItems
      \Object = Gadget
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoDisableGadget(Gadget, State)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #DisableGadget
      \Object = Gadget
      \Param1 = State
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoHideGadget(Gadget, State)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #HideGadget
      \Object = Gadget
      \Param1 = State
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetActiveGadget(Gadget)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetActiveGadget
      \Object = Gadget
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetGadgetAttribute(Gadget, Attribute, Value)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetGadgetAttribute
      \Object = Gadget
      \Param1 = Attribute
      \Param2 = Value
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetGadgetColor(Gadget, ColorType, Color)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetGadgetColor
      \Object = Gadget
      \Param1 = ColorType
      \Param2 = Color
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetGadgetData(Gadget, Value)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetGadgetData
      \Object = Gadget
      \Param1 = Value
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetGadgetFont(Gadget, FontID)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetGadgetFont
      \Object = Gadget
      \Param1 = FontID
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetGadgetItemAttribute(Gadget, Item, Attribute, Value, Column = 0)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetGadgetItemAttribute
      \Object = Gadget
      \Param1 = Item
      \Param2 = Attribute
      \Param3 = Value
      \Parma4 = Column
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetGadgetItemColor(Gadget, Item, ColorType, Color, Column = 0)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetGadgetItemColor
      \Object = Gadget
      \Param1 = Item
      \Param2 = ColorType
      \Param3 = Color
      \Parma4 = Column
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetGadgetItemData(Gadget, Item, Value)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetGadgetItemData
      \Object = Gadget
      \Param1 = Item
      \Param2 = Value
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetGadgetItemImage(Gadget, Item, ImageID)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetGadgetItemImage
      \Object = Gadget
      \Param1 = Item
      \Param2 = ImageID
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetGadgetItemState(Gadget, Position, State)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetGadgetItemState
      \Object = Gadget
      \Param1 = Position
      \Param2 = State
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetGadgetItemText(Gadget, Position, Text.s, Column = 0)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetGadgetItemText
      \Object = Gadget
      \Param1 = Position
      \Text = Text
      \Param3 = Column
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetGadgetState(Gadget, State)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetGadgetState
      \Object = Gadget
      \Param1 = State
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetGadgetText(Gadget, Text.s)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetGadgetText
      \Object = Gadget
      \Text = text
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoResizeGadget(Gadget, x, y, Width, Height)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #ResizeGadget
      \Object = Gadget
      \Param1 = x
      \Param2 = y
      \Param3 = Width
      \Parma4 = Height
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoRemoveGadgetColumn(Gadget, Column)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #RemoveGadgetColumn
      \Object = Gadget
      \Param1 = Column
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoRemoveGadgetItem(Gadget, Position)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #RemoveGadgetItem
      \Object = Gadget
      \Param1 = Position
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoGadgetToolTip(Gadget, Text.s)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #GadgetToolTip
      \Object = Gadget
      \Text = Text
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  ;-- Statusbar commands

  Procedure DoStatusBarImage(StatusBar, Field, ImageID, Appearance = 0)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #StatusBarImage
      \Object = StatusBar
      \Param1 = Field
      \Param2 = ImageID
      \Param3 = Appearance
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoStatusBarProgress(StatusBar, Field, Value, Appearance = 0, Min = #PB_Ignore, Max = #PB_Ignore)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #StatusBarProgress
      \Object = StatusBar
      \Param1 = Field
      \Param2 = Value
      \Param3 = Appearance
      \Parma4 = Min
      \Param5 = Max
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoStatusBarText(StatusBar, Field, Text.s, Appearance = 0)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #StatusBarText
      \Object = StatusBar
      \Param1 = Field
      \Text = Text
      \Param3 = Appearance
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  ;-- Toolbar commands

  Procedure DoDisableToolBarButton(ToolBar, ButtonID, State)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #DisableToolBarButton
      \Object = ToolBar
      \Param1 = ButtonID
      \Param2 = State
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSetToolBarButtonState(ToolBar, ButtonID, State)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SetToolBarButtonState
      \Object = ToolBar
      \Param1 = ButtonID
      \Param2 = State
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  ;-- Systray commands

  Procedure DoChangeSysTrayIcon(SysTrayIcon, ImageID)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #ChangeSysTrayIcon
      \Object = SysTrayIcon
      \Param1 = ImageID
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DoSysTrayIconToolTip(SysTrayIcon, Text.s)
    Protected *data.udtParam

    If Not DoEvent : ProcedureReturn 0 : EndIf

    *data = AllocateStructure(udtParam)
    With *data
      \Command = #SysTrayIconToolTip
      \Object = SysTrayIcon
      \Text = Text
      PostEvent(DoEvent, 0, 0, 0, *data)
    EndWith

    ProcedureReturn 1

  EndProcedure

  ; *************************************************************************************

  ;-- SendEvent commands

  Procedure SendEvent(Event, Window = 0, Object = 0, EventType = 0, pData = 0, Semaphore = 0)
    Protected MyEvent.udtSendEvent, result

    With MyEvent
      If Semaphore
        \Signal = Semaphore
      Else
        \Signal = CreateSemaphore()
      EndIf
      \pData = pData
      PostEvent(Event, Window, Object, EventType, @MyEvent)
      WaitSemaphore(\Signal)
      result = \Result
      If Semaphore = 0
        FreeSemaphore(\Signal)
      EndIf
    EndWith

    ProcedureReturn result

  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure SendEventData(*MyEvent.udtSendEvent)
    ProcedureReturn *MyEvent\pData
  EndProcedure

  ; -----------------------------------------------------------------------------------

  Procedure DispatchEvent(*MyEvent.udtSendEvent, result)
    *MyEvent\Result = result
    SignalSemaphore(*MyEvent\Signal)
  EndProcedure

  ; *************************************************************************************

EndModule

;- End Module


;-Example
CompilerIf #PB_Compiler_IsMainFile
  Procedure thFillList(id)
    Protected text.s, count
    ThreadToGUI::DoDisableGadget(1, #True)
    ThreadToGUI::DoStatusBarText(0, 0, "Thread 1 running...")
    For count = 1 To 10
      text = FormatDate("%HH:%II:%SS - Number ", Date()) + Str(count)
      ThreadToGUI::DoAddGadgetItem(0, -1, text)
      Delay(1000)
    Next
    ThreadToGUI::DoStatusBarText(0, 0, "Thread 1 finished.")
    ThreadToGUI::DoDisableGadget(1, #False)
  EndProcedure
  
  Procedure thFlash(id)
    Protected count, col
  
    UseModule ThreadToGUI
  
    DoDisableGadget(2, #True)
    For count = 0 To 4
      For col = 0 To 3
        DoStatusBarProgress(0, 1, count * 20 + col * 5)
        Select col
          Case 0 : DoSetGadgetColor(3, #PB_Gadget_BackColor, RGB(255,0,0))
          Case 1 : DoSetGadgetColor(3, #PB_Gadget_BackColor, RGB(255,255,0))
          Case 2 : DoSetGadgetColor(3, #PB_Gadget_BackColor, RGB(0,255,0))
          Case 3 : DoSetGadgetColor(3, #PB_Gadget_BackColor, RGB(255,255,255))
        EndSelect
        Delay(1000)
      Next
    Next
    DoStatusBarProgress(0, 1, 100)
    DoDisableGadget(2, #False)
  
    UnuseModule ThreadToGUI
  
  EndProcedure
  
  Procedure Main()
    Protected event, thread1, thread2
  
    If OpenWindow(0, #PB_Ignore, #PB_Ignore, 800, 560, "Thread To GUI Example", #PB_Window_SystemMenu)
      CreateStatusBar(0, WindowID(0))
      AddStatusBarField(200)
      StatusBarText(0, 0, "Thread 1")
      AddStatusBarField(200)
      AddStatusBarField(#PB_Ignore)
  
      ListViewGadget(0, 0, 0, 800, 500)
      ButtonGadget(1, 10, 510, 120, 24, "Fill List")
      ButtonGadget(2, 140, 510, 120, 24, "Flash")
      StringGadget(3, 710, 510, 80, 24, "State", #PB_String_ReadOnly)
  
      ThreadToGUI::BindEventGUI(#PB_Event_FirstCustomValue)
  
      Repeat
        event = WaitWindowEvent()
        Select event
          Case #PB_Event_CloseWindow
            If IsThread(thread1) : KillThread(thread1) : EndIf
            If IsThread(thread2) : KillThread(thread2) : EndIf
            ThreadToGUI::UnBindEventGUI()
            Break
  
          Case #PB_Event_Gadget
            Select EventGadget()
              Case 1
                If Not IsThread(thread1)
                  thread1 = CreateThread(@thFillList(), 0)
                EndIf
  
              Case 2
                If Not IsThread(thread2)
                  thread2 = CreateThread(@thFlash(), 0)
                EndIf
  
            EndSelect
  
        EndSelect
  
      ForEver
  
    EndIf
  
  EndProcedure : Main()
CompilerEndIf
