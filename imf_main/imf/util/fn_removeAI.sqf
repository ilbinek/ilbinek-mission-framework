/*
	FILE: fn_removeAI.sqf

	Name: IMF_fnc_removeAI

	Author(s):
		ilbinek

	Description:
		Removes all AI units from the mission

	Parameters:
		None

	Returns:
		Nothing

	Examples:
		> call IMF_fnc_removeAI;

	Public:
		Yes
*/

{
	if (!isPlayer _x) then {
		deleteVehicle _x;
	};
} forEach playableUnits;
