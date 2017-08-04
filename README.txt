  ______  __    __       ___   .___________.   .___________.  ______     ______    __      
 /      ||  |  |  |     /   \  |           |   |           | /  __  \   /  __  \  |  |     
|  ,----'|  |__|  |    /  ^  \ `---|  |----`   `---|  |----`|  |  |  | |  |  |  | |  |     
|  |     |   __   |   /  /_\  \    |  |            |  |     |  |  |  | |  |  |  | |  |     
|  `----.|  |  |  |  /  _____  \   |  |            |  |     |  `--'  | |  `--'  | |  `----.
 \______||__|  |__| /__/     \__\  |__|            |__|      \______/   \______/  |_______|
                                                                                           
===========================================================================================

Welcome to the super rad chat tool I made because I was bored at home.

First, a tour of the features: 
	1. Customizable buttons and responses in an easy to read format
	2. Responses are sent straight to Kana, not copied and pasted
	3. Set a window to be always on top - the selected window will stay on top of every 
	   other window and never go to the background
	4. Written by a super cool dude who loves to show off

Speaking of, source code for this bad boy is available here: 
https://github.com/CBromwich/Chat-Tool. Also, you can click "Help" and "About" to get a 
hyperlink

Next, some instructions:

	The Macro Buttons:
		The text displayed on the buttons (the labels) and the text sent when pressing the
		button are defined in text.ini in the tool's folder (Probably on your H: drive 
		somewhere, I don't know you.) If you don't want to go and find it because you're 
		lazy like me, you can use the "Set Responses" button on the "Tools" tab to open the
		file automagically.

		The format is fairly straightforward:
			Label<#>=<Button Label> - This sets what text the button has on it. Try to keep
						  it short
			Button<#>=<some text>   - This sets what will be sent to kana when you press the
						  button. You can theoretically put as much as you want 
						  here, but it has to all be on one line, do not break
						  the text up into multiple lines (sorry, this is a 
						  limitation of .ini files)
			An example:
				Label1=Greeting
				Button1=Hello, how can I help you today?

				This will make the first (top left) button's label say "Greeting", and when 
				you press the "Greeting" button, it will send "Hello, how can I help you today?" 
				to kana.

			NOTE: The enter key is not sent, this just puts the text in the box. You have to actually 
			      press the button.
			NOTE #2: Be sure to save the file

	Always On Top (AOT):
		This feature makes it so that any window chosen from the list will display over top of all other
		windows no matter what. The window can still be minimized, but clicking into other windows will 
		not cause the AOT window to be put behind the clicked window.

		To use this feature, select your desired window from the list and click "Set". If you open another
		window while the tool is running, hit "Reload" to reload the tool and add any new windows to the
		list.

		When "Set" is pressed, the current AOT window (if any) goes back to normal. Only one window can be
		AOT at a time. (Potential plans to add multi-window AOT support in the future)

		To reset any and all windows to normal, press "Reset".

	Reload:
		Press this button to reload the tool. Useful for refreshing current open windows for AOT as
		mentioned above, or to update macro buttons if edited while the tool is running.

	Set Responses:
		Opens the text.ini file, allowing changes to button labels and responses. Press "Reload" when
		you're done to update buttons in the tool. Be sure to save before closing.

		If the format of the .ini file is changed incorrectly, the button label and response text will 
		default to nothing (blank)




That's it. Doesn't seem like a lot now that I've typed it out. I pinky promise it was pretty hard regardless.

If you're savvy, feel free to modify this for you personal use. It doesn't have any company-protected
info, but please don't distribute this outside of Spectrum.