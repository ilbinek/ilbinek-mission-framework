/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// Show side numbers on briefing
[] spawn IMF_fnc_briefingSideNumbers;

// Show timer in briefing
[] spawn IMF_fnc_briefingTimer;

// Show extended briefing
call IMF_fnc_briefingExtended;

if (side player != sideLogic) then {
	// Show squad loadout
	call IMF_fnc_briefingInventory;

	// Show generated frequencies for squads
	call IMF_fnc_briefingFrequencies;

	// Show all squads
	call IMF_fnc_briefingSquads;
};

// Show basic info about mission
call IMF_fnc_briefingMission;
