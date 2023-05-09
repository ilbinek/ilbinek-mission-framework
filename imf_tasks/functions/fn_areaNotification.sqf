/*
*
*	DOCS MAYBE SOMEDAY
*
*/

params ["_side", "_state", "_zoneName", "_time"];

switch (_state) do {
	case "start" : {
		private _text = format ["%1 capturing started - %2 seconds left", _zoneName, _time];
		["TaskUpdated", ["", _text]] call BIS_fnc_showNotification;
	};
	case "stop": {
		private _text = format ["%1 capturing stopped", _zoneName];
		["TaskUpdated", ["", _text]] call BIS_fnc_showNotification;
	};
	case "finished": {
		private _text = format ["%1 captured by %2", _zoneName, _side];;
		if (side player == _side) then {
			["TaskSucceeded", ["", _text]] call BIS_fnc_showNotification;
		} else {
			["TaskFailed", ["", _text]] call BIS_fnc_showNotification;
		};
	};
	default { };
};

// ["TaskSucceeded", ["", "Zone 1 capture started - 30 seconds left"]] call BIS_fnc_showNotification;
// ["TaskFailed", ["", "Zone 1 capture started - 30 seconds left"]] call BIS_fnc_showNotification;
// ["TaskUpdated", ["", "Zone 1 capture started - 30 seconds left"]] call BIS_fnc_showNotification;
