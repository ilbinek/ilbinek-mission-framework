/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// Player connected event handler
addMissionEventHandler ["PlayerConnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	// Log that player connected
	private _text = format ["[IMF] - Player connected: %1 - %2 - JIP: %3", _name, _uid, if (_jip) then {"Yes"} else {"No"}];
	diag_log _text;
}];

// Player disconnected event handler
addMissionEventHandler ["PlayerDisconnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	private _text = format ["[IMF] - Player disconnected: %1 - %2 - JIP: %3", _name, _uid, if (_jip) then {"Yes"} else {"No"}];
	diag_log _text;
}];
