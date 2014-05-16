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
#EndRegion ACN预处理程序参数设置完成
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

 Au3 版本: 
 脚本作者: 
 电子邮件: 
	QQ/TM: 
 脚本版本: 
 脚本功能: 

#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

_CreateUrlShortcut(@ScriptDir & "\AutoIt中文论坛.url", "http://www.autoitx.com/", 'C:\Icon.ico');创建后的位置，网址，网站图标下载后路径


Func _CreateUrlShortcut($_Name, $_Url, $_IcoPass)
        Local $aData[2][2]
        $aData[0][0] = 'IconFile'
        $aData[0][1] = $_IcoPass
        $aData[1][0] = 'IconIndex'
        $aData[1][1] = '0'
        
        Local $objShell = ObjCreate("WScript.Shell")

        If FileExists($_Name) Then FileDelete($_Name)
        Local $objShortCut = $objShell.CreateShortcut($_Name)

        $objShortCut.TargetPath = $_Url
        InetGet($_Url & '/favicon.ico', $_IcoPass)
        IniWriteSection($_Name, 'InternetShortcut', $aData, 0)
        $objShortCut.Save()
        
	If @OSVersion = "WIN_XP" Then
			Local $size = DllCall("User32.dll", "int", "GetSystemMetrics", "int", 11)
			RegWrite("HKCU\Control Panel\Desktop\WindowMetrics", "Shell Icon Size", "REG_SZ", $size[0] - 1)
			DllCall("user32.dll", "Int", "SendMessage", "hwnd", 0xFFFF, "int", 0x001A, "int", 0, "int", 0)
			RegWrite("HKCU\Control Panel\Desktop\WindowMetrics", "Shell Icon Size", "REG_SZ", $size[0])
			DllCall("user32.dll", "Int", "SendMessage", "hwnd", 0xFFFF, "int", 0x001A, "int", 0, "int", 0)
	Else
        ; 刷新(Win7有效,XP无效)
        DllCall("shell32.dll", "ptr", "SHChangeNotify", "long", 0x8000000, "int", 0, "ptr", 0, "ptr", 0)
	EndIf	
EndFunc   ;==>_CreateUrlShortcut



;~ Func RefreshIcon()
;~         Local $size = DllCall("User32.dll", "int", "GetSystemMetrics", "int", 11)
;~         RegWrite("HKCU\Control Panel\Desktop\WindowMetrics", "Shell Icon Size", "REG_SZ", $size[0] - 1)
;~         DllCall("user32.dll", "Int", "SendMessage", "hwnd", 0xFFFF, "int", 0x001A, "int", 0, "int", 0)
;~         RegWrite("HKCU\Control Panel\Desktop\WindowMetrics", "Shell Icon Size", "REG_SZ", $size[0])
;~         DllCall("user32.dll", "Int", "SendMessage", "hwnd", 0xFFFF, "int", 0x001A, "int", 0, "int", 0)
;~ EndFunc


;下面代码不能修改
;~ $a = "http://www.baidu.com/" ;最后面必须加个"/"
;~ $b = "百度首页"
;~ _UrlLink($a,$b)

;~ Func _UrlLink($UrlLink,$UrlName)
;~ DirCreate(@ScriptDir & "\ico")
;~ InetGet($UrlLink&"favicon.ico", @ScriptDir & "\ico\" & $UrlName & ".ico", 1)
;~ $file = FileOpen($UrlName & ".url", 1)
;~ FileWriteLine($file, "[DEFAULT]")
;~ FileWriteLine($file, "BASEURL=" & $UrlLink)
;~ FileWriteLine($file, "[InternetShortcut]")
;~ FileWriteLine($file, "URL=" & $UrlLink)
;~ FileWriteLine($file, "IconFile=" & @ScriptDir & "\ico\" & $UrlName & ".ico")
;~ FileWriteLine($file, "IconIndex=0")
;~ FileClose($file)
;~ EndFunc
