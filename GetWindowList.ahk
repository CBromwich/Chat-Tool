#Include Command Center.ahk

SetTitleMatchMode, 2

WinList := Object()
CurrentTopWindow  := ""

Gui, Tab, Tools
Gui, Add, GroupBox, W420 H70 Section, Keep Window On Top
Gui, Add, DropDownList, W410 +xs+5 +ys+15 vWindowList
Gui, Add, Button, vWindowButton gSetWinActive Section, Set
Gui, Add, Button, vResetButton gResetWindows +ys, Reset
Gui, Add, GroupBox, W420 H45 Section +xs-5, Reload Program
Gui, Add, Button, vRefreshButton gRefresh +xs+5 +ys+15, Reload

/*
Cycles through current open windows and adds their title to WinList
*/
GetActiveWindows() {
	Global WinList
	WinGet, windows, List
	Loop, %windows% {
		this_id := windows%A_Index%
		WinGetTitle, this_title, ahk_id %this_id%
		if StrLen(this_title) > 0 {
			if (this_title != "Start") {
				WinList.Insert(this_title)
			}
		}
	}
}


/*
Add windows to drop down list
*/
setDDLItems() {
	Global WinList
	for e, element in WinList {
		GuiControl,, WindowList, %element%
	}
}

Refresh() {
	Reload
}


/*
Get currently selected drop down list item, returns string <name of window>
*/
GetWindowName() {
	GuiControlGet, windowName,, WindowList
	Return windowName
}

/*
Set currently selected window as always on top, and disable always on top for current top window
*/
SetWinActive() {
	Global CurrentTopWindow
	new_window := GetWindowName()
	if (CurrentTopWindow != "") {
		WinSet, AlwaysOnTop, Off, % CurrentTopWindow
	}
	WinSet, AlwaysOnTop, On, % new_window
	CurrentTopWindow := new_window
}


/*
Disabe always on top for all windows
*/
ResetWindows() {
	Global WinList
	for e, element in WinList {
		WinSet, AlwaysOnTop, Off, % element
	}
}

main() {
	getActiveWindows()
	setDDLItems()
}

main()
