#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=N:\工具\QQ\3D风格ICO图标\photoshopB.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\tutkp2p检测工具.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Comment=tutkp2p
#PRE_Res_Description=tutkp2p
#PRE_Res_Fileversion=2.0.0.4
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_LegalCopyright=tutkp2p
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#Region ACN预处理程序参数(常用参数)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#PRE_Run_Tidy=                   				;脚本整理
;#PRE_Run_Obfuscator=      						;代码迷惑
;#PRE_Run_AU3Check= 							;语法检查
;#PRE_Run_Before= 								;运行前
;#PRE_Run_After=								;运行后
;#PRE_UseX64=n									;使用64位解释器
;#PRE_Compile_Both								;进行双平台编译
#EndRegion ACN预处理程序参数设置完成
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

 Au3 版本: 
 脚本作者: 
 电子邮件: 
	QQ/TM: 
 脚本版本: 
 脚本功能: 

#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
Opt("TrayMenuMode", 1)
Opt("TrayOnEventMode", 1)
#Region ### START Koda GUI section ### Form=
$Form1_1 = GUICreate("TUTK UID检测状态", 467, 318, 192, 145)
$Input1 = GUICtrlCreateInput("", 8, 40, 449, 21)
$UID = GUICtrlCreateLabel("请输入UID", 8, 8, 60, 17)
$Button1 = GUICtrlCreateButton("显示UID状态", 328, 280, 129, 30,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$Group1 = GUICtrlCreateGroup("显示", 8, 80, 449, 193)
$Label1 = GUICtrlCreateLabel("", 16, 96, 436, 172)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
Local $HQ ,$BQ = "请等待，获取TUTK UID状态中..........." 

$Quit = TrayCreateItem("退出") ;创建第三个菜单项
TrayItemSetOnEvent(-1,"_Exit")
TraySetClick(8)  ;设置鼠标在系统托盘图标里面的点击模式 - 怎样的鼠标点击才会显示系统托盘的菜单  8 = 按下鼠标次要按键(通常右键) 
TraySetState()

While 1
	$msg = GUIGetMsg()
  Select 
	Case $msg =  $GUI_EVENT_CLOSE
			tc()
			_Exit()
		Case $msg = $Button1
			GUICtrlSetData ($Label1, $BQ)
			RunWait(@ComSpec & ' /c ' & @ScriptDir & '\tutkp2p.exe ' & GUICtrlRead($Input1) & ">" & @ScriptDir & '"\tutkp2p.txt"', '', @SW_HIDE)
			line()
			wj()
	EndSelect
WEnd


Func tutkp2p()
$HQ0 = IniRead(@ScriptDir & "\tutkp2p.ini", "字符", "获取1", "")
$HQ1 = IniRead(@ScriptDir & "\tutkp2p.ini", "字符", "获取2", "")
$HQ2 = IniRead(@ScriptDir & "\tutkp2p.ini", "字符", "获取3", "")
$HQ3 = IniRead(@ScriptDir & "\tutkp2p.ini", "字符", "获取4", "")
$HQ4 = IniRead(@ScriptDir & "\tutkp2p.ini", "字符", "获取5", "")
$HQ5 = IniRead(@ScriptDir & "\tutkp2p.ini", "字符", "获取6", "")
$HQ6 = IniRead(@ScriptDir & "\tutkp2p.ini", "字符", "获取7", "")
$HQ7 = IniRead(@ScriptDir & "\tutkp2p.ini", "字符", "获取8", "")
$HQ8 = IniRead(@ScriptDir & "\tutkp2p.ini", "字符", "获取9", "")

$HQ = $HQ0 & @CR & $HQ1 & @CR & $HQ2 & @CR & $HQ3 & @CR & $HQ4 & @CR & $HQ5 & @CR & $HQ6 & @CR & $HQ7 & @CR & $HQ8
EndFunc

Func line()
Local $file = FileOpen(@ScriptDir &"\tutkp2p.txt", 0)
Local $j = 1
Local $i = 1
Do
if $j<=10 Then
    Local $line = FileReadLine($file,$j)
	IniWrite(@ScriptDir & "\tutkp2p.ini", "字符", "获取" & $i ,$line)
	$j = $j + 1 
EndIf
   $i = $i + 1
Until $i = 10
FileClose($file)
FileDelete(@ScriptDir & "\tutkp2p.txt")
EndFunc

Func tc()
	ProcessClose ("cmd.exe")
	ProcessClose ("tutkp2p.exe")
EndFunc	

Func wj()
	If FileExists("tutkp2p.ini") Then
		tc()
		tutkp2p()
		GUICtrlSetData ($Label1, $HQ)
		FileDelete(@ScriptDir & "\tutkp2p.ini")
	Else
		MsgBox(1,"TUTK UID检测状态","获取TUTK UID检测状态不成功" & @CRLF & "请重新点击获取TUTK UID状态按钮")
EndIf
EndFunc


Func _Exit()
        Exit
EndFunc

