/*
	FILE: fn_respawn.sqf

	Name: IMF_fnc_respawn

	Author(s):
		ilbinek

	Description:
		Respawn script for IMF. Runs locally on each client, checks if it should be run on this client and if so, respawns the player.

	Parameters:
		_name - STRING - Name of the player to respawn

	Returns:
		Nothing

	Examples:
		> ["playerName"]call IMF_fnc_respawn;

	Public:
		Yes
*/

params ["_name"];
if (_name == name player) then {
	setPlayerRespawnTime 2;
	sleep 3;
	player setVariable ["IMF_killed", false, true];
	setPlayerRespawnTime 9999;
	player setUnitLoadout [IMF_LOCAL_LOADOUT, true];
	if (side player == civilian) then {
		private _group = player getVariable "IMF_OLD_GROUP";
		if (isNil "_group") then {
			_group = createGroup (player getVariable ["IMF_local_side", west]);
		};
		[player] joinSilent _group;
	};
};
