/*
	FILE: fn_heal.sqf

	Name: IMF_fnc_heal

	Author(s):
		ilbinek

	Description:
		Heals the player

	Parameters:
		_name - STRING - Name of the player to heal

	Returns:
		Nothing

	Examples:
		> ["playerName"] call IMF_fnc_heal;

	Public:
		Yes
*/

params ["_name"];
if (_name == name player) then {
	player setDamage 0;
	[player] call ace_medical_treatment_fnc_fullHealLocal;
};
