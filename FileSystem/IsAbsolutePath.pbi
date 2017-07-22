;   Description: Determines if the path is an absolute path
;        Author: Sicro
;          Date: 2017-07-22
;            OS: Windows, Linux, Mac
; English-Forum: Not in the forum
;  French-Forum: Not in the forum
;  German-Forum: Not in the forum
; -----------------------------------------------------------------------------

Procedure.i IsAbsolutePath(Path$)
  
  If Path$ = "" : ProcedureReturn #False : EndIf
  
  CompilerIf #PB_Compiler_OS = #PB_OS_Windows
    
    If Left(Path$, 2) = "//"   : ProcedureReturn #True : EndIf
    
    If Left(Path$, 4) = "\\\\" : ProcedureReturn #True : EndIf
    
    Select Asc(Left(Path$, 1))
      Case 'A' To 'Z', 'a' To 'z'
        If Mid(Path$, 2, 2) = ":/" Or Mid(Path$, 2, 2) = ":\" Or Mid(Path$, 2, 3) = ":\\"
          ProcedureReturn #True
        EndIf
    EndSelect
    
    ProcedureReturn #False
    
  CompilerElse ; Linux, MacOS
    
    If Left(Path$, 1) = "/" : ProcedureReturn #True : EndIf
    
    ProcedureReturn #False
    
  CompilerEndIf
  
EndProcedure

;-Example
CompilerIf #PB_Compiler_IsMainFile
  
  CompilerIf #PB_Compiler_OS = #PB_OS_Windows
    
    Debug IsAbsolutePath("//server")
    Debug IsAbsolutePath("\\\\server")
    Debug IsAbsolutePath("C:/foo/..")
    Debug IsAbsolutePath("C:\\foo\\..")
    Debug IsAbsolutePath("bar\\baz")
    Debug IsAbsolutePath("bar/baz")
    Debug IsAbsolutePath(".")
    
  CompilerElse ; Linux, MacOS
    
    Debug IsAbsolutePath("/foo/bar")
    Debug IsAbsolutePath("/baz/..")
    Debug IsAbsolutePath("qux/")
    Debug IsAbsolutePath(".")
    
  CompilerEndIf
  
CompilerEndIf