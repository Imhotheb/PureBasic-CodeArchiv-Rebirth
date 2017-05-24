;   Description: Creates arbitrarily deep directory level
;        Author: Sicro
;          Date: 2017-02-03
;            OS: Windows, Linux, Mac
; English-Forum: 
;  French-Forum: 
;  German-Forum: http://www.purebasic.fr/german/viewtopic.php?f=8&t=30020
; -----------------------------------------------------------------------------

Procedure.i CreatePath(Path$)
  
  Protected CountOfDirectories, i
  Protected TempPath$, Slash$
  
  CompilerSelect #PB_Compiler_OS
    CompilerCase #PB_OS_Windows
      Slash$ = "\"
    CompilerDefault
      Slash$ = "/"
  CompilerEndSelect
  
  Path$ = Trim(Path$, Slash$)
  
  CountOfDirectories = CountString(Path$, Slash$) + 1
  For i = 1 To CountOfDirectories
    CompilerIf #PB_Compiler_OS = #PB_OS_Windows
      If i = 1
        TempPath$ = StringField(Path$, i, Slash$)
        Continue
      EndIf
    CompilerEndIf
    TempPath$ + Slash$ + StringField(Path$, i, Slash$)
    If FileSize(TempPath$) <> -2 And Not CreateDirectory(TempPath$)
      ProcedureReturn #False
    EndIf
  Next
  
  ProcedureReturn #True
EndProcedure

;Debug CreatePath("/home/username/myproject/codes/gui")
;Debug CreatePath("C:\Dokumente und Einstellungen\Benutzername\Programmieren\Mein Projekt\GUI") 
