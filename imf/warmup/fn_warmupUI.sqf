/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// While warmup is running
while {IMF_warmup_state != 2} do {
	// Create string with the remaining warmup time and red color if time <= 30
	_str = format ["<t size = '0.6' color = '%2' >%1<t>", [IMF_warmup_time, "MM:SS"] call BIS_fnc_secondsToString, if (IMF_warmup_time >= 30) then {"#cccccc"} else {"#ff0000"}];
	// Show the text at the top of the screen
	[_str, 0, safeZoneY+0.01, 1.5, 0, 0, 3] spawn BIS_fnc_dynamicText;

	sleep 1;
};

// Show text "Start" once warmup ends
["<t size='1' color='#ff0000'>Start</t>", 0,safeZoneY+0.01,5,0,0,3] spawn bis_fnc_dynamicText;
