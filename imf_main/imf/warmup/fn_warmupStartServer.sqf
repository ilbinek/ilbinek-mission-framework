/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// Warmup states
/*
* 0 - ready to be initialised
* 1 - currently running
* 2 - finished
*/

// Get warmup state - must be 0
if (IMF_warmup_state != 0) exitWith {};

// Save the starting date
private _starTime = date;
missionNamespace setVariable ["IMF_start_time", _starTime, true];
IMF_warmup_state = 1;
publicVariable "IMF_warmup_state";

// Freeze for everyone on the begining
missionNamespace setVariable ["IMF_warmup_freeze", true, true];
private _players = {isPlayer _x} count playableUnits;
switch (true) do {
	case (_players > 140) : {sleep 120;};
	case (_players > 100) : {sleep 60;};
	case (_players > 60)  : {sleep 30;};
};

missionNamespace setVariable ["IMF_warmup_freeze", false, true];

if (IMF_warmup_time <= 0) exitWith {};

// Thread taking care of counting time
while {IMF_warmup_state != 2} do {
	// Get time left in warmup
	if (IMF_warmup_time > 0) then {
		// Still in warmup, remove one and continue
		missionNamespace setVariable ["IMF_warmup_time", IMF_warmup_time - 1, true];
	} else {
		// Warmup ended
		missionNamespace setVariable ["IMF_warmup_state", 2, true];
	};
	sleep 1;
};

// TODO: Remove AIs
call IMF_fnc_removeAI;
// Set the date back to the original time
setDate _starTime;
