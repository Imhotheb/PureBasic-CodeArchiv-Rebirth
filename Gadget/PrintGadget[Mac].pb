;   Description: Print the Gadget
;        Author: wilbert
;          Date: 2012-08-07
;            OS: Mac
; English-Forum: http://www.purebasic.fr/english/viewtopic.php?p=386831#p386831
;  French-Forum: 
;  German-Forum: 
; -----------------------------------------------------------------------------

CompilerIf #PB_Compiler_OS<>#PB_OS_MacOS
  CompilerError "MacOs only!"
CompilerEndIf

CocoaMessage(0, GadgetID(MyGadget), "print:", #nil)
