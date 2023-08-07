/*
	FILE: fn_warmupStartServer.sqf

	Name: IMF_fnc_warmupStartServer

	Author(s):
		ilbinek

	Description:
		Starts the server warmup handling

	Parameters:
		None

	Returns:
		Nothing

	Examples:
		> call IMF_fnc_warmupStartServer;

	Public:
		Yes
*/

// Warmup states
/*
* 0 - ready to be initialised
* 1 - currently running
* 2 - finished
*/

// Get warmup state - must be 0
if (IMF_warmup_state != 0) exitwith {};

// Save the starting date
private _startime = date;
missionnamespace setVariable ["IMF_start_time", _startime, true];
IMF_warmup_state = 1;
publicVariable "IMF_warmup_state";

//["IMF_Freeze_Warmup", [], "IMF_Freeze_Warmup"] call CBA_fnc_globalEventJIP;
missionNamespace setVariable ["IMF_warmup_freeze", true, true];
private _players = {
    isplayer _x
} count playableunits;
private _sleeptime = 0;
switch (true) do {
    case (_players > 140) : {
        _sleeptime = 120;
    };
    case (_players > 100) : {
        _sleeptime = 60;
    };
    case (_players > 60) : {
        _sleeptime = 30;
    };
};

waitUntil {sleep 0.1; time > 0.1};

[{
    time > 0.1
}, {
    params ["_sleeptime"];
    [{
        missionNamespace setVariable ["IMF_warmup_freeze", false, true];
        //["IMF_Unfreeze_Warmup", [], "IMF_Freeze_Warmup"] call CBA_fnc_globalEventJIP;
        if (IMF_warmup_time <= 0) exitwith {};
        
        // PFH that will take care of tracking time
        [
            {
                if (IMF_warmup_time > 0) then {
                    // Still in warmup, remove one and continue
                    missionnamespace setVariable ["IMF_warmup_time", IMF_warmup_time - 1, true];
                } else {
                    // Warmup ended
                    missionnamespace setVariable ["IMF_warmup_state", 2, true];
                };
            }, 		// Code to be executed
            1, 		// Once a second
            [], 	// No parameters
            {}, 	// No start function
            {}, 	// No end function
            {
                true
            }, // Always run
            {
                IMF_warmup_state == 2
            } 		// Will delete PFH when warmup ends
        ] call CBA_fnc_createPerFrameHandlerObject;
        
        [{
            IMF_warmup_state == 2;
        }, {
            // Remove AIs
            call IMF_fnc_removeAI;
            // set the date back to the original time
            setDate IMF_start_time;
        }] call CBA_fnc_waitUntilandexecute;
    }, [], _sleeptime] call CBA_fnc_waitandexecute;
}, [_sleeptime]] call CBA_fnc_waitUntilAndExecute;
