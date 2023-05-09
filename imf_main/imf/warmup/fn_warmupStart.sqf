/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// Warmup states
/*
* 0 - ready to be initialised
* 1 - currently running
* 2 - finished
*/

if (IMF_warmup_state == 2) exitwith {};

private _startPos = getPos player;

// Make players invincible
player allowdamage false;

// Create warmup area marker
["spawn_AREA", player, "", "ColorGreen", "EMPTY", "ELLIPSE", [IMF_warmup_area, IMF_warmup_area]] call IMF_fnc_createlocalMarker;

// Create markers for side squads
local_group_markers = [];
// Create markers for vehicles
local_vehicle_markers = [];

private _fnc_getVehMarkername = {
    params ["_pos"];
    format ["IMF_Warmup_%1_%2", floor ((_pos select 0) * 10), floor ((_pos select 1) * 10)];
};

// Iterate through all groups
{
    // Check if side of group is the same as of player
    if (side _x == side player) then {
        // Same side, so create marker
        // Create a marker name out of group ID and leader, so it can be later referenced
        private _marker = format ["IMF_group_MARKER_%1_%2", groupid _x, leader _x];
        // Get the name of the leader, if it is not a player, leave it emtpy
        private _leader_name = "";
        if (isplayer leader _x) then {
            _leader_name = name leader _x;
        };
        // Get number of players in group
        private _cnt = 0;
        {
            if (isplayer _x) then {
                _cnt = _cnt + 1;
            };
        } forEach units _x;
        // Create the marker text out of group ID and leader name
        private _text = format ["%1 %2: %3", groupid _x, _leader_name, _cnt];
        // Get the position of the group leader
        private _pos = position leader _x;
        // Choose the color depending on side
        private _color = [side player, true] call BIS_fnc_sideColor;
        // Create the marker itself
        [_marker, _pos, _text, _color, "mil_dot", "ICON", [1, 1]] call IMF_fnc_createlocalMarker;
        // Add the marker into the array
        local_group_markers pushBack _marker;
    };
} forEach allgroups;

// If side logic, then add all groups
if (side player == sideLogic) then {
    // Iterate through all groups
    {
        // Same side, so create marker
        // Create a marker name out of group ID and leader, so it can be later referenced
        private _marker = format ["IMF_group_MARKER_%1_%2_%3", groupid _x, leader _x, side _x];
        // Get the name of the leader, if it is not a player, leave it emtpy
        private _leader_name = "";
        if (isplayer leader _x) then {
            _leader_name = name leader _x;
        };
        // Get number of players in group
        private _cnt = 0;
        {
            if (isplayer _x) then {
                _cnt = _cnt + 1;
            };
        } forEach units _x;
        // Create the marker text out of group ID and leader name
        private _text = format ["%1 %2: %3", groupid _x, _leader_name, _cnt];
        // Get the position of the group leader
        private _pos = position leader _x;
        // Choose the color depending on side
        private _color = [side _x, true] call BIS_fnc_sideColor;
        // Create the marker itself
        [_marker, _pos, _text, _color, "mil_dot", "ICON", [1, 1]] call IMF_fnc_createlocalMarker;
        // Add the marker into the array
        local_group_markers pushBack _marker;
    } forEach allgroups;
};

// Loop through all vehicles in IMF_briefing_data and create local markers for vehicles if the side is same, or all vehicles if player is sideLogic
{
    _x params ["_type", "_pos", "_class", "_side", "_inv", "_isVeh"];
    if (_isVeh) then {
        if (side player == _side || side player == sideLogic) then {
            private _marker = [_pos] call _fnc_getVehMarkername;
            private _text = format ["%1", gettext (configFile >> "Cfgvehicles" >> _class >> "displayname")];
            [_marker, _pos, _text, "ColorYellow", "mil_dot", "ICON", [1, 1]] call IMF_fnc_createLocalMarker;
            local_vehicle_markers pushBack _marker;
        };
    };
} forEach IMF_briefing_data;

// Takes care of disabling the engine during the warmup
imf_frozen_vehs = [];
private ["_evh", "_handler"];

// Add event handlers for every vehicle
{
    // if a vehicles fires, delete the projectile - should not be possible anyway, but rather be safe than sorry
    _evh = _x addEventHandler ["fired", {
        if (IMF_warmup_state != 2) then {
            deletevehicle (_this select 6);
        };
    }];
    _x setVariable ["gunSafety", _evh];
    imf_frozen_vehs pushBack _x;
    
    // if vehicle changes engine state to on, turn it off
    _handler = _x addEventHandler ["Engine", {
        _car = _this select 0;
        _engineOn = _this select 1;
        if ((IMF_warmup_state != 2) and local _car and _engineOn) then {
            player action ["engineoff", _car];
            _car engineOn false;
        };
    }];
    _x setVariable ["engineFrz", _handler];
} forEach vehicles;

// Freeze for everyone
if (IMF_warmup_freeze) then {
    player enableSimulation false;
    waitUntil {sleep 0.1, ["<t size='2' color='#7f0505' shadow=2>Simulation disabled<br/>Don't touch anything</t>", 0, 0, 2, 0, 0, 3222] spawn bis_fnc_dynamicText, !IMF_warmup_freeze};
    // Random wait for everyone
    sleep (random 10) + 2;
    player enableSimulation true;
};

// Add the ability for squad leaders to open inventories of their squadmates during warmup
// Create the action
private _inventoryAction = ["OpenInventory","Open Inventory","",{params ["_target", "_source"]; _source action ["Gear", _target];},{ params ["_target", "_source"]; IMF_warmup_state != 2 && leader _target == _source && !isPlayer _target}] call ace_interact_menu_fnc_createAction; 
{
    [_x, 0, ["ACE_MainActions"], _inventoryAction] call ace_interact_menu_fnc_addActionToObject;
} forEach units group player;

// A small script running during the warmup - backup engine disable, as zeus spawned vehicles aren't disabled
// Also takes care of deleting local warmup markers after the warmup end

while {IMF_warmup_state != 2} do {
    // Zone restrictions
    if ((_startPos distance player) > (IMF_warmup_area - 10)) then {
        hint "You're leaving the warmup area, please stop";
        if ((_startPos distance player) > (IMF_warmup_area)) then {
            player setPos _startPos;
        };
    };
    
    // Backup check for zeus spawned vehicles - does not work great, but better than nothing
    if (player != (vehicle player) and {
        local (vehicle player)
    } and {
        isEngineOn (vehicle player)
    }) then {
        (vehicle player) engineOn false;
    };
    sleep 0.5;
};

// ############ WARMUP ENEDED ############
// Turn off safety and engine freeze for frozen vehicles
{
    // Remove safety
    private _evh = _x getVariable "gunSafety";
    if (!isnil "_evh") then {
        _x removeEventHandler ["fired", _evh];
    };
    
    // Remove engine freeze
    _x removeEventHandler ["Engine", (_x getVariable ["engineFrz", 0])];
} forEach imf_frozen_vehs;

// Delete the local warmup area marker
deleteMarkerlocal "spawn_AREA";

// Delete the local groups markers
{
    // Current result is saved in variable _x
    deleteMarkerlocal _x;
} forEach local_group_markers;

// Delete the local vehicle markers
{
    // Current result is saved in variable _x
    deleteMarkerlocal _x;
} forEach local_vehicle_markers;

// Make player vincible
player allowdamage true;

// Revert the time to the one the mission started with
setDate IMF_start_time;
private _author = getMissionConfigValue ["author", ""];
private _name = getMissionConfigValue ["onLoadName", ""];

[_name, name player, format ["by %1", _author]] spawn BIS_fnc_infoText;

// Remove the option to open AIs inventory during warmup
{
    [_x,0,["ACE_MainActions","OpenInventory"]] call ace_interact_menu_fnc_removeActionFromObject;
} forEach units group player;
