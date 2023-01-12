["Terminate"] call BIS_fnc_EGSpectator;
("IMF_spectatorUI" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
[player, 0] spawn BIS_fnc_traceBullets;
