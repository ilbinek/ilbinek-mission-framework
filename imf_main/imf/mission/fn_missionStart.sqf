/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// Start the mission - done only once by the server after warmup end
if (!isServer) exitwith {};

// Loop that updates sever FPS so they can be shown in admin menu
[] spawn {
	while {true} do {
		missionNamespace setVariable ["IMF_server_fps", diag_fps, true];
		sleep 5;
	};
};

// Loop that will take care of tracking time
[] spawn {
	while {IMF_mission_time_left > 0 && !IMF_MISSION_ENDED} do {
		// If not frozen and game not in warmup, substract time
		if (!IMF_mission_freeze && IMF_warmup_state == 2) then {
			IMF_mission_time_left = IMF_mission_time_left - 1;
			// Broadcast the updated variable
			publicVariable "IMF_mission_time_left";
		};
		sleep 1;
	};

	// End mission
	call IMF_fnc_missionEnd;
};

// Loop that will check if one of sides is considered eliminated
if (IMF_mission_end_if_dead) then {
	_west_start = {alive _x && side _x == west} count allPlayers;
	_east_start = {alive _x && side _x == east} count allPlayers;
	_guer_start = {alive _x && side _x == resistance} count allPlayers;
	// TODO remake it to percentages
	// TODO make it work in a three way

	[_west_start, _east_start, _guer_start] spawn {
		params ["_west_start", "_east_start", "_guer_start"];
		waitUntil {sleep 1; IMF_warmup_state == 2};
		if (count allPlayers < 10) exitWith {};
		private _west = 0;
		private _east = 0;
		while {true} do {
			_west = {alive _x && side _x == west} count allPlayers;
			_east = {alive _x && side _x == east} count allPlayers;
			_guer = {alive _x && side _x == resistance} count allPlayers;
			if (_west < IMF_mission_end_players) exitWith {
				[east, "Side eliminated"] call IMF_fnc_clientMissionEnd;
			};
			if (_east < IMF_mission_end_players) exitWith {
				[west, "Side eliminated"] call IMF_fnc_clientMissionEnd;
			};
			sleep 5;
		};
	};
};

// Loop that takes care of enabling/disabling simulation globally on vehicles
[] spawn {
	while {true} do {
		if (IMF_mission_freeze) then {
			sleep 10;
			private _frozen = [];
			{
				if (simulationEnabled _x) then {
					_frozen pushBack _x;
					_x enableSimulationGlobal false;
				};
			} forEach vehicles;
			waitUntil {sleep 1; !IMF_mission_freeze};
			sleep 5;
			{
				_x enableSimulationGlobal true;;
			} forEach _frozen;
		};
		sleep 1;
	};
};
