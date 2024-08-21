/*
*
*	DOCS MAYBE SOMEDAY
*
*/

if (!hasInterface) exitWith {};

// Exit if I am not a spectator or I am not dead
if (side player == sideLogic || !alive player) then {
	// Show HUD with remaining time and alive players
	("IMF_spectatorUI" call BIS_fnc_rscLayer) cutRsc ["IMF_spectatorUIRsc", "PLAIN"];

	// Add keybinds to the spectator interface
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
} else {
	("IMF_spectatorUI" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
};
