tools_dict := {Kana: "kana.mybrighthouse.com", Compass: "compass.mybrighthouse.com", Nyroc: "rdctools.bhn.net", unified: "unified.bhn.net", OMSe: "http://omse.bhn.net:7080/cwf", Sharepoint: "http://bhngateway.corp.local/markets/cfdiv/HSD/TCCA/default.aspx", CRM: "crm.bhn.net", ATIM: "http://atim.brighthouse.com/Default.aspx"}
articles_dict := {SalesIndex: "http://compass.mybrighthouse.com/content/billing/bhn-to-charter/spp-sales-offer-index/", Bundles: "http://compass.mybrighthouse.com/content/billing/bhn-to-charter/spectrum-bundles/", TVCodes: "http://compass.mybrighthouse.com/content/billing/codes/icoms-cable-service-codes/#parentHorizontalTab3", InternetCodes: "http://compass.mybrighthouse.com/content/billing/codes/icoms-hsi-service-codes/#parentHorizontalTab3", PhoneCodes: "http://compass.mybrighthouse.com/content/phone/phone-codes/icoms-home-phone-monthly-charge-codes/#parentHorizontalTab3"}

Gui, Tab, Tools
Gui, Add, Text, vTools Section +xs+4, Tools
Gui, Add, Button, W64 H30 vKana gOpenTool, Kana
Gui, Add, Button, W64 H30 vCompass gOpenTool y+-1, Compass
Gui, Add, Button, W64 H30 vNyroc gOpenTool y+-1, Nyroc
Gui, Add, Button, W64 H30 vUnified gOpenTool y+-1, Unified
Gui, Add, Button, W64 H30 vOMSe gOpenTool y+-1, OMSe
Gui, Add, Button, W64 H30 vSharepoint gOpenTool y+-1, Sharepoint
Gui, Add, Button, W64 H30 vCRM gOpenTool y+-1, CRM
Gui, Add, Button, W64 H30 vATIM gOpenTool y+-1, ATIM
Gui, Add, Text, vArticles Section +ys x+25, Articles
Gui, Add, Button, W64 H48 vSalesIndex gOpenArticle, Sales Index
Gui, Add, Button, W64 H47 vBundles gOpenArticle y+-1, SPP Bundles
Gui, Add, Button, W64 H47 vTVCodes gOpenArticle y+-1, TV Codes
Gui, Add, Button, W64 H47 vInternetCodes gOpenArticle y+-1, Internet Codes
Gui, Add, Button, W64 H48 vPhoneCodes gOpenArticle y+-1, Phone Codes
Gui, Add, GroupBox, H251 W238 +ys x+25 Section, Phone Numbers and Links
Gui, Add, Edit, w200 -E0x200 +Readonly +xs+5 +ys+15, Customer Service: 1-855-222-0102
Gui, Add, Edit, w200 -E0x200 +Readonly, Sales: 1-888-289-8988
Gui, Add, Edit, w200 -E0x200 +Readonly, Business: 1-877-824-6249
Gui, Add, Edit, w200 -E0x200 +Readonly, Security Code: 1-877-315-8519
Gui, Add, Link,, <a href="http://apps.brighthouse.com/agent-channel-lineups/">Internal Channel Lineups</a>
Gui, Add, Link,, <a href="https://www.spectrum.com/browse/content/new-channel-lineup">External Channel Lineups (Spectrum)</a>
Gui, Add, Link,, <a href="http://apps.brighthouse.com/channel-lineups/ ">External Channel Lineups (L-BHN)</a>
Gui, Add, Button, vOpenTeamChat gOpenTeamChat y+15, Open Team Chat

OpenTool() {
	Global tools_dict
	url := tools_dict[A_GuiControl]
	if A_GuiControl = Kana
	Run, Iexplore.exe %url%
	else
	Run, chrome.exe %url%
}

OpenArticle() {
	Global articles_dict
	url := articles_dict[A_GuiControl]
	Run, chrome.exe %url%
}

OpenTeamChat() {
	ComObjError(False)

	ie := ComObjCreate("InternetExplorer.Application")
	ie.Visible := False
	ie.Navigate("redacted")
	Sleep 2000
	ie.Quit
}