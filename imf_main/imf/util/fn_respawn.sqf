/*
*
*	DOCS MAYBE SOMEDAY
*
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
