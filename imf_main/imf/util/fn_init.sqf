/*
	FILE: fn_init.sqf

	Name: IMF_fnc_init

	Author(s):
		ilbinek

	Description:
		Initializes the IMF framework. Called from the module's init field.

	Parameters:
		Whatever is passed to the module's init field.

	Returns:
		Nothing

	Examples:
		> call IMF_fnc_init;

	Public:
		No
*/

// Argument 0 is module logic.
_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it is deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];

IMF_var_logic = _logic;

[] spawn {
	call IMF_fnc_serverInitCall;
};

[] spawn {
	call IMF_fnc_clientInitCall;
};
