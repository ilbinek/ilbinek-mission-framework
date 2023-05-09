/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// Secondary check if called by client
if (!hasinterface) exitwith {};

// Wait for server to finish initialising
waitUntil {
    !isnil "IMF_server_init_finished"
};

// Create briefing
call IMF_fnc_createBriefing;

// execute warmup
[] spawn IMF_fnc_warmupStart;

// Show timer during warmup
[] spawn IMF_fnc_warmupUI;

// Disabled AIs
call IMF_fnc_disableAI;

// if spectating or dead, start drawing spectator UI, otherwise this will exit
[] spawn IMF_fnc_spectatorUI;

// set correct frequencies on radios (requires TFAR)
// Adds an CBA event handler, TFAR_event_OnradiosReceived is fired by TFAR addon for local client when is radios
// are done inicialising and you can have fun with them
["TFAR_event_OnradiosReceived", {
    [{
        call IMF_fnc_setradioFreqs;
    }, [], 1] call CBA_fnc_waitandexecute;
}] call CBA_fnc_addEventHandler;

// Add keybinds to change view distance and admin menu
[] spawn IMF_fnc_addKeybinds;

// Add player handlers
call IMF_fnc_createClientHandlers;

// set view distance to the shortest
[2] call IMF_fnc_setVdistance;

// Start the client loop
call IMF_fnc_clientLoop;

// Add array that stores my kills
IMF_KILLS = [];
IMF_KILLER = "";

// Save the current loadout as local variable
IMF_local_loadoUT = getUnitloadout player;
if (isNil "IMF_local_loadout") then {
    player publicVariableClient ["IMF_local_loadout", true];
};

// ACE Medical bug temp fix - https://github.com/acemod/ACE3/pull/9145
if (player getVariable ["IMF_killed", false]) then {
    player setDamage 1;
} else {
    player setVariable ["ace_medical_causeOfDeath", nil];
};

player setVariable ["IMF_local_side", side player];
