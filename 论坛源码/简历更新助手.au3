#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=L:\测试脚本\更新助手.exe
#PRE_Outfile=C:\Users\chtyfox\Desktop\简历更新助手.exe
#PRE_Compression=4
#PRE_Res_Fileversion=1.0.0.3
#PRE_Res_Fileversion_AutoIncrement=p
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#region ACN预处理程序参数(常用参数)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#PRE_Run_Tidy=                   				;脚本整理
;#PRE_Run_Obfuscator=      						;代码迷惑
;#PRE_Run_AU3Check= 							;语法检查
;#PRE_Run_Before= 								;运行前
;#PRE_Run_After=								;运行后
;#PRE_UseX64=n									;使用64位解释器
;#PRE_Compile_Both								;进行双平台编译
#endregion ACN预处理程序参数(常用参数)
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
	
	Au3 版本:
	脚本作者:
	电子邮件:
	QQ/TM:
	脚本版本:
	脚本功能:
	
#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

HotKeySet("!1", "xiaozhan") 
HotKeySet("!2", "suoxiao") 
HotKeySet("!3", "ExitScript") 


#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ButtonConstants.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>
#include <array.au3>
#include <IE.au3>

Opt("GUIOnEventMode", 1)
Opt("TrayIconHide", 0)
Opt("TrayMenuMode", 1) ;没有默认的（暂停脚本和退出）菜单.
Opt("trayOnEventMode", 1) ;应用 OnEvent 函数于系统托盘

_IEErrorHandlerRegister()

$oIE = _IECreateEmbedded()
$gx = GUICreate("更新", 640, 580, _
		(@DesktopWidth - 640) / 2, (@DesktopHeight - 580) / 2, _
		$WS_OVERLAPPEDWINDOW + $WS_VISIBLE + $WS_CLIPSIBLINGS + $WS_CLIPCHILDREN)
$GUIActiveX = GUICtrlCreateObj($oIE, 10, 40, 600, 360)

GUISetState(@SW_HIDE,$gx)
;GUISetState() ;显示GUI

_IENavigate($oIE, "http://zh-hr.com")

$username = 'zhqf2001'
$password = 'zhqf19831022'
$Ele = _IEGetObjById($oIE,"loginname")
_IEFormElementSetValue($Ele,$username)
$Ele = _IEGetObjById($oIE,"loginpwd")
_IEFormElementSetValue($Ele,$password)
$Ele = _IETagNameGetCollection($oIE,"SPAN",18)
_IEAction($Ele,"click") ;点击
_IELoadWait($oIE,1000)
Send("{enter}")
;更新
$Ele = _IETagNameGetCollection($oIE,"SPAN",19)
_IEAction($Ele, "click")



_IELoadWait ($oIE)




GUISetOnEvent( $GUI_EVENT_MINIMIZE, "suoxiao")
GUISetOnEvent($GUI_EVENT_CLOSE, "_Exit")

TraySetOnEvent($TRAY_EVENT_PRIMARYDOUBLE,"xiaozhan") ;注册鼠标左键双击事件(只能在 TrayOnEventMode 设置为 1 时才能使用)
$Start = TrayCreateItem("启用") ;创建第一个菜单项
TrayItemSetOnEvent(-1,"qiyong") ;注册第一个菜单项的（被点下）事件  
;TrayItemSetOnEvent = 当系统托盘发生一个特殊事件就执行一个用户自定义函数
TrayCreateItem("") ;创建一个空白的菜单项（即横斜杠分割符） 
;TrayCreateItem = 在系统托盘上面创建一个菜单项目控件
$Quit = TrayCreateItem("退出") ;创建第三个菜单项
TrayItemSetOnEvent(-1,"ExitScript") ;注册第二个菜单项的（被点下）事件


TraySetClick(8)  ;设置鼠标在系统托盘图标里面的点击模式 - 怎样的鼠标点击才会显示系统托盘的菜单  8 = 按下鼠标次要按键(通常右键) 
TraySetState()



While 1
	$msg = GUIGetMsg()
	Select
		Case $msg = $GUI_EVENT_CLOSE
			Exit

	EndSelect
WEnd

Func _Exit()
        
     ; DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $gx, "int", 1000, "long", 0x00090000);渐隐

        Exit
        
 EndFunc
 

 
Func xiaozhan()
   GUISetState(@SW_SHOW, $gx)   ;调整窗口的状态
   GUISetState(@SW_RESTORE, $gx)
 
EndFunc   ;==>启用(双击鼠标)

Func suoxiao()
 GUISetState(@SW_HIDE,$gx)
EndFunc

Func qiyong()
   GUISetState(@SW_SHOW, $gx)    ;调整窗口的状态    
   GUISetState(@SW_RESTORE, $gx)
  
EndFunc  ;==>启用

Func ExitScript()
   Exit  ; $Quit
EndFunc ;==>退出