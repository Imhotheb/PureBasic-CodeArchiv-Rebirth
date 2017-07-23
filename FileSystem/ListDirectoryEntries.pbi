;   Description: Adds directory entries to a list
;        Author: Sicro
;          Date: 2017-07-23
;            OS: Windows, Linux, Mac
; English-Forum: Not in the forum
;  French-Forum: Not in the forum
;  German-Forum: Not in the forum
; -----------------------------------------------------------------------------

EnumerationBinary 
  #ListDirectoryEntries_Mode_ListDirectories
  #ListDirectoryEntries_Mode_ListFiles
  #ListDirectoryEntries_Mode_ListAll = #ListDirectoryEntries_Mode_ListDirectories | #ListDirectoryEntries_Mode_ListFiles
EndEnumeration

Procedure ListDirectoryEntries(Path$, List DirectoryEntries$(), FileExtensions$="", EnableRecursiveScan=#True, Mode=#ListDirectoryEntries_Mode_ListAll)

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
            If AddElement(DirectoryEntries$())
              DirectoryEntries$() = Path$ + EntryName$
            EndIf
          EndIf

        Case #PB_DirectoryEntry_Directory

          If EntryName$ <> "." And EntryName$ <> ".."
            If Mode & #ListDirectoryEntries_Mode_ListDirectories And AddElement(DirectoryEntries$())
              DirectoryEntries$() = Path$ + EntryName$
            EndIf

            If EnableRecursiveScan
              ListDirectoryEntries(Path$ + EntryName$, DirectoryEntries$(), FileExtensions$, EnableRecursiveScan, Mode)
            EndIf

          EndIf

      EndSelect

    Wend
    FinishDirectory(Directory)
  EndIf

EndProcedure

;-Example
CompilerIf #PB_Compiler_IsMainFile
  NewList myList$()
  ListDirectoryEntries(GetUserDirectory(#PB_Directory_Documents), myList$())
  ;ListDirectoryEntries(GetUserDirectory(#PB_Directory_Documents), myList$(), "pdf,txt", #True, #ListDirectoryEntries_Mode_ListFiles)
  ;ListDirectoryEntries(GetUserDirectory(#PB_Directory_Documents), myList$(), "", #True, #ListDirectoryEntries_Mode_ListDirectories)
  ;ListDirectoryEntries(GetUserDirectory(#PB_Directory_Documents), myList$(), "", #False, #ListDirectoryEntries_Mode_ListFiles)
  ForEach myList$()
    Debug myList$()
  Next
CompilerEndIf
