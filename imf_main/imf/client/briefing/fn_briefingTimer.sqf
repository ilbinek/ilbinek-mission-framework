/*
*
*	DOCS MAYBE SOMEDAY
*
*/

if (!hasInterface) exitwith {};
private["_display", "_ctrl", "_timeStart", "_eh"];

disableSerialization;

waitUntil {uiSleep 1; !isNull (uinamespace getVariable ["RscDiary",displaynull])};

_display = uinamespace getVariable ["RscDiary",displaynull];
if (isnull _display) exitwith {};
_ctrl = _display ctrlCreate ["RscText", -1];
_ctrl ctrlSetPosition [0.5, safezoneY, 0.15, 0.05];
_ctrl ctrlSetText "00:00";
_ctrl ctrlSetTextColor [0.75, 0.75, 0.75, 1];
_ctrl ctrlCommit 0;
_timeStart = diag_ticktime;

// Restrict start game by keyboard
_eh = _display displayAddEventHandler ["keyDown", "(_this select 1) in [28,57,156];"];

while {time < 0.1} do {
    _s1 = [diag_ticktime - _timeStart, "MM:SS"] call BIS_fnc_secondsToString;
    _ctrl ctrlSetText _s1;
    _ctrl ctrlCommit 0;
    uisleep 0.1;
};

ctrlDelete _ctrl;
_display displayRemoveEventHandler ["keyDown",_eh];
