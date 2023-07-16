/*
*
*	DOCS MAYBE SOMEDAY
*
*/

params ["_freeze"];

if (_freeze) then {
	missionNamespace setVariable ["IMF_mission_freeze", true, true];
	["IMF_Freeze", [true]] call CBA_fnc_globalEvent;
} else {
	missionNamespace setVariable ["IMF_mission_freeze", false, true];
	["IMF_Freeze", [false]] call CBA_fnc_globalEvent;
};
