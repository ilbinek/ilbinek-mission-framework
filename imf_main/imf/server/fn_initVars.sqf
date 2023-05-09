/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// Check if server
if (!isServer) exitWith {};

// Set warmup state to 0 - initialising
missionNamespace setVariable ["IMF_warmup_state", 0, true];

// Set warmup time
if (isNil "IMF_warmup_time") then {
	missionNamespace setVariable ["IMF_warmup_time", (IMF_var_logic getVariable "WarmupTime") * 60, true];
};

// Set warmup area
if (isNil "IMF_warmup_area") then {
	missionNamespace setVariable ["IMF_warmup_area", IMF_var_logic getVariable "WarmupArea", true];
};

// Set warmup start time
missionNamespace setVariable ["IMF_wrarmup_start_time", dayTime, true];

// Keep info if everyone is supposed to be frozen - edited only by admin / possible to add autodetection of a lag
missionNamespace setVariable ["IMF_mission_freeze", false, true];

// Set max view distance
if (isNil "IMF_max_view_distance") then {
	missionNamespace setVariable ["IMF_max_view_distance", IMF_var_logic getVariable "MaxViewDistance", true];
};

// Set max terrain ciew distance
if (isNil "IMF_max_view_terrain") then {
	missionNamespace setVariable ["IMF_max_view_terrain", IMF_var_logic getVariable "MaxViewDistanceTerrain", true];
};

// Set mission time
if (isNil "IMF_mission_duration") then {
	missionNamespace setVariable ["IMF_mission_duration", (IMF_var_logic getVariable "MissionTime") * 60, true];
};

// Set mission time left to mission duration
missionNamespace setVariable ["IMF_mission_time_left", IMF_mission_duration, true];

// Set mission TI disable
if (isNil "IMF_mission_ti_disable") then {
	missionNamespace setVariable ["IMF_mission_ti_disable", IMF_var_logic getVariable "ThermalImaging", true];
};

//  Set if mission should end if only nbr of people from one side is alive
if (isNil "IMF_mission_end_if_dead") then {
	missionNamespace setVariable ["IMF_mission_end_if_dead", IMF_var_logic getVariable "SideEliminatedEnd", true];
};

// Set number of the minimum people alive to continue missions
if (isNil "IMF_mission_end_players") then {
	missionNamespace setVariable ["IMF_mission_end_players", IMF_var_logic getVariable "PeopleAlive", true];
};

// Set if mission should end if all objectives are done
if (isNil "IMF_mission_end_if_all_objectives") then {
	missionNamespace setVariable ["IMF_mission_end_if_all_objectives", IMF_var_logic getVariable "ObjMissionEnd", true];
};

// Winning side when time runs out
if (isNil "IMF_mission_time_end_winner") then {
	private _winner = civilian;
	switch (IMF_var_logic getVariable "TimeEndWinner") do {
		case 0: { _winner = east };
		case 1: { _winner = west };
		case 2: { _winner = resistance };
		case 3: { _winner = civilian };
	};
	missionNamespace setVariable ["IMF_mission_time_end_winner", _winner, true];
};

// Text shown when time runs out
if (isNil "IMF_mission_time_end_text") then {
	missionNamespace setVariable ["IMF_mission_time_end_text", IMF_var_logic getVariable "TimeEndWinnerText", true];
};

// Set if mission ended
missionNamespace setVariable ["IMF_MISSION_ENDED", false, true];
