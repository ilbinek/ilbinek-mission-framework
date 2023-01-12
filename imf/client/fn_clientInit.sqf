/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// Secondary check if called by client
if (!hasInterface) exitWith {};

// Wait for server to finish initialising
waitUntil {!isNil "IMF_server_init_finished"};

// Create briefing
call IMF_fnc_createBriefing;

// Execute warmup
[] spawn IMF_fnc_warmupStart;

// Show timer during warmup
[] spawn IMF_fnc_warmupUI;

// Disabled AIs
call IMF_fnc_disableAI;

// If spectating or dead, start drawing spectator UI, otherwise this will exit
[] spawn IMF_fnc_spectatorUI;

// Set correct frequencies on radios (requires TFAR)
// Adds an CBA event handler, TFAR_event_OnRadiosReceived is fired by TFAR addon for local client when is radios
// are done inicialising and you can have fun with them
["TFAR_event_OnRadiosReceived", {
  [{
    call IMF_fnc_setRadioFreqs;
  },[],1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;


// Add keybinds to change view distance and admin menu
[] spawn IMF_fnc_addKeybinds;

// Add player handlers
call IMF_fnc_createClientHandlers;

// Set view distance to the shortest
[2] call IMF_fnc_setVDistance;

// Start view distance loop
call IMF_fnc_startVLoop;

// Start the client loop
call IMF_fnc_clientLoop;

// Add array that stores my kills
IMF_KILLS = [];
IMF_KILLER = "";

// Add fix uniform bug into ace self interaction menu
private _action = [
  "FixUniformBug",
  "Fix Uniform Bug",
  "",
  {call IMF_fnc_fixUniformBug},
  {true}
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

// Save the current loadout as local variable
IMF_LOCAL_LOADOUT = getUnitLoadout player;
(owner player) publicVariableClient "IMF_LOCAL_LOADOUT";
