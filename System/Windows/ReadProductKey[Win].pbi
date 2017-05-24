;   Description: Returns the product key from the running windows operating system
;        Author: ts-soft
;          Date: 2010-12-04
;            OS: Windows
; English-Forum: 
;  French-Forum: 
;  German-Forum: http://www.purebasic.fr/german/viewtopic.php?f=8&t=23505
; -----------------------------------------------------------------------------

CompilerIf #PB_Compiler_OS <> #PB_OS_Windows
  CompilerError "Supported OS are only: Windows"
CompilerEndIf

; Original Code in XProfan by frank abbing
; http://www.paules-pc-forum.de/forum/dlls-includes-units-prozeduren/134802-windows-product-key-auslesen.html

; rewritten to work with purebasic by ts-soft

; Plattform: windows only
; Supports 32 and 64 bit OS
; Supports Ascii and Unicode
; Requires PureBasic 4.40 and higher

EnableExplicit

#KEY_WOW64_64KEY = $100

Procedure.s GetWindowsProductKey()
  Protected hKey, Res, size = 280
  Protected i, j, x, Result.s
  Protected *mem = AllocateMemory(size)
  Protected *newmem = AllocateMemory(size)
  Protected *digits = AllocateMemory(25)

  PokeS(*digits, "BCDFGHJKMPQRTVWXY2346789", -1, #PB_Ascii)
  If OSVersion() <= #PB_OS_Windows_2000
    Res = RegOpenKeyEx_(#HKEY_LOCAL_MACHINE, "Software\Microsoft\Windows NT\CurrentVersion", 0, #KEY_READ, @hKey)
  Else
    Res = RegOpenKeyEx_(#HKEY_LOCAL_MACHINE, "Software\Microsoft\Windows NT\CurrentVersion", 0, #KEY_READ | #KEY_WOW64_64KEY, @hKey)
  EndIf
  If Res = #ERROR_SUCCESS
    RegQueryValueEx_(hKey, "DigitalProductID", 0, 0, *mem, @size)
    RegCloseKey_(hKey)
    If size <> 280
      For i = 24 To 0 Step -1
        x = 0
        For j = 66 To 52 Step -1
          x = (x << 8) + PeekA(*mem + j)
          PokeA(*mem + j, x / 24)
          x % 24
        Next
        PokeA(*newmem + i, PeekA(*digits + x))
      Next
      For i = 0 To 15 Step 5
        Result + PeekS(*newmem + i, 5, #PB_Ascii) + "-"
      Next
      Result + PeekS(*newmem + 20, 5, #PB_Ascii)
    EndIf
  EndIf
  FreeMemory(*mem) : FreeMemory(*newmem) : FreeMemory(*digits)
  ProcedureReturn Result
EndProcedure

;-Example
CompilerIf #PB_Compiler_IsMainFile
  
  Debug GetWindowsProductKey()
  
CompilerEndIf
