/*
	FILE: fn_teleport.sqf

	Name: IMF_fnc_teleport

	Author(s):
		ilbinek

	Description:
		Teleports player to target player. If target player is in vehicle, player will be teleported into vehicle.
		Runs localy on all players, but checks the name if it should teleport this player.

	Parameters:
		_name: STRING - Name of player to teleport
		_name2: STRING - Name of player to teleport to

	Returns:
		Nothing

	Examples:
		> ["playerName1", "playerName2"] call IMF_fnc_warmupStartServer;

	Public:
		Yes
*/

params ["_name", "_name2"];

if (_name == name player) then {
	_playerObject = (call BIS_fnc_listPlayers) select ( (call BIS_fnc_listPlayers) findIf {(name _x) isEqualTo _name2;} );
	// Teleport into vehicle if target player is in vehicle
	if (vehicle _playerObject != _playerObject) then {
		if (vehicle player != player) then {
			moveOut player; 
		};
		player moveInAny (vehicle _playerObject);
	} else {
		_playerObject setPos (_playerObject modelToWorld [0,0,1]);
	};

	player setPos (_playerObject modelToWorld [0,0,1]);
};
