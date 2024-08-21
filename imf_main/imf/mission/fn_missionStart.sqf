/*
*
*	doCS MAYBE SOMEDAY
*
*/

// Start the mission - done only once by the server after warmup end
if (!isServer) exitwith {};

// PFH that updates sever FPS so they can be shown in admin menu
[
    {
        missionnamespace setVariable ["IMF_server_fps", diag_fps, true];
    }, 		// Code to be executed
    1, 	// Once a second
    [], 	// No parameters
    {}, 	// No start function
    {}, 	// No end function
    {true}, // Always run
    {} 		// Never delete
] call CBA_fnc_createPerFrameHandlerObject;

// PFH that will take care of tracking time
[
    {
        if (!IMF_mission_freeze && IMF_warmup_state == 2) then {
            IMF_mission_time_left = IMF_mission_time_left - 1;
            // Broadcast the updated variable
            publicVariable "IMF_mission_time_left";

            if (IMF_mission_time_left <= 0) then {
                call IMF_fnc_missionEnd;
            };
        };
    }, 		// Code to be executed
    1, 	// Once a second
    [], 	// No parameters
    {}, 	// No start function
    {}, 	// No end function
    {true}, // Always run
    { IMF_mission_time_left <= 0 || IMF_MISSION_ENDED} 		// Will delete PFH when mission ends
] call CBA_fnc_createPerFrameHandlerObject;

// Loop that will check if one of sides is considered eliminated
/*if (IMF_mission_end_if_dead) then {
    _west_start = {
        alive _x && side _x == west
    } count (call BIS_fnc_listplayers);
    _east_start = {
        alive _x && side _x == east
    } count (call BIS_fnc_listplayers);
    _guer_start = {
        alive _x && side _x == resistance
    } count (call BIS_fnc_listplayers);
    
	// todo remake it to percentages
    // todo make it work in a three way
    [
        {
			params ["_west_start", "_east_start", "_guer_start"];
			
			_west = {
                alive _x && side _x == west
            } count (call BIS_fnc_listplayers);
            _east = {
                alive _x && side _x == east
            } count (call BIS_fnc_listplayers);
            _guer = {
                alive _x && side _x == resistance
            } count (call BIS_fnc_listplayers);
            if (_west < IMF_mission_end_players) exitwith {
                [east, "side eliminated"] call IMF_fnc_clientMissionEnd;
            };
            if (_east < IMF_mission_end_players) exitwith {
                [west, "side eliminated"] call IMF_fnc_clientMissionEnd;
            };
        }, 	// Code to be executed
        1, 	// Once a second
        [_west_start, _east_start, _guer_start], 	// Parameters
        {}, 	// No start function
        {}, 	// No end function
        { IMF_warmup_state == 2 }, // Run only during game
        {
            IMF_mission_time_left < 0 || IMF_MISSION_ENDED
        } 		// Will delete PFH when mission ends
    ] call CBA_fnc_createPerFrameHandlerObject;
};*/
