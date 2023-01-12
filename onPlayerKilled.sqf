// Move player into spectator
["Initialize", [player, [], true, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
sleep 2;
private _display = ["GetDisplay"] call BIS_fnc_EGSpectator;
_display displayAddEventHandler ["KeyDown", {call cba_events_fnc_keyHandlerDown}];
_display displayAddEventHandler ["KeyUp", {call cba_events_fnc_keyHandlerUp}];
// Spawn the spectator UI drawing;
[] spawn IMF_fnc_spectatorUI;
