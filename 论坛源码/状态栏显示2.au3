#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <GuiListView.au3>
#include <ListViewConstants.au3>
#include <WindowsConstants.au3>
#include <String.au3>
#include <Array.au3>
Opt("GUIOnEventMode", 1)
#Region ### START Koda GUI section ### Form=C:\Users\ilv\Desktop\www.28lu.com\Form1.kxf
$Form1 = GUICreate("Form1", 482, 322, 192, 124)
GUISetOnEvent($GUI_EVENT_CLOSE, "Form1Close")
GUISetOnEvent($GUI_EVENT_PRIMARYDOWN, "Form1PRIMARYDOWN")
;~ $GUI_EVENT_CLOSE ---------- 窗口关闭
;~ $GUI_EVENT_MINIMIZE ------- 窗口最小化
;~ $GUI_EVENT_RESTORE -------- 窗口还原
;~ $GUI_EVENT_MAXIMIZE ------- 窗口最大化
;~ $GUI_EVENT_PRIMARYDOWN ---- 鼠标左键按下
;~ $GUI_EVENT_PRIMARYUP ------ 鼠标左键释放
;~ $GUI_EVENT_SECONDARYDOWN -- 鼠标右键按下
;~ $GUI_EVENT_SECONDARYUP ---- 鼠标右键释放
;~ $GUI_EVENT_MOUSEMOVE ------ 鼠标移动
;~ $GUI_EVENT_RESIZED -------- 调整大小
;~ $GUI_EVENT_DROPPED -------- 拖动操作

$input1 = GUICtrlCreateInput("请输入地址或ID", 22, 16, 369, 21)
GUICtrlSetColor(-1, 0x800080)
GUICtrlSetData($input1, "http://www.28lu.com/yanyi/2242282858_26.html")
;GUICtrlSetOnEvent(-1, "input1Change")
$Button1 = GUICtrlCreateButton("创建", 415, 14, 41, 25)
GUICtrlSetOnEvent(-1, "Button1Click")
$StatusBar1 = _GUICtrlStatusBar_Create($Form1)
;~ _GUICtrlStatusBar_SetSimple($StatusBar1, True);这段代码 放到了后面 解决 不能显示状态栏的问题
;~ _GUICtrlStatusBar_SetText($StatusBar1, "就绪！")
;~ _GUICtrlStatusBar_SetMinHeight($StatusBar1, 17)
;GUICtrlCreateLabel()
GUICtrlSetState(-1, $GUI_FOCUS)
$MenuItem0 = GUICtrlCreateMenu("选项(&Z)")
$MenuItem1 = GUICtrlCreateMenuItem("创建批量任务", $MenuItem0)
GUICtrlSetOnEvent(-1, "MenuItem1Click")
$MenuItem2 = GUICtrlCreateMenuItem("载入进度", $MenuItem0)
GUICtrlSetOnEvent(-1, "MenuItem2Click")
$MenuItem3 = GUICtrlCreateMenuItem("关于", $MenuItem0)
GUICtrlSetOnEvent(-1, "MenuItem3Click")
$ListView1 = GUICtrlCreateListView("", 12, 56, 457, 217, -1, BitOR($WS_EX_CLIENTEDGE, $LVS_EX_GRIDLINES))
_GUICtrlListView_AddColumn($ListView1, "任务id", 70);添加列
_GUICtrlListView_AddColumn($ListView1, "源地址", 280)
_GUICtrlListView_AddColumn($ListView1, "状态", 100)
;~ $a=_GUICtrlListView_AddItem($ListView1,"test");添加项目
;~ _GUICtrlListView_AddSubItem($ListView1,$a,"test",2);添加子项目
GUICtrlSetOnEvent(-1, "ListView1Click")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
Global Const $u = "http://www.28lu.com"

;这段代码 放到了这里 解决 不能显示状态栏的问题
_GUICtrlStatusBar_SetSimple($StatusBar1)
_GUICtrlStatusBar_SetText($StatusBar1, " 就绪！");
_GUICtrlStatusBar_SetMinHeight($StatusBar1, 17)	



While 1
	Sleep(100)
WEnd
Func Button1Click()
	$str = GUICtrlRead($input1)
	If StringInStr($str,$u) = 0 Then
		MsgBox(16, "输入的网页地址无效！", "no")
	Else
		$a = StringRegExp($str,"\d{10,12}",3)
		MsgBox(0,"",$a[0])
		
		
	EndIf

EndFunc   ;==>Button1Click
Func Form1PRIMARYDOWN()
	$Pos = GUIGetCursorInfo($Form1);获取鼠标位置
	If  $Pos[4] = $input1 And GUICtrlRead($input1) = "请输入地址或ID" Then
		GUICtrlSetData($input1, "")
	EndIf

EndFunc   ;==>Form1PRIMARYDOWN
Func Form1Close()

	Exit
EndFunc   ;==>Form1Close
Func ListView1Click()

EndFunc   ;==>ListView1Click
Func MenuItem1Click()

EndFunc   ;==>MenuItem1Click
Func MenuItem2Click()

EndFunc   ;==>MenuItem2Click
Func MenuItem3Click()

EndFunc   ;==>MenuItem3Click


