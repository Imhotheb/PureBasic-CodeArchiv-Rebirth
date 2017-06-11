;   Description: Adds the function 'IsMemory()' (works like IsFile() etc.)
;        Author: Sicro
;          Date: 2017-06-11
;            OS: Windows, Linux, Mac
; English-Forum: Not in the forum
;  French-Forum: Not in the forum
;  German-Forum: Not in the forum
; -----------------------------------------------------------------------------

Global NewMap MemoryAddresses()
Global IsMemory_Mutex = CreateMutex()

Procedure.i _AllocateMemory(Size, Flags=0)

  Protected *Memory = AllocateMemory(Size, Flags)
  If *Memory
    LockMutex(IsMemory_Mutex)
    MemoryAddresses(Str(*Memory)) = #True
    UnlockMutex(IsMemory_Mutex)
  EndIf
  ProcedureReturn *Memory

EndProcedure

Procedure.i _ReAllocateMemory(*Memory, Size, Flags=0)

  Protected *NewMemory = ReAllocateMemory(*Memory, Size, Flags)
  If *NewMemory
    LockMutex(IsMemory_Mutex)
    DeleteMapElement(MemoryAddresses(), Str(*Memory))
    MemoryAddresses(Str(*NewMemory)) = #True
    UnlockMutex(IsMemory_Mutex)
  EndIf
  ProcedureReturn *NewMemory

EndProcedure

Procedure _FreeMemory(*Memory)
  FreeMemory(*Memory)
  LockMutex(IsMemory_Mutex)
  DeleteMapElement(MemoryAddresses(), Str(*Memory))
  UnlockMutex(IsMemory_Mutex)
EndProcedure

Macro AllocateMemory(Size, Flags=0)
  _AllocateMemory(Size, Flags)
EndMacro

Macro ReAllocateMemory(Memory, Size, Flags=0)
  _ReAllocateMemory(Memory, Size, Flags)
EndMacro

Macro IsMemory(Memory)
  MemoryAddresses(Str(Memory))
EndMacro

Macro FreeMemory(Memory)
  _FreeMemory(Memory)
EndMacro

;-Example
CompilerIf #PB_Compiler_IsMainFile

  Define *Memory1, *Memory2, *Memory2_resized
  
  *Memory1 = AllocateMemory(4*1024)
  *Memory2 = AllocateMemory(8*1024)
  If *Memory1 = 0 Or *Memory2 = 0
    Debug "Error: AllocateMemory()"
    End
  EndIf
  
  Debug "IsMemory(Memory1): " + IsMemory(*Memory1)
  Debug "IsMemory(Memory2): " + IsMemory(*Memory2)
  Debug "---------------------------------------"
  Debug "Free Memory1"
  FreeMemory(*Memory1)
  Debug "---------------------------------------"
  Debug "IsMemory(Memory1): " + IsMemory(*Memory1)
  Debug "IsMemory(Memory2): " + IsMemory(*Memory2)
  
  Debug ""
  Debug "======================================="
  Debug ""
  
  Debug "MemorySize(Memory2): " + MemorySize(*Memory2)
  Debug "---------------------------------------"
  Debug "Resize Memory2"
  Debug "---------------------------------------"
  *Memory2_resized = ReAllocateMemory(*Memory2, 16*1024)
  If *Memory2_resized
    *Memory2 = *Memory2_resized
    Debug "MemorySize(Memory2): " + MemorySize(*Memory2)
  EndIf
  
  Debug ""
  Debug "======================================="
  Debug ""
  
  Debug "IsMemory(Memory1): " + IsMemory(*Memory1)
  Debug "IsMemory(Memory2): " + IsMemory(*Memory2)
  Debug "---------------------------------------"
  Debug "Free Memory2"
  FreeMemory(*Memory2)
  Debug "---------------------------------------"
  Debug "IsMemory(Memory1): " + IsMemory(*Memory1)
  Debug "IsMemory(Memory2): " + IsMemory(*Memory2)

CompilerEndIf