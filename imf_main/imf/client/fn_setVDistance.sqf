/*
*
*	DOCS MAYBE SOMEDAY
*
*/

params ["_distance"];

player setVariable ["IMF_player_view_distance", _distance];
private _obj = 1;
private _ter = 1;
switch (_distance) do {
	case 0: {
		_obj = profilenamespace getVariable ["IMF_user_view_objects_0", 1];
		_ter = profilenamespace getVariable ["IMF_user_view_terrain", 1];
		hint "First preset of view distance";
	};

	case 1: {
		_obj = profilenamespace getVariable ["IMF_user_view_objects_1", 0.5];
		_ter = _obj;
		hint "Second preset of view distance";
	};

	case 2: {
		_obj = profilenamespace getVariable ["IMF_user_view_objects_2", 0.1];
		_ter = _obj;
		hint "Third preset of view distance";
	};
};

private _od = ((IMF_max_view_distance * _obj) min IMF_max_view_distance);
private _ter = ((IMF_max_view_terrain * _ter) min IMF_max_view_terrain);
if (_distance != 0) then {
	_ter = _od;
};
setObjectViewDistance _od;
setViewDistance _ter;
