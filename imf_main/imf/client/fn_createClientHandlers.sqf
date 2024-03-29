/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// Player hit
player addMPEventHandler ["MPHit", {
	params ["_unit", "_causedBy", "_damage", "_instigator"];
	private _text = format ["[IMF] - %1 hit by %2", name _unit, name _instigator];
	diag_log _text;
}];

// Player killed
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

// Instead of onPlayerKilled.sqf
player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	private _name = "KILLED_" + name player;
	missionNamespace setVariable [_name, true, true];
	// Start the spectator
	["Initialize", [player, [], true, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
	[] spawn {
		sleep 2;
		// Add cba key handlers
		private _display = ["GetDisplay"] call BIS_fnc_EGSpectator;
		_display displayAddEventHandler ["KeyDown", {call cba_events_fnc_keyHandlerDown}];
		_display displayAddEventHandler ["KeyUp", {call cba_events_fnc_keyHandlerUp}];
	};
	// Spawn the spectator UI drawing;
	[] spawn IMF_fnc_spectatorUI;
}];

player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	private _name = "KILLED_" + name player;
	missionNamespace setVariable [_name, false, true];
	// Turn off the spectator
	["Terminate"] call BIS_fnc_EGSpectator;
	// Turn off dead overlay
	("IMF_spectatorUI" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
}];

// Player went uncon
["ace_unconscious", {
	params ["_unit", "_state"];
	if (_unit != player) exitWith {};
	if (_state) then {
		player setVariable ["IMF_OLD_GROUP", group player];
		if (isNil "IMF_GLOBAL_CIVIL") then {
			_group = createGroup civilian;
			missionNamespace setVariable ["IMF_GLOBAL_CIVIL", _group, true];
		};
		[player] joinSilent IMF_GLOBAL_CIVIL;
	} else {
		_group = player getVariable "IMF_OLD_GROUP";
		if (isNull _group) then {
			_group = createGroup (player getVariable "IMF_local_side");
		};
		[player] joinSilent _group;
	};
}] call CBA_fnc_addEventHandler;

// Add view distance changes to zeus spectators
["ace_spectator_displayLoaded", {params ["_display"]; _display displayAddEventHandler ["KeyDown", {call cba_events_fnc_keyHandlerDown}];
_display displayAddEventHandler ["KeyUp", {call cba_events_fnc_keyHandlerUp}];}] call CBA_fnc_addEventHandler;

// Good way to show a hint if a player recieved a message from admin
["IMF_CHAT_UPDATE", {
	params ["_sender", "_text"];
	hint format ["New message from %1: %2", _sender, _text];
}] call CBA_fnc_addEventHandler;

// Rewrote it to CBA - God bless them I guess eh?
private _uid = getPlayerUID player;
if (serverCommandAvailable "#kick" or _uid == "76561197993230499" or _uid == "76561198018749868") then {
	["IMF_ADMIN_CHAT_UPDATE", {
		params ["_sender", "_text"];
		hint format ["New message from %1: %2", _sender, _text];
	}] call CBA_fnc_addEventHandler;
};
