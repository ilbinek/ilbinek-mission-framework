#define IDC_OPTIONS_TERRAIN_0	62001
#define IDC_OPTIONS_OBJECT_0	62002
#define IDC_OPTIONS_TERRAIN_1	62003
#define IDC_OPTIONS_OBJECT_1	62004
#define IDC_OPTIONS_TERRAIN_2	62005
#define IDC_OPTIONS_OBJECT_2	62006

params ["_event", "_nbr", "_obj"];

switch (_event) do {
	case "init": {
		private _dialog = _obj select 0;
		// Set sliders to proper values
		(_dialog displayCtrl IDC_OPTIONS_TERRAIN_0) sliderSetPosition ((profileNamespace getVariable ["IMF_user_view_terrain_0", 1]) * 100);
		(_dialog displayCtrl IDC_OPTIONS_OBJECT_0) sliderSetPosition ((profileNamespace getVariable ["IMF_user_view_objects_0", 1]) * 100);
		(_dialog displayCtrl IDC_OPTIONS_TERRAIN_1) sliderSetPosition ((profileNamespace getVariable ["IMF_user_view_terrain_1", 0.5]) * 100);
		(_dialog displayCtrl IDC_OPTIONS_OBJECT_1) sliderSetPosition ((profileNamespace getVariable ["IMF_user_view_objects_1", 0.5]) * 100);
		(_dialog displayCtrl IDC_OPTIONS_TERRAIN_2) sliderSetPosition ((profileNamespace getVariable ["IMF_user_view_terrain_2", 0.1]) * 100);
		(_dialog displayCtrl IDC_OPTIONS_OBJECT_2) sliderSetPosition ((profileNamespace getVariable ["IMF_user_view_objects_2", 0.1]) * 100);
	};

	case "setTerrain": {
		private _val = (_obj select 1) / 100;
		_val = _val max 0.01;
		profileNamespace setVariable ["IMF_user_view_terrain", _val];
		[_nbr] call IMF_fnc_setVDistance;
	};

	case "setObject": {
		private _val = (_obj select 1) / 100;
		_val = _val max 0.01;
		switch (_nbr) do {
			case 0: {
				profileNamespace setVariable ["IMF_user_view_objects_0", _val];
			};
			case 1: {
				profileNamespace setVariable ["IMF_user_view_objects_1", _val];
			};
			case 2: {
				profileNamespace setVariable ["IMF_user_view_objects_2", _val];
			};
		};
		[_nbr] call IMF_fnc_setVDistance;
	};
};
