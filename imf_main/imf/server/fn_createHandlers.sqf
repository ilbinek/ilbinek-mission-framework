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

// Make sure people in vehicles that blow up die
addMissionEventHandler ["EntityKilled", {
    params ["_vehicle", "_killer", "_instigator", "_useEffects"];

    // Taken from ACE - medical_engine - XEH_postInit.sqf
    // Check if destruction effects are enabled
    if (!_useEffects || {(getText (configOf _vehicle >> "destrType")) == ""}) exitWith {};

    // Check if 'vehicle' is an actual vehicle (look for a driver position)
    if ((fullCrew [_vehicle, "driver", true]) isEqualTo []) exitWith {};

    // Don't kill UAV crews
    if (unitIsUAV _vehicle) exitWith {};

    // Don't kill units in parachutes
    if (_vehicle isKindOf "ParachuteBase") exitWith {};

    {
        ["ace_medical_woundReceived", [_x, ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"] apply {[(random [0.5, 0.75, 1]) * 10, _x, 0]}, _instigator, "explosive"], _x] call CBA_fnc_targetEvent;
        [_x, "#setDead", _instigator] remoteExecCall ["ace_medical_status_fnc_setDead", _x];
    } forEach (crew _vehicle);
}];
