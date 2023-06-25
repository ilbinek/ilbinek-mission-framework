/*
*
*	DOCS MAYBE SOMEDAY
*
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
