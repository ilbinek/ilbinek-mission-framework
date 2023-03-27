if not (isNull (vestContainer cursorTarget)) then {
    private ["_vest", "_vestItems", "_vestmagaiznes"];
    _vest = vest cursorTarget;
    _vestItems = vestItems cursorTarget;
    _vestmagaiznes = magazinesAmmoCargo (vestContainer cursorTarget);
    removevest cursorTarget;
    
    cursorTarget addvest _vest;
    {
        if not (isClass (configFile >> "cfgmagazines" >> _x)) then
        {
            cursorTarget addItemtovest _x;
        };
    } forEach _vestItems;
    {
        (vestContainer cursorTarget) addMagazineammoCargo [_x select 0, 1, _x select 1];
    } forEach _vestmagaiznes;
};

// ===========================

if not (isNull (uniformContainer cursorTarget)) then {
    private ["_uniform", "_uniformItems", "_uniformmagaiznes"];
    _uniform = uniform cursorTarget;
    _uniformItems = uniformItems cursorTarget;
    _uniformmagaiznes = magazinesAmmoCargo (uniformContainer cursorTarget);
    removeuniform cursorTarget;
    
    cursorTarget forceAdduniform _uniform;
    {
        if not (isClass (configFile >> "cfgmagazines" >> _x)) then
        {
            cursorTarget addItemtouniform _x;
        };
    } forEach _uniformItems;
    
    {
        (uniformContainer cursorTarget) addMagazineammoCargo [_x select 0, 1, _x select 1];
    } forEach _uniformmagaiznes;
};
