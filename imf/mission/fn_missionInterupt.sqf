/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// TODO

params ["_side", "_reason"];

// Interupted - export ocap and stats
// export stats if stats logger plugin is available
if (isClass(configFile >> "CfgPatches" >> "STATSLOGGER")) then {
    // TODO - Scores, winner etc
	[_side, 0, 0] call statslogger_fnc_mission_end;
    [] call statslogger_fnc_export;
    
};

// export ocap if ocap available
if (isClass(configFile >> "CfgPatches" >> "ocap")) then {
	call ocap_fnc_exportData;
};

// Show that mission was interupted, who won and why
// TODO
