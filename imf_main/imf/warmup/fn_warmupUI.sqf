/*
	FILE: fn_warmupUI.sqf

	Name: IMF_fnc_warmupUI

	Author(s):
		ilbinek

	Description:
		Takes care of displaying remaining time of warmup

	Parameters:
		None

	Returns:
		Nothing

	Examples:
		> call IMF_fnc_warmupUI;

	Public:
		Yes
*/

// Show text "Start" once warmup ends
["<t size='1' color='#ff0000'>Start</t>", 0, safeZoneY+0.01, 5, 0, 0, 3] spawn bis_fnc_dynamictext;

[
    {
        private _time = IMF_warmup_time;
        // Create string with the remaining warmup time and red color if time <= 30
        if (_time < 0) then {
            _time = 0
        };
        _str = format ["<t size = '0.6' color = '%2' >%1<t>", [_time, "MM:SS"] call BIS_fnc_secondstoString, if (_time >= 30) then {
            "#cccccc"
        } else {
            "#ff0000"
        }];
        // Show the text at the top of the screen
        [_str, 0, safeZoneY+0.01, 1.5, 0, 0, 3] spawn BIS_fnc_dynamictext;
    },
    1,
    [],
    {},
    {},
    { true },
    { IMF_warmup_state == 2 }
] call CBA_fnc_createPerFrameHandlerObject;

[{IMF_warmup_state == 2}, {
    ["<t size='1' color='#ff0000'>Start</t>", 0, safeZoneY+0.01, 5, 0, 0, 3] spawn bis_fnc_dynamictext;
}] call CBA_fnc_waitUntilAndExecute;
