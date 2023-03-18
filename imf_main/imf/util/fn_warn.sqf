/*
*
*	DOCS MAYBE SOMEDAY
*
*/

params ["_name"];
if (_name == name player) then {
	titleText ["<t color='#ff0000' size='5'>YOU ARE LONEWOLFING! RETURN TO THE REST OF YOUR SQUAD</t><br/>", "PLAIN", 1, true, true];
};
