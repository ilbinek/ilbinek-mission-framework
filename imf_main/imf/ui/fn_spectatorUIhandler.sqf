#define IMF_RSC_TEXT_1 	6001
#define IMF_RSC_TEXT_2 	6002
#define IMF_RSC_TEXT_3 	6003
#define IMF_RSC_TEXT_4 	6004
#define IMF_RSC_TIME 	6005

[] spawn {
	private _dialog = uiNamespace getVariable "IMF_spectatorUI";

	while {!isNil "_dialog"} do {
		// Time portion
		private _text = _dialog displayCtrl IMF_RSC_TIME;
		_text ctrlSetText format ["%1", [IMF_mission_time_left, "MM:SS"] call BIS_fnc_secondsToString];

		// Numbers portion
		private _nbr = IMF_RSC_TEXT_1;
		{
			// Current result is saved in variable _x
			_side = _x;
			_count = ({alive _x && isPlayer _x} count units _side);
			if (_count > 0) then {
				_control = _dialog displayCtrl _nbr;
				_color = _side call BIS_fnc_sideColor;
				_control ctrlSetBackgroundColor _color;
				_control ctrlSetText str(_count);
				_control ctrlCommit 0;
				_nbr = _nbr + 1;
			};
		} forEach [west, east, resistance, civilian];

		sleep 0.1;
		_dialog = uiNamespace getVariable "IMF_spectatorUI";
	};
};
