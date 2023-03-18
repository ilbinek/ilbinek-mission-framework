/*
*
*	DOCS MAYBE SOMEDAY
*	
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"

waitUntil {sleep 1; time > 1};

//["WMT","ViewDistancePreset3",["Set view distace (preset 3)","Set view distace (preset 3)"],{[2] call IMF_fnc_setVDistance},{true},[61,[false,false,false]],false] call cba_fnc_addKeybind;
["IMF","short_long_distance", "Set view distance to long", {[0] call IMF_fnc_setVDistance}, "", [DIK_F1, [false, false, false]]] call CBA_fnc_addKeybind;
["IMF","short_medium_distance", "Set view distance to medium", {[1] call IMF_fnc_setVDistance}, "", [DIK_F2, [false, false, false]]] call CBA_fnc_addKeybind;
["IMF","short_view_distance", "Set view distance to low", {[2] call IMF_fnc_setVDistance}, "", [DIK_F3, [false, false, false]]] call CBA_fnc_addKeybind;

// Add keybind that will show your kills and your killer
["IMF","show_kills_and_killers", "Show kills and killer", {call IMF_fnc_showKills}, "", [DIK_END, [false, false, false]]] call CBA_fnc_addKeybind;

// Keybind to open admin menu
//(findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 199) then { call IMF_fnc_openMenu; };"];
["IMF","open_admin_menu", "Opens admin menu", {call IMF_fnc_openMenu}, "", [DIK_HOME, [false, false, false]]] call CBA_fnc_addKeybind;
//[DIK_HOME, [false, false, false], {call IMF_fnc_openMenu}] call CBA_fnc_addKeyHandler;
