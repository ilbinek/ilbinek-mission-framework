/*
	FILE: fn_processKill.sqf

	Name: IMF_fnc_processKill

	Author(s):
		ilbinek

	Description:
		Processes kill event of an entity. Mainly used to handle kill feed.

	Parameters:
		0: OBJECT - Entity that was killed
		1: OBJECT - Entity that killed the first entity
		2: OBJECT - Entity that pulled the trigger

	Returns:
		Nothing

	Examples:
		> call IMF_fnc_processKill;

	Public:
		No
*/
diag_log "IMF_fnc_processKill1";
params ["_victim", "_killer", "_instigator"];
diag_log "IMF_fnc_processKill2";

// Get the real killer
[_victim, _killer] spawn {
	diag_log "IMF_fnc_processKill - _victim, _killer";
	params ["_victim", "_killer"];
	if (_killer == _victim) then {
		private _time = diag_ticktime;
	    [_victim, {
            _this setVariable ["ace_medical_lastdamageSource", (_this getVariable "ace_medical_lastdamageSource"), 2];
        }] remoteExec ["call", _victim];
        waitUntil {
            diag_ticktime - _time > 3 || !(isnil {
                _victim getVariable "ace_medical_lastdamageSource"
            });
        };
        _killer = _victim getVariable ["ace_medical_lastdamageSource", _killer];
    };

	private _colorKiller = ["#0000FF", "#FF0000"] select (side group _killer == west);
	private _colorVictim = ["#0000FF", "#FF0000"] select (side group _victim == west);

	// Add text
	private _tmp = format ["<t size = '0.75' color = '%1'>%2</t> <t size = '0.5' color = '#FFFFFF'>killed</t> <t size = '0.75' color = '%3'>%4</t>", _colorKiller, name _killer, _colorVictim, name _victim];

	// Add kill feed
	IMF_KILL_FEED pushBack _tmp;
	publicVariable "IMF_KILL_FEED";

	[
		{
			IMF_KILL_FEED deleteAt 0;
			publicVariable "IMF_KILL_FEED";
		},
		[],
		10
	] call CBA_fnc_waitAndExecute;
};
