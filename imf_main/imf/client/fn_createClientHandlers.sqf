/*
*
*	doCS MAYBE SOMEDAY
*
*/

// player hit
player addMPEventHandler ["MPHit", {
    params ["_unit", "_causedBy", "_damage", "_instigator"];
    private _text = format ["[IMF] - %1 hit by %2", name _unit, name _instigator];
    diag_log _text;
}];

// player killed
player addMPEventHandler ["MPKilled", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];
    private _text = format ["[IMF] - %1 killed by %2", name _unit, name _killer];
    diag_log _text;
    if (_unit == player) then {
        IMF_KILLER = name _killer;
    };
    if (_killer == player) then {
        IMF_KILLS pushBack name _unit;
    };
}];

// instead of onplayerKilled.sqf
player addEventHandler ["Killed", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];
    private _name = "KILLED_" + name player;
    missionnamespace setVariable [_name, true, true];
    // Start the spectator
    ["initialize", [player, [], true, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
    [] spawn {
        sleep 2;
        // Add cba key handlers
        private _display = ["GetDisplay"] call BIS_fnc_EGSpectator;
        _display displayAddEventHandler ["Keydown", {
            call cba_events_fnc_keyHandlerdown
        }];
        _display displayAddEventHandler ["KeyUp", {
            call cba_events_fnc_keyHandlerUp
        }];
    };
    // spawn the spectator UI drawing;
    [] spawn IMF_fnc_spectatorUI;
}];

player addEventHandler ["Respawn", {
    params ["_unit", "_corpse"];
    private _name = "KILLED_" + name player;
    missionnamespace setVariable [_name, false, true];
    // Turn off the spectator
    ["terminate"] call BIS_fnc_EGSpectator;
    // Turn off dead overlay
    ("IMF_spectatorUI" call BIS_fnc_rscLayer) cuttext ["", "PLAIN"];
}];

// player went uncon
["ace_unconscious", {
    params ["_unit", "_state"];
    if (_unit != player) exitwith {};
    if (_state) then {
        player setVariable ["IMF_OLD_group", group player];
        if (isnil "IMF_GLOBAL_CIVIL") then {
            _group = creategroup civilian;
            missionnamespace setVariable ["IMF_GLOBAL_CIVIL", _group, true];
        };
        [player] joinSilent IMF_GLOBAL_CIVIL;
    } else {
        _group = player getVariable "IMF_OLD_group";
        if (isNull _group) then {
            _group = creategroup (player getVariable "IMF_local_side");
        };
        [player] joinSilent _group;
    };
}] call CBA_fnc_addEventHandler;

// Add view distance changes to zeus spectators
["ace_spectator_displayloaded", {
    params ["_display"];
    _display displayAddEventHandler ["Keydown", {
        call cba_events_fnc_keyHandlerdown
    }];
    _display displayAddEventHandler ["KeyUp", {
        call cba_events_fnc_keyHandlerUp
    }];
}] call CBA_fnc_addEventHandler;

// Good way to show a hint if a player recieved a message from admin
["IMF_CHAT_UPdate", {
    params ["_sender", "_text"];
    hint format ["New message from %1: %2", _sender, _text];
}] call CBA_fnc_addEventHandler;

// Rewrote it to CBA - God bless them I guess eh?
private _uid = getplayerUID player;
if (serverCommandAvailable "#kick" or _uid == "76561197993230499" or _uid == "76561198018749868") then {
    ["IMF_admin_CHAT_UPdate", {
        params ["_sender", "_text"];
        hint format ["New message from %1: %2", _sender, _text];
    }] call CBA_fnc_addEventHandler;
};

["IMF_Freeze", {
    [{
        titleText ["<t color='#ff0000' size='8'>Freeze starting in 10!</t><br/>", "PLAIN", 0.5, true, true];
    }, [], 1] call CBA_fnc_waitandexecute;
    
    [{
        titleText ["<t color='#ff0000' size='8'>Freeze starting in 9!</t><br/>", "PLAIN", 0.5, true, true];
    }, [], 2] call CBA_fnc_waitandexecute;
    
    [{
        titleText ["<t color='#ff0000' size='8'>Freeze starting in 8!</t><br/>", "PLAIN", 0.5, true, true];
    }, [], 3] call CBA_fnc_waitandexecute;
    
    [{
        titleText ["<t color='#ff0000' size='8'>Freeze starting in 7!</t><br/>", "PLAIN", 0.5, true, true];
    }, [], 4] call CBA_fnc_waitandexecute;
    
    [{
        titleText ["<t color='#ff0000' size='8'>Freeze starting in 6!</t><br/>", "PLAIN", 0.5, true, true];
    }, [], 5] call CBA_fnc_waitandexecute;
    
    [{
        titleText ["<t color='#ff0000' size='8'>Freeze starting in 5!</t><br/>", "PLAIN", 0.5, true, true];
    }, [], 6] call CBA_fnc_waitandexecute;
    
    [{
        titleText ["<t color='#ff0000' size='8'>Freeze starting in 4!</t><br/>", "PLAIN", 0.5, true, true];
    }, [], 7] call CBA_fnc_waitandexecute;
    
    [{
        titleText ["<t color='#ff0000' size='8'>Freeze starting in 3!</t><br/>", "PLAIN", 0.5, true, true];
    }, [], 8] call CBA_fnc_waitandexecute;
    
    [{
        titleText ["<t color='#ff0000' size='8'>Freeze starting in 2!</t><br/>", "PLAIN", 0.5, true, true];
    }, [], 9] call CBA_fnc_waitandexecute;
    
    [{
        titleText ["<t color='#ff0000' size='8'>Freeze starting in 1!</t><br/>", "PLAIN", 0.5, true, true];
    }, [], 10] call CBA_fnc_waitandexecute;
    
    [{
        player enableSimulation false;
        titleText ["<t color='#e5eb34' size='3'>Simulation disabled<br/>doN'T toUCH ANYTHinG</t><br/>", "PLAIN", -1, true, true];
    }, [], 10] call CBA_fnc_waitandexecute;
}] call CBA_fnc_addEventHandler;

["IMF_Unfreeze", {
    if (simulationEnabled player) exitwith {};
    
    [{
        titleText ["<t color='#15d625' size='3'>Simulation enabled in 5</t><br/>", "PLAIN", -1, true, true];
    }, [], 1] call CBA_fnc_waitandexecute;
    
    [{
        titleText ["<t color='#15d625' size='3'>Simulation enabled in 4</t><br/>", "PLAIN", -1, true, true];
    }, [], 1] call CBA_fnc_waitandexecute;
    
    [{
        titleText ["<t color='#15d625' size='3'>Simulation enabled in 3</t><br/>", "PLAIN", -1, true, true];
    }, [], 1] call CBA_fnc_waitandexecute;
    
    [{
        titleText ["<t color='#15d625' size='3'>Simulation enabled in 2</t><br/>", "PLAIN", -1, true, true];
    }, [], 1] call CBA_fnc_waitandexecute;
    
    [{
        titleText ["<t color='#15d625' size='3'>Simulation enabled in 1</t><br/>", "PLAIN", -1, true, true];
    }, [], 1] call CBA_fnc_waitandexecute;
    
    [{
        titleText ["", "PLAIN", -1, true, true];
        player enableSimulation true;
    }, [], 1] call CBA_fnc_waitandexecute;
}] call CBA_fnc_addEventHandler;
