/*
	FILE: fn_createLocalMarker.sqf

	Name: IMF_fnc_createLocalMarker

	Author(s):
		ilbinek

	Description:
		Creates a local marker

	Parameters:
		_name	- STRING - Name of the marker
		_pos	- ARRAY - Position of the marker
		_text	- STRING - Text of the marker
		_color	- STRING - Color of the marker
		_type	- STRING - Type of the marker
		_shape	- STRING - Shape of the marker
		_size	- NUMBER - Size of the marker

	Returns:
		OBJECT - Marker object

	Examples:
		> ["markerName", [0,0,0], "Marker text", "ColorRed", "mil_dot", "RECTANGLE", 1] call IMF_fnc_createLocalMarker;

	Public:
		Yes
*/

// TODO: Add default variables
params ["_name", "_pos", "_text", "_color", "_type", "_shape", "_size"];

// Create marker itself
_marker = createMarkerLocal [_name, _pos];

// Set the marker properties
_marker setMarkerTextLocal _text;
_marker setMarkerColorLocal _color;
_marker setMarkerTypeLocal _type;
_marker setMarkerShapeLocal _shape;
_marker setMarkerSizeLocal _size;

_marker
