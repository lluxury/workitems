#Region ACN预处理程序参数(常用参数)
#PRE_Icon= 										;图标,支持EXE,DLL,ICO
#PRE_OutFile=									;输出文件名
#PRE_OutFile_Type=exe							;文件类型
#PRE_Compression=4								;压缩等级
#PRE_UseUpx=y 									;使用压缩
#PRE_Res_Comment= 								;程序注释
#PRE_Res_Description=							;详细信息
#PRE_Res_Fileversion=							;文件版本
#PRE_Res_FileVersion_AutoIncrement=p			;自动更新版本
#PRE_Res_LegalCopyright= 						;版权
#PRE_Change2CUI=N                   			;修改输出的程序为CUI(控制台程序)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#PRE_Run_Tidy=                   				;脚本整理
;#PRE_Run_Obfuscator=      						;代码迷惑
;#PRE_Run_AU3Check= 							;语法检查
;#PRE_Run_Before= 								;运行前
;#PRE_Run_After=								;运行后
;#PRE_UseX64=n									;使用64位解释器
;#PRE_Compile_Both								;进行双平台编译
#EndRegion ACN预处理程序参数(常用参数)
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
#include <WindowsConstants.au3>
#include <Array.au3>
#include <GuiStatusBar.au3>
#Region ### START Koda GUI section ### Form=
Local $str, $n
$path =@ScriptDir & "\网页源码.txt"

$Ra1_1 = "\s"
$Ra1_2 = "\S"
$Ra1_3 = "\t"
$Ra1_4 = "\n"
$Ra1_5 = "\r"
$Ra1_6 = "\f"
$Form1_1 = GUICreate("正则", 560, 503, 192, 124)
$Edit1 = GUICtrlCreateEdit("", 40, 16, 513, 200,$WS_VSCROLL)
GUICtrlSetData(-1, bb($path))
$Edit2 = GUICtrlCreateEdit("", 40, 256, 505, 177,$WS_VSCROLL)
$Radio1 = GUICtrlCreateRadio("\s", 48, 232, 73, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$Radio2 = GUICtrlCreateRadio("\S", 136, 232, 73, 17)
$Radio3 = GUICtrlCreateRadio("\t", 224, 232, 73, 17);在文档里面要按tab键才可以看结果
$Radio4 = GUICtrlCreateRadio("\n", 312, 232, 73, 17)
$Radio5 = GUICtrlCreateRadio("\r", 392, 232, 73, 17);在文档里面要按回车键才可以看结果
$Radio6 = GUICtrlCreateRadio("\f", 472, 232, 73, 17);
$Button1 = GUICtrlCreateButton("正则", 160, 440, 273, 33)
$StatusBar1 = _GUICtrlStatusBar_Create($Form1_1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

_GUICtrlStatusBar_SetSimple($StatusBar1)
_GUICtrlStatusBar_SetText($StatusBar1, "就绪！");
_GUICtrlStatusBar_SetMinHeight($StatusBar1, 17)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			zz($str, $n)
			GUICtrlSetData($Edit2,$str)
			_GUICtrlStatusBar_SetText($StatusBar1, " 总共" &  $n & "字符")
	EndSwitch
WEnd


Func ra()
	If GUICtrlRead($Radio1) = $GUI_CHECKED Then $str4 = $Ra1_1
	If GUICtrlRead($Radio2) = $GUI_CHECKED Then $str4 = $Ra1_2
	If GUICtrlRead($Radio3) = $GUI_CHECKED Then $str4 = $Ra1_3
	If GUICtrlRead($Radio4) = $GUI_CHECKED Then $str4 = $Ra1_4
	If GUICtrlRead($Radio5) = $GUI_CHECKED Then $str4 = $Ra1_5
	If GUICtrlRead($Radio6) = $GUI_CHECKED Then $str4 = $Ra1_6
	Return $str4
EndFunc

Func zz(ByRef $str, ByRef $n)
	$str=""
	Local $str1 = bb ($path), $str2 = ra()
			If StringRegExp($str1, $str2) Then;加个判断 防止不匹配时直接退出
				$h = StringRegExp($str1, $str2, 3);第三个参数选择3 是全局匹配  返回的是数组
			Else
				MsgBox(0, "", "不匹配")
			EndIf
				For $n=0 To UBound($h)-1
			$str &=$h[$n]; & @CRLF 
	    Next
		Return $str	
			
EndFunc			

Func bb($iDIR)
	$sFile = FileOpen($iDIR,0)
	$bFileStrings = FileRead($sFile)
	Return $bFileStrings
	FileClose($sFile)
EndFunc	