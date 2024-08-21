/*
	FILE: fn_showGuide.sqf

	Name: IMF_fnc_showGuide

	Author(s):
		ilbinek

	Description:
		Adds a map tab to the player's map and shows the guide

	Parameters:
		Nothing

	Returns:
		Nothing

	Examples:
		> call IMF_fnc_showGuide;

	Public:
		Yes
*/

player createDiarySubject ["TBDGuide", "TBD Guide"];

player createDiaryRecord ["TBDGuide", ["Fix uniform bug", 
"<br/>If you got the uniform bug, press Home and then press Fix uniform bug. The bug should get fixed once the progress bar fills up.
"]];

player createDiaryRecord ["TBDGuide", ["Display kills / killer", 
"<br/>Once you have perished you can press the End button to display the name of your killer, and the names of people you maybe killed.
"]];

player createDiaryRecord ["TBDGuide", ["Kill feed toggling", 
"<br/>If you want to toggle the kill feed on or off head over to Configure -> Control -> Configure addons -> IMF.
<br/><br/>Kill feed only works in the spectator.
"]];

player createDiaryRecord ["TBDGuide", ["Game muting", 
"<br/>In order to set up a keybind that would allow you to reduce the overall volume of the game (not TFAR) by a set amount head to:
<br/><br/>1. Configure -> Addon options -> ACE Volume
<br/>If you do not have the <t font='RobotoCondensedBold'>Enabled</t> option ticked, tick it.
<br/>Set up the desired percentage of sound reduction in the Reduction option.
<br/><br/>2. Configure -> Controls -> Configure addons -> ACE common
<br/>Look for the Toggle volume option. Here you can select which button you would like to bind the muting to
"]];

player createDiaryRecord ["TBDGuide", ["How to contact the admin", 
"<br/>If you need to contact the admin for whatever reason, press Home and then press Contact admin. Type your message into the message box below and send it. The admin will see it, and based on the amount of stuff he has to deal with at the given moment will get back to you at some point in the future. 
<br/><br/>Please refrain from pressing the Ping Zeus button as it will have no effect. 
<br/><br/>Only use teamspeak / discord to contact the admin in cases of utmost emergency (such as when you can´t contact him via the in-game tool).
"]];

player createDiaryRecord ["TBDGuide", ["View distance presets", 
"<br/>TBD allows you to set up custom view distance presets, in order to maximize your FPS in certain situations.
<br/>
<br/>Start by pressing the Home button, then clicking Options.
<br/>On the following screen you can set up the draw distance of objects and terrain. There are three presets available.
<br/>The more filled the preset bar is, the further the draw distance of objects. If the bar is full, the draw distance will be at maximum and if the bar is empty, then it will be at minimum.
<br/>You should probably have one preset with maximum draw distance for when you need to spot stuff in the distance, and one preset with minimum or close to minimum draw distance for CQB scenarios, where you do not need to see very far.
<br/>
<br/>You can cycle through the presets by pressing F1, F2 and F3 (Default keybinds. You can change them via Configure -> Controls -> Configure addons -> IMF)
<br/>F1: First preset
<br/>F2: Second preset 
<br/>F3: Third preset 
"]];
player createDiaryRecord ["TBDGuide", ["–––––––––––––––––––",  ""]];
player createDiaryRecord ["TBDGuide", ["TBD Guide", 
"<br/>The following paragraphs will explain how do certain framework features work. It is recommended you read them, especially if you are new."]];

player createDiaryRecord ["TBDGuide", ["–––––––––––––––––––",  ""]];
player createDiaryRecord ["TBDGuide", ["–––––––––––––––––––",  ""]];