/*
*
*    DOCS MAYBE SOMEDAY
*
*/
params ["_logic", "_units", "_activated"];

private _unit = _logic getVariable "Owner";
if (_unit != vehicleVarName player) exitWith {};

private _points = (_logic getVariable "Positions") splitString ", ";
private _v = (_logic getVariable "Vehicles") splitString ", ";
private _vehicles = [];

{
    _vehicles pushBack (missionNamespace getVariable _x);
} forEach _v;


[_points, _vehicles] spawn {
    params ["_points", "_vehicles"];
    // Not needed when on dedi, but well, I am testing on local
    waitUntil {sleep 0.5; !isNil "IMF_warmup_state"};

    if (IMF_warmup_state == 2) exitWith {};

    private _ids = [];

    IMF_player_spawnLoc = -1;
    private _cntr = 0;
    {
        private _id = player addAction ["Spawn: " + markerText _x, {IMF_player_spawnLoc = _this select 3;}, _cntr];
        _ids pushBack _id;
        _cntr = _cntr + 1;
    } forEach _points;

    // Wait for warmup end
    waitUntil {sleep 0.5; IMF_warmup_state == 2};

    if (IMF_player_spawnLoc != -1) then {
        private _marPos = getMarkerPos (_points select IMF_player_spawnLoc);
        // Teleport
        {    
            if (vehicle _x == _x) then {
                private _pos = ([_marPos, 1, 10, 3, 0, 20, 0] call BIS_fnc_findSafePos);
                _x allowDamage false;
                _x setPos _pos;
            }
        } forEach units group player;

        {
            private _pos = ([_marPos, 5, 25, 7, 0, 5, 0] call BIS_fnc_findSafePos);
            _x allowDamage false;
            _x setPos _pos;
        } forEach _vehicles;

        sleep 1;

        {
            _x allowDamage true;
        } forEach units group player;

        {
            _x allowDamage true;
        } forEach _vehicles;
    };

    {
        player removeAction _x;
    } forEach _ids;
};
