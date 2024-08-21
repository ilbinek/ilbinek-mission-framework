/*
*
*	DOCS MAYBE SOMEDAY
*
*/

params ["_freeze"];

if (_freeze) then {
	missionNamespace setVariable ["IMF_mission_freeze", true, true];
	["IMF_Freeze", [], "IMF_Freeze"] call CBA_fnc_globalEventJIP;
} else {
	missionNamespace setVariable ["IMF_mission_freeze", false, true];
	["IMF_Unfreeze", [], "IMF_Freeze"] call CBA_fnc_globalEventJIP;
};
