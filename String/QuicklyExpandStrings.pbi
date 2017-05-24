;   Description: Allows to quickly expand strings
;        Author: Sicro
;          Date: 2017-03-19
;            OS: Windows, Linux, Mac
; English-Forum: Not in the forum
;  French-Forum: Not in the forum
;  German-Forum: Not in the forum
; -----------------------------------------------------------------------------

DeclareModule QuicklyExpandStrings
  Declare.i CreateString()
  Declare.i AddToString(*String, String$)
  Declare$  GetString(*String)
  Declare   FreeString(*String)
EndDeclareModule

Module QuicklyExpandStrings
  #Size_Megabyte = 1024 * 1024
  
  Structure StringStruc
    DataLength.i
    *Memory
  EndStructure
  
  Procedure.i CreateString()
    Protected *String.StringStruc
    
    *String = AllocateMemory(SizeOf(StringStruc))
    If *String = 0
      ProcedureReturn #False
    EndIf
    
    *String\Memory = AllocateMemory(#Size_Megabyte)
    If *String\Memory = 0
      FreeMemory(*String)
      ProcedureReturn #False
    EndIf
    
    ProcedureReturn *String
  EndProcedure
  
  Procedure.i AddToString(*String.StringStruc, String$)
    Protected StringLength = StringByteLength(String$)
    Protected *NewMemory
  
    If *String = 0
      ProcedureReturn #False
    EndIf
    
    If MemorySize(*String\Memory) <= (*String\DataLength + StringLength)
      *NewMemory = ReAllocateMemory(*String\Memory, *String\DataLength + StringLength + #Size_Megabyte)
      If *NewMemory = 0
        ProcedureReturn #False
      EndIf
      *String\Memory = *NewMemory
    EndIf
    PokeS(*String\Memory + *String\DataLength, String$)
    *String\DataLength + StringLength
  
    ProcedureReturn #True
  EndProcedure
  
  Procedure$ GetString(*String.StringStruc)
    ProcedureReturn PeekS(*String\Memory, *String\DataLength / SizeOf(Character))
  EndProcedure
  
  Procedure FreeString(*String.StringStruc)
    FreeMemory(*String\Memory)
    FreeMemory(*String)
  EndProcedure
EndModule

;-Example
CompilerIf #PB_Compiler_IsMainFile
  
  *String = QuicklyExpandStrings::CreateString()
  If *String = 0 : End : EndIf
    
  If Not QuicklyExpandStrings::AddToString(*String, "Hello! ")
    Debug "Error: AddString"
  EndIf
  
  If Not QuicklyExpandStrings::AddToString(*String, "This is a example text.")
    Debug "Error: AddString"
  EndIf
  
  Debug QuicklyExpandStrings::GetString(*String)
  
  QuicklyExpandStrings::FreeString(*String) ; This is done automatically when the program ends.
CompilerEndIf
