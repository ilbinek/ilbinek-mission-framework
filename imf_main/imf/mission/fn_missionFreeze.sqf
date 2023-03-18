/*
*
*	DOCS MAYBE SOMEDAY
*
*/

params ["_freeze"];

if (_freeze) then {
	missionNamespace setVariable ["IMF_mission_freeze", true, true];
} else {
	missionNamespace setVariable ["IMF_mission_freeze", false, true];
};
