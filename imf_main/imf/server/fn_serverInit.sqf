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

// Make sure people in vehicles that blow up die
addMissionEventHandler ["EntityKilled", {
    params ["_vehicle", "_killer", "_instigator", "_useEffects"];

    // Taken from ACE - medical_engine - XEH_postInit.sqf
    // Check if destruction effects are enabled
    if (!_useEffects || {(getText (configOf _vehicle >> "destrType")) == ""}) exitWith {};

    // Check if 'vehicle' is an actual vehicle (look for a driver position)
    if ((fullCrew [_vehicle, "driver", true]) isEqualTo []) exitWith {};

    // Don't kill UAV crews
    if (unitIsUAV _vehicle) exitWith {};

    // Don't kill units in parachutes
    if (_vehicle isKindOf "ParachuteBase") exitWith {};

    {
        ["ace_medical_woundReceived", [_x, ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"] apply {[(random [0.5, 0.75, 1]) * 10, _x, 0]}, _instigator, "explosive"], _x] call CBA_fnc_targetEvent;
        [_x, "#setDead", _instigator] remoteExecCall ["ace_medical_status_fnc_setDead", _x];
    } forEach (crew _vehicle);
}];

// Variable that will tell everyone that server finished init
missionNamespace setVariable ["IMF_server_init_finished", true, true];
