#Include Command Center.ahk

Gui, Tab, Tools
Gui, Add, GroupBox, W420 H45 Section +xs-1, Change Button Labels and Responses
Gui, Add, Button, vSettings gOpenSettings +xs+5 +ys+15, Set Responses

/*
Opens the text.ini file in Notepad for easy editing
*/
OpenSettings() {
	Global file_path
	Run notepad %file_path%text.ini
}