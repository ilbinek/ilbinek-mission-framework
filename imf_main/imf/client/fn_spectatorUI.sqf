/*
*
*	DOCS MAYBE SOMEDAY
*
*/

if (!hasInterface) exitWith {};

// Exit if I am not a spectator or I am not dead
if (side player == sideLogic || !alive player) then {
	// Show HUD with remaining time and alive players
	// TODO Make it better, thank you prisoner#2519 for somewhat working example, much apreciated!
	("IMF_spectatorUI" call BIS_fnc_rscLayer) cutRsc ["IMF_spectatorUIRsc", "PLAIN"];
};
