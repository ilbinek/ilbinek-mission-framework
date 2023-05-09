/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// Only for clients
if (!hasInterface) exitWith {};

// Should be run only once
private _running = player getVariable ["IMF_local_clinet_loop", false];
if (_running) exitWith {};

player setVariable ["IMF_local_client_loop", true];

// Take care of freeze
// Could be done by remote execing a function from client/admin, but decided for this approach, as it will be always synced with server and re-log won't "disable" this freeze
[] spawn {
	while {true} do {
		if (IMF_mission_freeze) then {
			titleText ["<t color='#ff0000' size='8'>Freeze starting in 10!</t><br/>", "PLAIN", 0.5, true, true];
			sleep 5;
			titleText ["<t color='#ff0000' size='8'>Freeze starting in 5!</t><br/>", "PLAIN", 0.5, true, true];
			sleep 5;
			player enableSimulation false;
			waitUntil {titleText ["<t color='#e5eb34' size='3'>Simulation disabled<br/>DON'T TOUCH ANYTHING</t><br/>", "PLAIN", 0.5, true, true]; sleep 1; !IMF_mission_freeze};
			titleText ["<t color='#15d625' size='3'>Simulation enabled in 5</t><br/>", "PLAIN", 0.5, true, true];
			sleep 1;
			titleText ["<t color='#15d625' size='3'>Simulation enabled in 4</t><br/>", "PLAIN", 0.5, true, true];
			sleep 1;
			titleText ["<t color='#15d625' size='3'>Simulation enabled in 3</t><br/>", "PLAIN", 0.5, true, true];
			sleep 1;
			titleText ["<t color='#15d625' size='3'>Simulation enabled in 2</t><br/>", "PLAIN", 0.5, true, true];
			sleep 1;
			titleText ["<t color='#15d625' size='3'>Simulation enabled in 1</t><br/>", "PLAIN", 0.5, true, true];
			sleep 1;
			titleText ["", "PLAIN", -1, true, true];
			player enableSimulation true;
		};
		sleep 1;
	};
};
