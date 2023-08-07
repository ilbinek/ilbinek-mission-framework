/*
	FILE: fn_warmupAddTime.sqf

	Name: IMF_fnc_warmupAddTime

	Author(s):
		ilbinek

	Description:
		Adds time to the warmup timer

	Parameters:
		_time 	- number	- Number of seconds to add to the timer

	Returns:
		Nothing

	Examples:
		> [60] call IMF_fnc_warmupAddTime;

	Public:
		Yes
*/

params ["_time"];
IMF_warmup_time = IMF_warmup_time + _time;
publicVariable "IMF_warmup_time";
