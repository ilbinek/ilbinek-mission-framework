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
    [] call statslogger_fnc_export;
};

// Find out who won
private _winner = civilian;
private _reason = "";
if (!isNil "IMF_TASK_MANAGER") then {
    _winner = call (IMF_TASK_MANAGER getVariable ["function", "{civilian}"]);
    _reason = IMF_TASK_MANAGER getVariable ["Reason", ""];

    if (_winner == IMF_mission_time_end_winner) then {
        _reason = IMF_mission_time_end_text;
    };
};

private _time = false;

// Did they win because time ran out
/*if (IMF_mission_time_left <= 0) then {
    _time = false;
    _reason = IMF_mission_time_end_text;
};*/

// Show who won
[_winner, _time, _reason] remoteExec ["IMF_fnc_clientMissionEnd", [0, -2] select isDedicated];

missionNamespace setVariable ["IMF_MISSION_ENDED", true, true];
