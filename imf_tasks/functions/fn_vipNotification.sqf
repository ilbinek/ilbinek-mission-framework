params ["_name"];

private _text = format ["%1 destroyed", _name];
["TaskUpdated", ["", _text]] call BIS_fnc_showNotification;
