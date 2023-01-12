/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// TODO

// Should be called only by server
if (!isServer) exitwith {};

// export stats if stats logger plugin is available
if (isClass(configFile >> "CfgPatches" >> "STATSLOGGER")) then {
    // TODO - Scores, winner etc
	//[_winner, omtk_sb_scores select 0, omtk_sb_scores select 1] remoteExec ["statslogger_fnc_mission_end", 2];
    [] call statslogger_fnc_export;
    
};

// export ocap if ocap available
if (isClass(configFile >> "CfgPatches" >> "ocap")) then {
	call ocap_fnc_exportData;
};

// Calculate objectives
// call IMF_fnc_calculateObjectives;
if (IMF_AREA_1 and IMF_AREA_2) then {
	// Blue win
	private _t = ["<t size='2' color='#b51931' shadow=2>", "REDFOR Captured all the zones and WON", "</t>"] joinString "";
	[_t, 0, 0, 15, 0, 0, 3222] remoteExec ["BIS_fnc_dynamicText", 0];
} else {
	// Red win
	private _t = ["<t size='2' color='#3232a8' shadow=2>", "BLUEFOR Protected at least one zone and WON", "</t>"] joinString "";
	[_t, 0, 0, 15, 0, 0, 3222] remoteExec ["BIS_fnc_dynamicText", 0];
};

missionNamespace setVariable ["IMF_MISSION_ENDED", true, true];

// Show results maybe someday
// TODO
