;   Description: Save to a file in a specific file format like RTF or HTML
;        Author: wilbert
;          Date: 2014-07-09
;            OS: Mac
; English-Forum: http://www.purebasic.fr/english/viewtopic.php?p=448103#p448103
;  French-Forum: 
;  German-Forum: 
; -----------------------------------------------------------------------------

CompilerIf #PB_Compiler_OS<>#PB_OS_MacOS
  CompilerError "MacOs only!"
CompilerEndIf

Procedure SaveFormattedText(EditorGadget, FileName.s, Type.s = "NSRTF")
  
  ; Type can be "NSPlainText", "NSRTF", "NSHTML", "NSDocFormat", "NSWordML", "NSOfficeOpenXML", "NSOpenDocument"
  
  Protected.i range.NSRange, attributes, dataObj, textStorage = CocoaMessage(0, GadgetID(EditorGadget), "textStorage")
  CocoaMessage(@range\length, textStorage, "length")
  CocoaMessage(@attributes, 0, "NSDictionary dictionaryWithObject:$", @Type, "forKey:$", @"DocumentType")
  CocoaMessage(@dataObj, textStorage, "dataFromRange:@", @range, "documentAttributes:", attributes, "error:", #Null)
  ProcedureReturn CocoaMessage(0, dataObj, "writeToFile:$", @FileName, "atomically:", #NO)
  
EndProcedure

;-Example
CompilerIf #False
  SaveFormattedText(0, "MyFile.rtf", "NSRTF"); save as rtf file
CompilerEndIf

