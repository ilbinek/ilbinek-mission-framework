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

// execute warmup
[] spawn IMF_fnc_warmupStart;

// Create briefing
call IMF_fnc_createBriefing;

// Show timer during warmup
[] spawn IMF_fnc_warmupUI;

// Disabled AIs
call IMF_fnc_disableAI;

// if spectating or dead, start drawing spectator UI, otherwise this will exit
[] spawn IMF_fnc_spectatorUI;

// set correct frequencies on radios (requires TFAR Beta)
// Adds an CBA event handler, TFAR_event_OnradiosReceived is fired by TFAR addon for local client when is radios
// are done inicialising and you can have fun with them
["TFAR_event_OnradiosReceived", {
    [{
        call IMF_fnc_setradioFreqs;
        // Temporary fix for TFAR bug
        ["noAutomoveSpectator", true] call TFAR_fnc_setPluginSetting;
        // Temporary fix for TFAR bug 
        ["allowDebugging", false] call TFAR_fnc_setPluginSetting; 
    }, [], 1] call CBA_fnc_waitandexecute;
}] call CBA_fnc_addEventHandler;

// Add keybinds to change view distance and admin menu
[] spawn IMF_fnc_addKeybinds;

// Add player handlers
call IMF_fnc_createClientHandlers;

// set view distance to the shortest
[2] call IMF_fnc_setVdistance;

// Add array that stores my kills
IMF_KILLS = [];
IMF_KILLER = "";

// Add TBD guide
call IMF_fnc_showGuide;

_load = player getVariable ["IMF_local_loadout", []];

// Save the current loadout as local variable if it hasn't been set before
if (count _load == 0) then {
    player setVariable ["IMF_local_loadout", getUnitloadout player, true];
};

player setVariable ["IMF_local_side", side player];

// ACE Medical bug temp fix - https://github.com/acemod/ACE3/pull/9145
private _name = "KILLED_" + name player;
if (missionNamespace getVariable [_name, false]) then {
    player setDamage 1;
} else {
    player setVariable ["ace_medical_causeOfDeath", nil];
};

if (!alive player) then {
    diag_log "IMF: Player is dead";
    [] spawn IMF_fnc_spectatorUI;
};

// Set terraing grid to 3.125
setterraingrid 3.125;
