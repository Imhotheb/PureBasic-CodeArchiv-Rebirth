;   Description: Corrects the slash of paths according to the OS
;        Author: Sicro
;          Date: 2017-03-12
;            OS: Windows, Linux, Mac
; English-Forum: Not in the forum
;  French-Forum: Not in the forum
;  German-Forum: Not in the forum
; -----------------------------------------------------------------------------

Procedure$ CorrectPathSlash(Path$)
  CompilerSelect #PB_Compiler_OS
    CompilerCase #PB_OS_Windows : ReplaceString(Path$, "/", "\", #PB_String_InPlace)
    CompilerDefault             : ReplaceString(Path$, "\", "/", #PB_String_InPlace)
  CompilerEndSelect
  ProcedureReturn Path$
EndProcedure

;-Example
CompilerIf #PB_Compiler_IsMainFile
  Debug CorrectPathSlash(GetTemporaryDirectory() + "myProject/AppName/")
  Debug CorrectPathSlash(GetTemporaryDirectory() + "myProject\AppName\")
CompilerEndIf
