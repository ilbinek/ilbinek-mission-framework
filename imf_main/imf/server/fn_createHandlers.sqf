/*
*
*	doCS MAYBE SOMEDAY
*
*/

// player connected event handler
addMissionEventHandler ["playerConnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
    // log that player connected
    private _text = format ["[IMF] - player connected: %1 - %2 - JIP: %3", _name, _uid, if (_jip) then {
        "Yes"
    } else {
        "No"
    }];
    diag_log _text;
}];

// player disconnected event handler
addMissionEventHandler ["playerDisconnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
    private _text = format ["[IMF] - player disconnected: %1 - %2 - JIP: %3", _name, _uid, if (_jip) then {
        "Yes"
    } else {
        "No"
    }];
    diag_log _text;
}];

// Make sure people in vehicles that blow up die
addMissionEventHandler ["EntityKilled", {
    params ["_vehicle", "_killer", "_instigator", "_useEffects"];
    
    // Taken from ACE - medical_engine - XEH_postinit.sqf
    // Check if destruction effects are enabled
    if (!_useEffects || {
        (gettext (configOf _vehicle >> "destrtype")) == ""
    }) exitwith {};
    
    // Check if 'vehicle' is an actual vehicle (look for a driver position)
    if ((fullCrew [_vehicle, "driver", true]) isEqualto []) exitwith {};
    
    // don't kill UAV crews
    if (unitIsUAV _vehicle) exitwith {};
    
    // don't kill units in parachutes
    if (_vehicle isKindOf "ParachuteBase") exitwith {};
    
    {
        ["ace_medical_woundReceived", [_x, ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"] apply {
            [(random [0.5, 0.75, 1]) * 10, _x, 0]
        }, _instigator, "explosive"], _x] call CBA_fnc_targetEvent;
        [_x, "#setDead", _instigator] remoteExecCall ["ace_medical_status_fnc_setDead", _x];
    } forEach (crew _vehicle);
}];

["IMF_Freeze", {
    [{
        {
            if (simulationEnabled _x) then {
                _x enableSimulationGlobal false;
            };
        } forEach vehicles;
    }, [], 10] call CBA_fnc_waitandexecute;
}] call CBA_fnc_addEventHandler;

["IMF_Unfreeze", {
    [{
        {
            _x enableSimulationGlobal true;
        } forEach vehicles;
    }, [], 5] call CBA_fnc_waitandexecute;
}] call CBA_fnc_addEventHandler;
