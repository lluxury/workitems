#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=..\..\工具\综合软件\3D风格ICO图标\f2.ico
#AutoIt3Wrapper_outfile=数字签名向导 (HiDvrOcx.cab).exe
#AutoIt3Wrapper_UseUpx=n
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
Local $1
ShellExecute ("signcode.exe","",@ScriptDir)
WinWait("数字签名向导","下一步(&N) >")
Sleep(500)
ControlClick("数字签名向导","下一步(&N) >","Button2")
Sleep(500)
ControlClick("数字签名向导","浏览(&R)...","Button1")
IniWrite(@ScriptDir & "\数字签名向导.ini", "设置", "路径", @ScriptDir)
$1 = IniRead(@ScriptDir & "\数字签名向导.ini", "设置", "路径","").
$2 = IniRead(@ScriptDir & "\数字签名向导.ini", "设置", "控件名称","")
BlockInput (1 ) 
Sleep(500)
Send($1)
Send("{enter}")
Sleep(500)
Send($2)
Send("{enter}")
Sleep(500)
BlockInput (0) 

;WinActivate("数字签名向导","下一步(&N) >")
ControlClick("数字签名向导","下一步(&N) >","Button3")


BlockInput (1 ) 
Send("{down}")
BlockInput (0) 
ControlClick("数字签名向导","下一步(&N) >","Button5")
ControlClick("数字签名向导","从文件选择(&F)...","Button3")
$1 = IniRead(@ScriptDir & "\数字签名向导.ini", "设置", "路径","")
Sleep(500)
Send($1)
Send("{enter}")
Sleep(500)
Send("mycredentials.spc")
Send("{enter}")
Sleep(500)
BlockInput (0 )

;WinActivate("数字签名向导","下一步(&N) >")
ControlClick("数字签名向导","下一步(&N) >","Button8")
ControlClick("数字签名向导","浏览(&R)...","Button2")


BlockInput (1 ) 
$1 = IniRead(@ScriptDir & "\数字签名向导.ini", "设置", "路径","")
Sleep(500)
Send($1)
Send("{enter}")
Sleep(500)
Send("myprivatekey.pvk")
Send("{enter}")
Sleep(500)
BlockInput (0) 

ControlClick("数字签名向导","下一步(&N) >","Button11")

WinWait("输入私钥密码","确定")
ControlClick("输入私钥密码","","Edit1")

BlockInput (1 ) 
Send("lorex")
Send("{enter}")
BlockInput (0) 


ControlClick("数字签名向导","下一步(&N) >","Button11")
ControlClick("数字签名向导","下一步(&N) >","Button21")
WinWait("数字签名向导","数字签名向导")
ControlClick("数字签名向导","","Edit1")
BlockInput (1 ) 
Send("web for client")
Send("{enter}")
BlockInput (0) 


WinWait("数字签名向导","将时间戳添加到数据中(&D)")
ControlClick("数字签名向导","将时间戳添加到数据中(&D)","Button1")
ControlClick("数字签名向导","","Edit1")
BlockInput (1 ) 
Send("http://timestamp.verisign.com/scripts/timstamp.dll")
Send("{enter}")
BlockInput (0) 
ControlClick("数字签名向导","完成","Button23")

WinWait("输入私钥密码","确定")
ControlClick("输入私钥密码","","Edit1")

BlockInput (1 ) 
Send("lorex")
Send("{enter}")
BlockInput (0) 
