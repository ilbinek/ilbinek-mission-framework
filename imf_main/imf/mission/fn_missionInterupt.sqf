/*
*
*	DOCS MAYBE SOMEDAY
*
*/

params ["_side", "_reason"];

// Interupted - export ocap and stats
// export stats if stats logger plugin is available
if (isClass(configFile >> "CfgPatches" >> "STATSLOGGER")) then {
    [] call statslogger_fnc_export;
};

// Show that mission was interupted, who won and why
if (_side == west) then {
    private _t = ["<t size='2' color='#FF0000'>", "REDFOR WON", "</t><br />", "<t size='1'>", _reason, "</t>"] joinString "";
    [_t, 0, 0, 15, 0, 0, 3222] remoteExec ["BIS_fnc_dynamicText", 0];
};

if (_side == east) then {
    private _t = ["<t size='2' color='#0000FF'>", "BLUEFOR WON", "</t><br />", "<t size='1'>", _reason, "</t>"] joinString "";
    [_t, 0, 0, 15, 0, 0, 3222] remoteExec ["BIS_fnc_dynamicText", 0];
};

if (_side == resistance) then {
    private _t = ["<t size='2' color='#00FF00'>", "GREENFOR WON", "</t><br />", "<t size='1'>", _reason, "</t>"] joinString "";
    [_t, 0, 0, 15, 0, 0, 3222] remoteExec ["BIS_fnc_dynamicText", 0];
};

if (_side == civilian) then {
    private _t = ["<t size='2' color='#FFFFFF'>", "Mission interrupted", "</t><br />", "<t size='1'>", _reason, "</t>"] joinString "";
    [_t, 0, 0, 15, 0, 0, 3222] remoteExec ["BIS_fnc_dynamicText", 0];
};

missionNamespace setVariable ["IMF_MISSION_ENDED", true, true];
