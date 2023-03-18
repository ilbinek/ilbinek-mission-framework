/*
*
*	DOCS MAYBE SOMEDAY
*
*/

params ["_distance"];

player setVariable ["IMF_player_view_distance", _distance];

switch (_distance) do {
	case 0: {
		setObjectViewDistance IMF_max_view_distance;
		setViewDistance 10000;
	};

	case 1: {
		setObjectViewDistance (IMF_max_view_distance / 2);
		setViewDistance IMF_max_view_distance;
	};

	case 2: {
		setViewDistance ((IMF_max_view_distance / 4) min 200);
		setObjectViewDistance ((IMF_max_view_distance / 4) min 200);
	};
};
