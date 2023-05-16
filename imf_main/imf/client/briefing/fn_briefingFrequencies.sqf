/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// Check if client
if (!hasInterface) exitWith {};

private _sideToColor = {
	switch(_this select 0) do {
		case WEST:{"#288cf0"};
		case EAST:{"#cd2e2e"};
		default{"#ececec"};
	};
};


// Function that will create the text based on type of frequency - either side or squad - called with every array in IMF_frequencies
private _textFreq = {
	private _str = _this;
	private _ret = "";
	private _freqArr = _str select 1;

	// Determine if this frequency is side or squad
	switch (typeName (_str select 0)) do {
		case ("SIDE"): {
			_ret = format ["<font>LR: %1 MHz    (%2,   %3,   %4 MHz)</font><br/><br/>", _freqArr select 0, _freqArr select 1, _freqArr select 2, _freqArr select 3];
		};
		case ("GROUP") : {
			private _leader = leader (_str select 0);
			private _color = [side (_str select 0)] call _sideToColor;
			if (group player == _str select 0) then {
				_color = "#c7861b";
			};
			_ret = format["<font color ='%1'>%2: %3</font><br/>", _color, groupID (_str select 0), if (isPlayer _leader) then {name _leader} else {""}];
			_ret = _ret + format["%1 MHz    (%2,   %3,   %4 MHz)<br/><br/>", _freqArr select 0, _freqArr select 1, _freqArr select 2, _freqArr select 3];
		};
	};

	// Return the generated text
	_ret
};

private _text = "";

{
	// If side is same as of player or group side is same, print freqs
	switch (typeName (_x select 0)) do {
		case ("SIDE"): {
			if ((_x select 0) == side player) then {
				_text = _text + (_x call _textFreq);
			}; 
		};
		case ("GROUP") : {
			if (side (_x select 0) == side player) then {
				_text = _text + (_x call _textFreq);
			}; 
		};
	};
} forEach IMF_frequencies;

player createDiaryRecord ["Diary", ["Frequencies", _text]];
