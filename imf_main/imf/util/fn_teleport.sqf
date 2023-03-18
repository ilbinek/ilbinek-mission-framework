/*
*
*	DOCS MAYBE SOMEDAY
*
*/

params ["_name", "_name2"];

if (_name == name player) then {
	_playerObject = allPlayers select ( allPlayers findIf {(name _x) isEqualTo _name2;} );
	player setPos (_playerObject modelToWorld [0,0,1]);
};
