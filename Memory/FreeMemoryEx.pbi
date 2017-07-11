;   Description: Add a second FreeMemory function that always returns zero to null the address variable
;        Author: Sicro, STARGÅTE
;          Date: 2017-07-11
;            OS: Windows, Linux, Mac
; English-Forum: Not in the forum
;  French-Forum: Not in the forum
;  German-Forum: Not in the forum
; -----------------------------------------------------------------------------

Procedure.i FreeMemoryEx(*Memory)

  FreeMemory(*Memory)
  ProcedureReturn 0

EndProcedure

;-Example
CompilerIf #PB_Compiler_IsMainFile

  Define *Memory = AllocateMemory(1024)
  If *Memory = 0
    Debug "Error: AllocateMemory()"
    End
  EndIf
  
  Debug "Memory: " + *Memory
  Debug "---------------------"
  Debug "Free Memory"
  *Memory = FreeMemoryEx(*Memory)
  Debug "---------------------"
  Debug "Memory: " + *Memory

CompilerEndIf