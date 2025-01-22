/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// Check if TFAR is loaded
if (!isClass (configFile >> "CfgPatches" >> "task_force_radio_items")) exitWith {};

// Server only and only once
if (!isServer || !isNil "IMF_frequencies") exitWith {};

// This will hold all the frequencies
IMF_frequencies = [];
publicVariable "IMF_frequencies";

// Array of already used frequencies, so they don't match - available serverwide, so it's easier to deal with
IMF_usedFreqs = [];

// This will generate 4 frequencies and return them as array
private _fncGenFreqArray = {
	params ["_isLR"];

	// Limits for LR radios
	private _minFreq = 30;
	private _maxFreq = 87;

	if (!_isLR) then {
		// Short range, so change limits
		_minFreq = 100;
		_maxFreq = 511;
	};

	// Generate the array itself
	private _return = [];
	for "_i" from 0 to 3 do {
		private _finished = false;
		private _freq = _minFreq;
		while {!_finished} do {
			_freq = round (((random (_maxFreq - _minFreq)) + _minFreq) * 10) / 10; 
			if (!(_freq in IMF_usedFreqs)) then {
				IMF_usedFreqs pushBack _freq;
				_finished = true;
			};
		};
		_return pushBack _freq;
	};
	_return
};

// Generate LR frequencies
{
	private _freqs = [true] call _fncGenFreqArray;
	IMF_frequencies pushBack [_x, _freqs];
} forEach [west, east, resistance];

// IMF_frequencies now contains:
//	[west, [freq1, freq2, freq3, freq4]]
//	[east, [freq1, freq2, freq3, freq4]]
//	[resistance, [freq1, freq2, freq3, freq4]]

// Generate SR freqs per squad and inject the first one into SR settings
{
	// Generate new SR frequencies for this group
	private _freqs = [false] call _fncGenFreqArray;
	// Add these freqs into the global array
	IMF_frequencies pushBack [_x, _freqs];

	// Rename the group to the correct name after the @ in the leaders description. If no @ found keep it default?
	private _lead = leader _x;
	private _desc = roleDescription _lead;
	if (_desc != "") then {
		private _nbr = _desc find "@";
		if (_nbr >= 0) then {
			_x setGroupIdGlobal [(_desc select [_nbr + 1])];
		};
	};
} forEach allGroups;

publicVariable "IMF_frequencies";
