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
[] spawn IMF_fnc_warmupStartServer;

// Freze AIs
call IMF_fnc_disableAI;

// Prepare briefing
call IMF_fnc_prepareBriefing;

// Generate frequencies
call IMF_fnc_generateFreqs;

// Disable thermal imaging
call IMF_fnc_disableTI;

// Generate objectives
call IMF_fnc_initObjectives;

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
}];

// Variable that will tell everyone that server finished init
missionNamespace setVariable ["IMF_server_init_finished", true, true];
