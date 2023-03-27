/*
*
*	DOCS MAYBE SOMEDAY
*
*/

params ["_winner", "_time", "_reason"];

private _toShow = "";

_side = player getVariable ["IMF_local_side", side player];
 
if (_side == _winner) then { 
 // Won 
	_toShow = ["<t size='2' color='#7fff00' shadow=2>", "WINNER", "<br />", _reason, "</t>"] joinString ""; 
} else { 
 // Lost 
	_toShow = ["<t size='2' color='#FF0000' shadow=2>", "DEFEAT", "<br />", _reason, "</t>"] joinString ""; 
}; 
 
[_toShow, 0, 0, 15, 0, 0, 3222] spawn BIS_fnc_dynamicText;
