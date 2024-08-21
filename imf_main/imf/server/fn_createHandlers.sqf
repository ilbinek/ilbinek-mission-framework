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

/*addMissionEventHandler ["EntityKilled", {
    diag_log format ["[IMF] - EntityKilled: %1", _this];
	//_this call IMF_fnc_processKill;
}];*/

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
