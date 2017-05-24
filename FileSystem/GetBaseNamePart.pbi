;   Description: Gets the trailing name component of path
;        Author: Sicro
;          Date: 2017-04-15
;            OS: Windows, Linux, Mac
; English-Forum: Not in the forum
;  French-Forum: Not in the forum
;  German-Forum: Not in the forum
; -----------------------------------------------------------------------------

Procedure$ GetBaseNamePart(Path$, Suffix$="")
  ; https://secure.php.net/manual/de/function.basename.php
  
  Protected i
  Protected PathSlash$, Char$, Result$
  
  CompilerSelect #PB_Compiler_OS
      
    CompilerCase #PB_OS_Windows
      ReplaceString(Path$, "/", "\", #PB_String_InPlace)
      PathSlash$ = "\"
      
    CompilerDefault ; Linux und Mac
      PathSlash$ = "/"
      
  CompilerEndSelect
  
  If Right(Path$, 1) = PathSlash$
    Path$ = Left(Path$, Len(Path$) - 1)
  EndIf
  
  For i = Len(Path$) To 1 Step -1
    Char$ = Mid(Path$, i, 1)
    If Char$ = PathSlash$
      Break
    EndIf
    Result$ = Char$ + Result$
  Next
  
  If Suffix$ And Right(Result$, Len(Suffix$)) = Suffix$
    Result$ = Left(Result$, Len(Result$) - Len(Suffix$))
  EndIf
  
  ProcedureReturn Result$
  
EndProcedure

;-Example
CompilerIf #PB_Compiler_IsMainFile
  
  Debug GetBaseNamePart("/etc/sudoers.d", ".d")
  Debug GetBaseNamePart("/etc/sudoers.d")
  Debug GetBaseNamePart("/etc/passwd")
  Debug GetBaseNamePart("/etc/")
  Debug GetBaseNamePart(".")
  Debug GetBaseNamePart("/")
  
  ; https://secure.php.net/manual/de/function.basename.php#74429
  Debug GetBaseNamePart("path/to/file.xml#xpointer(/Texture)", ".xml#xpointer(/Texture)")
  
  Debug GetBaseNamePart("C:\Windows\System32\") ; Works only on windows
  
CompilerEndIf
