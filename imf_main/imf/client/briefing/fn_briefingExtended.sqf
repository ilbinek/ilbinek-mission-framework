/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// Client only
if (!hasinterface) exitwith {};

private _friendlysides = [playerside] call BIS_fnc_friendlysides;
private _enemysides = [playerside] call BIS_fnc_enemysides;

private _friendlyVehs = [];
private _enemyVehs = [];

private _inventorytext = "";

private _fnc_getVehMarkername = {
    params ["_pos"];
    format ["IMF_Warmup_%1_%2", floor ((_pos select 0) * 10), floor ((_pos select 1) * 10)];
};

private _fnc_getItemConfig = {
    params ["_name"];
    private _cfgPath = "";
    switch (true) do {
        case (isClass (configFile / "Cfgweapons" / _name)) : {
            _cfgPath = "Cfgweapons";
        };
        case (isClass (configFile / "Cfgmagazines" / _name)) : {
            _cfgPath = "Cfgmagazines";
        };
        case (isClass (configFile / "Cfgvehicles" / _name)) : {
            _cfgPath = "Cfgvehicles";
        };
        case (isClass (configFile / "CfgGlasses" / _name)) : {
            _cfgPath = "CfgGlasses";
        };
    };
    private _image = gettext (configFile / _cfgPath / _name / "picture");
    private _text = gettext (configFile / _cfgPath / _name / "displayname");
    private _tooltip = gettext (configFile / _cfgPath / _name / "descriptionShort");
    [_image, _text, _tooltip, _cfgPath]
};

{
    // Might add other things in the future
    if ((_x select 0) == "V") then {
        private ["_pic", "_marker"];
        
        // Parse things inside the vehicle array
        _x params ["_type", "_pos", "_class", "_side", "_inv", "_isVeh"];
        // Get the name of the vehicle from it's config
        _vehname = format ["%1", gettext (configFile >> "Cfgvehicles" >> _class >> "displayname") ];
        // Get the picture associated with it
        _pic = gettext (configFile / "Cfgvehicles" / _class / "picture");
        // Workaround for ace medical I guess?
        if (_pic == "pictureThing") then {
            if ((_class == "ACE_medicalSupplyCrate")||(_class == "ACE_medicalSupplyCrate_advanced")) then {
                _pic = "\IMF\pic\medbox.paa"
            } else {
                _pic = "\A3\weapons_F\ammoboxes\data\ui\icomap_ammo_CA.paa"
            };
        };
        
        if (_side in _friendlysides) then {
            // inventory magic
            if (count _inv > 0) then {
                _inventorytext = _inventorytext + format ["<br/><img image='%2' height=24/> <marker name=%3><font color='#c7861b'>%1</font></marker><br/>",
                format ["%1", gettext (configFile >> "Cfgvehicles" >> _class >> "displayname") ], _pic, [_pos] call _fnc_getVehMarkerName];
                
                if (!isnil "_inv") then {
                    {
                        private _data = (_x select 0) call _fnc_getItemConfig;
                        _data params ["_pic", "_text", "_tooltip", "_cfgPath"];
                        _inventoryText = _inventoryText + format ["<img image='%1' height=24 style = 'border: 1px solid red;
                        '/>x%2 ", _pic, _x select 1];
                    } forEach _inv;
                };
                _inventoryText = _inventoryText + "<br/>";
            };
            // Add vehicle inside friendly list
            if (_isVeh) then {
                _friendlyVehs pushBack _class;
            };
        };
        
        // Add vehicle inside enemy list
        if (_side in _enemysides && _isVeh) then {
            _enemyVehs pushBack _class;
        };
    };
} forEach IMF_briefing_data;

// Create diary entry for friendly vehicles
private _text = "";

// Diary for enemy vehicles
if (count _enemyVehs != 0) then {
    _enemyVehs = _enemyVehs call BIS_fnc_consolidateArray;
    {
        _pic = gettext (configFile / "Cfgvehicles" / (_x select 0) / "picture");
        _vehname = format ["%1", gettext (configFile >> "Cfgvehicles" >> (_x select 0) >> "displayname") ];
        
        _text = _text + format ["<img image='%3' height=24/> %1 - <font color='#c7861b'>%2</font>", _vehname, _x select 1, _pic];
        _text = _text + "<br/>";
    } forEach _enemyVehs;
    
    player createDiaryRecord ["Diary", ["Enemy vehicles", _text]];
};

// Diary for friendly vehicles inventory
player createDiaryRecord ["Diary", ["Vehicle Inventory", _inventoryText]];

_text = "";
// Diary for friendly vehicles

private _tmp = if (side player == sideLogic) then {"Vehicles in mission"} else {"Friendly vehicles"};

if (count _friendlyVehs != 0) then {
    _friendlyVehs = _friendlyVehs call BIS_fnc_consolidateArray;
    {
        _pic = gettext (configFile / "Cfgvehicles" / (_x select 0) / "picture");
        _vehname = format ["%1", gettext (configFile >> "Cfgvehicles" >> (_x select 0) >> "displayname") ];
        
        _text = _text + format ["<img image='%3' height=24/> %1 - <font color='#c7861b'>%2</font>", _vehname, _x select 1, _pic];
        _text = _text + "<br/>";
    } forEach _friendlyVehs;
    
    player createDiaryRecord ["Diary", [_tmp, _text]];
};
