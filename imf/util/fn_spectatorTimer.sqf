params ["_control"];
[_control] spawn {
	params ["_control"];
	while {IMF_spectator} do {
		_control ctrlSetTextColor [0.9, 0.9, 0.9, 0.9];
		_control ctrlSetText format ["%1", [IMF_mission_time_left, "MM:SS"] call BIS_fnc_secondsToString];
		sleep 1;
	};
};
