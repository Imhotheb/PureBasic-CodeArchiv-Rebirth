;   Description: Returns the absolute path of a relative path
;        Author: Sicro
;          Date: 2017-07-21
;            OS: Windows, Linux, Mac
; English-Forum: Not in the forum
;  French-Forum: Not in the forum
;  German-Forum: Not in the forum
; -----------------------------------------------------------------------------

IncludeFile "GetPreviousDirectory.pbi"

Procedure$ GetAbsolutePath(RelativePath$)
  
  Protected Slash$, PathPart$, AbsolutePath$
  Protected CountOfSlashes, i
  
  CompilerIf #PB_Compiler_OS = #PB_OS_Windows
    Slash$ = "\"
  CompilerElse ; Linux, Mac
    Slash$ = "/"
  CompilerEndIf
  
  RelativePath$ = RTrim(RelativePath$, Slash$)
  
  AbsolutePath$ = GetCurrentDirectory()
  
  CountOfSlashes = CountString(RelativePath$, Slash$)
  For i = 1 To CountOfSlashes + 1
    PathPart$ = StringField(RelativePath$, i, Slash$)
    Select PathPart$
      Case ".", ""
        Continue
      Case ".."
        AbsolutePath$ = GetPreviousDirectory(AbsolutePath$)
      Default
        AbsolutePath$ + PathPart$ + Slash$
    EndSelect
  Next
  
  ProcedureReturn AbsolutePath$
  
EndProcedure

;-Example
CompilerIf #PB_Compiler_IsMainFile
  
  Define RelativePath$
  
  CompilerIf #PB_Compiler_OS = #PB_OS_Windows
    RelativePath$ = "..\..\Test1\Test2\"
  CompilerElse ; Linux, Mac
    RelativePath$ = "../../Test1/Test2/"
  CompilerEndIf
  
  Debug GetCurrentDirectory()
  Debug GetAbsolutePath(RelativePath$)
  Debug GetAbsolutePath(".")
  Debug GetAbsolutePath("")
  
CompilerEndIf
