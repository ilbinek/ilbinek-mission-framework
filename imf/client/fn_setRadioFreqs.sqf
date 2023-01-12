/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// Check if TFAR is loaded
if (!isClass (configFile >> "CfgPatches" >> "task_force_radio_items")) exitwith {};

// Check if client
if (!hasInterface) exitWith {};

//waitUntil {sleep 1; tfar_core_instanciationisready};

// Only setup LR if player has one
if (call TFAR_fnc_haveLRRadio) then {
	// Get side first frequency
	private _freq = "";
	{
		if (typeName (_x select 0) == "SIDE") then {
			if (_x select 0 == side player) then {_freq = (_x select 1) select 0};
		};	
	} forEach IMF_frequencies;

	// Set the LR channel 1 to this frequency
	str(_freq) call TFAR_fnc_setLongRangeRadioFrequency;

	// Set right ear only for LR if player has SR
	if (call TFAR_fnc_haveSWRadio) then {
		[call TFAR_fnc_activeLrRadio, 2] call TFAR_fnc_setLrStereo;
	};
};

// Only setup SR if player has one
if (call TFAR_fnc_haveSWRadio) then {
	// Get the group first frequency
	private _freq = "";
	{
		if (typeName (_x select 0) == "GROUP") then {
			if (_x select 0 == group player) then {_freq = (_x select 1) select 0};
		};	
	} forEach IMF_frequencies;

	// Set the SR channel 1 to this frequency
	str(_freq) call TFAR_fnc_setPersonalRadioFrequency;

	// Set right ear only for SR if player has LR
	if (call TFAR_fnc_haveLRRadio) then {
		[call TFAR_fnc_activeSWRadio, 1] call TFAR_fnc_setSwStereo;
	};
};
