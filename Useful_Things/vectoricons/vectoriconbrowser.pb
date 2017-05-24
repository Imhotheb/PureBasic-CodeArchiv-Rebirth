; PB 5.40+, cross-platform
; by Little John, 2017-03-08
; http://www.purebasic.fr/english/viewtopic.php?f=12&t=65091


; Displays the icons and allows to save them as PNG files
; (and on Linux as SVG files, too).

EnableExplicit

XIncludeFile "vectoricons.pbi"

UseModule VectorIcons
UsePNGImageEncoder()

#IconSet1$ = "IconSet_1"
#IconSet2$ = "IconSet_2"


Macro NewIcon (_proc_)
   file$ = ""
   
   CompilerIf #PB_Compiler_OS = #PB_OS_Linux
      If createSVG
         Read.s file$
         ReplaceString(file$, "/", "_", #PB_String_InPlace)
         file$ = LCase(file$ + tail$)
      EndIf
   CompilerEndIf
   
   _proc_
   img + 1
EndMacro


;{ Names of icons in set #1
DataSection
   IconNames01:
   Data.s "Transparent", "Add", "Refresh", "SelectAll", "Checked", "Sub", "Delete", "Find", "FindNext", "Question1", "Question2"
   Data.s "FivePointedStar", "Wizard", "Diskette", "Alarm1", "Alarm2", "Quit", "HotDrink/Pause", "Watch", "Night", "UpArrow"
   Data.s "DownArrow", "LeftArrow", "RightArrow", "ReSize", "Stop1", "Stop2", "Warning1", "Warning2", "On", "Off", "Info1"
   Data.s "Info2", "Collapse", "Expand", "Success", "Home", "AlignLeft", "AlignCentre", "AlignRight", "AlignJustify", "Compile"
   Data.s "CompileRun", "Settings", "Options", "Toggle1", "Toggle2", "Save1", "ZoomIn", "ZoomOut", "Great/OK", "Download1"
   Data.s "Upload1", "LineWrapOn", "LineWrapOff", "Donate1", "Donate2", "Filter", "Bookmark", "Database", "Tools", "Sort"
   Data.s "Randomise", "IsProtected", "UnProtected1", "UnProtected2", "Network", "Music", "Microphone", "Picture", "Bug", "Debug"
   Data.s "Crop", "ReSize2", "Rating", "Orange Fruit", "Lemon Fruit", "Lime Fruit", "Action" , "Move", "Lock" , "Unlock"
   Data.s "Fill", "Message", "Colours", "Navigation 1", "Navigation 2", "Volume", "Secure", "Book", "Library", "USB"
   Data.s "White Pawn", "Black Pawn", "White Rook", "Black Rook", "White Knight", "Black Knight", "White Bishop", "Black Bishop"
   Data.s "White King", "Black King", "White Queen", "Black Queen", "History", "Danger", "The Sun", "Good Luck", "Telephone"
   Data.s "BlueTooth", "Broadcast", "Speaker", "Mute", "Battery Charging", "Snowflake", "A2M", "N2Z", "Rain Cloud", "Cloud Storage"
   Data.s "MediaPlay", "MediaStop", "MediaBegin", "MediaEnd", "MediaForward", "MediaFastForward", "MediaBack", "MediaFastBack"
   Data.s "FirstAid", "NoEntry", "Stop3", "Download2", "FirstAidSpatial", "NoEntrySpatial", "Stop3Spatial", "Download2Spatial"
   Data.s "ToClipboard", "FromClipboard", "Copy", "Paste", "Cut", "Undo", "Redo", "Open1", "Open2", "Open3", "Save2", "SaveAs2"
   Data.s "Printer1", "PrinterError1", "NewDocument", "EditDocument", "ClearDocument", "ImportDocument", "ExportDocument"
   Data.s "CloseDocument", "SortAscending", "SortDescending", "SortBlockAsc", "SortBlockDesc", "ChartLine", "ChartDot", "ChartLineDot"
   Data.s "ChartPrice", "ChartBarVert", "ChartCylVert", "ChartBarHor", "ChartCylHor", "ChartBarVertStacked", "ChartBarHorStacked"
   Data.s "ChartCylVertStacked", "ChartCylHorStacked", "ChartArea", "ChartAreaPerc", "ChartPie", "ChartRing", "Notes", "NotesSpatial"
   Data.s "UnfoldDown", "UnfoldUp/Eject", "UnfoldLeft", "UnfoldRight", "FoldDown", "FoldUp", "FoldLeft", "FoldRight"
   Data.s "ArrowBowTop2Right", "ArrowBowRight2Bottom", "ArrowBowBottom2Left", "ArrowBowLeft2Top"
   Data.s "ArrowBowBottom2Right", "ArrowBowRight2Top", "ArrowBowTop2Left", "ArrowBowLeft2Bottom"
   Data.s "BracketRoundOpen", "BracketRoundClose", "BracketSquareOpen", "BracketSquareClose"
   Data.s "BracketAngleOpen", "BracketAngleClose", "BracketCurlyOpen", "BracketCurlyClose", "BracketHtml"
   Data.s "Site", "Compare"
EndDataSection
;}


Procedure.i CreateIcons01 (size.i, createSVG.i=#False)
   ; in : size     : width and height (number of pixels) of each icon
   ;      createSVG: #True / #False
   ; out: return value: number of different icons (not counting the "disabled" versions)
   Protected file$, tail$, iconCount.i, img.i=0
   
   ;--- Create coloured ("enabled") icons
   Restore IconNames01
   tail$ = ".svg"
   
   NewIcon(Transparent(file$, img, size))
   NewIcon(Add(file$, img, size, #CSS_ForestGreen))
   NewIcon(Refresh(file$, img, size, #CSS_ForestGreen))
   NewIcon(SelectAll(file$, img, size, #CSS_ForestGreen))
   NewIcon(Checked(file$, img, size, #CSS_ForestGreen))
   NewIcon(Sub(file$, img, size, #VI_GuardsmanRed))
   NewIcon(Delete(file$, img, size, #VI_GuardsmanRed))
   NewIcon(Find(file$, img, size, #CSS_Black))
   NewIcon(FindNext(file$, img, size, #CSS_Black, #CSS_ForestGreen))
   NewIcon(Question(file$, img, size, #CSS_Yellow))
   NewIcon(Question(file$, img, size, #CSS_White, #CSS_Navy))
   NewIcon(FivePointedStar(file$, img, size, #CSS_Gold))
   NewIcon(Wizard(file$, img, size, #CSS_Black, #CSS_Gold))
   NewIcon(Diskette(file$, img, size, #CSS_Navy, #VI_GuardsmanRed, #CSS_White))
   NewIcon(Alarm(file$, img, size, #CSS_Black))
   NewIcon(Alarm(file$, img, size, #CSS_White, #CSS_Black))
   NewIcon(Quit(file$, img, size, #VI_GuardsmanRed))
   NewIcon(HotDrink(file$, img, size, #CSS_Black))
   NewIcon(Watch(file$, img, size, #CSS_RoyalBlue, #CSS_Black, #CSS_White))
   NewIcon(Night(file$, img, size, #CSS_Gold, #CSS_MidnightBlue))
   
   NewIcon(Arrow(file$, img, size, #CSS_DimGrey))
   NewIcon(Arrow(file$, img, size, #CSS_DimGrey, 180))
   NewIcon(Arrow(file$, img, size, #CSS_DimGrey, -90))
   NewIcon(Arrow(file$, img, size, #CSS_DimGrey, 90))
   
   NewIcon(ReSize(file$, img, size, #CSS_ForestGreen))
   NewIcon(Stop(file$, img, size, #VI_GuardsmanRed))
   NewIcon(Stop(file$, img, size, #VI_GuardsmanRed, #CSS_White))
   NewIcon(Warning(file$, img, size, #VI_GuardsmanRed))
   NewIcon(Warning(file$, img, size, #CSS_Black, #CSS_Yellow))
   NewIcon(OnOff(file$, img,  size, #CSS_White, #CSS_ForestGreen))
   NewIcon(OnOff(file$, img, size, #CSS_White, #VI_GuardsmanRed))
   NewIcon(Info(file$, img, size, #CSS_Yellow))
   NewIcon(Info(file$, img, size, #CSS_White, #CSS_Navy))
   NewIcon(Collapse(file$, img, size, #CSS_Black))
   NewIcon(Expand(file$, img, size, #CSS_Black))
   NewIcon(Success(file$, img, size, #CSS_ForestGreen))
   NewIcon(Home(file$, img, size, #CSS_Black))
   NewIcon(AlignLeft(file$, img, size, #CSS_Black))
   NewIcon(AlignCentre(file$, img, size, #CSS_Black))
   NewIcon(AlignRight(file$, img, size, #CSS_Black))
   NewIcon(AlignJustify(file$, img, size, #CSS_Black))
   NewIcon(Compile(file$, img, size, #CSS_Navy))
   NewIcon(CompileRun(file$, img, size, #CSS_Navy))
   NewIcon(Settings(file$, img, size, #CSS_Navy))
   NewIcon(Options(file$, img, size, #CSS_Navy))
   NewIcon(Toggle1(file$, img, size, #VI_GuardsmanRed, #CSS_ForestGreen, #CSS_Silver))
   NewIcon(Toggle2(file$, img, size, #CSS_Silver, #CSS_ForestGreen, #VI_GuardsmanRed))
   NewIcon(Save1(file$, img, size, #CSS_Navy))
   NewIcon(ZoomIn(file$, img, size, #CSS_Black))
   NewIcon(ZoomOut(file$, img, size, #CSS_Black))
   NewIcon(Great(file$, img, size, #CSS_Navy))
   NewIcon(DownLoad1(file$, img, size, #CSS_White, #CSS_ForestGreen))
   NewIcon(UpLoad1(file$, img, size, #CSS_White, #CSS_ForestGreen))
   NewIcon(LineWrapOn(file$, img, size, #CSS_Navy, #VI_GuardsmanRed))
   NewIcon(LineWrapOff(file$, img, size, #CSS_Navy, #VI_GuardsmanRed))
   NewIcon(Donate1(file$, img, size, #VI_GuardsmanRed))
   NewIcon(Donate2(file$, img, size, #VI_GuardsmanRed))
   NewIcon(Filter(file$, img, size, #VI_GuardsmanRed))
   NewIcon(Bookmark(file$, img, size, #CSS_Navy, #CSS_ForestGreen))
   NewIcon(Database(file$, img, size, #CSS_SteelBlue, #CSS_White))
   NewIcon(Tools(file$, img, size, #CSS_DimGrey))
   NewIcon(Sort(file$, img, size, #CSS_FireBrick))
   NewIcon(Randomise(file$, img, size, #CSS_Navy))
   NewIcon(IsProtected(file$, img, size, #CSS_ForestGreen, #CSS_DarkGreen, #CSS_White))
   NewIcon(UnProtected1(file$, img, size, #CSS_Red, #VI_GuardsmanRed, #CSS_Black))
   NewIcon(UnProtected2(file$, img, size, #CSS_Red, #VI_GuardsmanRed, #CSS_Black))
   NewIcon(Network(file$, img, size, #CSS_Navy))
   NewIcon(Music(file$, img, size, #CSS_Navy))
   NewIcon(Microphone(file$, img, size, #CSS_Navy))
   NewIcon(Picture(file$, img, size, #CSS_LightBlue, #CSS_LawnGreen, #CSS_Yellow, #CSS_Sienna, #CSS_White, #CSS_DarkGreen))
   NewIcon(Bug(file$, img, size, #CSS_Orange, #CSS_Black))
   NewIcon(DBug(file$, img, size, #CSS_Orange, #CSS_Black, #CSS_Red))
   NewIcon(Crop(file$, img, size, #CSS_Navy))
   NewIcon(ReSize2(file$, img, size, #CSS_Navy, #CSS_Blue))
   NewIcon(Rating(file$, img, size, #CSS_Orange, #CSS_WhiteSmoke))
   NewIcon(CitrusFruits(file$, img, size, #CSS_Orange, #CSS_WhiteSmoke))
   NewIcon(CitrusFruits(file$, img, size, #CSS_Khaki, #CSS_WhiteSmoke))
   NewIcon(CitrusFruits(file$, img, size, #CSS_LimeGreen, #CSS_WhiteSmoke))
   NewIcon(Action(file$, img, size, #CSS_Red, #CSS_LightGreen, #CSS_Blue))
   NewIcon(Move(file$, img, size, #CSS_Black))
   NewIcon(Lock(file$, img, size, #CSS_Black, #CSS_WhiteSmoke))
   NewIcon(Unlock(file$, img, size, #CSS_Black, #CSS_WhiteSmoke))
   NewIcon(Fill(file$, img, size, #CSS_Black, #CSS_OrangeRed))
   NewIcon(Message(file$, img, size, #CSS_RoyalBlue, #CSS_WhiteSmoke))
   NewIcon(Colours(file$, img, size, #CSS_Red, #CSS_Green, #CSS_Blue, #CSS_Magenta, #CSS_Yellow, #CSS_Cyan))
   NewIcon(Navigation1(file$, img, size, #CSS_Black, #CSS_WhiteSmoke))
   NewIcon(Navigation2(file$, img, size, #CSS_Black, #CSS_RoyalBlue, #CSS_Gold))
   NewIcon(Volume(file$, img, size, #CSS_Black, #CSS_LightSteelBlue))
   NewIcon(Secure(file$, img, size, #CSS_Black))
   NewIcon(Book(file$, img, size, #CSS_Black, #CSS_LightGrey, #CSS_LightGoldenRodYellow))
   NewIcon(Library(file$, img, size, #CSS_SaddleBrown, #CSS_BurlyWood, #CSS_DarkGoldenRod, #CSS_Gold))
   NewIcon(USB(file$, img, size, #CSS_Black))
   NewIcon(WhitePawn(file$, img, size, #CSS_Black, #CSS_WhiteSmoke))
   NewIcon(BlackPawn(file$, img, size, #CSS_Black))
   NewIcon(WhiteRook(file$, img, size, #CSS_Black, #CSS_WhiteSmoke))
   NewIcon(BlackRook(file$, img, size, #CSS_Black, #CSS_Silver))
   NewIcon(WhiteKnight(file$, img, size, #CSS_Black, #CSS_WhiteSmoke))
   NewIcon(BlackKnight(file$, img, size, #CSS_Black, #CSS_WhiteSmoke))
   NewIcon(WhiteBishop(file$, img, size, #CSS_Black, #CSS_WhiteSmoke))
   NewIcon(BlackBishop(file$, img, size, #CSS_Black, #CSS_WhiteSmoke))
   NewIcon(WhiteKing(file$, img, size, #CSS_Black, #CSS_WhiteSmoke))
   NewIcon(BlackKing(file$, img, size, #CSS_Black, #CSS_WhiteSmoke))
   NewIcon(WhiteQueen(file$, img, size, #CSS_Black, #CSS_WhiteSmoke))
   NewIcon(BlackQueen(file$, img, size, #CSS_Black, #CSS_WhiteSmoke))
   NewIcon(History(file$, img, size, #CSS_Black, #CSS_SteelBlue, #CSS_OrangeRed, #CSS_WhiteSmoke))
   NewIcon(Danger(file$, img, size, #CSS_Black, #CSS_WhiteSmoke))
   NewIcon(TheSun(file$, img, size, #CSS_LightSkyBlue, #CSS_Gold))
   NewIcon(GoodLuck(file$, img, size, #CSS_LimeGreen, #CSS_DarkGreen))
   NewIcon(Telephone(file$, img, size, #CSS_Black, #CSS_BurlyWood))
   NewIcon(BlueTooth(file$, img, size, #CSS_Black))
   NewIcon(Broadcast(file$, img, size, #CSS_Black))
   NewIcon(Speaker(file$, img, size, #CSS_Black))
   NewIcon(Mute(file$, img, size, #CSS_Black, #CSS_Red))
   NewIcon(BatteryCharging(file$, img, size, #CSS_Grey, #CSS_Black, #CSS_Yellow))
   NewIcon(Snowflake(file$, img, size, #CSS_Black))
   NewIcon(A2M(file$, img, size, #CSS_Blue))
   NewIcon(N2Z(file$, img, size, #CSS_Blue))
   NewIcon(RainCloud(file$, img, size, #CSS_AliceBlue, #CSS_Silver))
   NewIcon(CloudStorage(file$, img, size, #CSS_AliceBlue, #CSS_Blue))
   
   NewIcon(MediaPlay(file$, img, size, #CSS_Navy))
   NewIcon(MediaStop(file$, img, size, #CSS_Navy))
   NewIcon(MediaBegin(file$, img, size, #CSS_Navy))
   NewIcon(MediaEnd(file$, img, size, #CSS_Navy))
   NewIcon(MediaForward(file$, img, size, #CSS_Navy))
   NewIcon(MediaFastForward(file$, img, size, #CSS_Navy))
   NewIcon(MediaBack(file$, img, size, #CSS_Navy))
   NewIcon(MediaFastBack(file$, img, size, #CSS_Navy))
   
   NewIcon(FirstAid(file$, img, size, #CSS_White, #VI_GuardsmanRed))
   NewIcon(NoEntry(file$, img, size, #CSS_White, #VI_GuardsmanRed))
   NewIcon(Stop3(file$, img, size, #CSS_White, #VI_GuardsmanRed))
   NewIcon(Download2(file$, img, size, #CSS_White, #CSS_ForestGreen))
   NewIcon(FirstAid_Spatial(file$, img, size, #CSS_White, #CSS_OrangeRed))
   NewIcon(NoEntry_Spatial(file$, img, size, #CSS_White, #CSS_OrangeRed))
   NewIcon(Stop3_Spatial(file$, img, size, #CSS_White, #CSS_OrangeRed))
   NewIcon(Download2_Spatial(file$, img, size, #CSS_White, #CSS_LimeGreen))
   NewIcon(ToClipboard(file$, img, size, #CSS_Navy, #CSS_Black))
   NewIcon(FromClipboard(file$, img, size, #CSS_Navy, #CSS_Black))
   NewIcon(Copy(file$, img, size, #CSS_Navy, #CSS_White))
   NewIcon(Paste(file$, img, size, #CSS_Navy, #CSS_White))
   NewIcon(Cut(file$, img, size, #CSS_Navy))
   NewIcon(Undo(file$, img, size, #CSS_ForestGreen))
   NewIcon(Redo(file$, img, size, #CSS_ForestGreen))
   NewIcon(Open1(file$, img, size, #CSS_GoldenRod))
   NewIcon(Open2(file$, img, size, #CSS_GoldenRod, #CSS_Navy, #CSS_White))
   NewIcon(Open3(file$, img, size, #CSS_GoldenRod, #CSS_Chocolate))
   NewIcon(Save2(file$, img, size, #CSS_Navy, #CSS_White))
   NewIcon(SaveAs2(file$, img, size, #CSS_Navy, #CSS_White))
   NewIcon(Printer1(file$, img, size, #CSS_DimGrey, #CSS_White))
   NewIcon(PrinterError1(file$, img, size, #CSS_DimGrey, #CSS_White, #CSS_Red))
   NewIcon(NewDocument(file$, img, size, #CSS_White, #CSS_Navy, #CSS_Black))
   NewIcon(EditDocument(file$, img, size, #CSS_White, #CSS_Navy, #CSS_Black))
   NewIcon(ClearDocument(file$, img, size, #CSS_White, #CSS_Navy, #CSS_Black))
   NewIcon(ImportDocument(file$, img, size, #CSS_White, #CSS_Navy, #CSS_Black))
   NewIcon(ExportDocument(file$, img, size, #CSS_White, #CSS_Navy, #CSS_Black))
   NewIcon(CloseDocument(file$, img, size, #CSS_White, #CSS_Navy, #CSS_Red))
   NewIcon(SortAscending(file$, img, size, #CSS_White, #CSS_Navy, #CSS_Black))
   NewIcon(SortDescending(file$, img, size, #CSS_White, #CSS_Navy, #CSS_Black))
   NewIcon(SortBlockAscending(file$, img, size, #CSS_White, #CSS_Navy))
   NewIcon(SortBlockDescending(file$, img, size, #CSS_White, #CSS_Navy))
   NewIcon(ChartLine(file$, img, size, #CSS_Black, #CSS_Green, #CSS_Blue))
   NewIcon(ChartDot(file$, img, size, #CSS_Black, #CSS_Blue))
   NewIcon(ChartLineDot(file$, img, size, #CSS_Black, #CSS_DarkOrange, #CSS_Blue, #CSS_White))
   NewIcon(ChartPrice(file$, img, size, #CSS_Black, #CSS_Blue, #CSS_White))
   NewIcon(ChartBarVert(file$, img, size, #CSS_Black, #CSS_DarkOrange, #CSS_Yellow, #CSS_LightSkyBlue, #CSS_White))
   NewIcon(ChartCylVert(file$, img, size, #CSS_Black, #CSS_Lime, #CSS_Yellow, #CSS_LightSkyBlue, #CSS_White))
   NewIcon(ChartBarHor(file$, img, size, #CSS_Black, #CSS_DarkOrange, #CSS_Yellow, #CSS_LightSkyBlue, #CSS_White))
   NewIcon(ChartCylHor(file$, img, size, #CSS_Black, #CSS_Lime, #CSS_Yellow, #CSS_LightSkyBlue, #CSS_White))
   NewIcon(ChartBarVertStacked(file$, img, size, #CSS_Black, #CSS_LimeGreen, #CSS_DarkOrange, #CSS_RoyalBlue, #CSS_White))
   NewIcon(ChartBarHorStacked(file$, img, size, #CSS_Black, #CSS_LimeGreen, #CSS_DarkOrange, #CSS_RoyalBlue, #CSS_White))
   NewIcon(ChartCylVertStacked(file$, img, size, #CSS_Black, #CSS_Lime, #CSS_Yellow, #CSS_LightSkyBlue, #CSS_White))
   NewIcon(ChartCylHorStacked(file$, img, size, #CSS_Black, #CSS_Lime, #CSS_Yellow, #CSS_LightSkyBlue, #CSS_White))
   NewIcon(ChartArea(file$, img, size, #CSS_Black, #CSS_Yellow, #CSS_DodgerBlue))
   NewIcon(ChartAreaPerc(file$, img, size, #CSS_Black, #CSS_DodgerBlue, #CSS_Yellow, #CSS_DarkOrange))
   NewIcon(ChartPie(file$, img, size, #CSS_Black, #CSS_DarkOrange, #CSS_Yellow, #CSS_CornflowerBlue, #CSS_White))
   NewIcon(ChartRing(file$, img, size, #CSS_DarkGray, #CSS_DarkOrange, #CSS_Yellow, #CSS_CornflowerBlue, #CSS_White))
   NewIcon(Notes(file$, img, size, #CSS_Gold, #CSS_DarkGray, #CSS_Black, #CSS_White, #CSS_White))
   NewIcon(Notes_Spatial(file$, img, size, #CSS_Yellow, #CSS_DarkGray, #CSS_Tan, #CSS3_LightGoldenrod, #CSS_OrangeRed, #CSS_BurlyWood, #CSS_DimGray))
   
   NewIcon(Unfold(file$, img, size, #CSS_ForestGreen, #CSS_White, 0.0, #False))
   NewIcon(Unfold(file$, img, size, #CSS_ForestGreen, #CSS_White, 180.0, #False))
   NewIcon(Unfold(file$, img, size, #CSS_ForestGreen, #CSS_White, 90.0, #False))
   NewIcon(Unfold(file$, img, size, #CSS_ForestGreen, #CSS_White, 270.0, #False))
   NewIcon(Fold(file$, img, size, #CSS_FireBrick, #CSS_White, 0.0, #False))
   NewIcon(Fold(file$, img, size, #CSS_FireBrick, #CSS_White, 180.0, #False))
   NewIcon(Fold(file$, img, size, #CSS_FireBrick, #CSS_White, 90.0, #False))
   NewIcon(Fold(file$, img, size, #CSS_FireBrick, #CSS_White, 270.0, #False))
   
   NewIcon(ArrowBowLeft(file$, img, size, #CSS_DimGrey))
   NewIcon(ArrowBowLeft(file$, img, size, #CSS_DimGrey,  90.0))
   NewIcon(ArrowBowLeft(file$, img, size, #CSS_DimGrey, 180.0))
   NewIcon(ArrowBowLeft(file$, img, size, #CSS_DimGrey, 270.0))
   NewIcon(ArrowBowRight(file$, img, size, #CSS_ForestGreen))
   NewIcon(ArrowBowRight(file$, img, size, #CSS_ForestGreen,  90.0))
   NewIcon(ArrowBowRight(file$, img, size, #CSS_ForestGreen, 180.0))
   NewIcon(ArrowBowRight(file$, img, size, #CSS_ForestGreen, 270.0))
   
   NewIcon(BracketRound(file$, img, size, #CSS_Black, #True))
   NewIcon(BracketRound(file$, img, size, #CSS_Black))
   NewIcon(BracketSquare(file$, img, size, #CSS_Black, #True))
   NewIcon(BracketSquare(file$, img, size, #CSS_Black))
   NewIcon(BracketAngle(file$, img, size, #CSS_Black, #True))
   NewIcon(BracketAngle(file$, img, size, #CSS_Black))
   NewIcon(BracketCurly(file$, img, size, #CSS_Black, #True))
   NewIcon(BracketCurly(file$, img, size, #CSS_Black))
   NewIcon(BracketHtml(file$, img, size, #CSS_Black))
   
   NewIcon(Site(file$, img, size, #CSS_DarkOrange, #CSS_White))
   NewIcon(Compare(file$, img, size, #CSS_SteelBlue, #CSS_Black))
   
   iconCount = img
   
   ;--- Create gray ("disabled") icons
   Restore IconNames01
   tail$ = "_d.svg"
   
   NewIcon(Transparent(file$, img, size))
   NewIcon(Add(file$, img, size, #CSS_Silver))
   NewIcon(Refresh(file$, img, size, #CSS_Silver))
   NewIcon(SelectAll(file$, img, size, #CSS_Silver))
   NewIcon(Checked(file$, img, size, #CSS_Silver))
   NewIcon(Sub(file$, img, size, #CSS_Silver))
   NewIcon(Delete(file$, img, size, #CSS_Silver))
   NewIcon(Find(file$, img, size, #CSS_Silver))
   NewIcon(FindNext(file$, img, size, #CSS_Silver, #CSS_Silver))
   NewIcon(Question(file$, img, size, #CSS_Silver))
   NewIcon(Question(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver))
   NewIcon(FivePointedStar(file$, img, size, #CSS_Silver))
   NewIcon(Wizard(file$, img, size, #CSS_Silver, #CSS_Silver))
   NewIcon(Diskette(file$, img, size, #CSS_Silver, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(Alarm(file$, img, size, #CSS_Silver))
   NewIcon(Alarm(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver))
   NewIcon(Quit(file$, img, size, #CSS_Silver))
   NewIcon(HotDrink(file$, img, size, #CSS_Silver))
   NewIcon(Watch(file$, img, size, #CSS_Silver, #CSS_DimGrey, #CSS_WhiteSmoke))
   NewIcon(Night(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver))
   
   NewIcon(Arrow(file$, img, size, #CSS_Silver))
   NewIcon(Arrow(file$, img, size, #CSS_Silver, 180))
   NewIcon(Arrow(file$, img, size, #CSS_Silver, -90))
   NewIcon(Arrow(file$, img, size, #CSS_Silver, 90))
   
   NewIcon(ReSize(file$, img, size, #CSS_Silver))
   NewIcon(Stop(file$, img, size, #CSS_Silver))
   NewIcon(Stop(file$, img, size, #CSS_Silver))
   NewIcon(Warning(file$, img, size, #CSS_Silver))
   NewIcon(Warning(file$, img, size, #CSS_Silver))
   NewIcon(OnOff(file$, img , size, #CSS_WhiteSmoke, #CSS_Silver))
   NewIcon(OnOff(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver))
   NewIcon(Info(file$, img, size, #CSS_Silver))
   NewIcon(Info(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver))
   NewIcon(Collapse(file$, img, size, #CSS_Silver))
   NewIcon(Expand(file$, img, size, #CSS_Silver))
   NewIcon(Success(file$, img, size, #CSS_Silver))
   NewIcon(Home(file$, img, size, #CSS_Silver))
   NewIcon(AlignLeft(file$, img, size, #CSS_Silver))
   NewIcon(AlignCentre(file$, img, size, #CSS_Silver))
   NewIcon(AlignRight(file$, img, size, #CSS_Silver))
   NewIcon(AlignJustify(file$, img, size, #CSS_Silver))
   NewIcon(Compile(file$, img, size, #CSS_Silver))
   NewIcon(CompileRun(file$, img, size, #CSS_Silver))
   NewIcon(Settings(file$, img, size, #CSS_Silver))
   NewIcon(Options(file$, img, size, #CSS_Silver))
   NewIcon(Toggle1(file$, img, size, #CSS_Silver, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(Toggle2(file$, img, size, #CSS_Silver, #CSS_DimGrey, #CSS_DimGrey))
   NewIcon(Save1(file$, img, size, #CSS_Silver))
   NewIcon(ZoomIn(file$, img, size, #CSS_Silver))
   NewIcon(ZoomOut(file$, img, size, #CSS_Silver))
   NewIcon(Great(file$, img, size, #CSS_Silver))
   NewIcon(DownLoad1(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver))
   NewIcon(UpLoad1(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver))
   NewIcon(LineWrapOn(file$, img, size, #CSS_DimGrey, #CSS_Silver))
   NewIcon(LineWrapOff(file$, img, size, #CSS_DimGrey, #CSS_Silver))
   NewIcon(Donate1(file$, img, size, #CSS_Silver))
   NewIcon(Donate2(file$, img, size, #CSS_Silver))
   NewIcon(Filter(file$, img, size, #CSS_Silver))
   NewIcon(Bookmark(file$, img, size, #CSS_Silver, #CSS_DimGrey))
   NewIcon(Database(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(Tools(file$, img, size, #CSS_Silver))
   NewIcon(Sort(file$, img, size, #CSS_Silver))
   NewIcon(Randomise(file$, img, size, #CSS_Silver))
   NewIcon(IsProtected(file$, img, size, #CSS_Silver, #CSS_DimGrey, #CSS_WhiteSmoke))
   NewIcon(UnProtected1(file$, img, size, #CSS_Silver, #CSS_DimGrey, #CSS_WhiteSmoke))
   NewIcon(UnProtected2(file$, img, size, #CSS_Silver, #CSS_DimGrey, #CSS_WhiteSmoke))
   NewIcon(Network(file$, img, size, #CSS_Silver))
   NewIcon(Music(file$, img, size, #CSS_Silver))
   NewIcon(Microphone(file$, img, size, #CSS_Silver))
   NewIcon(Picture(file$, img, size, #CSS_LightGrey, #CSS_Silver, #CSS_DarkGrey, #CSS_DimGrey, #CSS_WhiteSmoke, #CSS_DimGrey))
   NewIcon(Bug(file$, img, size,  #CSS_Silver, #CSS_DimGrey))
   NewIcon(DBug(file$, img, size,  #CSS_Silver, #CSS_DimGrey, #CSS_WhiteSmoke))
   NewIcon(Crop(file$, img, size, #CSS_Silver))
   NewIcon(ReSize2(file$, img, size, #CSS_Silver, #CSS_Silver))
   NewIcon(Rating(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(CitrusFruits(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(CitrusFruits(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(CitrusFruits(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(Action(file$, img, size, #CSS_Silver, #CSS_Silver, #CSS_Silver))
   NewIcon(Move(file$, img, size, #CSS_Silver))
   NewIcon(Lock(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(Unlock(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(Fill(file$, img, size, #CSS_Silver, #CSS_Silver))
   NewIcon(Message(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(Colours(file$, img, size, #CSS_DarkGrey, #CSS_Grey, #CSS_Silver, #CSS_DarkGrey, #CSS_Grey, #CSS_Silver))
   NewIcon(Navigation1(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(Navigation2(file$, img, size, #CSS_DarkGrey, #CSS_Grey, #CSS_Silver))
   NewIcon(Volume(file$, img, size, #CSS_Grey, #CSS_Silver))
   NewIcon(Secure(file$, img, size, #CSS_Silver))
   NewIcon(Book(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke, #CSS_WhiteSmoke))
   NewIcon(Library(file$, img, size, #CSS_Silver, #CSS_Silver, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(USB(file$, img, size, #CSS_Silver))
   NewIcon(WhitePawn(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(BlackPawn(file$, img, size, #CSS_Silver))
   NewIcon(WhiteRook(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(BlackRook(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(WhiteKnight(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(BlackKnight(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(WhiteBishop(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(BlackBishop(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(WhiteKing(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(BlackKing(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(WhiteQueen(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(BlackQueen(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(History(file$, img, size, #CSS_DarkGrey, #CSS_Grey, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(Danger(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(TheSun(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver))
   NewIcon(GoodLuck(file$, img, size, #CSS_DarkGrey, #CSS_Silver))
   NewIcon(Telephone(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(BlueTooth(file$, img, size, #CSS_Silver))
   NewIcon(Broadcast(file$, img, size, #CSS_Silver))
   NewIcon(Speaker(file$, img, size, #CSS_Silver))
   NewIcon(Mute(file$, img, size, #CSS_Silver, #CSS_Silver))
   NewIcon(BatteryCharging(file$, img, size, #CSS_Grey, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(Snowflake(file$, img, size, #CSS_Silver))
   NewIcon(A2M(file$, img, size, #CSS_Silver))
   NewIcon(N2Z(file$, img, size, #CSS_Silver))
   NewIcon(RainCloud(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver))
   NewIcon(CloudStorage(file$, img, size, #CSS_Silver, #CSS_DarkGrey))
   
   NewIcon(MediaPlay(file$, img, size, #CSS_Silver))
   NewIcon(MediaStop(file$, img, size, #CSS_Silver))
   NewIcon(MediaBegin(file$, img, size, #CSS_Silver))
   NewIcon(MediaEnd(file$, img, size, #CSS_Silver))
   NewIcon(MediaForward(file$, img, size, #CSS_Silver))
   NewIcon(MediaFastForward(file$, img, size, #CSS_Silver))
   NewIcon(MediaBack(file$, img, size, #CSS_Silver))
   NewIcon(MediaFastBack(file$, img, size, #CSS_Silver))
   
   NewIcon(FirstAid(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver))
   NewIcon(NoEntry(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver))
   NewIcon(Stop3(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver))
   NewIcon(Download2(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver))
   NewIcon(FirstAid_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver))
   NewIcon(NoEntry_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver))
   NewIcon(Stop3_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver))
   NewIcon(Download2_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver))
   NewIcon(ToClipboard(file$, img, size, #CSS_Silver, #CSS_Silver))
   NewIcon(FromClipboard(file$, img, size, #CSS_Silver, #CSS_Silver))
   NewIcon(Copy(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(Paste(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(Cut(file$, img, size, #CSS_Silver))
   NewIcon(Undo(file$, img, size, #CSS_Silver))
   NewIcon(Redo(file$, img, size, #CSS_Silver))
   NewIcon(Open1(file$, img, size, #CSS_Silver))
   NewIcon(Open2(file$, img, size, #CSS_Silver, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(Open3(file$, img, size, #CSS_Silver, #CSS_DarkGrey))
   NewIcon(Save2(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(SaveAs2(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(Printer1(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(PrinterError1(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(NewDocument(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver))
   NewIcon(EditDocument(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver))
   NewIcon(ClearDocument(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver))
   NewIcon(ImportDocument(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver))
   NewIcon(ExportDocument(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver))
   NewIcon(CloseDocument(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(SortAscending(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver))
   NewIcon(SortDescending(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver))
   NewIcon(SortBlockAscending(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver))
   NewIcon(SortBlockDescending(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver))
   NewIcon(ChartLine(file$, img, size, #CSS_DimGrey, #CSS_Silver, #CSS_Silver))
   NewIcon(ChartDot(file$, img, size, #CSS_DimGrey, #CSS_Silver))
   NewIcon(ChartLineDot(file$, img, size, #CSS_DimGrey, #CSS_Silver, #CSS_Silver))
   NewIcon(ChartPrice(file$, img, size, #CSS_DimGrey, #CSS_DarkGrey))
   NewIcon(ChartBarVert(file$, img, size, #CSS_DimGrey, #CSS_Silver, #CSS_Silver, #CSS_Silver))
   NewIcon(ChartCylVert(file$, img, size, #CSS_DimGrey, #CSS_Silver, #CSS_Silver, #CSS_Silver))
   NewIcon(ChartBarHor(file$, img, size, #CSS_DimGrey, #CSS_Silver, #CSS_Silver, #CSS_Silver))
   NewIcon(ChartCylHor(file$, img, size, #CSS_DimGrey, #CSS_Silver, #CSS_Silver, #CSS_Silver))
   NewIcon(ChartBarVertStacked(file$, img, size, #CSS_DimGrey, #CSS_Silver, #CSS_Silver, #CSS_Silver))
   NewIcon(ChartBarHorStacked(file$, img, size, #CSS_DimGrey, #CSS_Silver, #CSS_Silver, #CSS_Silver))
   NewIcon(ChartCylVertStacked(file$, img, size, #CSS_DimGrey, #CSS_Silver, #CSS_Silver, #CSS_Silver))
   NewIcon(ChartCylHorStacked(file$, img, size, #CSS_DimGrey, #CSS_Silver, #CSS_Silver, #CSS_Silver))
   NewIcon(ChartArea(file$, img, size, #CSS_DimGrey, #CSS_Silver, #CSS_Silver))
   NewIcon(ChartAreaPerc(file$, img, size, #CSS_DimGrey, #CSS_Silver, #CSS_Silver, #CSS_Silver))
   NewIcon(ChartPie(file$, img, size, #CSS_DimGrey, #CSS_Silver, #CSS_Silver, #CSS_Silver))
   NewIcon(ChartRing(file$, img, size, #CSS_DimGrey, #CSS_Silver, #CSS_Silver, #CSS_Silver))
   NewIcon(Notes(file$, img, size, #CSS_Silver, #CSS_DimGrey, #CSS_DimGrey, #CSS_Silver, #CSS_Silver))
   NewIcon(Notes_Spatial(file$, img, size, #CSS_Silver, #CSS_DimGrey, #CSS_LightGray, #CSS_WhiteSmoke, #CSS_Gray, #CSS_LightGray, #CSS_Gray))
   
   NewIcon(Unfold(file$, img, size, #CSS_DarkGray, #CSS_LightGray, 0.0, #False))
   NewIcon(Unfold(file$, img, size, #CSS_DarkGray, #CSS_LightGray, 180.0, #False))
   NewIcon(Unfold(file$, img, size, #CSS_DarkGray, #CSS_LightGray, 90.0, #False))
   NewIcon(Unfold(file$, img, size, #CSS_DarkGray, #CSS_LightGray, 270.0, #False))
   NewIcon(Fold(file$, img, size, #CSS_DarkGray, #CSS_LightGray, 0.0, #False))
   NewIcon(Fold(file$, img, size, #CSS_DarkGray, #CSS_LightGray, 180.0, #False))
   NewIcon(Fold(file$, img, size, #CSS_DarkGray, #CSS_LightGray, 90.0, #False))
   NewIcon(Fold(file$, img, size, #CSS_DarkGray, #CSS_LightGray, 270.0, #False))
   
   NewIcon(ArrowBowLeft(file$, img, size, #CSS_Silver))
   NewIcon(ArrowBowLeft(file$, img, size, #CSS_Silver,  90.0))
   NewIcon(ArrowBowLeft(file$, img, size, #CSS_Silver, 180.0))
   NewIcon(ArrowBowLeft(file$, img, size, #CSS_Silver, 270.0))
   NewIcon(ArrowBowRight(file$, img, size, #CSS_Silver))
   NewIcon(ArrowBowRight(file$, img, size, #CSS_Silver,  90.0))
   NewIcon(ArrowBowRight(file$, img, size, #CSS_Silver, 180.0))
   NewIcon(ArrowBowRight(file$, img, size, #CSS_Silver, 270.0))
   
   NewIcon(BracketRound(file$, img, size, #CSS_Silver, #True))
   NewIcon(BracketRound(file$, img, size, #CSS_Silver))
   NewIcon(BracketSquare(file$, img, size, #CSS_Silver, #True))
   NewIcon(BracketSquare(file$, img, size, #CSS_Silver))
   NewIcon(BracketAngle(file$, img, size, #CSS_Silver, #True))
   NewIcon(BracketAngle(file$, img, size, #CSS_Silver))
   NewIcon(BracketCurly(file$, img, size, #CSS_Silver, #True))
   NewIcon(BracketCurly(file$, img, size, #CSS_Silver))
   NewIcon(BracketHtml(file$, img, size, #CSS_Silver))
   
   NewIcon(Site(file$, img, size, #CSS_LightGray, #CSS_WhiteSmoke))
   NewIcon(Compare(file$, img, size, #CSS_DarkGray, #CSS_DarkGray))

   ProcedureReturn iconCount
EndProcedure


;{ Names of icons in set #2
DataSection
   IconNames02:
   Data.s "FindAndReplace", "Open1Spatial", "Open2Spatial", "Open3Spatial", "FindFileSpatial", "FindFile"
   Data.s "RotateDownSpatial", "RotateUpSpatial", "RotateVerticalSpatial", "RotateLeftSpatial", "RotateRightSpatial", "RotateHorizontalSpatial"
   Data.s "RotateCounterClockwiseSpatial", "RotateClockwiseSpatial", "WritingPad", "WritingPadSpatial", "CalculateSpatial", "CalendarSpatial"
   Data.s "RulerSpatial", "RulerTriangleSpatial", "CartonSpatial", "BookKeepingSpatial", "PenSpatial", "PenFlat", "BrushSpatial", "BrushFlat"
   Data.s "PipetteSpatial", "PipetteFlat", "FillSpatial", "FillFlat", "SpraySpatial", "SprayFlat", "EraserSpatial", "EraserFlat"
   Data.s "ColorPaletteSpatial", "ColorPaletteFlat", "PaintSpatial", "PaintFlat", "DrawVText", "DrawVLine", "DrawVBox", "DrawVRoundedBox", "DrawVPolygonBox"
   Data.s "DrawVCircle", "DrawVCircleSegment", "DrawVEllipse", "DrawVEllipseSegment", "DrawVCurve(Spline)", "DrawVArc", "DrawVLinePath"
   Data.s "SetVSelectRange", "SetVLineStyle", "SetVLineWidth", "SetVLineCap", "SetVLineJoin", "SetVColorSelect", "SetVColorBoardSelect"
   Data.s "SetVFlipX", "SetVFlipY", "SetVRotate", "SetVMove", "SetVCopy", "SetVScale", "SetVTrimSegment", "SetVExtendSegment"
   Data.s "SetVCatchGrid", "SetVLinearGradient", "SetVCircularGradient", "SetVChangeCoord", "SetVDelete", "SetVFill", "SetVLayer"
   Data.s "ToClipboardSpatial", "FromClipboardSpatial", "CopySpatial", "PasteSpatial", "CutSpatial"
   Data.s "FindSpatial", "FindNextSpatial", "FindAndReplaceSpatial", "ZoomInSpatial", "ZoomOutSpatial"
   Data.s "NewDocument1Spatial", "EditDocument1Spatial", "ClearDocument1Spatial", "ImportDocument1Spatial", "ExportDocument1Spatial"
   Data.s "SaveDocument1Spatial", "CloseDocument1Spatial", "SortAscending1Spatial", "SortDescending1Spatial", "SortBlockAscending1Spatial", "SortBlockDescending1Spatial"
   Data.s "NewDocument2Spatial", "EditDocument2Spatial", "ClearDocument2Spatial", "ImportDocument2Spatial", "ExportDocument2Spatial"
   Data.s "SaveDocument2Spatial", "CloseDocument2Spatial", "SortAscending2Spatial", "SortDescending2Spatial", "SortBlockAscending2Spatial", "SortBlockDescending2Spatial"
   Data.s "SiteSpatial", "CompareSpatial"
EndDataSection
;}


Procedure.i CreateIcons02 (size.i, start.i, createSVG.i=#False)
   ; in : size     : width and height (number of pixels) of each icon
   ;      start    : number of first image created by this procedure
   ;      createSVG: #True / #False
   ; out: return value: number of different icons (not counting the "disabled" versions)
   Protected file$, tail$, iconCount.i, img.i=start
   
   ;--- Create coloured ("enabled") icons
   Restore IconNames02
   tail$ = ".svg"
   
   NewIcon(FindAndReplace(file$, img, size, #CSS_Black, #CSS_Black, #CSS_WhiteSmoke, #CSS3_Red3, #CSS_BurlyWood, #CSS_Black))
   NewIcon(Open1_Spatial(file$, img, size, #CSS_Gold, #CSS_LightYellow))
   NewIcon(Open2_Spatial(file$, img, size, #CSS_Gold, #CSS_LightYellow, #CSS_Blue, #CSS_White))
   NewIcon(Open3_Spatial(file$, img, size, #CSS_Gold, #CSS_LightYellow))
   NewIcon(FindFile_Spatial(file$, img, size, #CSS_Gold, #CSS_LightYellow, #CSS_Black))
   NewIcon(FindFile(file$, img, size, #CSS_GoldenRod, #CSS_Black))
   
   NewIcon(RotateDown_Spatial(file$, img, size, #CSS_OrangeRed, #CSS_DarkGray, #CSS_Gold))
   NewIcon(RotateUp_Spatial(file$, img, size, #CSS_OrangeRed, #CSS_DarkGray, #CSS_Gold))
   NewIcon(RotateVert_Spatial(file$, img, size, #CSS_OrangeRed, #CSS_Gold))
   NewIcon(RotateLeft_Spatial(file$, img, size, #CSS_OrangeRed, #CSS_DarkGray, #CSS_Gold))
   NewIcon(RotateRight_Spatial(file$, img, size, #CSS_OrangeRed, #CSS_DarkGray, #CSS_Gold))
   NewIcon(RotateHor_Spatial(file$, img, size, #CSS_OrangeRed, #CSS_Gold))
   NewIcon(RotateCCw_Spatial(file$, img, size, #CSS_OrangeRed, #CSS_Gold))
   NewIcon(RotateCw_Spatial(file$, img, size, #CSS_OrangeRed, #CSS_Gold))
   
   NewIcon(Writingpad(file$, img, size, #CSS_White, #CSS_Gray, #CSS_Black, #CSS_Black, #CSS_WhiteSmoke, #CSS3_Red3, #CSS_BurlyWood, #CSS_Black))
   NewIcon(Writingpad_Spatial(file$, img, size, #CSS_White, #CSS_DimGray, #CSS_Black, #CSS_Tan, #CSS3_LightGoldenrod, #CSS_OrangeRed, #CSS_BurlyWood, #CSS_DimGray))
   NewIcon(Calculate_Spatial(file$, img, size, #CSS_DeepSkyBlue, #CSS_Black, #CSS_Yellow, #CSS_Beige))   ; #CSS_Yellow
   NewIcon(Calendar_Spatial(file$, img, size, #CSS_White, #CSS_Silver, #CSS_Black, #CSS_OrangeRed, #CSS_Gray))
   
   NewIcon(Ruler_Spatial(file$, img, size, #CSS_AliceBlue, #CSS_Black))
   NewIcon(RulerTriangle_Spatial(file$, img, size, #CSS_AliceBlue, #CSS_Black))
   
   NewIcon(Carton_Spatial(file$, img, size, #CSS_SandyBrown, #CSS_PapayaWhip, #CSS_Black, "tar.gz", 0.22))
   NewIcon(BookKeeping_Spatial(file$, img, size, #CSS3_Gray50, #CSS_MediumPurple, #CSS_DimGray, #CSS_Black, #CSS_White))
   NewIcon(Pen_Spatial(file$, img, size, #CSS_Tan, #CSS3_LightGoldenrod, #CSS_OrangeRed, #CSS_BurlyWood, #CSS_DimGray))
   NewIcon(Pen_Flat(file$, img, size, #CSS_Brown, #CSS_WhiteSmoke, #CSS3_Red3, #CSS_BurlyWood, #CSS_Black))
   NewIcon(Brush_Spatial(file$, img, size, #CSS_OrangeRed, #CSS_WhiteSmoke, #CSS_DimGray))
   NewIcon(Brush_Flat(file$, img, size, #CSS3_Red3, #CSS_LightGray, #CSS_Black))
   NewIcon(Pipette_Spatial(file$, img, size, #CSS_OrangeRed, #CSS_HoneyDew))
   NewIcon(Pipette_Flat(file$, img, size, #CSS3_Red3, #CSS_LightBlue, #CSS_DeepSkyBlue))
   NewIcon(Fill_Spatial(file$, img, size, #CSS_OrangeRed, #CSS_White, #CSS_Orange))
   NewIcon(Fill_Flat(file$, img, size, #CSS3_Red3, #CSS_Orange))
   NewIcon(Spray_Spatial(file$, img, size, #CSS_OrangeRed, #CSS_HoneyDew, #CSS_White, #CSS_OrangeRed))
   NewIcon(Spray_Flat(file$, img, size, #CSS3_Red3, #CSS_LightGray, #CSS3_Red3, #CSS_OrangeRed))
   NewIcon(Eraser_Spatial(file$, img, size, #CSS_OrangeRed, #CSS_HoneyDew))
   NewIcon(Eraser_Flat(file$, img, size, #CSS3_Red3, #CSS_LightGray))
   NewIcon(ColorPalette_Spatial (file$, img, size, #CSS_Wheat, #CSS_Red, #CSS_RoyalBlue, #CSS_Lime, #CSS_Yellow, #CSS_Magenta, #CSS_White))
   NewIcon(ColorPalette_Flat (file$, img, size, #CSS_Wheat, #CSS_Red, #CSS_RoyalBlue, #CSS_Lime, #CSS_Yellow, #CSS_Magenta, #CSS_White))
   NewIcon(Paint_Spatial (file$, img, size, #CSS_Tan, #CSS_Brown, #CSS_Ivory, #CSS_Orange, #CSS_Blue, #CSS_Green, #CSS_Red))
   NewIcon(Paint_Flat (file$, img, size, #CSS_Brown, #CSS_Brown, #CSS_HoneyDew, #CSS_Orange, #CSS_Blue, #CSS_Green, #CSS_Red))
   
   NewIcon(DrawVText(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_MintCream))
   NewIcon(DrawVLine(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_MintCream))
   NewIcon(DrawVBox(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_MintCream))
   NewIcon(DrawVRoundedBox(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_MintCream))
   NewIcon(DrawVPolygonBox(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_MintCream))
   NewIcon(DrawVCircle(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_MintCream))
   NewIcon(DrawVCircleSegment(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_MintCream))
   NewIcon(DrawVEllipse(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_MintCream))
   NewIcon(DrawVEllipseSegment(file$, img, size, #CSS_Red, #CSS_CornflowerBlue, #CSS_Silver, #CSS_MintCream))
   NewIcon(DrawVCurve(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_MintCream))
   NewIcon(DrawVArc(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_MintCream))
   NewIcon(DrawVLinePath(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_MintCream))
   
   NewIcon(SetVSelectionRange(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_Ivory))  ; #CSS_Cornsilk
   NewIcon(SetVLineStyle(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_Ivory))
   NewIcon(SetVLineWidth(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_Ivory))
   NewIcon(SetVLineCap(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_Ivory))
   NewIcon(SetVLineJoin(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_Ivory))
   NewIcon(SetVColorSelect(file$, img, size, #CSS_Red, #CSS_Lime, #CSS_Blue, #CSS_Silver, #CSS_Ivory))
   NewIcon(SetVColorBoardSelect(file$, img, size, #CSS_WhiteSmoke, #CSS_Ivory, #CSS_Wheat, #CSS_Red, #CSS_RoyalBlue, #CSS_Lime, #CSS_Yellow, #CSS_Magenta, #CSS_White))
   NewIcon(SetVFlipX(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_Ivory))
   NewIcon(SetVFlipY(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_Ivory))
   NewIcon(SetVRotate(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_Ivory))
   NewIcon(SetVMove(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_Ivory))
   NewIcon(SetVCopy(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_Ivory))
   NewIcon(SetVScale(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_Ivory))
   NewIcon(SetVTrimSegment(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_Ivory))
   NewIcon(SetVExtendSegment(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_Ivory))
   NewIcon(SetVCatchGrid(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Silver, #CSS_Ivory))
   NewIcon(SetVLinearGradient(file$, img, size, #CSS_GhostWhite, #CSS_Ivory))
   NewIcon(SetVCircularGradient(file$, img, size, #CSS_GhostWhite, #CSS_Ivory))
   NewIcon(SetVChangeCoord(file$, img, size, #CSS_Black, #CSS_CornflowerBlue, #CSS_Black, #CSS_White, #CSS_Silver, #CSS_Ivory))
   NewIcon(SetVDelete(file$, img, size, #CSS_Black, #CSS_Red, #CSS_Black, #CSS_White, #CSS_Silver, #CSS_Ivory))
   NewIcon(SetVFill(file$, img, size, #CSS_Black, #CSS_DodgerBlue, #CSS_Gold, #CSS_White, #CSS_LightGray, #CSS_Ivory))
   NewIcon(SetVLayer(file$, img, size, #CSS_LightSeaGreen, #CSS_Orange, #CSS_RoyalBlue, #CSS_LightGray, #CSS_Ivory))
   
   NewIcon(ToClipboard_Spatial(file$, img, size, #CSS_SandyBrown, #CSS_DarkSlateBlue, #CSS_Black, #CSS_White))
   NewIcon(FromClipboard_Spatial(file$, img, size, #CSS_SandyBrown, #CSS_DarkSlateBlue, #CSS_Black, #CSS_White))
   NewIcon(Copy_Spatial(file$, img, size, #CSS_DodgerBlue, #CSS_DarkGrey, #CSS_White))
   NewIcon(Paste_Spatial(file$, img, size, #CSS_DodgerBlue, #CSS_DarkGrey, #CSS_White, #CSS_SandyBrown, #CSS_Black, #CSS_White))
   NewIcon(Cut_Spatial (file$, img.i, size.i, #VI_GrayBlue1, #CSS_White, #VI_GrayBlue2, #CSS_DarkGray, #CSS_White, #CSS_Gray))
   NewIcon(Find_Spatial(file$, img, size, #CSS_DarkGray, #CSS_AliceBlue, #CSS_White, #CSS_PowderBlue, #False))
   NewIcon(FindNext_Spatial(file$, img, size, #CSS_DarkGray, #VI_WhiteBlue1, #CSS_White, #CSS_PowderBlue, #CSS_ForestGreen, #False))
   NewIcon(FindAndReplace_Spatial(file$, img, size, #CSS_DarkGray, #VI_WhiteBlue1, #CSS_White, #CSS_PowderBlue, #CSS_Tan, #CSS3_LightGoldenrod, #CSS_OrangeRed, #CSS_BurlyWood, #CSS_DimGray, #True))
   NewIcon(ZoomIn_Spatial(file$, img, size, #CSS_DarkGray, #VI_WhiteBlue1, #CSS_White, #CSS_PowderBlue, #CSS_CornflowerBlue, #False))
   NewIcon(ZoomOut_Spatial(file$, img, size, #CSS_DarkGray, #VI_WhiteBlue1, #CSS_White, #CSS_PowderBlue, #CSS_CornflowerBlue, #False))
   
   NewIcon(NewDocument_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey, #CSS_DodgerBlue))
   NewIcon(EditDocument_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey, #CSS_Tan, #CSS3_LightGoldenrod, 
                                #CSS_OrangeRed, #CSS_BurlyWood, #CSS_DimGray))
   NewIcon(ClearDocument_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey, #CSS_DodgerBlue))
   NewIcon(ImportDocument_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey, #CSS_DodgerBlue))
   NewIcon(ExportDocument_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey, #CSS_DodgerBlue))
   NewIcon(SaveDocument_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey, #CSS_DodgerBlue))
   NewIcon(CloseDocument_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey, #CSS_OrangeRed))
   NewIcon(SortAscending_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey))
   NewIcon(SortDescending_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey))
   NewIcon(SortBlockAscending_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey))
   NewIcon(SortBlockDescending_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey))
   
   NewIcon(NewDocument_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey, #CSS_DodgerBlue, #True))
   NewIcon(EditDocument_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey, #CSS_Tan, #CSS3_LightGoldenrod, 
                                #CSS_OrangeRed, #CSS_BurlyWood, #CSS_DimGray, #True))
   NewIcon(ClearDocument_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey, #CSS_DodgerBlue, #True))
   NewIcon(ImportDocument_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey, #CSS_DodgerBlue, #True))
   NewIcon(ExportDocument_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey, #CSS_DodgerBlue, #True))
   NewIcon(SaveDocument_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey, #CSS_DodgerBlue, #True))
   NewIcon(CloseDocument_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey, #CSS_OrangeRed, #True))
   NewIcon(SortAscending_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey, #True))
   NewIcon(SortDescending_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey, #True))
   NewIcon(SortBlockAscending_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey, #True))
   NewIcon(SortBlockDescending_Spatial(file$, img, size, #CSS_White, #CSS_DodgerBlue, #CSS_DarkGrey, #True))
   
   NewIcon(Site_Spatial(file$, img, size, #CSS_Orange, #CSS_White))
   NewIcon(Compare_Spatial(file$, img, size, #CSS_Gold, #CSS_Black))
   
   iconCount = img - start
   
   ;--- Create gray ("disabled") icons
   Restore IconNames02
   tail$ = "_d.svg"
   
   NewIcon(FindAndReplace(file$, img, size, #CSS_DimGray, #CSS_Gray, #CSS_WhiteSmoke, #CSS_Gray, #CSS_LightGray, #CSS_Gray))
   NewIcon(Open1_Spatial(file$, img, size, #CSS_Gainsboro, #CSS_WhiteSmoke))
   NewIcon(Open2_Spatial(file$, img, size, #CSS_Gainsboro, #CSS_WhiteSmoke, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(Open3_Spatial(file$, img, size, #CSS_Gainsboro, #CSS_WhiteSmoke))
   NewIcon(FindFile_Spatial(file$, img, size, #CSS_LightGray, #CSS_WhiteSmoke, #CSS_DimGray))
   NewIcon(FindFile(file$, img, size, #CSS_Silver, #CSS_DimGray))
   
   NewIcon(RotateDown_Spatial(file$, img, size, #CSS_DarkGray, #CSS_Gainsboro, #CSS_Silver))
   NewIcon(RotateUp_Spatial(file$, img, size, #CSS_DarkGray, #CSS_Gainsboro, #CSS_Silver))
   NewIcon(RotateVert_Spatial(file$, img, size, #CSS_DarkGray, #CSS_Silver))
   NewIcon(RotateLeft_Spatial(file$, img, size, #CSS_DarkGray, #CSS_Gainsboro, #CSS_Silver))
   NewIcon(RotateRight_Spatial(file$, img, size, #CSS_DarkGray, #CSS_Gainsboro, #CSS_Silver))
   NewIcon(RotateHor_Spatial(file$, img, size, #CSS_DarkGray, #CSS_Silver))
   NewIcon(RotateCCw_Spatial(file$, img, size, #CSS_LightGray, #CSS_DarkGray))
   NewIcon(RotateCw_Spatial(file$, img, size, #CSS_LightGray, #CSS_DarkGray))
   
   NewIcon(Writingpad(file$, img, size, #CSS_WhiteSmoke, #CSS_Gray, #CSS_Black, #CSS_LightGray, #CSS_WhiteSmoke, #CSS_Gray, #CSS_LightGray, #CSS_Gray))
   NewIcon(Writingpad_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Gray, #CSS_Black, #CSS_LightGray, #CSS_WhiteSmoke, #CSS_DarkGray, #CSS_LightGray, #CSS_Gray))
   NewIcon(Calculate_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_DimGray, #CSS_WhiteSmoke, #CSS_LightGray))
   NewIcon(Calendar_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Black, #CSS_LightGray, #CSS_DimGray))
   
   NewIcon(Ruler_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_DimGray))
   NewIcon(RulerTriangle_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_DimGray))
   
   NewIcon(Carton_Spatial(file$, img, size, #CSS_LightGray, #CSS_WhiteSmoke))
   NewIcon(BookKeeping_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_WhiteSmoke, #CSS_LightGray, #CSS_DimGray, #CSS_WhiteSmoke))
   NewIcon(Pen_Spatial(file$, img, size, #CSS_LightGray, #CSS_WhiteSmoke, #CSS_DarkGray, #CSS_LightGray, #CSS_Gray))
   NewIcon(Pen_Flat(file$, img, size, #CSS_LightGray, #CSS_WhiteSmoke, #CSS_DarkGray, #CSS_LightGray, #CSS_Gray))
   NewIcon(Brush_Spatial(file$, img, size, #CSS_LightGray, #CSS_WhiteSmoke, #CSS_Gray))
   NewIcon(Brush_Flat(file$, img, size, #CSS_LightGray, #CSS_WhiteSmoke, #CSS_DarkGray))
   NewIcon(Pipette_Spatial(file$, img, size, #CSS_Silver, #CSS_LightGray))
   NewIcon(Pipette_Flat(file$, img, size, #CSS_Gray, #CSS_LightGray, #CSS_Gray))
   NewIcon(Fill_Spatial(file$, img, size, #CSS_DarkGray, #CSS_LightGray, #CSS_LightGray))
   NewIcon(Fill_Flat(file$, img, size, #CSS_Silver, #CSS_LightGray))
   NewIcon(Spray_Spatial(file$, img, size, #CSS_Silver, #CSS_LightGray, #CSS_White, #CSS_Gray))
   NewIcon(Spray_Flat(file$, img, size, #CSS_DarkGray, #CSS_LightGray, #CSS_Gray, #CSS_Gray))
   NewIcon(Eraser_Spatial(file$, img, size, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(Eraser_Flat(file$, img, size, #CSS_DarkGray, #CSS_Gainsboro))
   NewIcon(ColorPalette_Spatial (file$, img, size, #CSS_LightGray, #CSS_Silver, #CSS_Silver, #CSS_Silver, #CSS_Silver, #CSS_Silver, #CSS_Silver))
   NewIcon(ColorPalette_Flat (file$, img, size, #CSS_LightGray, #CSS_DarkGray, #CSS_DarkGray, #CSS_DarkGray, #CSS_DarkGray, #CSS_DarkGray, #CSS_DarkGray))
   NewIcon(Paint_Spatial (file$, img, size, #CSS_LightGray, #CSS_Silver, #CSS_LightGray, #CSS_Gray, #CSS_Gray, #CSS_Gray, #CSS_Gray))
   NewIcon(Paint_Flat (file$, img, size, #CSS_Gray, #CSS_Silver, #CSS_LightGray, #CSS_Gray, #CSS_Gray, #CSS_Gray, #CSS_Gray))
   
   NewIcon(DrawVText(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(DrawVLine(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(DrawVBox(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(DrawVRoundedBox(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(DrawVPolygonBox(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(DrawVCircle(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(DrawVCircleSegment(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(DrawVEllipse(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(DrawVEllipseSegment(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(DrawVCurve(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(DrawVArc(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(DrawVLinePath(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   
   NewIcon(SetVSelectionRange(file$, img, size, #CSS_Gray, #CSS_LightGray, #CSS_LightGray))
   NewIcon(SetVLineStyle(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(SetVLineWidth(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(SetVLineCap(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(SetVLineJoin(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(SetVColorSelect(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(SetVColorBoardSelect(file$, img, size, #CSS_White, 0, #CSS_LightGray, #CSS_LightGray, #CSS_Silver, #CSS_Silver, #CSS_Silver, #CSS_Silver, #CSS_Silver))
   NewIcon(SetVFlipX(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(SetVFlipY(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(SetVRotate(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(SetVMove(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(SetVCopy(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(SetVScale(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(SetVTrimSegment(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(SetVExtendSegment(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(SetVCatchGrid(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray))
   NewIcon(SetVLinearGradient(file$, img, size, #CSS_White))
   NewIcon(SetVCircularGradient(file$, img, size, #CSS_White))
   NewIcon(SetVChangeCoord(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_Gray, #CSS_Gainsboro, #CSS_LightGray))
   NewIcon(SetVDelete(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_Gray, #CSS_Gainsboro, #CSS_LightGray))
   NewIcon(SetVFill(file$, img, size, #CSS_Gray, #CSS_Gray, #CSS_LightGray, #CSS_White, #CSS_White))
   NewIcon(SetVLayer(file$, img, size, #CSS_DarkGray, #CSS_LightGray, #CSS_LightGray, #CSS_LightGray))
   
   NewIcon(ToClipboard_Spatial(file$, img, size, #CSS_LightGrey, #CSS_Gray, #CSS_Gray, #CSS_White))
   NewIcon(FromClipboard_Spatial(file$, img, size, #CSS_LightGrey, #CSS_Gray, #CSS_Gray, #CSS_White))
   NewIcon(Copy_Spatial(file$, img, size, #CSS_Silver, #CSS_Gainsboro, #CSS_WhiteSmoke))
   NewIcon(Paste_Spatial(file$, img, size, #CSS_Silver, #CSS_Gainsboro, #CSS_WhiteSmoke, #CSS_LightGrey, #CSS_Gray, #CSS_White))
   NewIcon(Cut_Spatial (file$, img.i, size.i, #CSS_Gainsboro, #CSS_White, #CSS_Gainsboro, #CSS_LightGrey, #CSS_White, #CSS_Silver))
   NewIcon(Find_Spatial(file$, img, size, #CSS_White, #CSS_WhiteSmoke, #CSS_White, #CSS_White, #False))
   NewIcon(FindNext_Spatial(file$, img, size, #CSS_White, #CSS_WhiteSmoke, #CSS_White, #CSS_White, #CSS_Silver, #False))
   NewIcon(FindAndReplace_Spatial(file$, img, size, #CSS_White, #CSS_WhiteSmoke, #CSS_White, #CSS_White, #CSS_LightGray, #CSS_WhiteSmoke, #CSS_DarkGray, #CSS_LightGray, #CSS_Gray, #True))
   NewIcon(ZoomIn_Spatial(file$, img, size, #CSS_White, #CSS_WhiteSmoke, #CSS_White, #CSS_White, #CSS_Silver, #False))
   NewIcon(ZoomOut_Spatial(file$, img, size, #CSS_White, #CSS_WhiteSmoke, #CSS_White, #CSS_White, #CSS_Silver, #False))
   
   NewIcon(NewDocument_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver, #CSS_DarkGray))
   NewIcon(EditDocument_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver, #CSS_LightGray, 
                                #CSS_WhiteSmoke, #CSS_DarkGray, #CSS_LightGray, #CSS_Gray))
   NewIcon(ClearDocument_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver, #CSS_DarkGray))
   NewIcon(ImportDocument_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(ExportDocument_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(SaveDocument_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(CloseDocument_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver, #CSS_WhiteSmoke))
   NewIcon(SortAscending_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver))
   NewIcon(SortDescending_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver))
   NewIcon(SortBlockAscending_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver))
   NewIcon(SortBlockDescending_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver))
   
   NewIcon(NewDocument_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver, #CSS_DarkGray, #True))
   NewIcon(EditDocument_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver, #CSS_LightGray, 
                                #CSS_WhiteSmoke, #CSS_DarkGray, #CSS_LightGray, #CSS_Gray, #True))
   NewIcon(ClearDocument_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver, #CSS_DarkGray, #True))
   NewIcon(ImportDocument_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver, #CSS_WhiteSmoke, #True))
   NewIcon(ExportDocument_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver, #CSS_WhiteSmoke, #True))
   NewIcon(SaveDocument_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver, #CSS_WhiteSmoke, #True))
   NewIcon(CloseDocument_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver, #CSS_WhiteSmoke, #True))
   NewIcon(SortAscending_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver, #True))
   NewIcon(SortDescending_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver, #True))
   NewIcon(SortBlockAscending_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver, #True))
   NewIcon(SortBlockDescending_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver, #CSS_Silver, #True))
   
   NewIcon(Site_Spatial(file$, img, size, #CSS_Gainsboro, #CSS_White))
   NewIcon(Compare_Spatial(file$, img, size, #CSS_WhiteSmoke, #CSS_Silver))
   
   ProcedureReturn iconCount
EndProcedure


Procedure.s ChoosePath (initialPath$, targetDir$)
   ; in : initialPath$: the initial path to use when the PathRequester is opened
   ;      targetDir$  : name of target directory in the choosen path
   ; out: chosen path, or "" on error
   Protected path$
   
   path$ = PathRequester("Choose path where to create main directory for the icon files.", initialPath$)
   If path$ <> ""
      path$ + targetDir$
      
      If FileSize(path$) = -2
         If MessageRequester("Warning", ~"Directory already exists:\n" +
                                        path$ + ~"\n\n" +
                                        "Proceed anyway?",
                             #PB_MessageRequester_YesNo) = #PB_MessageRequester_No
            path$ = ""
         EndIf
      ElseIf CreateDirectory(path$) = 0
         MessageRequester("Error", ~"Can't create directory\n" +
                                   path$)
         path$ = ""
      EndIf
   EndIf
   
   ProcedureReturn path$
EndProcedure


Procedure SaveSVG (size.i, iconCount01.i, iconCount02.i)
   ; -- save all icons to individual SVG files
   ; in: size       : width and height (number of pixels) of each icon
   ;     iconCount01: number of different icons in set #1 (not counting the "disabled" versions)
   ;     iconCount02: number of different icons in set #2 (not counting the "disabled" versions)
   Protected path$
   
   path$ = ChoosePath(GetHomeDirectory(), "vectoricons_svg")
   If path$ <> ""
      CreateDirectory(path$ + "/" + #IconSet1$)
      SetCurrentDirectory(path$ + "/" + #IconSet1$)
      CreateIcons01(size, #True)
      
      CreateDirectory(path$ + "/" + #IconSet2$)
      SetCurrentDirectory(path$ + "/" + #IconSet2$)
      CreateIcons02(size, 0, #True)
      
      MessageRequester("Done", Str(2*iconCount01) + "+" + Str(2*iconCount02) +
                               " = " + Str(2*iconCount01 + 2*iconCount02) +
                               ~" SVG images saved to directory\n" +
                               path$)
   EndIf
EndProcedure


Procedure SavePNG (iconCount01.i, iconCount02.i)
   ; -- save all icons to individual PNG files
   ; in: iconCount01: number of different icons in set #1 (not counting the "disabled" versions)
   ;     iconCount02: number of different icons in set #2 (not counting the "disabled" versions)
   Protected path$, file$
   Protected.i first, last, img
   
   path$ = ChoosePath(GetHomeDirectory(), "vectoricons_png")
   If path$ <> ""
      CreateDirectory(path$ + "/" + #IconSet1$)
      SetCurrentDirectory(path$ + "/" + #IconSet1$)
      Restore IconNames01
      first = 0
      last  = first + iconCount01 - 1
      For img = first To last
         Read.s file$
         ReplaceString(file$, "/", "_", #PB_String_InPlace)
         file$ = LCase(file$)
         If SaveImage(img,               file$ + ".png", #PB_ImagePlugin_PNG) = 0
            Debug "Can't save image #" + Str(img)
         EndIf
         If SaveImage(img + iconCount01, file$ + "_d.png", #PB_ImagePlugin_PNG) = 0
            Debug "Can't save image #" + Str(img + iconCount01)
         EndIf
      Next
      
      CreateDirectory(path$ + "/" + #IconSet2$)
      SetCurrentDirectory(path$ + "/" + #IconSet2$)
      Restore IconNames02
      first = 2*iconCount01
      last  = first + iconCount02 - 1
      For img = first To last
         Read.s file$
         ReplaceString(file$, "/", "_", #PB_String_InPlace)
         file$ = LCase(file$)
         If SaveImage(img,               file$ + ".png", #PB_ImagePlugin_PNG) = 0
            Debug "Can't save image #" + Str(img)
         EndIf
         If SaveImage(img + iconCount02, file$ + "_d.png", #PB_ImagePlugin_PNG) = 0
            Debug "Can't save image #" + Str(img + iconCount02)
         EndIf
      Next
      
      MessageRequester("Done", Str(2*iconCount01) + "+" + Str(2*iconCount02) +
                               " = " + Str(2*iconCount01+2*iconCount02) +
                               ~" PNG images saved to directory\n" +
                               path$)
   EndIf
EndProcedure


Procedure.s SaveOverview (initialPath$, name$, size.i, columns.i, firstIcon.i, iconCount.i)
   ; -- create *one* PNG file that shows all icons of the given set (e.g. for uploading on the PureBasic forum)
   ; in : initialPath$: the initial path to use when the PathRequester is opened
   ;      name$       : the initial file name to use when the SaveFileRequester is opened
   ;      size        : width and height (number of pixels) of each icon
   ;      columns     : number of icons per row
   ;      firstIcon   : number of first icon to be saved
   ;      iconCount   : number of different icons in current set (not counting the "disabled" versions)
   ; out: return value: path where the PNG file was saved
   Protected.i rows, picWidth, picHeight, pic, img, row, col, lastIcon=firstIcon+iconCount-1
   Protected file$
   
   file$ = SaveFileRequester("", initialPath$+name$, "PNG files (*.png)|*.png|All files (*.*)|*.*", 0)
   If file$ <> ""
      rows = Round(iconCount/columns, #PB_Round_Up)
      picWidth  = columns  * (size+20)
      picHeight = 2 * rows * (size+20)
      
      pic = CreateImage(#PB_Any, picWidth, picHeight, 32, $F0F0F0)
      If pic = 0
         MessageRequester("Error", "Can't create image.")
         ProcedureReturn
      EndIf
      
      If StartDrawing(ImageOutput(pic)) = 0
         MessageRequester("Error", "Can't start drawing.")
         FreeImage(pic)
         ProcedureReturn
      EndIf
      
      DrawingMode(#PB_2DDrawing_AlphaBlend)
      For img = firstIcon To lastIcon
         row = Int((img-firstIcon) / columns)
         col = (img-firstIcon) % columns
         If IsImage(img)
            DrawImage(ImageID(img),             col*(size+20)+10,  2*row   *(size+20)+10)  ; "enabled"
         EndIf
         If IsImage(img + iconCount)
            DrawImage(ImageID(img + iconCount), col*(size+20)+10, (2*row+1)*(size+20)+10)  ; "disabled"
         EndIf
      Next
      StopDrawing()
      
      If SaveImage(pic, file$, #PB_ImagePlugin_PNG)
         MessageRequester("OK", "Overview picture saved to file '" + file$ + "'.")
      Else
         MessageRequester("Error", "Can't create file '" + file$ + "'.")
      EndIf
      
      FreeImage(pic)
   EndIf
   
   ProcedureReturn GetPathPart(file$)
EndProcedure


Procedure DisplayIcons (parent.i, size.i, columns.i, firstIcon.i, iconCount.i)
   ; -- display one iconset with tooltips
   ; in: parent   : number of the ScrollAreaGadget that contains the icons
   ;     size     : width and height (number of pixels) of each icon
   ;     columns  : number of icons per row
   ;     firstIcon: number of first icon to be displayed
   ;     iconCount: number of different icons in current set (not counting the "disabled" versions)
   Protected.i img, row, col, rows, lastIcon=iconCount+firstIcon-1
   Protected name$
   
   OpenGadgetList(parent)
   For img = firstIcon To lastIcon
      row = Int((img-firstIcon) / columns)
      col = (img-firstIcon) % columns
      
      Read.s name$
      If IsImage(img)
         ImageGadget(img, col*(size+20)+10,  2*row   *(size+20)+10, size, size, ImageID(img))              ; "enabled"
         GadgetToolTip(img, name$)
      Else
         Debug "Coloured image #" + Str(img) + " not found."
      EndIf
      If IsImage(img + iconCount)
         ImageGadget(img + iconCount, col*(size+20)+10, (2*row+1)*(size+20)+10, size, size, ImageID(img + iconCount))  ; "disabled"
         GadgetToolTip(img + iconCount, name$)
      Else
         Debug "Gray image #" + Str(img + iconCount) + " not found."
      EndIf
   Next
   CloseGadgetList()
   
   rows = Round(iconCount/columns, #PB_Round_Up)
   SetGadgetAttribute(parent, #PB_ScrollArea_InnerWidth,  columns*(size+20))
   SetGadgetAttribute(parent, #PB_ScrollArea_InnerHeight, 2*rows *(size+20))
EndProcedure


Procedure FreeIconsAndGadgets (first.i, count.i)
   ; in: first: number of first icon/imagegadget to be freed
   ;     count: number of icons/imagegadgets to be freed (not counting the "disabled" versions)
   Protected.i img, last=first+count-1
   
   For img = first To last
      FreeImage (img)
      FreeGadget(img)
      FreeImage (img + count)
      FreeGadget(img + count)
   Next
EndProcedure


Procedure.i DrawIcons1 (parent.i, size.i, columns.i, firstIcon.i)
   ; -- create and display iconset #1
   ; in : parent   : number of the ScrollAreaGadget that contains the icons
   ;      size     : width and height (number of pixels) of each icon
   ;      columns  : number of icons per row
   ;      firstIcon: number of first icon to be displayed
   ; out: number of created icons (not counting the "disabled" versions)
   Protected.i iconCount
   
   iconCount = CreateIcons01(size)
   Restore IconNames01
   DisplayIcons(parent, size, columns, firstIcon, iconCount)
   
   ProcedureReturn iconCount
EndProcedure


Procedure.i DrawIcons2 (parent.i, size.i, columns.i, firstIcon.i)
   ; -- create and display iconset #2
   ; in : parent   : number of the ScrollAreaGadget that contains the icons
   ;      size     : width and height (number of pixels) of each icon
   ;      columns  : number of icons per row
   ;      firstIcon: number of first icon to be displayed
   ; out: number of created icons (not counting the "disabled" versions)
   Protected.i iconCount
   
   iconCount = CreateIcons02(size, firstIcon)
   Restore IconNames02
   DisplayIcons(parent, size, columns, firstIcon, iconCount)
   
   ProcedureReturn iconCount
EndProcedure


CompilerIf #PB_Compiler_Unicode
   #XmlEncoding = #PB_Unicode
CompilerElse
   #XmlEncoding = #PB_Ascii
CompilerEndIf

#Dialog = 0
#XML = 0


Procedure BrowseIcons (size.i, minWidth.i=840, minHeight.i=640, columns.i=15)
   ; * Main procedure *
   ; in: size     : width and height (number of pixels) of each icon
   ;     minWidth : minimal width  of the preview window
   ;     minHeight: minimal height of the preview window
   ;     columns  : number of icons per row in the preview window
   Protected XML$, path$
   Protected.i imgZoomIn, imgZoomOut, imgZoomOut_d, zoomOutDisabled, iconCount01, iconCount02, evGadget
   Protected.i gadZoomIn, gadZoomOut, gadPanel, gadScroll1, gadScroll2, btnSaveSVG, btnSavePNG, btnOverview, btnExit
   Protected.i tbIconSize=24
   
   XML$ = "<window id='0' text='VectorIcons (" + size + "x" + size + ")' minwidth='" + minWidth + "' minheight='" + minHeight + "' " +
          "flags='#PB_Window_ScreenCentered|#PB_Window_SizeGadget|#PB_Window_MaximizeGadget|#PB_Window_MinimizeGadget'>" +
          "   <vbox expand='item:2'>" +
          "      <hbox height='" + Str(tbIconSize+10) + "' spacing='10' expand='no'>" +
          "         <image name='ZoomIn'  width='" + tbIconSize + "'/>" +
          "         <image name='ZoomOut' width='" + tbIconSize + "'/>" +
          "      </hbox>" +
          "      <panel name='Panel'>" +
          "         <tab name='Tab1' text='" + #IconSet1$ + "' margin='0'>" +
          "            <scrollarea name='Scroll1'>" +
          "            </scrollarea>" +
          "         </tab>" +
          "         <tab name='Tab2' text='" + #IconSet2$ + "' margin='0'>" +
          "            <scrollarea name='Scroll2'>" +
          "            </scrollarea>" +
          "         </tab>" +
          "      </panel>" +
          "      <hbox spacing='10' expand='item:1'>" +
          "         <empty/>" +
          "         <button name='BtnSaveSVG'  text='Save all to SVG'/>" +
          "         <button name='BtnSavePNG'  text='Save all to PNG'/>" +
          "         <button name='BtnOverview' text='Save overview pictures'/>" +
          "         <button name='BtnExit'     text='Exit' width='60'/>" +
          "      </hbox>" +
          "   </vbox>" +
          "</window>"
   
   If CatchXML(#Xml, @XML$, StringByteLength(XML$), 0, #XmlEncoding) = 0 Or XMLStatus(#Xml) <> #PB_XML_Success
      MessageRequester("Error", XMLError(#XML))
      End
   EndIf
   
   If CreateDialog(#Dialog) = 0 Or OpenXMLDialog(#Dialog, #XML, "") = 0
      MessageRequester("Error", DialogError(#Dialog))
      End
   EndIf
   
   ; Toolbar images
   imgZoomIn    = ZoomIn ("", #PB_Any, tbIconSize, #CSS_Black)
   imgZoomOut   = ZoomOut("", #PB_Any, tbIconSize, #CSS_Black)
   imgZoomOut_d = ZoomOut("", #PB_Any, tbIconSize, #CSS_Silver)
   
   ; Gadget numbers and tooltips
   gadZoomIn  = DialogGadget(#Dialog, "ZoomIn")
   GadgetToolTip(gadZoomIn,  "Zoom in")
   gadZoomOut = DialogGadget(#Dialog, "ZoomOut")
   GadgetToolTip(gadZoomOut, "Zoom out")
   gadPanel   = DialogGadget(#Dialog, "Panel")
   gadScroll1 = DialogGadget(#Dialog, "Scroll1")
   gadScroll2 = DialogGadget(#Dialog, "Scroll2")
   btnSaveSVG = DialogGadget(#Dialog, "BtnSaveSVG")
   
   CompilerIf #PB_Compiler_OS = #PB_OS_Linux
      GadgetToolTip(btnSaveSVG, "Save all icons to individual SVG files")
   CompilerElse
      HideGadget(btnSaveSVG, #True)
   CompilerEndIf
   
   btnSavePNG  = DialogGadget(#Dialog, "BtnSavePNG")
   GadgetToolTip(btnSavePNG, "Save all icons to individual PNG files")
   btnOverview = DialogGadget(#Dialog, "BtnOverview")
   GadgetToolTip(btnOverview, "Save the content of each tab to a PNG file")
   btnExit     = DialogGadget(#Dialog, "BtnExit")
   
   SetGadgetState(gadZoomIn , ImageID(imgZoomIn))
   SetGadgetState(gadZoomOut, ImageID(imgZoomOut))
   
   HideGadget(gadScroll1, #True)
   iconCount01 = DrawIcons1(gadScroll1, size, columns, 0)
   iconCount02 = DrawIcons2(gadScroll2, size, columns, 2*iconCount01)
   HideGadget(gadScroll1, #False)
   
   ; -- Event loop
   Repeat
      Select WaitWindowEvent()
         Case #PB_Event_Gadget
            evGadget = EventGadget()
            Select evGadget
               Case gadZoomIn, gadZoomOut
                  If EventType() = #PB_EventType_LeftClick
                     If evGadget = gadZoomIn
                        If size <= 16
                           size = 16
                           zoomOutDisabled = #False
                           SetGadgetState(gadZoomOut, ImageID(imgZoomOut))
                        EndIf
                        size * 2
                     ElseIf zoomOutDisabled = #False
                        size / 2
                        If size <= 16
                           size = 16
                           zoomOutDisabled = #True
                           SetGadgetState(gadZoomOut, ImageID(imgZoomOut_d))
                        EndIf
                     Else
                        Continue
                     EndIf
                     
                     HideGadget(gadScroll1, #True)
                     HideGadget(gadScroll2, #True)
                     FreeIconsAndGadgets(0, iconCount01)
                     DrawIcons1(gadScroll1, size, columns, 0)
                     FreeIconsAndGadgets(2*iconCount01, iconCount02)
                     DrawIcons2(gadScroll2, size, columns, 2*iconCount01)
                     HideGadget(gadScroll1, #False)
                     HideGadget(gadScroll2, #False)
                     RefreshDialog(#Dialog)
                     SetWindowTitle(0, "VectorIcons (" + size + "x" + size + ")")
                  EndIf
                  
                  CompilerIf #PB_Compiler_OS = #PB_OS_Linux
                  Case btnSaveSVG
                     SaveSVG(size, iconCount01, iconCount02)
                  CompilerEndIf
                  
               Case btnSavePNG
                  SavePNG(iconCount01, iconCount02)
                  
               Case btnOverview
                  path$ = SaveOverview(#PB_Compiler_FilePath, "vectoricons1.png", size, columns, 0            , iconCount01)
                  path$ = SaveOverview(path$                , "vectoricons2.png", size, columns, 2*iconCount01, iconCount02)
                  
               Case btnExit
                  Break
            EndSelect
            
         Case #PB_Event_CloseWindow
            Break
      EndSelect
   ForEver
EndProcedure


CompilerIf #PB_Compiler_IsMainFile
   
   BrowseIcons(32)   ; For parameters 'minWidth', 'minHeight', and 'columns',
                     ; the default values are used.
   
   ; If you want to use your own parameters, and don't want to edit this file each
   ; time it is updated, create your own main file say named "myvectoriconbrowser.pb".
   ; The contents of that file could be for instance:
   ;
   ; XIncludeFile "vectoriconbrowser.pb"
   ; BrowseIcons(16, 600, 400, 10)
CompilerEndIf
