/*
*
*	DOCS MAYBE SOMEDAY
*
*/

params ["_event", "_arg"];

switch (_event) do {
	case "init": {
		private _dialog = _arg select 0;
		uiNamespace setVariable ["AdminDialog", _dialog];

		private _list = _dialog displayCtrl 6559;
		private _list2 = _dialog displayCtrl 6560;
		_list lbAdd "===WHO===";
		_list lbAdd "===BLUFOR===";
		_list2 lbAdd "===WHERE===";
		_list2 lbAdd "===BLUFOR===";

		{
			_list lbAdd name _x;
			_list2 lbAdd name _x;
		} forEach ((call BIS_fnc_listPlayers) select {side (group _x) == west});

		_list lbAdd "===OPFOR===";
		_list2 lbAdd "===OPFOR===";
		{
			_list lbAdd name _x;
			_list2 lbAdd name _x;
		} forEach ((call BIS_fnc_listPlayers) select {side (group _x) == east});

		_list lbAdd "===GREENFOR===";
		_list2 lbAdd "===GREENFOR===";
		{
			_list lbAdd name _x;
			_list2 lbAdd name _x;
		} forEach ((call BIS_fnc_listPlayers) select {side (group _x) == resistance});

		_list lbAdd "===CIVILIAN===";
		_list2 lbAdd "===CIVILIAN===";
		{
			_list lbAdd name _x;
			_list2 lbAdd name _x;
		} forEach ((call BIS_fnc_listPlayers) select {side (group _x) == civilian});

		// Run loop
		["loop", _dialog] call IMF_fnc_handleAdminMenu;
	};
	case "close": {
		// Closed, remove the var
		uiNamespace setVariable ["AdminDialog", nil];
	};
	case "loop": {
		// Create loop for mision time and server FPS
		[_arg] spawn {
			disableSerialization;
			private _dialog = _this select 0;
			private _ctrlTime = _dialog displayCtrl 6557;
			private _ctrlFPS = _dialog displayCtrl 6555;

			if (isNil "IMF_mission_time_left") then {
				_ctrlTime ctrlSetText "--:--";
			} else {
				while {(uiNamespace getVariable ["AdminDialog", displayNull]) == _dialog} do {
					private _timeLeft = IMF_mission_time_left;
					private _minutes = floor (IMF_mission_time_left / 60);
					private _sec = floor (IMF_mission_time_left % 60);
					if (_sec < 10) then {
						_ctrlTime ctrlSetText format ["%1:0%2", _minutes, _sec];
					} else {
						_ctrlTime ctrlSetText format ["%1:%2", _minutes, _sec];
					};
					_ctrlFPS ctrlSetText format ["Server FPS: %1", floor IMF_server_fps];
					sleep 0.1;
				};
			};
		};

		[_arg] spawn {
			disableSerialization;
			private _dialog = _this select 0;
			private _ctrlTime = _dialog displayCtrl 6556;

			if (isNil "IMF_warmup_time") then {
				_ctrlTime ctrlSetText "--:--";
			} else {
				while {(uiNamespace getVariable ["AdminDialog", displayNull]) == _dialog} do {
					private _timeLeft = IMF_warmup_time;
					if (_timeLeft < 0) then {
						_timeLeft = 0;
					};
					private _minutes = floor (_timeLeft / 60);
					private _sec = floor (_timeLeft % 60);
					if (_sec < 10) then {
						_ctrlTime ctrlSetText format ["%1:0%2", _minutes, _sec];
					} else {
						_ctrlTime ctrlSetText format ["%1:%2", _minutes, _sec];
					};
					sleep 0.1;
				};
			};
		};

		[_arg] spawn {
			disableSerialization;
			private _dialog = _this select 0;
			
			private _list1 = _dialog displayCtrl 6559;
			private _list2 = _dialog displayCtrl 6560;

			private _name1 = _dialog displayCtrl 6561;
			private _name2 = _dialog displayCtrl 6562;

			private _saved1 = ctrlText _name1;
			private _saved2 = ctrlText _name2;

			while {(uiNamespace getVariable ["AdminDialog", displayNull]) == _dialog} do {
				if (ctrlText _name1 != _saved1) then {
					lbClear _list1;
					_saved1 = ctrlText _name1;
					_list1 lbAdd "===WHO===";
					_list1 lbAdd "===BLUEFOR===";
					{
						if ([_saved1, name _x] call BIS_fnc_inString) then {
							_list1 lbAdd name _x;
						};
					} forEach ((call BIS_fnc_listPlayers) select {side (group _x) == west});

					_list1 lbAdd "===REDFOR===";
					{
						if ([_saved1, name _x] call BIS_fnc_inString) then {
							_list1 lbAdd name _x;
						};
					} forEach ((call BIS_fnc_listPlayers) select {side (group _x) == east});

					_list1 lbAdd "===GREENFOR===";
					{
						if ([_saved1, name _x] call BIS_fnc_inString) then {
							_list1 lbAdd name _x;
						};
					} forEach ((call BIS_fnc_listPlayers) select {side (group _x) == resistance});

					_list1 lbAdd "===CIVILIAN===";
					{
						if ([_saved1, name _x] call BIS_fnc_inString) then {
							_list1 lbAdd name _x;
						};
					} forEach ((call BIS_fnc_listPlayers) select {side (group _x) == civilian});
				};

				if (ctrlText _name2 != _saved2) then {
					lbClear _list2;
					_saved2 = ctrlText _name2;
					_list2 lbAdd "===WHERE===";
					_list2 lbAdd "===BLUEFOR===";
					{
						if ([_saved2, name _x] call BIS_fnc_inString) then {
							_list2 lbAdd name _x;
						};
					} forEach ((call BIS_fnc_listPlayers) select {side (group _x) == west});

					_list2 lbAdd "===REDFOR===";
					{
						if ([_saved2, name _x] call BIS_fnc_inString) then {
							_list2 lbAdd name _x;
						};
					} forEach ((call BIS_fnc_listPlayers) select {side (group _x) == east});

					_list2 lbAdd "===GREENFOR===";
					{
						if ([_saved2, name _x] call BIS_fnc_inString) then {
							_list2 lbAdd name _x;
						};
					} forEach ((call BIS_fnc_listPlayers) select {side (group _x) == resistance});

					_list2 lbAdd "===CIVILIAN===";
					{
						if ([_saved2, name _x] call BIS_fnc_inString) then {
							_list2 lbAdd name _x;
						};
					} forEach ((call BIS_fnc_listPlayers) select {side (group _x) == civilian});
				};
				sleep 0.2;
			};
		};
	};
	case "announcement": {
		// Get the text
		private _dialog = uiNamespace getVariable ["AdminDialog", displayNull];
		private _text = ctrlText (_dialog displayCtrl 6558);
		if (_text != "") then {
			private _t = ["<t size='2' color='#a8a632' shadow=2>", _text, "</t>"] joinString "";
			[_t, 0, 0, 15, 0, 0, 3222] remoteExec ["BIS_fnc_dynamicText", 0];
		};
	};
	case "respawn": {
		private _dialog = uiNamespace getVariable ["AdminDialog", displayNull];
		private _list = _dialog displayCtrl 6559;
		private _index = lbCurSel _list;
		private _name = _list lbText _index;
		[_name] remoteExec ["IMF_fnc_respawn", [0, -2] select isDedicated];
	};
	case "heal": {
		private _dialog = uiNamespace getVariable ["AdminDialog", displayNull];
		private _list = _dialog displayCtrl 6559;
		private _index = lbCurSel _list;
		private _name = _list lbText _index;
		[_name] remoteExec ["IMF_fnc_heal", [0, -2] select isDedicated];
	};
	case "teleport": {
		private _dialog = uiNamespace getVariable ["AdminDialog", displayNull];
		private _list = _dialog displayCtrl 6559;
		private _index = lbCurSel _list;
		private _name = _list lbText _index;
		private _list2 = _dialog displayCtrl 6560;
		private _index2 = lbCurSel _list2;
		private _name2 = _list2 lbText _index2;
		[_name, _name2] remoteExec ["IMF_fnc_teleport", [0, -2] select isDedicated];
	};
};
