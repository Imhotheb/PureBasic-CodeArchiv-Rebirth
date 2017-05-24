;   Description: Gets the path of the previous directory
;        Author: Sicro
;          Date: 2017-05-24
;            OS: Windows, Linux, Mac
; English-Forum: Not in the forum
;  French-Forum: Not in the forum
;  German-Forum: Not in the forum
; -----------------------------------------------------------------------------

Procedure$ GetPreviousDirectory(Path$)
  
  Protected Slash$
  Protected StringLength
  
  CompilerIf #PB_Compiler_OS = #PB_OS_Windows
    Slash$ = "\"
  CompilerElse ; Linux, Mac
    Slash$ = "/"
  CompilerEndIf
  
  Path$ = RTrim(Path$, Slash$)
  
  StringLength = Len(Path$)
  
  While Path$ <> "" And Right(Path$, 1) <> Slash$
    StringLength - 1
    Path$ = Left(Path$, StringLength)
  Wend
  
  ProcedureReturn Path$
  
EndProcedure

;-Example
CompilerIf #PB_Compiler_IsMainFile
  
  Define Path$
  
  CompilerIf #PB_Compiler_OS = #PB_OS_Windows
    Path$ = "C:\home\username\projects\whatever\codes\"
  CompilerElse ; Linux, Mac
    Path$ = "/home/username/projects/whatever/codes/"
  CompilerEndIf
  
  Debug Path$
  Path$ = GetPreviousDirectory(Path$)
  Debug Path$
  Path$ = GetPreviousDirectory(Path$)
  Debug Path$
  Path$ = GetPreviousDirectory(Path$)
  Debug Path$
  Path$ = GetPreviousDirectory(Path$)
  Debug Path$
  Path$ = GetPreviousDirectory(Path$)
  Debug Path$
  
CompilerEndIf