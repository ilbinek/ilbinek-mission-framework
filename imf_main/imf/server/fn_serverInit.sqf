/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// Secondary check if called by server
if (!isServer) exitwith {};
// Check that init isn't run more than once
if (!isNil "IMF_server_init_ran") exitwith {};
missionnamespace setVariable ["IMF_server_init_ran", true, true];

// set all public vars
call IMF_fnc_initVars;

// spawn the thread taking care of warmup
missionNamespace setVariable ["IMF_warmup_freeze", true, true];
[] spawn IMF_fnc_warmupStartServer;

// Freze AIs
call IMF_fnc_disableAI;

// Prepare briefing
call IMF_fnc_prepareBriefing;

// Generate frequencies
call IMF_fnc_generateFreqs;

// TODO Set vehicle LR frequencies

// Disable thermal imaging
if (IMF_mission_ti_disable) then {
    call IMF_fnc_disableTI;
};

// Create event handlers
call IMF_fnc_createHandlers;

// Start the mission loop
call IMF_fnc_missionStart;

// Add handler to disabled AIs after people disconnect
addMissionEventHandler ["HandleDisconnect", {
    params ["_unit"];
    _unit disableAI "AUtoTARGET";
    _unit disableAI "TARGET";
    _unit disableAI "FSM";
    _unit disableAI "move";
    _unit stop true;
    _unit setBehaviour "CARELESS";
    _unit allowfleeing 0;
    _unit disableConversation true;
    _unit setVariable ["BIS_noCoreConversations", false];
    _unit setspeaker "NoVoice";
    true;
}];

// Variable that will tell everyone that server finished init
missionNamespace setVariable ["IMF_server_init_finished", true, true];

// Set terrain grid to 3.125
setTerrainGrid 3.125;
