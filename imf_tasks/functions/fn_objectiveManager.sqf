/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// Argument 0 is module logic.
_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it is deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

missionNamespace setVariable ["IMF_TASK_MANAGER", _logic, true];
private _function = compile (_logic getVariable "Code");
private _end = compile (_logic getVariable "End");
_logic setVariable ["function", _function];

[_end] spawn {
	params ["_end"];
	waitUntil {sleep 1; time > 10};
	waitUntil {sleep 10; call _end};
	call IMF_fnc_missionEnd;
};
