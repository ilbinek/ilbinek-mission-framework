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

[_logic] spawn {
	params ["_logic"];

	waitUntil {!isnil "IMF_server_init_finished" };

	private _marker = _logic getVariable ["Marker", ""];
	private _time = _logic getVariable ["Time", 0];
	private _objStr = _logic getVariable ["Object", ""];
	private _obj = missionNamespace getVariable _objStr;
	private _name = _logic getVariable ["Name", ""];
	private _continue = true;
	_logic setVariable ["killed", false, true];

	private _timeLeft = _time;
	private _left = false;

	// loop and check
	while {_continue} do {
		sleep 1;
		// Check if alive, otherwise set to dead and exit
		if (!alive _obj) then {
			_logic setVariable ["killed", true, true];
			_continue = false;
			[_name] remoteExec ["IMF_fnc_vipNotification", [0, -2] select isDedicated];
		};

		// Cehck if zone specified
		if (_marker != "") then {
			// Check if inside, otherwise countdown and kill;
			if (_obj in _marker) then {
				private _timeLeft = _time;
				if (_left) then {
					"You're safe now" remoteExec ["hint"];
					_left = false;
				};
			} else {
				if (_timeLeft == 0) then {
					_obj setDamage 1;
					_continue = false;
				};
				_left = true;
				_timeLeft = _timeLeft - 1;
				_str = "You'll die in " + _timeLeft + " seconds, get back";
				_str remoteExec ["hint"];
			};
		};
	};
};