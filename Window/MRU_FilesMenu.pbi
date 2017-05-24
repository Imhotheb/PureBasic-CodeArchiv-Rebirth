;   Description: Manages a MRU (Most recently used) files menu
;        Author: Keya
;          Date: 2017-03-11
;            OS: Windows, Linux, Mac
; English-Forum: http://www.purebasic.fr/english/viewtopic.php?f=12&t=68086
;  French-Forum: 
;  German-Forum: 
; -----------------------------------------------------------------------------

Enumeration FormMenu
  #mnuRecentFile0
  #mnuRecentFile1
  #mnuRecentFile2
  #mnuRecentFile3
  #mnuRecentFile4 ;To have more slots simply make more #mnuRecentFileN's. Nothing else to do.
  #MRU_LAST
EndEnumeration

Global hMRUMenu
Global NewList MRUList.s()

Declare MRU_cbOpenProc(File$, fromMRU)


Procedure MRU_ResetMenus()
  Protected nextmenu
  ResetList(MRUList())
  For i = #mnuRecentFile0 To #MRU_LAST-1
    If NextElement(MRUList())
      File$ = MRUList()
    Else
      File$ = "<empty>"
    EndIf
    nextmenu+1
    SetMenuItemText(hMRUMenu, i, "#"+Str(nextmenu)+". " + File$)
  Next i
EndProcedure


Procedure MRU_SelectFile(idx)
  SelectElement(MRUList(), idx)
  File$ = MRUList()
  MoveElement(MRUList(), #PB_List_First)
  MRU_ResetMenus()
  Debug "Open MRU file: " + File$
  MRU_cbOpenProc(File$, 1)
EndProcedure


Procedure MRU_MenuEvent()
  Protected menu = EventMenu()
  MRU_SelectFile(menu - #mnuRecentFile0)
EndProcedure


Procedure MRU_AddMenu(hMenu)
  hMRUMenu=hMenu
  OpenSubMenu("Recently Used")
  For i = #mnuRecentFile0 To #MRU_LAST-1
  MenuItem(i, "")
  Next i
  CloseSubMenu()
  MRU_ResetMenus()
  For i = #mnuRecentFile0 To #MRU_LAST-1
    DisableMenuItem(hMRUMenu, i, 1)
    BindMenuEvent(hMRUMenu, i, @MRU_MenuEvent())
  Next i
EndProcedure


Procedure MRU_AddFile(File$)
  ;// Check existing
  If ListSize(MRUList())
    ResetList(MRUList())
    NextElement(MRUList())
    LFile$ = LCase(File$)
    ForEach MRUList()
      If LCase(MRUList()) = LFile$
        Debug "- File already in MRU. Moving to top of list."
        MRU_SelectFile(ListIndex(MRUList()))
        ProcedureReturn 0
      EndIf
    Next
  EndIf
  ;// Add new
  If ListSize(MRUList()) = (#MRU_LAST-1 - #mnuRecentFile0) + 1
    Debug "- New file, but MRU list is full. Removing oldest file, inserting newest at top"
    SelectElement(MRUList(), ListSize(MRUList())-1)
    DeleteElement(MRUList())
    SelectElement(MRUList(),0)
    InsertElement(MRUList())
  Else
    Debug "- New file. Inserting at top, moving other files down one to grow the MRU list."
    SelectElement(MRUList(),0)
    InsertElement(MRUList())
    DisableMenuItem(hMRUMenu, #mnuRecentFile0 + ListSize(MRUList())-1, 0)
  EndIf
  MRUList() = File$
  MRU_ResetMenus()
  MRU_cbOpenProc(File$, 0)
EndProcedure

;-Example
CompilerIf #PB_Compiler_IsMainFile
  ;To use:
  ;1) add a Callback function: MRU_cbOpenProc(File$, fromMRU)
  ;2) call MRU_AddMenu() when building your dialog's menu
  ;3) call MRU_AddFile() to add to MRU list
  
  Enumeration FormWindow
    #Dlg1
  EndEnumeration
  
  Enumeration FormMenu
    #mnuOpen
    #mnuExit
  EndEnumeration
  
  Procedure MRU_cbOpenProc(File$, fromMRU)  ;<### 1 -----------------
    MessageRequester("Open File",File$+Chr(10)+"Already on MRU: " + Str(fromMRU))
  EndProcedure
  
  
  
  Procedure OpenDlg1(x = 0, y = 0, width = 400, height = 304)
    OpenWindow(#Dlg1, x, y, width, height, "Recently Used File Menu", #PB_Window_SystemMenu | #PB_Window_ScreenCentered)
    hMainMenu = CreateMenu(#PB_Any, WindowID(#Dlg1))
    MenuTitle("File")
    MenuItem(#mnuOpen, "Open")
    MenuBar()
    MRU_AddMenu(hMainMenu)                    ;<### 2 -----------------
    MenuBar()
    MenuItem(#mnuExit, "Exit")
  EndProcedure
  
  
  
  Procedure mnuOpen(evt)
    ;Normally an OpenFileRequester, but for this demo...
    Static Nextfile
    Nextfile+1
    File$ = "c:\File-"+Str(Nextfile)+".txt"
    Debug "Open file: " + File$
    MRU_AddFile(File$)                       ;<### 3 -----------------
  EndProcedure
  
  
  Procedure Dlg1_Events(event)
    If event = #PB_Event_Menu
      evtmenu = EventMenu()
      Select evtmenu
        Case #mnuOpen
          mnuOpen(evtmenu)
        Case #mnuExit
          End
      EndSelect
    EndIf
    ProcedureReturn #True
  EndProcedure
  
  
  OpenDlg1()
  
  Repeat
    Define event.i = WaitWindowEvent()
    Dlg1_Events(event)
  Until event = #PB_Event_CloseWindow
  End
CompilerEndIf
