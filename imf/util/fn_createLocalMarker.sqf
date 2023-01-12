/*
*
*	DOCS MAYBE SOMEDAY
*
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
