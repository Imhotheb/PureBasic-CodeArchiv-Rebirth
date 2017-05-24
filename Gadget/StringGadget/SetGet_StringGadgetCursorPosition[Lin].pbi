;   Description: Adds support to set or get the cursor position on string gadgets
;        Author: Sicro
;          Date: 2017-04-09
;            OS: Linux
; English-Forum: Not in the forum
;  French-Forum: Not in the forum
;  German-Forum: Not in the forum
; -----------------------------------------------------------------------------

CompilerIf #PB_Compiler_OS <> #PB_OS_Linux
  CompilerError "Supported OS are only: Linux"
CompilerEndIf

Macro SetStringGadgetCursorPos(Gadget, NewPos)

  gtk_editable_set_position_(GadgetID(Gadget), NewPos)

EndMacro

Macro GetStringGadgetCursorPos(Gadget)

  gtk_editable_get_position_(GadgetID(Gadget))

EndMacro

; SetStringGadgetCursorPos(0, 10)
; Pos = GetStringGadgetCursorPos(0)
