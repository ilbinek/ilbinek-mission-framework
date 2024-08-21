/*
	FILE: fn_warmupSubstractTime.sqf

	Name: IMF_fnc_warmupSubstractTime

	Author(s):
		ilbinek

	Description:
		Substracts time to the warmup timer

	Parameters:
		_time 	- number	- Number of seconds to substract from the timer

	Returns:
		Nothing

	Examples:
		> [60] call IMF_fnc_warmupSubstractTime;

	Public:
		Yes
*/

params ["_time"];
IMF_warmup_time = IMF_warmup_time - _time;
publicVariable "IMF_warmup_time";
