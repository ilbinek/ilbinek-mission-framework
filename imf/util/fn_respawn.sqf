/*
*
*	DOCS MAYBE SOMEDAY
*
*/

params ["_name"];
if (_name == name player) then {
	setPlayerRespawnTime 2;
	sleep 3;
	setPlayerRespawnTime 9999;
	player setUnitLoadout [IMF_LOCAL_LOADOUT, true];
};
