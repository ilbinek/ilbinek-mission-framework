/*
*
*	DOCS MAYBE SOMEDAY
*
*/

params ["_name"];
if (_name == name player) then {
	titleText ["<t color='#ff0000' size='5'>Admin does not like something you do, think about it and stop it!</t><br/>", "PLAIN", 1, true, true];
};
