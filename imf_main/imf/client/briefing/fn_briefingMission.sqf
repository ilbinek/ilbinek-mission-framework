/*
*
*	DOCS MAYBE SOMEDAY
*
*/

private _text = "";

// Add the max view distance
_text = _text + format ["View distance: <font color='#c7861b'>%1</font><br/>", IMF_max_view_distance];

// Add the warmup time
// _text = _text + format ["Warmup time <font color='#c7861b'>%1</font><br/>", IMF_warmup_time];

// Add mission start time
_text = _text + format ["Mission start: <font color='#c7861b'>%1</font><br/>", [IMF_wrarmup_start_time, "HH:MM"] call BIS_fnc_timeToString];

// Add mission duration
_text = _text + format ["Mission duration: <font color='#c7861b'>%1</font><br/>", [IMF_mission_duration, "HH:MM"] call BIS_fnc_secondstoString];

// Add if TI is disabled
private _str = "";
if (IMF_mission_ti_disable) then {
    _str = "Disabled";
} else {
    _str = "Enabled";
};
_text = _text + format ["Thermal imaging: <font color='#c7861b'>%1</font><br/>", _str];

private _author = getMissionConfigValue ["author", ""];
if (_author != "") then {
    // Add authors name
    _text = _text + format ["Author: <font color='#c7861b'>%1</font><br/>", _author];
};

player createDiaryRecord ["Diary", ["Mission parameters", _text]];
