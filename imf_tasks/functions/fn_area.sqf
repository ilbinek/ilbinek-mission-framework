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

// Register this area in objectiveManager
//[_logic] call IMF_fnc_objectiveManager;

// Spawn the thread that will take care of this area
[_logic] spawn {
	// get the _logic param 
	params ["_logic"];

	waitUntil {!isnil "IMF_server_init_finished" };

	// get basic arguments
	private _marker = _logic getVariable ["Marker", "zone"];
	private _name = _logic getVariable ["Name", ""];
	private _owner = civilian;
	switch (_logic getVariable ["Owner", 3]) do {
		case 0: { _owner = east };
		case 1: { _owner = west };
		case 2: { _owner = resistance };
		case 3: { _owner = civilian };
	};
	_logic setVariable ["IMF_owner", _owner, true];
	private _capturer = civilian;
	switch (_logic getVariable ["Capturer", 4]) do {
		case 0: { _capturer = east };
		case 1: { _capturer = west };
		case 2: { _capturer = resistance };
		case 3: { _capturer = civilian };
	};
	private _timeToCapture = _logic getVariable ["TimeToCapture", 60];
	private _recapturable = _logic getVariable ["Recapturable", false];
	private _advantage = _logic getVariable ["Advantage", 1];
	private _height = _logic getVariable ["Height", 50];
	private _condition = compile (_logic getVariable ["Condition", "true"]);

	// Edit the marker visuals at the start
	private _color = if (_owner == civilian) then [{"ColorWhite"}, {[_owner, true] call BIS_fnc_sideColor}];
	_marker setMarkerColorLocal _color;
	private _brush = if (call _condition) then [{"Solid"}, {"Border"}];
	_marker setMarkerBrush _brush;

	private _isBeingCaptured = false;
	private _timeLeft = _timeToCapture;
	private _loop = true;

	// Start the loop itself
	while {_loop} do {
		// Wait until zone can be captured. If not set to proper states
		if (!(call _condition)) then {
			_timeLeft = _timeToCapture;
			_isBeingCaptured = false;
			private _color = if (_owner == civilian) then [{"ColorWhite"}, {[_owner, true] call BIS_fnc_sideColor}];
			_marker setMarkerColorLocal _color;
			_marker setMarkerBrush "Border";
			sleep 1;
			continue;
		};
		

		// Get number of defenders in zone
		private _def = { alive _x && side _x == _owner && _x inArea _marker } count allPlayers;
		// Get number of capturers - if it's civilian - any, get the heighest number of them all and compare, if it's the same as defender
		private _cap = 0;
		private _capSide = civilian;
		if (_capturer == civilian) then {
			// TODO 
		} else {
			_cap = { alive _x && side _x == _capturer && _x inArea _marker && (getPos _x select 2) <= _height} count allPlayers;
			_capSide = _capturer;
		};

		// Loop through the logic of the zone
		// Check if we should be capturing
		private _con1 = !(_def == 0 && _cap > 0);
		private _con2 = _def > (_cap - _advantage);
		if (_con1 && _con2) then {
			// Defended - check if it was being captured and set proper vars and visuals
			_marker setMarkerBrush "Solid";
			if (_isBeingCaptured) then {
				_timeLeft = _timeToCapture;
				_isBeingCaptured = false;
				private _color = if (_owner == civilian) then [{"ColorWhite"}, {[_owner, true] call BIS_fnc_sideColor}];
				_marker setMarkerColorLocal _color;
				private _brush = if (call _condition) then [{"Solid"}, {"Border"}];
				_marker setMarkerBrush _brush;
				// TODO Show a message about capture end
				[_owner, "stop", _name, _timeToCapture] remoteExec ["IMF_fnc_areaNotification", [0, -2] select isDedicated];
			};
		} else {
			// Caputring
			if (_isBeingCaptured) then {
				_timeLeft = _timeLeft -1;
				if (_timeLeft == 0) then {
					[_capSide, "finished", _name, _timeToCapture] remoteExec ["IMF_fnc_areaNotification", [0, -2] select isDedicated];
					_capturer = _owner;
					_owner = _capSide;
					_logic setVariable ["IMF_owner", _owner, true];
					private _color = if (_owner == civilian) then [{"ColorWhite"}, {[_owner, true] call BIS_fnc_sideColor}];
					_marker setMarkerColorLocal _color;
					private _brush = if (call _condition) then [{"Solid"}, {"Border"}];
					_marker setMarkerBrush _brush;
					// If zone is recapturable, rework all variables
					if (_recapturable) then {
						_timeLeft = _timeToCapture;
						_isBeingCaptured = false;
					} else {
						// If not, end the loop
						break;
					};
				};
			} else {
				_isBeingCaptured = true;
				private _color = [_capSide, true] call BIS_fnc_sideColor;
				_marker setMarkerColorLocal "ColorWhite";
				_marker setMarkerBrush "Vertical";
				// TODO Show a message about capture start
				[_owner, "start", _name, _timeToCapture] remoteExec ["IMF_fnc_areaNotification", [0, -2] select isDedicated];
			};
		};

		sleep 1;
	};
};
