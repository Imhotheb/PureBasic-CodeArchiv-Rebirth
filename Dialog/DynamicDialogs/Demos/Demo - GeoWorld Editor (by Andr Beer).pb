XIncludeFile "..\DynamicDialogs_plain.pbi"

#BlueLink = $C80000    ; used for Hyperlinks in GeoWorld

;- GUI Constants ******************************************************************************************
; Images
Enumeration 
  #MediaSaveImage     ; loaded image in its original full size, before saving to the Multimedia DB resized to a smaller size for using in GeoWorld (e.g. 19200x1080 pixel maximum)
  #MediaCanvasImage   ; loaded image - resized to the small CanvasGadget (around 300x300 pixel) in the main window / Multimedia module...
  #MediaSelectImage   ; loaded image - resized to the bigger canvas in the ImageSelectArea() function for storing only a selected part of the original image
  #MediaButtonUp
  #MediaButtonDown
  #MediaButtonLeft
  #MediaButtonRight
  #MediaButtonResize
  #MediaCopyCoordinates
  #MediaPasteCoordinates
  #MediaSaveDB
  #MediaOpenDisk
  #MediaOpenLink
  #MediaOpenAuthorsLink
  #MediaThumbnailTempImage  ; will be used for loading an image and resize it to max. 16x16 pixel, which will then be copied into the black-backgrounded real thumbnail image below
  #Media1stThumbnailImage   ; with this ImageID are starting the little thumbnail images, created for each picture in the Multimedia database. So don't use higher IDs for other things!!!!
EndEnumeration

; Dialogs
Enumeration 
  #MainDialog
  #StatusDialog
  #DateSelectDialog
  #SelectImageDialog
EndEnumeration

; Windows
Enumeration 
  #MainWin
  #StatusWin
  #DateSelectWin
  #SelectImageWin
EndEnumeration

; Menu shortcuts (menu items)
Enumeration 
  #MenuQuit
  #MenuFinishInput     ; currently used for finishing the input in the editable 'Licence type' combobox in Picture module
  #MenuDeleteItem      ; currently used for deleting the selected item in the editable 'Licence type' combobox in Picture module
  #MenuCountryHelp  
  #StatusWinQuit
  #DateWinQuit
  #SelectImageWinQuit
EndEnumeration

; PanelTabs (used for storing the currently selected tab as their numbering also starts with 0 for the first tab)
Enumeration 
  #PanelNavigation
  #PanelHistoryDB
  #PanelReligionDB
  #PanelPictureDB
EndEnumeration

; Gadgets
Enumeration 
  ; Panel
  #PanelEditor
    
  ;- .. Main (Navigation)
  #MainLanguageSelection
  #MainLanguageEnglish
  #MainLanguageEnglishText
  #MainLanguageGerman
  #MainLanguageGermanText
  #MainDatabaseSelection
  #MainCallHistory
  #MainCallReligionDB
  #MainCallPictureDB
  #MainSendDatabases
  #MainSender
  #MainSenderSelect
  #MainRecipient
  #MainRecipientSelect
  #MainSelectFileToSend
  #MainHistoryDB
  #MainHistoryLocal
  #MainReligionDB
  #MainPictureDB
  #MainStartSending
  
  ;- .. HistoryEditor
  #FrameTime
  #YearStartText
  #YearStart
  #MonthStartText
  #MonthStart
  #DayStartText
  #DayStart
  #FlagStartText
  #FlagStart
  #DateAddText
  #DateAdd
  #YearEndText
  #YearEnd
  #MonthEndText
  #MonthEnd
  #DayEndText
  #DayEnd
  #FlagEndText
  #FlagEnd
  #FrameFilters
  #Filter
  #SearchTerm
  #SearchTermText
  #FrameSettings
  #ID
  #TypeText
  #Type1
  #Type2
  #Type4
  #Type8
  #Type16
  #Type32
  #Type64
  #Type128
  #Type256
  #Type512
  #Type1024
  #Type2048
  #Type4096
  #Type8192
  #Type16384
  #Type32768
  #Type65536
  #ImportanceText
  #Importance1
  #Importance2
  #Importance3
  #ContinentText
  #ContinentSelect
  #ContinentID
  #CountryText
  #CountrySelect
  #CountryID
  #StateID
  #CityID
  #PersonID
  #FrameEvent
  #Event
  #EventTranslatedInto
  #EventTranslatedLang
  #EventSaveLocaleHistory
  #EventTranslated
  #For1
  #For10
  #For100
  #For1000
  #ForEnd
  #Back1
  #Back10
  #Back100
  #Back1000
  #BackEnd
  #Save
  #YearFilter
  #CountryFilter
  #InsertFrame
  #InsertBefore
  #InsertAfter
  #DeleteFrame
  #DeleteGO
  
  ;- .. ReligionEditor
  #ReliDB_FrameSelect
  #ReliDB_CountrySelect
  #ReliDB_PreviewFrame
  #ReliDB_Preview
  #ReliDB_Help
  #ReliDB_Internet
  #ReliDB_WorldFactBook
  #ReliDB_FrameEdit
  #ReliDB_CountryReligionsText
  #ReliDB_ReligionSelect
  #ReliDB_SelectedCountryText
  #ReliDB_SelectedCountry
  #ReliDB_ReligionsScrollArea
  #ReliDB_SelectReligion
  #ReliDB_EnterPortion
  #ReliDB_Combobox1
  #ReliDB_Combobox2
  #ReliDB_Combobox3
  #ReliDB_Combobox4
  #ReliDB_Combobox5
  #ReliDB_Combobox6
  #ReliDB_Combobox7
  #ReliDB_Combobox8
  #ReliDB_Combobox9
  #ReliDB_Combobox10
  #ReliDB_Combobox11
  #ReliDB_Combobox12
  #ReliDB_ShareInput1
  #ReliDB_ShareInput2
  #ReliDB_ShareInput3
  #ReliDB_ShareInput4
  #ReliDB_ShareInput5
  #ReliDB_ShareInput6
  #ReliDB_ShareInput7
  #ReliDB_ShareInput8
  #ReliDB_ShareInput9
  #ReliDB_ShareInput10
  #ReliDB_ShareInput11
  #ReliDB_ShareInput12
  #ReliDB_StateReligionText
  #ReliDB_StateReligion
  #ReliDB_NotesText
  #ReliDB_Notes
  #ReliDB_NotesLocalText
  #ReliDB_NotesLocal
  #ReliDB_StoreCountrySettings
  #ReliDB_SaveDatabase
  
  ;- .. PictureEditor
  #PicDB_PictureList
  #PicDB_FilterFrame
  #PicDB_FilterType
  #PicDB_FilterString
  #PicDB_AddItem
  #PicDB_SaveItem
  #PicDB_DeleteItem
  #PicDB_SaveDB
  #PicDB_Export
  #PicDB_ScrollArea
  #PicDB_Frame1
  #PicDB_ImageCanvas
  #PicDB_IDText
  #PicDB_ID
  #PicDB_FilenameText
  #PicDB_Filename
  #PicDB_SourceLinkText
  #PicDB_SourceLink
  #PicDB_OpenSourceLink
  #PicDB_Requester
  #PicDB_PictureSizeTitle
  #PicDB_PictureSizeOrg
  #PicDB_PictureSizeResized
  #PicDB_MapCanvas
  #PicDB_ZoomText
  #PicDB_Zoom
  #PicDB_NavigationText
  #PicDB_NaviUp
  #PicDB_NaviDown
  #PicDB_NaviLeft
  #PicDB_NaviRight
  #PicDB_NaviResize
  #PicDB_LongitudeText
  #PicDB_Longitude
  #PicDB_LatitudeText
  #PicDB_Latitude
  #PicDB_CopyCoordinates
  #PicDB_PasteCoordinates
  #PicDB_Frame2
  #PicDB_TitleText
  #PicDB_Title
  #PicDB_TitleTranslatedText
  #PicDB_TitleTranslated
  #PicDB_NativeTitleText
  #PicDB_NativeTitle
  #PicDB_DescriptionText
  #PicDB_Description
  #PicDB_DescriptionTranslatedText
  #PicDB_DescriptionTranslated
  #PicDB_TypeText
  #PicDB_Type
  #PicDB_ImportanceText
  #PicDB_Importance
  #PicDB_DateText
  #PicDB_Date
  #PicDB_DateRequester
  #PicDB_AuthorText
  #PicDB_Author
  #PicDB_OpenAuthorsWebsite
  #PicDB_AuthorWWWText
  #PicDB_AuthorWWW
  #PicDB_PublicNoteText
  #PicDB_PublicNote
  #PicDB_PublicNoteTranslatedText
  #PicDB_PublicNoteTranslated
  #PicDB_LicenceText
  #PicDB_Licence
  #PicDB_LicenceWWW
  #PicDB_LicenceExample
  #PicDB_InternalNoteText
  #PicDB_InternalNote
  #PicDB_Frame3
  #PicDB_ContinentSelect
  #PicDB_ContinentID
  #PicDB_CountrySelect
  #PicDB_CountryID
  #PicDB_AdminDivCountrySelectText
  #PicDB_AdminDivCountrySelect
  #PicDB_AdminDivSelect
  #PicDB_AdminDivID
  #PicDB_CitySelect
  #PicDB_CityID
  #PicDB_WorldHeritageSelect
  #PicDB_WorldHeritageID
  #PicDB_MountainSelect
  #PicDB_MountainID
  #PicDB_RessourceSelect
  #PicDB_RessourceID
  ; Gadget constants for the separate Image Selector window:
  #PicDB_SelectImageCanvas
  #PicDB_SelectImageStatus
  #PicDB_SelectImageOK
  #PicDB_SelectImageCancel
  
  ;- .. Status window:
  #StatusFrame
  #StatusOutput
  #StatusOK
  
  ;- .. DateSelector window:
  #DateFrame
  #DateCalendarGadget
  #DateOk
  #DateCancel
EndEnumeration


;- Create dummy images:

If CreateImage(0, 16, 16)
  StartDrawing(ImageOutput(0))
    DrawingMode(#PB_2DDrawing_Gradient)      
    BackColor($00FFFF)
    FrontColor($FF0000)
    BoxedGradient(0, 0, 16, 16)      
    Circle(8, 8, 8)
  StopDrawing()
EndIf
If CreateImage(1, 16, 16)
  StartDrawing(ImageOutput(1))
    DrawingMode(#PB_2DDrawing_Gradient)      
    BackColor($0000FF)
    FrontColor($FFAA00)
    BoxedGradient(0, 0, 16, 16)      
    Circle(8, 8, 8)
  StopDrawing()
EndIf


Procedure OpenGUI()
  Protected gad, win, XML$, dialog
  Protected x, y, width = 600, height = 500
  Protected a, a$
  Protected ImageCanvasWidth = 300, MapCanvasWidth = 400, CanvasHeight = 300    ; standard sizes of the CanvasGadgets
  Protected MaxGUIWidth, MaxGUIHeight
  Protected UseScrollArea = #False   ; if set to #True, most of the gadgets in the Picture module are included in a ScrollArea (to make them visible on smaller desktops)
  Protected VSpaceSmall = 5, VSpaceMedium = 10, VSpaceLarge = 20  ; vertical space between gadgets in the Dialog, values used for setting in Empty(width, XXX) definitions
  Protected VSpaceGadgetLists = 5   ; vertical space between 'gadget lists' (e.g. several OptionGadgets or CheckBoxGadgets below each other)
  
  ; Here we check the size of the users display and adapt the dimensions of CanvasGadgets, if the
  ; display is a smaller one (e.g. Andre on his MacBook with 1280x800 pixel):
  If ExamineDesktops()
    MaxGUIWidth = DesktopWidth(0)
    MaxGUIHeight = DesktopHeight(0)
    CompilerIf #PB_Compiler_OS = #PB_OS_MacOS
      ; Here we set the values for decreasing the height of the main window and move it a bit down, according to the menu and dock panel
      #GUI_MainWin_Menu = 20
      #GUI_MainWin_Dock = 50
      MaxGUIHeight - #GUI_MainWin_Dock - #GUI_MainWin_Menu
    CompilerEndIf
    If MaxGUIWidth < 1030
      ImageCanvasWidth = 150
      MapCanvasWidth = 180
    ElseIf MaxGUIWidth < 1300
      ImageCanvasWidth = 180
      MapCanvasWidth = 250
    ElseIf MaxGUIWidth < 1600
      ImageCanvasWidth = 220
      MapCanvasWidth = 300
    EndIf
    If MaxGUIHeight < 800
      CanvasHeight = 80
      VSpaceSmall  = 3     ; we set smaller values for the vertical space between GUI elements in the Dialog definition below!
      VSpaceMedium = 5     ; - " -    (will only be used in the Picture module for now, as the modules have a smaller GUI...)
      VSpaceLarge  = 10    ; - " -
      VSpaceGadgetLists = 0; space between several checkboxes/options (standard = 5 pixel), which need to be saved here
      UseScrollArea = #True
    ElseIf MaxGUIHeight < 900
      CanvasHeight = 150
      VSpaceGadgetLists = 2   ; space between several checkboxes/options (standard = 5 pixel), which need to be saved here
      UseScrollArea = #True
    EndIf
    ;Debug "MaxGUIWidth=" + MaxGUIWidth + ", MaxGUIHeight=" + MaxGUIHeight + ", ImageCanvas=" + ImageCanvasWidth + "x" + CanvasHeight + ", MapCanvas=" + MapCanvasWidth + "x" + CanvasHeight
  EndIf
  x = 0 : y = 0
  
  ; XML dialog definition for the FlagWindow window starts here:
  ; ------------------------------------------------------------------------------------------------------
  ; Note: locale strings with included special chars like "'", "<>", etc. are now automatically converted
  ;       to their html equivalents by the T2H() function included in the DynamicDialogs module :-)
  ;       Removing of special chars in religion names (e.g. "Baha'i" religion) isn't needed anymore,
  ;       because the previously problem of non-valid XML strings doesn't happen anymore with the 
  ;       great new DynamicDialogs module by 'PureLust', which handles such cases automatically now! :)
  ;
  ; Each time a 'name' definition is made, we will determine the GadgetID via DialogGadget() later, to
  ; receive and handle user input/actions later!
    
   UseModule DynamicDialogs                 ; we need the 'main'-Modul for standard functions
   UseModule DynamicDialogs_plain         ; we need the 'plain'-Modul for XML-Elements
  
  ClearXML()
  
  SetXMLOutputFormat(#XMLout_Indent, 5)
  SetXMLOutputFormat(#XMLout_AlignLineBreak, #True)
  
  Window(#MainWin, "", "GeoWorld v2 Editor - (c) Jan. 2017 by Andre Beer", #PB_Window_SystemMenu|#PB_Window_MinimizeGadget|#PB_Window_MaximizeGadget|#PB_Window_SizeGadget, width, height, width, height)
    ;- GUI: Panel
    Panel(#PanelEditor)
      ;- GUI: Navigation ********************************************************
      Tab("Navigation")
        vBox(2)
          ; Select language:
          Frame(#MainLanguageSelection, "", "Change Language", #PB_Frame_Single)
            hBox(#Expand_No, #alignTopCenter)
              Empty(10)
              ;   Now we add the country flags for English and German:
              If IsImage(0)
                ButtonImage(#MainLanguageEnglish, "", 0, #PB_Ignore, #PB_Ignore, ImageWidth(0), ImageHeight(0), #alignCenter)
              EndIf
              HyperLink(#MainLanguageEnglishText, "", "English")   ; blue link color is set below
              Empty(20)
              If IsImage(1)
                ButtonImage(#MainLanguageGerman, "", 1, #PB_Ignore, #PB_Ignore, ImageWidth(1), ImageHeight(1), #alignCenter)
              EndIf
              HyperLink(#MainLanguageGermanText, "", "German")   ; blue link color is set below
            EndHBox()
          EndFrame()
          hBox(1)
            ; Select database to edit:
            Frame(#MainDatabaseSelection, "", "Select Database", #PB_Frame_Single)
              vBox(#Expand_Yes, #alignTopCenter, 30)   ; <===   #alignCenter in vBox / hBox will DISABLE Expanding !!!!
                Button(#MainCallHistory, "", "History DB")
                Button(#MainCallReligionDB, "", "Religion DB")
                Button(#MainCallPictureDB, "", "Picture DB")
                Empty()
                Empty()
                Empty()
              EndVBox()
            EndFrame()
            
            ; Select databases to send to the GeoWorld team:
            Frame(#MainSendDatabases, "", "Send Databases", #PB_Frame_Single)
              vBox(#Expand_No, #alignTopCenter, 5)   ; <===   #alignCenter in vBox / hBox will DISABLE Expanding !!!!
                Empty(#PB_Default, 5)
                Text(#MainSender, "", "Sender")
                ComboBox(#MainSenderSelect)
                Empty(#PB_Default, 5)
                Text(#MainRecipient, "", "Recipient")
                ComboBox(#MainRecipientSelect)
                Empty(#PB_Default, 10)
                Text(#MainSelectFileToSend, "", "Select File To Send")
                CheckBox(#MainHistoryDB, "", "HistoryDB")
                CheckBox(#MainHistoryLocal, "", "HistoryLocale")
                CheckBox(#MainReligionDB, "", "ReligionDB")
                CheckBox(#MainPictureDB, "", "PictureDB")
                Empty(#PB_Default, 10)
                Button(#MainStartSending, "", "Start Sending")
              EndVBox()
            EndFrame()
          EndHBox()
        EndVBox()
      EndTab()
      ;- GUI: HistoryEditor ********************************************************
      Tab("HistoryDB")
        ; Main editing area on the left side
        vBox(#Expand_Yes, #alignLeft, VSpaceSmall)
          hBox(1)
            Frame(#FrameTime, "", "Date Of Event")
              vBox(#Expand_No, #alignLeft, VSpaceSmall)
                hBox(#Expand_Yes)
                  Text(#YearStartText, "", "Year Start")
                  String(#YearStart, "", "", 0, 40)
                  Empty(10)
                  Text(#MonthStartText, "", "Month Start")
                  String(#MonthStart, "", "", 0, 40)
                  Empty(10)
                  Text(#DayStartText, "", "Day Start")
                  String(#DayStart, "", "", 0, 40)
                  Empty(10)
                  Text(#FlagStartText, "", "Flag Start")
                  String(#FlagStart, "", "", 0, 60)
                EndHBox()
                hBox(3)
                  Empty(20)
                  Text(#DateAddText, "", "Date Add")
                  String(#DateAdd)
                  Empty(20)
                EndHBox()
                hBox(#Expand_Yes)
                  Text(#YearEndText, "", "Year End")
                  String(#YearEnd, "", "", 0, 40)
                  Empty(10)
                  Text(#MonthEndText, "", "Month End")
                  String(#MonthEnd, "", "", 0, 40)
                  Empty(10)
                  Text(#DayEndText, "", "Day End")
                  String(#DayEnd, "", "", 0, 40)
                  Empty(10)
                  Text(#FlagEndText, "", "Flag End")
                  String(#FlagEnd, "", "", 0, 60)
                EndHBox()
              EndVBox()
            EndFrame()
            ; Event filter/search:
            Frame(#FrameFilters, "", "Filters")
              vBox(#Expand_Yes, #alignTop, VSpaceSmall)
                ComboBox(#Filter, "", 0, 120)
                Empty(VSpaceSmall)
                Text(#SearchTermText, "", "Search For")
                String(#SearchTerm)
              EndVBox()
            EndFrame()
          EndHBox()  
          hBox(1)  
            Frame(#FrameSettings, "", "Settings")
              hBox(#Expand_Yes, #alignLeft, VSpaceSmall)
                vBox(#Expand_No, #alignLeft, VSpaceGadgetLists)
                  Text(#TypeText, "", "Type Of Event")
                  CheckBox(#Type1,     "", "Political")
                  CheckBox(#Type2,     "", "Economy")
                  CheckBox(#Type4,     "", "Sports")
                  CheckBox(#Type8,     "", "InventionsScience")
                  CheckBox(#Type16,    "", "DiscoveriesRecords")
                  CheckBox(#Type32,    "", "ArtFilm")
                  CheckBox(#Type64,    "", "Disasters")
                  CheckBox(#Type128,   "", "WarRebellions")
                  CheckBox(#Type256,   "", "AnimalsNature")
                  CheckBox(#Type512,   "", "Buildings")
                  CheckBox(#Type1024,  "", "Religous")
                  CheckBox(#Type2048,  "", "Crime")
                  CheckBox(#Type4096,  "", "TechnicInfrastruct")
                  CheckBox(#Type8192,  "", "Military")
                  CheckBox(#Type16384, "", "Cultural")
                  CheckBox(#Type32768, "", "LiteracyEducation")
                  CheckBox(#Type65536, "", "Medicine")
                EndVBox()
                vBox(#Expand_No, #alignLeft, VSpaceSmall)
                  Text(#ImportanceText, "", "Importance")
                  Option(#Importance1, "", "High")
                  Option(#Importance2, "", "Middle")
                  Option(#Importance3, "", "Low")
                EndVBox()
                vBox(1, #alignLeft, VSpaceGadgetLists)
                  ListIcon(#CountrySelect, "", "CountriesAffected", 150, #PB_ListIcon_FullRowSelect|#PB_ListIcon_AlwaysShowSelection, 180)
                  ;Empty(5)
                  String(#CountryID, "", "")
                EndVBox()
                vBox(1, #alignLeft, VSpaceGadgetLists)
                  ListIcon(#ContinentSelect, "", "ContinentsAffected", 120, #PB_ListIcon_FullRowSelect|#PB_ListIcon_AlwaysShowSelection, 150)  ;, #PB_Default, #alignLeft, Str(VSpaceSmall))
                  ;Empty(5)
                  String(#ContinentID, "", "")
                EndVBox()
              EndHBox()
            EndFrame()
            vBox(#Expand_No, #alignCenter, VSpaceSmall)
              ; Insert/delete event:  
              Frame(#InsertFrame, "", "InsertEvent", 0, 150)
                vBox(#Expand_Horizontal, #alignTop, VSpaceMedium)
                  Button(#InsertBefore, "", "Before")
                  Button(#InsertAfter, "", "After")
                EndVBox()
              EndFrame()
              Frame(#DeleteFrame, "", "DeleteEvent")
                vBox(#Expand_Horizontal, #alignTop, VSpaceMedium)
                  Button(#DeleteGO, "", "Go")
                EndVBox()
              EndFrame()
              ; Save:  
              Empty(VSpaceMedium)
              Button(#Save, "", "Save", 0, #PB_Ignore, 35)
            EndVBox()
          EndHBox()
          Frame(#FrameEvent, "", "Event")
            vBox(#Expand_Yes, #alignTop, VSpaceMedium)
              Editor(#Event, "", "", #PB_Editor_WordWrap, #PB_Default, 50)
              Empty(VSpaceSmall)
              hBox(#Expand_No, #alignLeft, 10)
                Text(#EventTranslatedInto, "", "EventTranslatedInto")
                ComboBox(#EventTranslatedLang, "", 0, 100)
                Empty(50)
                Button(#EventSaveLocaleHistory, "", "Save")
              EndHBox()
              Editor(#EventTranslated, "", "", #PB_Editor_WordWrap, #PB_Default, 50)                
            EndVBox()
          EndFrame()
          Empty(VSpaceSmall)  
          hBox()
            Button(#BackEnd, "", "|<")
            Button(#Back1000, "", "<<<<")
            Button(#Back100, "", "<<<")
            Button(#Back10, "", "<<")
            Button(#Back1, "", "<")
            Button(#For1, "", ">")
            Button(#For10, "", ">>")
            Button(#For100, "", ">>>")
            Button(#For1000, "", ">>>>")
            Button(#ForEnd, "", ">|")
          EndHBox()
;          Empty(VSpaceSmall)  
        EndVBox()
      EndTab()
        
      ;- GUI: ReligionEditor ********************************************************
      Tab("ReligionDB")
        vBox(#Expand_Yes)
          Frame(#ReliDB_FrameSelect, "", "SelectionArea")
            vBox(1)
              ListIcon(#ReliDB_CountrySelect, "", "Countries", 150, #PB_ListIcon_FullRowSelect|#PB_ListIcon_AlwaysShowSelection)
              hBox(1)
                Frame(#ReliDB_PreviewFrame, "", "ReligionPreview")
                  Editor(#ReliDB_Preview, "", " ", #PB_Editor_ReadOnly|#PB_Editor_WordWrap, #PB_Default, 60)   ; will be filled according to the selected country
                EndFrame()
                vBox(2)  
                  Frame(#ReliDB_Internet, "", "Internet")
                    HyperLink(#ReliDB_WorldFactBook, "", "WorldFactbook")
                  EndFrame()
                  Button(#ReliDB_Help, "", "?")
                EndVBox()
                Button(#ReliDB_SaveDatabase, "", "SaveDatabase", #PB_Button_MultiLine) ; , #PB_Default, 60)
              EndHBox()  
            EndVBox()
          EndFrame()
          Frame(#ReliDB_FrameEdit, "", "EditingArea")
            ScrollArea(#ReliDB_ReligionsScrollArea)
              vBox(#Expand_Yes)
                hBox(#Expand_No, #alignLeft)
                  Text(#ReliDB_SelectedCountryText, "", "SelectedCountry")
                  String(#ReliDB_SelectedCountry, "", " ", #PB_String_ReadOnly, 300)   ; will be filled according to the selected country
                  Empty(20)
                  Button(#ReliDB_StoreCountrySettings, "", "StoreSettings")
                EndHBox()
                Empty(#PB_Default, 10)  
                hBox(2)  
                  GridBox(2)
                    Text(#ReliDB_SelectReligion, "", "SelectReligion")
                    Text(#ReliDB_EnterPortion, "", "EnterPortion")
                    ComboBox(#ReliDB_Combobox1, "", 0, 200)
                    String(#ReliDB_ShareInput1, "", "      ")
                    ComboBox(#ReliDB_Combobox2)
                    String(#ReliDB_ShareInput2)
                    ComboBox(#ReliDB_Combobox3)
                    String(#ReliDB_ShareInput3)
                    ComboBox(#ReliDB_Combobox4)
                    String(#ReliDB_ShareInput4)
                    ComboBox(#ReliDB_Combobox5)
                    String(#ReliDB_ShareInput5)
                    ComboBox(#ReliDB_Combobox6)
                    String(#ReliDB_ShareInput6)
                    ComboBox(#ReliDB_Combobox7)
                    String(#ReliDB_ShareInput7)
                    ComboBox(#ReliDB_Combobox8)
                    String(#ReliDB_ShareInput8)
                    ComboBox(#ReliDB_Combobox9)
                    String(#ReliDB_ShareInput9)
                    ComboBox(#ReliDB_Combobox10)
                    String(#ReliDB_ShareInput10)
                    ComboBox(#ReliDB_Combobox11)
                    String(#ReliDB_ShareInput11)
                    ComboBox(#ReliDB_Combobox12)
                    String(#ReliDB_ShareInput12)
                  EndGridBox()
                  Empty(5)  
                  vBox(#Expand_No)  
                    Empty(#PB_Default, 20)
                    Text(#ReliDB_StateReligionText, "", "StateReligion")
                    String(#ReliDB_StateReligion, "", " ")
                    Empty(#PB_Default, 15)
                    Text(#ReliDB_NotesText, "", "Notes")
                    Editor(#ReliDB_Notes, "", " ", #PB_Editor_WordWrap, #PB_Default, 80)
                    Empty(#PB_Default, 5)
                    Text(#ReliDB_NotesLocalText, "", "NotesLocal")
                    Editor(#ReliDB_NotesLocal, "", " ", #PB_Editor_WordWrap, #PB_Default, 80)
                  EndVBox()
                EndHBox()  
              EndVBox()
            EndScrollArea()
          EndFrame()  
        EndVBox()
      EndTab()
        
      ;- GUI: PictureEditor ********************************************************
      Tab("PictureDB")
        vBox(1)
          hBox(1)
            ListIcon(#PicDB_PictureList, "", "ID", 80, #PB_ListIcon_LargeIcon|#PB_ListIcon_FullRowSelect|#PB_ListIcon_AlwaysShowSelection)
            Frame(#PicDB_FilterFrame, "", "FilterFrame")
              vBox(#Expand_No)
                ComboBox(#PicDB_FilterType, "", 0, 100)   ; type of the filter, determines how the following string will be parsed (e.g. it should contain the search string for the title of the Multimedia item)
                ComboBox(#PicDB_FilterString, "", #PB_ComboBox_Editable)   ; filter string, contains the string for which should be searched (according to the type)
              EndVBox()
            EndFrame()
            vBox(#Expand_Yes)
              Button(#PicDB_AddItem, "", "AddNew")
              Button(#PicDB_DeleteItem, "", "Delete")
              Button(#PicDB_SaveItem, "", "SaveItem")
            EndVBox()
            vBox(#Expand_Yes)
              ; Save Database button:
              Button(#PicDB_SaveDB, "", "Save DB")
              Button(#PicDB_Export, "", "Export")
            EndVBox()
          EndHBox()
        If UseScrollArea = #True      ; We include the following gadgets into a ScrollArea to make them all visible on smaller desktops
          ScrollArea(#PicDB_ScrollArea, "", #PB_Default, #PB_Default, 20, 0, #PB_Default, MaxGUIHeight)
        EndIf
          hBox(1)    ; Left area, for editing all picture informations
            vBox(#Expand_Yes, #alignLeft, VSpaceSmall)
              Frame(#PicDB_Frame1, "", "Browser")
                hBox(#Expand_Yes)
                  vBox(1, #alignLeft, VSpaceSmall) 
                    Canvas(#PicDB_ImageCanvas, "", #PB_Canvas_Border|#PB_Canvas_Keyboard|#PB_Canvas_DrawFocus, ImageCanvasWidth, CanvasHeight)    ; standard size = 300x300
                    hBox(2)
                      Text(#PicDB_FilenameText, "", "Filename")
                      String(#PicDB_Filename, "", "", #PB_String_ReadOnly)   ; Original filename of the picture, e.g. how is was named by the camera (HPI1465.jpg).
                    EndHBox()
                    hBox(2)
                      Text(#PicDB_SourceLinkText, "", "Source")
                      String(#PicDB_SourceLink, "", "")     ; WWW address, from which the image was taken   OR  Path from disk, from where the original(!) image was taken from
                      ; Open SourceLink button:
                      Button(#PicDB_OpenSourceLink, "", "Open")
                    EndHBox()
                  EndVBox()
                  vBox(#Expand_No, #alignTopCenter, VSpaceSmall)
                    ; Open Disk button:
                    Button(#PicDB_Requester, "", "Open")
                    Empty(#PB_Default, VSpaceSmall)
                    Text(#PicDB_PictureSizeTitle, "", "Picture sizes")
                    String(#PicDB_PictureSizeOrg, "", "SizeOrg", #PB_String_ReadOnly)
                    String(#PicDB_PictureSizeResized, "", "SizeResized", #PB_String_ReadOnly)
                    Empty(#PB_Default, VSpaceSmall)
                    Text(#PicDB_IDText, "", "ID")
                    String(#PicDB_ID, "", "", #PB_String_ReadOnly)
                    Empty(#PB_Default, VSpaceLarge)
                    Text(#PicDB_ZoomText, "", "Zoom")
                    TrackBar(#PicDB_Zoom, "", 1, 18, 1, #PB_TrackBar_Ticks, 50, 20)   ; Min/Max values according to current PBMap::InitPBMap() settings!
                    Empty(#PB_Default, VSpaceSmall)
                    Text(#PicDB_NavigationText, "", "Navigation")
                    GridBox(3, 2, VSpaceGadgetLists)
                      ; first row:
                      Empty()
                      Button(#PicDB_NaviUp, "", "Up")
                      Empty()
                      ; second row:
                      Button(#PicDB_NaviLeft, "", "Left")
                      Button(#PicDB_NaviResize, "", ">x<")
                      Button(#PicDB_NaviRight, "", "Right")
                      ; third row:
                      Empty()
                      Button(#PicDB_NaviDown, "", "Down")
                      Empty()
                    EndGridBox()
                  EndVBox()
                  vBox(1, #alignLeft, VSpaceSmall) 
                    Canvas(#PicDB_MapCanvas, "", #PB_Canvas_Border|#PB_Canvas_Keyboard|#PB_Canvas_DrawFocus|#PB_Canvas_ClipMouse, MapCanvasWidth, CanvasHeight)   ; standard size = 400x300
                    hBox(2)
                      Text(#PicDB_LongitudeText, "", "Longitude")
                      String(#PicDB_Longitude, "", "")
                      Empty()
                      Button(#PicDB_CopyCoordinates, "", "Copy")
                    EndHBox()
                    hBox(2)
                      Text(#PicDB_LatitudeText, "", "Latitude")
                      String(#PicDB_Latitude, "", "")
                      Empty()
                      Button(#PicDB_PasteCoordinates, "", "Paste")
                    EndHBox()
                  EndVBox()  
                EndHBox()
              EndFrame()
              Frame(#PicDB_Frame2, "", "Data")
                vBox(#Expand_No, #alignLeft, VSpaceSmall)
                  hBox(#Expand_Yes)
                    hBox(2)
                      Text(#PicDB_TitleText, "", "Title")
                      String(#PicDB_Title, "", "")          ; Picture/Movie/Sound title  (maximum one short line).
                      Empty(10)
                    EndHBox()
                    hBox(2)
                      Text(#PicDB_TitleTranslatedText, "", "Title Translated")
                      String(#PicDB_TitleTranslated, "", "")          ; Picture/Movie/Sound title  (maximum one short line).
                    EndHBox()
                  EndHBox()
                  hBox(2)
                    Text(#PicDB_NativeTitleText, "", "NativeTitle")
                    String(#PicDB_NativeTitle, "", "")    ;  ; Name of the picture etc. (the item displayed on it) in the native language, where the photo was taken.
                  EndHBox()
                  hBox(#Expand_Yes)
                    hBox(2)
                      Text(#PicDB_DescriptionText, "", "Description")
                      Editor(#PicDB_Description, "", "", #PB_Editor_WordWrap, #PB_Default, 50)   ; Description of the multimedia resource with further informations about it. 
                      Empty(10)
                    EndHBox()
                    hBox(2)
                      Text(#PicDB_DescriptionTranslatedText, "", "Description Translated")
                      Editor(#PicDB_DescriptionTranslated, "", "", #PB_Editor_WordWrap, #PB_Default, 50)   ; Description of the multimedia resource with further informations about it. 
                    EndHBox()
                  EndHBox()
                  Empty(#PB_Default, VSpaceSmall)
                  hBox()
                    vBox(#Expand_Yes, #alignLeft, VSpaceSmall)
                      Text(#PicDB_TypeText, "", "Type")
                      ComboBox(#PicDB_Type)                ; 1 (picture) or 2 (movie) or 3 (sound)
                    EndVBox()
                    Empty(10)
                    vBox(#Expand_Yes, #alignLeft, VSpaceSmall)
                      Text(#PicDB_ImportanceText, "", "Importance")
                      ComboBox(#PicDB_Importance)          ; Importance of the item (landscape, building, etc.) showed on the picture. Can be: 1 = highest, 2 = medium, 3 (or empty field) = lowest. Works the same like for History events.
                    EndVBox()
                    Empty(10)
                    vBox(#Expand_Yes, #alignLeft, VSpaceSmall)
                      Text(#PicDB_DateText, "", "Date")
                      hBox(1)
                        String(#PicDB_Date, "", "")          ; string (YYYYMMDD) or "PureBasic Date lib"-compatible number including the date of creation (when the picture was taken, etc.)
                        Button(#PicDB_DateRequester, "", "...")    ; opens a DateRequester, which can be used to set a valid date
                      EndHBox()
                    EndVBox()
                  EndHBox()
                  Empty(#PB_Default, VSpaceSmall)
                  hBox(2)
                    Text(#PicDB_AuthorText, "", "Author")
                    ComboBox(#PicDB_Author, "", #PB_ComboBox_Editable)   ; Author informations about the resource, e.g. "Diego Delso".
                  EndHBox()
                  hBox(2)
                    Text(#PicDB_AuthorWWWText, "", "AuthorWWW")
                    ComboBox(#PicDB_AuthorWWW, "", #PB_ComboBox_Editable)   ; link to authors website (if available/wanted to displayed), e.g. "https://commons.wikimedia.org/wiki/User:Poco_a_poco"
                    ; Open Authors website button:
                    Button(#PicDB_OpenAuthorsWebsite, "", "Open")
                  EndHBox()
                  Empty(#PB_Default, VSpaceSmall)
                  hBox(#Expand_Yes)
                    hBox(2)
                      Text(#PicDB_PublicNoteText, "", "PublicNote")
                      String(#PicDB_PublicNote, "", "")    ; Additional string (beside the authors name), which need to be displayed beside the picture (e.g. the authors name and licence). 
                      Empty(10)
                    EndHBox()
                    hBox(2)
                      Text(#PicDB_PublicNoteTranslatedText, "", "PublicNote Translated")
                      String(#PicDB_PublicNoteTranslated, "", "")    ; Additional string (beside the authors name), which need to be displayed beside the picture (e.g. the authors name and licence). 
                    EndHBox()
                  EndHBox()
                  Empty(#PB_Default, VSpaceSmall)
                  hBox(2)
                    Text(#PicDB_LicenceText, "", "Licence")
                    ComboBox(#PicDB_Licence, "", #PB_ComboBox_Editable)   ; Licence informations about the resource, e.g. if it's freely available, commercial, etc.  Can be in text form, or possibly use some unique shortcuts (PD = PublicDomain; CC = Commercial; LI = Commercial, but licenced; other....)
                    HyperLink(#PicDB_LicenceWWW, "", "LicenceWWW")   ; blue link color is set below
                    HyperLink(#PicDB_LicenceExample, "", "LicenceExample")   ; blue link color is set below
                  EndHBox()
                  hBox(2)
                    Text(#PicDB_InternalNoteText, "", "InternalNote")
                    Editor(#PicDB_InternalNote, "", "", #PB_Editor_WordWrap, #PB_Default, 40)   ; Internal notes about this picture/multimedia ressource
                  EndHBox()
                EndVBox()    
              EndFrame()
            EndVBox()
            Frame(#PicDB_Frame3, "", "Relations")     ; Right area, for selecting all affecting GeoWorld items (continents, countries, states, cities, ressources, world heritage...)
              hBox(#Expand_Equal)    
                vBox(#Expand_Equal, #alignTop, VSpaceSmall)   ; left column with listicons
                  vBox(1)
                    ListIcon(#PicDB_ContinentSelect, "", "ContinentsAffected", 150, #PB_ListIcon_FullRowSelect|#PB_ListIcon_AlwaysShowSelection, 170)
                    String(#PicDB_ContinentID, "", "")
                    Empty(#PB_Default, VSpaceSmall)
                  EndVBox()
                  vBox(1)
                    ListIcon(#PicDB_CountrySelect, "", "CountriesAffected", 150, #PB_ListIcon_FullRowSelect|#PB_ListIcon_AlwaysShowSelection, 170)
                    String(#PicDB_CountryID, "", "")
                    Empty(#PB_Default, VSpaceSmall)
                  EndVBox()
                  vBox(3)
                    Text(#PicDB_AdminDivCountrySelectText, "", "AdminDivRestrictedTo")
                    ComboBox(#PicDB_AdminDivCountrySelect)
                    ListIcon(#PicDB_AdminDivSelect, "", "AdminDivAffected", 150, #PB_ListIcon_FullRowSelect|#PB_ListIcon_AlwaysShowSelection, 170)
                    String(#PicDB_AdminDivID, "", "")
                  EndVBox()
                EndVBox()
                vBox(#Expand_Equal, #alignTop, 3)   ; right column with listicons
                  vBox(1)
                    ListIcon(#PicDB_CitySelect, "", "CityAffected", 150, #PB_ListIcon_FullRowSelect|#PB_ListIcon_AlwaysShowSelection, 170)
                    String(#PicDB_CityID, "", "")
                    Empty(#PB_Default, VSpaceSmall)
                  EndVBox()
                  vBox(1)
                    ListIcon(#PicDB_WorldHeritageSelect, "", "WorldHeritageAffected", 150, #PB_ListIcon_FullRowSelect|#PB_ListIcon_AlwaysShowSelection, 170, 70)
                    String(#PicDB_WorldHeritageID, "", "")
                    Empty(#PB_Default, VSpaceSmall)
                  EndVBox()
                  vBox(1)
                    ListIcon(#PicDB_MountainSelect, "", "MountainAffected", 150, #PB_ListIcon_FullRowSelect|#PB_ListIcon_AlwaysShowSelection, 170, 70)
                    String(#PicDB_MountainID, "", "")
                    Empty(#PB_Default, VSpaceSmall)
                  EndVBox()
                  vBox(1)
                    ListIcon(#PicDB_RessourceSelect, "", "RessourceAffected", 150, #PB_ListIcon_FullRowSelect|#PB_ListIcon_AlwaysShowSelection, 170, 70)
                    String(#PicDB_RessourceID, "", "")
                  EndVBox()
                EndVBox()
              EndHBox()  
            EndFrame()
          EndHBox()    
        If UseScrollArea = #True      ; We close the ScrollArea, into which the previously declared gadgets were included to make them all visible on smaller desktops
          EndScrollArea()
        EndIf
        EndVBox()
      EndTab()
      
    EndPanel()
  EndWindow()  
  
  
   UnuseModule DynamicDialogs_plain         ; we don't need the XML-Elements anymore
   ; from now on we really need the functions from the 'main'-Modul 'DynamicDialogs'
  
   XML$ = GetXML()
   ;Debug XML$
  
  dialog = OpenDialogWindow(#MainDialog, XML$, #MainWin, "", x, y, width, height, 0, #DialogError_Debug)
  
  If dialog = 0
    MessageRequester("Error", "Error while opening 'GeoWorldEditor' Dialog!")
    ProcedureReturn 
  EndIf
    
  UnuseModule DynamicDialogs         ; we don't need the Module-Functions anymore
  
  ;- Gadget settings (initial after GUI creation):
  ;- .. History tab: gadget settings
  SetGadgetColor(#MainLanguageEnglishText, #PB_Gadget_FrontColor, $AA0000)   ; need to be done, as setting the color in the Dialog definition has no effect...
  SetGadgetColor(#MainLanguageGermanText, #PB_Gadget_FrontColor, $AA0000)    ; - " -
  
  ; Display all possible mail senders + recipients, and activate the preselected items:
  If IsGadget(#MainSenderSelect)
    For a = 0 To 3
      AddGadgetItem(#MainSenderSelect, a, "Mail Sender " + Str(a))
    Next
    SetGadgetState(#MainSenderSelect, 2)
  EndIf
  If IsGadget(#MainRecipientSelect)
    For a = 0 To 3
      AddGadgetItem(#MainRecipientSelect, a, "Mail Recipient " + Str(a))
    Next
    SetGadgetState(#MainRecipientSelect, 1)
  EndIf
  If IsGadget(#MainPictureDB)
    DisableGadget(#MainPictureDB, 1)     ; disable the checkbox, as editing this database isn't supported yet (so nothing to send)
  EndIf
    
  ; Filling the Filter combobox with its related items:
  If IsGadget(#Filter)
    AddGadgetItem(#Filter, 0, "None")               ; we use fixed 'position' values, as we need them too when changing the localization language
    AddGadgetItem(#Filter, 1, "empty TypeID")
    AddGadgetItem(#Filter, 2, "empty ImpID")
    AddGadgetItem(#Filter, 3, "empty CountryID")
    AddGadgetItem(#Filter, 4, "Time More Than Day")
    AddGadgetItem(#Filter, 5, "High Importance")
    SetGadgetState(#Filter, 0)
  Else
    Debug "Filter combobox not found!"
  EndIf
  
  If IsGadget(#CountrySelect)
    a = 0
    AddGadgetItem(#CountrySelect, 0, "World")
    For a = 1 To 50
      AddGadgetItem(#CountrySelect, a, "Country " + Str(a))
    Next
  EndIf
  
  If IsGadget(#ContinentSelect)
    a = 0
    AddGadgetItem(#ContinentSelect, 0, "World")
    For a = 1 To 5
      AddGadgetItem(#ContinentSelect, a, "Continent " + Str(a))
    Next
  EndIf
  
  If IsGadget(#EventTranslatedLang)    ; Translation of the event text into another language
    AddGadgetItem(#EventTranslatedLang, 0, "None")
    For a = 1 To 3
      AddGadgetItem(#EventTranslatedLang, a, "Language " + Str(a))
    Next
    SetGadgetState(#EventTranslatedLang, 0)
  EndIf
  
  ;- .. Religion tab: gadget settings
  If IsGadget(#ReliDB_CountrySelect)
    AddGadgetColumn(#ReliDB_CountrySelect, 1, "AssignedReligions", 250)
    AddGadgetColumn(#ReliDB_CountrySelect, 2, "ReligionShares", 250)
    AddGadgetColumn(#ReliDB_CountrySelect, 3, "ReligionMoreInfo", 50)
  EndIf  
  If IsGadget(#ReliDB_WorldFactBook)
    SetGadgetColor(#ReliDB_WorldFactBook, #PB_Gadget_FrontColor, #BlueLink)
  EndIf
  
  ;- .. Picture tab: gadget settings
  DisableGadget(#PicDB_DeleteItem, 1)    ; disable the 'Delete' button (will be activated, as soon there are items in the Multimedia() list and 'PictureList' listicon...)
  
  If IsGadget(#PicDB_PictureList)
    AddGadgetColumn(#PicDB_PictureList, 1, "Title", 300)
    AddGadgetColumn(#PicDB_PictureList, 2, "Country", 150)
    ; Here we add a dummy entry, as long there isn't any Picture database with contents available:
    If CreateImage(99, 32, 32)
      StartDrawing(ImageOutput(99))
        DrawingMode(#PB_2DDrawing_Gradient)      
        BackColor($00FFFF)
        FrontColor($FF0000)
        BoxedGradient(0, 0, 32, 32)      
        Circle(16, 16, 16)
      StopDrawing()
    EndIf
    AddGadgetItem(#PicDB_PictureList, 0, "XX-1234"+Chr(10)+"Dummy PictureList entry..."+Chr(10)+"Germany...", ImageID(99))
  EndIf
  If IsGadget(#PicDB_FilterType)
    a = 0
    AddGadgetItem(#PicDB_FilterType, a, "None")   ; None  (no active filter)
    AddGadgetItem(#PicDB_FilterType, a, "Continent")    ; Continent
    AddGadgetItem(#PicDB_FilterType, a, "Country")      ; Country
    AddGadgetItem(#PicDB_FilterType, a, "Mountain")     ; Mountain
    AddGadgetItem(#PicDB_FilterType, a, "Resource")     ; Resource
    AddGadgetItem(#PicDB_FilterType, a, "Title")    ; Title string of the Multimedia item (could be either international, localized or native name)
    AddGadgetItem(#PicDB_FilterType, a, "Author")       ; Author
    AddGadgetItem(#PicDB_FilterType, a, "AuthorWWW")    ; Author's website
    AddGadgetItem(#PicDB_FilterType, a, "Source")       ; Source of the image, on disk or website (URL$)
    SetGadgetState(#PicDB_FilterType, 0)    ; no filter active at the start...
    DisableGadget(#PicDB_FilterString, 1)   ; input field is disabled at the beginning (when filter=None anyway...)
  EndIf    
  If IsGadget(#PicDB_ImageCanvas)
    ; Enable dropping of image onto the canvas, so we get our external images loaded into the database easily...
    ;EnableGadgetDrop(#PicDB_ImageCanvas, #PB_Drop_Image, #PB_Drag_Copy)   ; 'Image' format seems only meant for drag & drop of image inside the program, so we don't need it here...
    EnableGadgetDrop(#PicDB_ImageCanvas, #PB_Drop_Files, #PB_Drag_Copy)
    EnableGadgetDrop(#PicDB_ImageCanvas, #PB_Drop_Text, #PB_Drag_Copy)  ; 'Text' support need to be activatad as last option, else the dropped images of websites will be recognized with their temporary file-path on disk instead of their real html-link!
  EndIf
  
  If IsGadget(#PicDB_MapCanvas)
    ; Init the OpenStreetMap stuff:
    ;PBMap::InitPBMap(#MainWin)
    ;PBMap::MapGadget(-#PicDB_MapCanvas, 5, 5, GadgetWidth(#PicDB_MapCanvas)-10, GadgetHeight(#PicDB_MapCanvas)-10)   ; the GadgetID of the MapCanvas will be given as negative number => this avoids, that the PBMap module is creating a new CanvasGadget!!!
    ;PBMap::SetCallBackLocation(@UpdateLocation())
    ;PBMap::SetLocation(49.04599, 2.03347, 6)
    ;PBMap::AddMarker(49.0446828398, 2.0349812508, -1, @MyPointer())
    
    If IsGadget(#PicDB_Zoom)
      ;SetGadgetState(#PicDB_Zoom, PBMap::GetZoom())    ; set current zoom level - here according to the initial PBMap::InitPBMap() settings
    EndIf
  EndIf  
  
  ; Enable drag & drop support for the 'source' StringGadget too, as CanvasGadget currently don't get the real html-link when dropping an image from a website:
  EnableGadgetDrop(#PicDB_SourceLink, #PB_Drop_Text, #PB_Drag_Copy)
  
  If IsGadget(#PicDB_Type)
    AddGadgetItem(#PicDB_Type, 0, "Picture")
    AddGadgetItem(#PicDB_Type, 1, "Movie")
    AddGadgetItem(#PicDB_Type, 2, "Sound")
    SetGadgetState(#PicDB_Type, 0)    ; we are currently supporting only the 'Picture' type in this editor
  EndIf
  If IsGadget(#PicDB_Importance)
    AddGadgetItem(#PicDB_Importance, 0, "High")
    AddGadgetItem(#PicDB_Importance, 1, "Middle")
    AddGadgetItem(#PicDB_Importance, 2, "Low")
    SetGadgetItemData(#PicDB_Importance, 1, 3)
  EndIf  
  
  SetGadgetColor(#PicDB_LicenceWWW, #PB_Gadget_FrontColor, $AA0000)   ; need to be done, as setting the color in the Dialog definition has no effect...
  DisableGadget(#PicDB_LicenceWWW, 1)
  SetGadgetColor(#PicDB_LicenceExample, #PB_Gadget_FrontColor, $AA0000)   ; need to be done, as setting the color in the Dialog definition has no effect...  
  DisableGadget(#PicDB_LicenceExample, 1)
  
  If IsGadget(#PicDB_ContinentSelect)
    a = 0
    AddGadgetItem(#PicDB_ContinentSelect, 0, "World")
    For a = 1 To 5
      AddGadgetItem(#PicDB_ContinentSelect, a, "Continent " + Str(a))
    Next
  EndIf
  If IsGadget(#PicDB_CountrySelect)
    a = 0
    AddGadgetItem(#PicDB_CountrySelect, 0, "World")
    For a = 1 To 50
      AddGadgetItem(#PicDB_CountrySelect, a, "Country " + Str(a))
    Next
  EndIf
  If IsGadget(#PicDB_AdminDivCountrySelect)  ; fill the combobox for restricting the admin. divisions selection to 'all' or a specified country
    a = 0
    AddGadgetItem(#PicDB_AdminDivCountrySelect, 0, "All Countries")
    For a = 1 To 50
      AddGadgetItem(#PicDB_AdminDivCountrySelect, a, "Country " + Str(a))
    Next
    SetGadgetState(#PicDB_AdminDivCountrySelect, 0)    ; activate the 'All countries' item
  EndIf
  SetGadgetState(#PanelEditor, 3)
  
  ; Now we bind the needed procedures to their related gadgets:
  ; BindGadgetEvent(...)
EndProcedure

OpenGUI()

Repeat
  Event = WaitWindowEvent()
  EventGadget = EventGadget()
  
  Select Event
    Case #PB_Event_Gadget
      Select EventGadget
        Case #MainCallHistory, #MainCallReligionDB, #MainCallPictureDB
          a = 1 + EventGadget - #MainCallHistory
          SetGadgetState(#PanelEditor, a)
      EndSelect
  EndSelect
Until Event = #PB_Event_CloseWindow
