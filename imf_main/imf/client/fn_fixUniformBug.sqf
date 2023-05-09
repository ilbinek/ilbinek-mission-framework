if not (isNull (vestContainer player)) then {
    private ["_vest", "_vestItems", "_vestmagaiznes"];
    _vest = vest player;
    _vestItems = vestItems player;
    _vestmagaiznes = magazinesAmmoCargo (vestContainer player);
    removevest player;
    
    player addvest _vest;
    {
        if not (isClass (configFile >> "cfgmagazines" >> _x)) then
        {
            player addItemtovest _x;
        };
    } forEach _vestItems;
    {
        (vestContainer player) addMagazineammoCargo [_x select 0, 1, _x select 1];
    } forEach _vestmagaiznes;
};

// ===========================

if not (isNull (uniformContainer player)) then {
    private ["_uniform", "_uniformItems", "_uniformmagaiznes"];
    _uniform = uniform player;
    _uniformItems = uniformItems player;
    _uniformmagaiznes = magazinesAmmoCargo (uniformContainer player);
    removeuniform player;
    
    player forceAdduniform _uniform;
    {
        if not (isClass (configFile >> "cfgmagazines" >> _x)) then
        {
            player addItemtouniform _x;
        };
    } forEach _uniformItems;
    
    {
        (uniformContainer player) addMagazineammoCargo [_x select 0, 1, _x select 1];
    } forEach _uniformmagaiznes;
};
