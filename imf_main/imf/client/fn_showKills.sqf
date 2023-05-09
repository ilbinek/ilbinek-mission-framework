/*
*
*	DOCS MAYBE SOMEDAY
*	
*/

// Exit if alive or mission did not end
if (alive player and !IMF_MISSION_ENDED) exitWith {};

private _text = "";
// Add who killed you
_text = _text + format ["<t color='#FF0000'>Killed by:</t><br/>%1<br/><br/>", IMF_KILLER];

_text = _text + format ["<t color='#00FF00'>Your kills:</t><br/>"];
{
	_text = _text + format ["%1<br/>", _x];
} forEach IMF_KILLS;

[_text, 0, 0, 15, 0, 0, 3222] spawn BIS_fnc_dynamicText;
