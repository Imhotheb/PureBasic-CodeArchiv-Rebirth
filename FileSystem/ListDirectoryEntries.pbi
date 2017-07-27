;   Description: Adds directory entries to a list
;        Author: Sicro
;          Date: 2017-07-27
;            OS: Windows, Linux, Mac
; English-Forum: Not in the forum
;  French-Forum: Not in the forum
;  German-Forum: Not in the forum
; -----------------------------------------------------------------------------

; Thanks goes to "useful" from the English forum for the inspiration to use a callback:
; http://www.purebasic.fr/english/viewtopic.php?f=12&t=68172

EnumerationBinary 
  #ListDirectoryEntries_Mode_ListDirectories
  #ListDirectoryEntries_Mode_ListFiles
  #ListDirectoryEntries_Mode_ListAll = #ListDirectoryEntries_Mode_ListDirectories | #ListDirectoryEntries_Mode_ListFiles
EndEnumeration

Prototype ProtoListDirectoryEntriesCallback(EntryPath$)

Procedure ListDirectoryEntries(Path$, Callback.ProtoListDirectoryEntriesCallback, FileExtensions$="", EnableRecursiveScan=#True, Mode=#ListDirectoryEntries_Mode_ListAll)

  Protected Directory
  Protected EntryName$
  Protected EntryExtension$
  Protected Slash$

  CompilerSelect #PB_Compiler_OS
    CompilerCase #PB_OS_Windows: Slash$ = "\"
    CompilerDefault:           : Slash$ = "/"
  CompilerEndSelect

  If Right(Path$, 1) <> Slash$
    Path$ + Slash$
  EndIf
  
  FileExtensions$ = "," + FileExtensions$ + ","

  Directory = ExamineDirectory(#PB_Any, Path$, "*")
  If Directory
    While NextDirectoryEntry(Directory)

      EntryName$ = DirectoryEntryName(Directory)

      Select DirectoryEntryType(Directory)

        Case #PB_DirectoryEntry_File

          If Mode & #ListDirectoryEntries_Mode_ListFiles
            If FileExtensions$ <> ",,"
              EntryExtension$ = GetExtensionPart(EntryName$)
              If EntryExtension$ = ""
                Continue
              EndIf
              If Not FindString(FileExtensions$, "," + EntryExtension$ + ",", #PB_String_NoCase)
                Continue
              EndIf
            EndIf
            Callback(Path$ + EntryName$)
          EndIf

        Case #PB_DirectoryEntry_Directory

          If EntryName$ <> "." And EntryName$ <> ".."
            If Mode & #ListDirectoryEntries_Mode_ListDirectories
              Callback(Path$ + EntryName$)
            EndIf

            If EnableRecursiveScan
              ListDirectoryEntries(Path$ + EntryName$, Callback, FileExtensions$, EnableRecursiveScan, Mode)
            EndIf

          EndIf

      EndSelect

    Wend
    FinishDirectory(Directory)
  EndIf

EndProcedure

;-Example
CompilerIf #PB_Compiler_IsMainFile
  
  Procedure Callback(EntryPath$)
    Debug EntryPath$
  EndProcedure
  
  ListDirectoryEntries(GetUserDirectory(#PB_Directory_Documents), @Callback())
  ;ListDirectoryEntries(GetUserDirectory(#PB_Directory_Documents), @Callback(), "pdf,txt", #True, #ListDirectoryEntries_Mode_ListFiles)
  ;ListDirectoryEntries(GetUserDirectory(#PB_Directory_Documents), @Callback(), "", #True, #ListDirectoryEntries_Mode_ListDirectories)
  ;ListDirectoryEntries(GetUserDirectory(#PB_Directory_Documents), @Callback(), "", #False, #ListDirectoryEntries_Mode_ListFiles)
  
CompilerEndIf
