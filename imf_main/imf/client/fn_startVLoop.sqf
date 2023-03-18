/*
*
*	DOCS MAYBE SOMEDAY
*
*/

[] spawn {
	while {true} do {
		sleep 1;
		private _distance = player getVariable ["IMF_player_view_distance", 0];
		private _o = getObjectViewDistance select 0;
		switch (_distance) do {
			case 0: {
				if (_o != IMF_max_view_distance || viewDistance != 10000) then {
					setObjectViewDistance IMF_max_view_distance;
					setViewDistance 10000;
				};
			};

			case 1: {
				if (_o != (IMF_max_view_distance / 2) || viewDistance != IMF_max_view_distance) then {
					setObjectViewDistance (IMF_max_view_distance / 2);
					setViewDistance IMF_max_view_distance;
				};
			};

			case 2: {
				if (_o != 200 || viewDistance != 200) then {
					setObjectViewDistance 200;
					setViewDistance 200;
				};
			};
		};
	};
};
