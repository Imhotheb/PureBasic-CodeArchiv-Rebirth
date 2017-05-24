;   Description: Set Badge Label
;        Author: wilbert
;          Date: 2012-09-19
;            OS: Mac
; English-Forum: http://www.purebasic.fr/english/viewtopic.php?p=391168#p391168
;  French-Forum: 
;  German-Forum: 
; -----------------------------------------------------------------------------

CompilerIf #PB_Compiler_OS<>#PB_OS_MacOS
  CompilerError "MacOs only!"
CompilerEndIf

App = CocoaMessage(0, 0, "NSApplication sharedApplication")
DockTile = CocoaMessage(0, App, "dockTile")
CocoaMessage(0, DockTile, "setBadgeLabel:$", @"Pure")

MessageRequester("", "Badge label set")
