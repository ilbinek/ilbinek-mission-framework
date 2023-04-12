/*
*
*	DOCS MAYBE SOMEDAY
*
*/

params ["_winner", "_time", "_reason"];

private _toShow = "";

if (side player == _winner) then {
	// Won
	private _toShow = ["<t size='2' color='#7fff00' shadow=2>", "WINNER", "</t> <br/>", _reason] joinString "";
	[_t, 0, 0, 15, 0, 0, 3222] remoteExec ["BIS_fnc_dynamicText", 0];
} else {
	private _toShow = ["<t size='2' color='#3232a8' shadow=2>", "DEFEAT", "</t> <br/>", _reason] joinString "";
	[_t, 0, 0, 15, 0, 0, 3222] remoteExec ["BIS_fnc_dynamicText", 0];
};

[_t, 0, 0, 15, 0, 0, 3222] call "BIS_fnc_dynamicText";
