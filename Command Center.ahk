#SingleInstance, Force
#NoTrayIcon
SetKeyDelay, 10 10

;Have to create tabs before importing otherwise the tabs that are referenced in the other files don't exist yet
Gui, Add, Tab3, Section, Comments 1|Comments 2|Tools 

#Include GetWindowList.ahk
#Include OpenSettings.ahk

;=== Page 1, Column 1 ===
Gui, Tab, Comments 1
Gui, Add, Button, W205 H100 vButton1 gPressButton Section, % LabelButtons("Label1")
Gui, Add, Button, W205 H100 vButton2 gPressButton, % LabelButtons("Label2")
Gui, Add, Button, W205 H100 vButton3 gPressButton, % LabelButtons("Label3")
Gui, Add, Button, W205 H100 vButton4 gPressButton, % LabelButtons("Label4")

;=== Page 1, Column 2 ===
Gui, Add, Button, W205 H100 vButton5 gPressButton ys, % LabelButtons("Label5")
Gui, Add, Button, W205 H100 vButton6 gPressButton, % LabelButtons("Label6")
Gui, Add, Button, W205 H100 vButton7 gPressButton, % LabelButtons("Label7")
Gui, Add, Button, W205 H100 vButton8 gPressButton, % LabelButtons("Label8")

;=== Page 2, Column 1 ===
Gui, Tab, Comments 2
Gui, Add, Button, W205 H100 vButton9 gPressButton Section, % LabelButtons("Label9")
Gui, Add, Button, W205 H100 vbutton10 gPressButton, % LabelButtons("Label10")
Gui, Add, Button, W205 H100 vButton11 gPressButton, % LabelButtons("Label11")
Gui, Add, Button, W205 H100 vButton12 gPressButton, % LabelButtons("Label12")

;=== Page 2, Column 2 ===
Gui, Add, Button, W205 H100 vButton13 gPressButton ys, % LabelButtons("Label13")
Gui, Add, Button, W205 H100 vButton14 gPressButton, % LabelButtons("Label14")
Gui, Add, Button, W205 H100 vButton15 gPressButton, % LabelButtons("Label15")
Gui, Add, Button, W205 H100 vButton16 gPressButton, % LabelButtons("Label16")

;=== Menu Bar ===
Menu, HelpMenu, Add, About, AboutPage
Menu, HelpMenu, Add, Help, HelpPage
Menu, MenuBar, Add, Help, :HelpMenu
Gui, Menu, MenuBar

Gui, Show,, Command Center

/*
Get text associated with pressed button from text.ini and send it
If no text is found or there is any other error, it sends nothing
*/
PressButton() {
	IniRead button_text, text.ini, Responses, %A_GuiControl%, %A_SPACE%
	SendToKana(button_text)
}

/*
Function to dynamically label all buttons based on text.ini "Label" fields
The label defaults to nothing if there is an error reading the label
*/
LabelButtons(ButtonLabel) {
	IniRead _label, text.ini, Responses, %ButtonLabel%, %A_SPACE%
	return _label
}

/*
Popup window with information about the tool
*/
AboutPage() {
	Gui, Help: New
	Gui, Help:Add, Text,, Developed by: Cody Bromwich
	Gui, Help:Add, Text, Section, Source code available here:
	Gui, Help:Add, Link,, <a href="https://github.com/CBromwich/Chat-Tool">https://github.com/CBromwich/Chat-Tool</a>
	Gui, Help:Show,, About
}

/*
Opens the Readme in notepad
*/
HelpPage() {
	Run, notepad README.txt
}

/*
Kana Magic courtesy if Christian Belland and Jeremy Lyon. I don't fully understand what this does, but it does work, so...
*/
SendToKana(txt) {
		IfWinExist, KANA - Agent
		{
		WinActivate, KANA - Agent
		WinGetPos,,,x1,y1, KANA - Agent
		x1 := 40
		y1 := y1-280
		ControlClick, x%x1% y%y1%, KANA - Agent, ,left, 2, , , ,
		SendInput % txt
	}
}
Return ; So GuiClose doesn't screw everything up

GuiClose:
	ExitApp