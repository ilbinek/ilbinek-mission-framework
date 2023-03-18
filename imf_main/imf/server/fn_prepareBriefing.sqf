/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// Server only
if (!isServer) exitwith {};

IMF_briefing_data = [];

// Hold all data until made public
private _tmpData = [];

private _vehicles = [];
private _boxes = [];

// Pool all vehicles
{
	if ((_x isKindOf "Ship" || _x isKindof "Air" || _x isKindof "LandVehicle") && {!(_x isKindOf "Strategic") && !(_x isKindOf "Thing")}) then {
		//  It's a vehicle, let's add it
		_vehicles pushBack _x;
	} else {
		// It's a box, if it's empty, ignore it
		if (!(isNil {(weaponCargo _x + magazinecargo _x + itemCargo _x + backpackCargo _x)}) &&
            {count (weaponCargo _x + magazinecargo _x + itemCargo _x + backpackCargo _x) != 0}) then {
            _boxes pushBack _x;
        };
	};
} forEach vehicles;

// Get info of all vehicles
// Looks like - ["V", position, className, side, inventory, vehicle]
{
    _vehinfo = ["V"];
    _vehinfo pushback getPos _x;
    _vehinfo pushback typeOf _x;
    _side = _x getVariable ["IMF_side", [getNumber (configOf _x >> "side")] call BIS_fnc_sideType];
    _vehinfo pushback _side;
    _vehinfo pushBack (if (isNil {(weaponCargo _x + magazinecargo _x + itemCargo _x + backpackCargo _x)}) then {[]} else {(weaponCargo _x + magazinecargo _x + itemCargo _x + backpackCargo _x) call BIS_fnc_consolidateArray});
    _vehinfo pushBack true; // vehicle
    if (_x getVariable ["IMF_show", true]) then {
        _tmpData pushback _vehinfo;
    };
} foreach _vehicles;

// Get info of all boxes
// Looks like - ["V", position, className, side, inventory, vehicle]
{
    _vehinfo = ["V"];
    _vehinfo pushback getPos _x;
    _vehinfo pushback typeOf _x;
    // Side determined by the closest group
    private _allGroups = allGroups;
    private _veh = _x;
    _allGroups = [_allGroups,[],{_veh distance (leader _x)},"ASCEND"] call BIS_fnc_sortBy;
    _side = _x getVariable ["IMF_side", side (_allGroups select 0)];

    _vehinfo pushback _side;
    _vehinfo pushBack (if (isNil {(weaponCargo _x + magazinecargo _x + itemCargo _x + backpackCargo _x)}) then {[]} else {(weaponCargo _x + magazinecargo _x + itemCargo _x + backpackCargo _x) call BIS_fnc_consolidateArray});
    _vehinfo pushBack false; // box
    if (_x getVariable ["IMF_show", true]) then {
        _tmpData pushback _vehinfo;
    };
} foreach _boxes;

IMF_briefing_data = _tmpData;
publicVariable "IMF_briefing_data";
