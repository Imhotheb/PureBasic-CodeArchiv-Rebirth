;   Description: Adds support to get or set cursor position on editor gadgets
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

Procedure.i SetEditorGadgetCursorPos(Gadget.i, NewPos.i)

  Protected.GtkTextBuffer *Buffer
  Protected.GtkTextIter   Pos

  If Not IsGadget(Gadget)
    ProcedureReturn #False
  EndIf

  *Buffer = gtk_text_view_get_buffer_(GadgetID(Gadget))
  If Not *Buffer
    ProcedureReturn #False
  EndIf

  ; Iterator der Position ermitteln
  gtk_text_buffer_get_iter_at_offset_(*Buffer, @Pos, NewPos)

  ; Cursor entsprechend dem Iterator setzen
  gtk_text_buffer_place_cursor_(*Buffer, @Pos)

  ProcedureReturn #True

EndProcedure

Procedure.i GetEditorGadgetCursorPos(Gadget)

  Protected.GtkTextBuffer *Buffer
  Protected.GtkTextMark   *Cursor
  Protected.GtkTextIter   Pos

  If Not IsGadget(Gadget)
    ProcedureReturn #False
  EndIf

  *Buffer = gtk_text_view_get_buffer_(GadgetID(Gadget))
  If Not *Buffer
    ProcedureReturn -1
  EndIf

  *Cursor = gtk_text_buffer_get_insert_(*Buffer)
  gtk_text_buffer_get_iter_at_mark_(*Buffer, @Pos, *Cursor)

  ProcedureReturn gtk_text_iter_get_offset_(@Pos)

EndProcedure

; SetEditorGadgetCursorPos(0, 10)
; Pos = GetEditorGadgetCursorPos(0)
