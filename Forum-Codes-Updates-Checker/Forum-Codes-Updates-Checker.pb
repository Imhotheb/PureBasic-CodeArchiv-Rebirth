;   Description: A PB tool that helps to check the codes that are in the CodeArchive, whether they are still up-to-date
;        Author: Sicro
;          Date: 2017-06-05
;            OS: Windows, Linux, Mac
; English-Forum: Not in the forum
;  French-Forum: Not in the forum
;  German-Forum: Not in the forum
; -----------------------------------------------------------------------------

CompilerIf Not #PB_Compiler_Debugger
  CompilerError "Activate the debugger and run the code only inside the PB-IDE"
CompilerEndIf

EnableExplicit

InitNetwork()
UseSHA1Fingerprint()

Global EditDateInFirstPost = CreateRegularExpression(#PB_Any, "(Zuletzt geändert von|Last edited by)\s+.*\s+(am|on)\s+(?<time>.*),")
Global CountOfPosts        = CreateRegularExpression(#PB_Any, "[0-9]+\s+(Beiträge|Beitrag|posts|post)")
If Not CountOfPosts
  Debug "Error: CreateRegularExpression()"
  End
EndIf

Procedure AddFiles(Path$, FileExtensions$, List Files$())
  
  Protected Slash$, EntryName$, FileExtension$
  Protected Directory
  
  CompilerIf #PB_Compiler_OS = #PB_OS_Windows
    Slash$ = "\"
  CompilerElse ; Linux, Mac
    Slash$ = "/"
  CompilerEndIf
  
  If Right(Path$, 1) <> Slash$
    Path$ + Slash$
  EndIf
  
  FileExtensions$ = RemoveString(FileExtensions$, " ")
  FileExtensions$ = "," + FileExtensions$ + ","
  
  Directory = ExamineDirectory(#PB_Any, Path$, "")
  If Directory
    
    While NextDirectoryEntry(Directory)
      EntryName$ = DirectoryEntryName(Directory)
      Select DirectoryEntryType(Directory)
        Case #PB_DirectoryEntry_File
          FileExtension$ = GetExtensionPart(EntryName$)
          If FileExtension$ = ""
            FileExtension$ = " "
          EndIf
          If FileExtensions$ <> "" And FindString(FileExtensions$, "," + FileExtension$ + ",", 1, #PB_String_NoCase) = 0
            Continue
          EndIf
          If AddElement(Files$())
            Files$() = Path$ + EntryName$
          EndIf
        Case #PB_DirectoryEntry_Directory
          Select EntryName$
            Case ".", ".."
            Default
              AddFiles(Path$ + EntryName$, FileExtensions$, Files$())
          EndSelect
      EndSelect
    Wend
    
    FinishDirectory(Directory)
  EndIf
  
EndProcedure

Procedure.i FileHeader_GetURLs(File$, List URLs$())
  Protected File, RowsCounter
  Protected Line$, Value$
  
  ClearList(URLs$())
  
  File = ReadFile(#PB_Any, File$, #PB_UTF8)
  If File
    While Not Eof(File) And RowsCounter <> 8 ; "RowsCounter" ensures that only the code header is scanned
      Line$  = ReadString(File)
      Value$ = Trim(Mid(Line$, FindString(Line$, ":") + 1))
      If Left(Value$, 7) = "http://" Or Left(Value$, 8) = "https://"
        If AddElement(URLs$())
          URLs$() = Value$
        EndIf
      EndIf
      RowsCounter + 1
    Wend
    CloseFile(File)
    ProcedureReturn #True
  EndIf
EndProcedure

Procedure.s GetEditInfos(File$)
  Protected File, FileContent$, Pos, StringToFind$, EditInfos$
  
  File = ReadFile(#PB_Any, File$, #PB_UTF8)
  If Not File : ProcedureReturn "" : EndIf
  
  FileContent$ = ReadString(File, #PB_File_IgnoreEOL)
  CloseFile(File)
  
  EditInfos$ = "EditDateInFirstPost: "
  If ExamineRegularExpression(EditDateInFirstPost, FileContent$) And NextRegularExpressionMatch(EditDateInFirstPost)
    EditInfos$ + RegularExpressionNamedGroup(EditDateInFirstPost, "time")
  EndIf
  EditInfos$ + #CRLF$ + "CountOfPosts: "
  If ExamineRegularExpression(CountOfPosts, FileContent$) And NextRegularExpressionMatch(CountOfPosts)
    EditInfos$ + RegularExpressionMatchString(CountOfPosts)
  EndIf
  
  ProcedureReturn EditInfos$
EndProcedure

Procedure.s GetCachedEditInfos(URL$, CachePath$)
  Protected File, StringFormat, FileContent$
  
  File = ReadFile(#PB_Any, CachePath$ + StringFingerprint(URL$, #PB_Cipher_SHA1), #PB_Ascii)
  If File
    FileContent$ = ReadString(File, #PB_File_IgnoreEOL)
    CloseFile(File)
    ProcedureReturn FileContent$
  EndIf
EndProcedure

Procedure CacheEditInfos(URL$, EditInfos$, CachePath$)
  Protected File
  
  File = CreateFile(#PB_Any, CachePath$ + StringFingerprint(URL$, #PB_Cipher_SHA1), #PB_Ascii)
  If File
    WriteString(File, EditInfos$)
    CloseFile(File)
  EndIf
EndProcedure

Procedure.i RunStandardProgram(FilePath$)
  
  Protected Result
  
  CompilerSelect #PB_Compiler_OS
    CompilerCase #PB_OS_Windows
      Result = RunProgram(FilePath$)
    CompilerCase #PB_OS_Linux
      ; http://www.chabba.de/Linux/System/System_OpenWithStandardApp.pb
      Result = RunProgram("xdg-open", FilePath$, "")
      If Not Result
        Result = RunProgram("gnome-open", FilePath$, "")
      EndIf
  CompilerEndSelect
  
  ProcedureReturn Result
  
EndProcedure

Define CodesPath$
Define URL$, CacheDirectoryPath$
Define CachedEditInfos$, EditInfos$
Define TempFile$
Define ToDoList$
Define i
NewList Files$()
NewList URLs$()

CodesPath$ = PathRequester("Open PureBasic-CodeArchiv-Rebirth", "")
If FileSize(CodesPath$) <> -2
  Debug "Invalid path"
  End
EndIf

SetCurrentDirectory(#PB_Compiler_FilePath)

CompilerIf #PB_Compiler_OS = #PB_OS_Windows
  CacheDirectoryPath$ = "Cache\"
CompilerElse
  CacheDirectoryPath$ = "Cache/"
CompilerEndIf
If FileSize(CacheDirectoryPath$) <> -2
  If Not CreateDirectory(CacheDirectoryPath$)
    Debug "Failed to create cache directory!"
    End
  EndIf
EndIf

TempFile$ = GetTemporaryDirectory() + "DownloadedFile"

AddFiles(CodesPath$, "pb,pbi,txt", Files$())
SortList(Files$(), #PB_Sort_Ascending)

ForEach Files$()
  i + 1
  
  If FileHeader_GetURLs(Files$(), URLs$())
    ForEach URLs$()
      If ReceiveHTTPFile(URLs$(), TempFile$)
        EditInfos$       = GetEditInfos(TempFile$)
        CachedEditInfos$ = GetCachedEditInfos(URLs$(), CacheDirectoryPath$)
      
        If EditInfos$ <> CachedEditInfos$
          CacheEditInfos(URLs$(), EditInfos$, CacheDirectoryPath$)
          ToDoList$ + Files$() + #CRLF$ +
                      ":::" + #CRLF$ +
                      URLs$() + #CRLF$ +
                      EditInfos$ + #CRLF$ + #CRLF$ +
                      "----------------------------------------------" + #CRLF$ + #CRLF$
        EndIf
      EndIf
    Next
  EndIf
  
  Debug Str(i) + " of " + Str(ListSize(Files$())) + " files checked"
  Debug "------------------"
Next

If ToDoList$ = ""
  MessageRequester("Forum-Codes-Updates-Checker", "Nothing to do!", #PB_MessageRequester_Info)
Else
  If CreateFile(0, "ToDo.txt", #PB_UTF8)
    WriteStringFormat(0, #PB_UTF8)
    WriteStringN(0, ToDoList$)
    CloseFile(0)
  EndIf
  MessageRequester("Forum-Codes-Updates-Checker", "New codes on the forum found! A todo file was created:" + #CRLF$ +
                                                  GetCurrentDirectory() + "ToDo.txt" + #CRLF$ + #CRLF$ +
                                                  "File opens automatically after this message!", #PB_MessageRequester_Info)
  RunStandardProgram(GetCurrentDirectory() + "ToDo.txt")
EndIf
