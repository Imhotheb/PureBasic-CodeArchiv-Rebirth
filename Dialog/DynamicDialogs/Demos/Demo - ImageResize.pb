XIncludeFile "..\DynamicDialogs_plain.pbi"		; please adjust include-path

Enumeration ;Gadgets
	#gad_Spacer1
	#gad_Spacer2
	#gad_Spacer3
	#gad_Spacer4
	#gad_Container
	#gad_Image
EndEnumeration

Enumeration ;Images
	#SourceImage
	#DisplayImage
EndEnumeration

CreateImage(#SourceImage,800,600)				; ----- create an example-image
If StartDrawing(ImageOutput(#SourceImage))
	Box(0,0,800,600,#Blue)
	Circle(400,300,200,#Red)
	StopDrawing()
EndIf

Runtime Procedure MyResizeEvent()				; ----- resize callback-event
	CopyImage(#SourceImage, #DisplayImage)
	If IsGadget(#gad_Container)
		ResizeImage(#DisplayImage, GadgetWidth(#gad_Container), GadgetHeight(#gad_Container))
		SetGadgetState(#gad_Image, ImageID(#DisplayImage))
	EndIf
EndProcedure 

UseModule DynamicDialogs
UseModule DynamicDialogs_plain

ClearXML()

; ----- create the Dialog-Window

	Window(1, "", "Resize me ...", #PB_Window_SizeGadget | #PB_Window_SystemMenu, 450, 350)
		GridBox(5,0,0,#Expand_Yes, #Expand_Yes)
			Empty() : Empty() : Empty() : Empty() : Empty() : Empty()
			Container(#gad_Container,"",0,0,0,0,"",3,3) : EndContainer()
			Empty() : Empty() : Empty() : Empty() : Empty() : Empty()
		EndGridBox()
	EndWindow()

UnuseModule DynamicDialogs_plain	

Debug GetXML()

If OpenDialogWindow(0, GetXML(), 1)								; ----- Create and open the Dialog-Window
	
	UnuseModule DynamicDialogs	
	
	UseGadgetList(GadgetID(#gad_Container))					; ----- Insert ImageGadget into the Container
	ImageGadget(#gad_Image, 0,0,20,20,0)
	
	BindEvent(#PB_Event_SizeWindow, @MyResizeEvent())		; ----- Bind the Resize-Event to the Callback-Procedure
	MyResizeEvent()													; ----- need to call the Callback once, to do a first resize
	
	Repeat : Until WaitWindowEvent() = #PB_Event_CloseWindow
EndIf

