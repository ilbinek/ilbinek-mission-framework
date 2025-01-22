/*
	FILE: fn_setVehicleFreqs.sqf

	Name: IMF_fnc_setVehicleFreqs

	Author(s):
		ilbinek

	Description:
		Set's all vehicles to the correct frequency depending on their side

	Parameters:
		None

	Returns:
		Nothing

	Examples:
		> call IMF_fnc_setVehicleFreqs;

	Public:
		No
*/

// Get the correct freqs from frequency list
private _westFreq = "";
private _eastFreq = "";
private _restFreq = "";

{
	if (typeName (_x select 0) == "SIDE") then {
		if (_x select 0 == west) then {_westFreq = str((_x select 1) select 0)};
		if (_x select 0 == east) then {_eastFreq = str((_x select 1) select 0)};
		if (_x select 0 == resistance) then {_restFreq = str((_x select 1) select 0)};
	};	
} forEach IMF_frequencies;

waitUntil {sleep 1; time > 3};

{
	if ((_x isKindOf "Ship" || _x isKindof "Air" || _x isKindof "LandVehicle") && {!(_x isKindOf "Strategic") && !(_x isKindOf "Thing")}) then {
		if (_x call TFAR_fnc_hasVehicleRadio) then {
			private _side = _x getVariable ["IMF_side", [getNumber (configOf _x >> "side")] call BIS_fnc_sideType];
			private _radios = _x call TFAR_fnc_getVehicleRadios;
			{
				if (_side == west) then {
					[_x, _westFreq] call TFAR_fnc_setLrFrequency;
				} else if (_side == east) {
					[_x, _eastFreq] call TFAR_fnc_setLrFrequency;
				} else {
					[_x, _restFreq] call TFAR_fnc_setLrFrequency;
				};
			} foreach _radios;
		};
	};
} forEach vehicles;
