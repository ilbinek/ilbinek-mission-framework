/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// Player hit
player addMPEventHandler ["MPHit", {
	params ["_unit", "_causedBy", "_damage", "_instigator"];
	private _text = format ["[IMF] - %1 hit by %2", name _unit, name _instigator];
	diag_log _text;
}];

// Player killed
player addMPEventHandler ["MPKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	private _text = format ["[IMF] - %1 killed by %2", name _unit, name _killer];
	diag_log _text;
	if (_unit == player) then {
		IMF_KILLER = name _killer;
	};
	if (_killer == player) then {
		IMF_KILLS pushBack name _unit;
	};
}];
