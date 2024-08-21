#define IMF_RSC_TIME 	6000
#define IMF_RSC_TEXT_1 	6001
#define IMF_RSC_TEXT_2 	6002
#define IMF_RSC_TEXT_3 	6003
#define IMF_RSC_TEXT_4 	6004

[
	{
		private _dialog = uiNamespace getVariable ["IMF_spectatorUI", displayNull];

		if (isNull _dialog) exitWith {};
		// Update time
		private _text = _dialog displayCtrl IMF_RSC_TIME;
		_text ctrlSetText format ["%1", [IMF_mission_time_left, "MM:SS"] call BIS_fnc_secondsToString];
		
		// Numbers portion
		private _nbr = IMF_RSC_TEXT_1;
		{
			// Current result is saved in variable _x
			_side = _x;
			_count = ({alive _x && isPlayer _x} count units _side);
			if (_count > 0) then {
				_control = _dialog displayCtrl _nbr;
				_color = _side call BIS_fnc_sideColor;
				_control ctrlSetBackgroundColor _color;
				_control ctrlSetText str(_count);
				_control ctrlCommit 0;
				_nbr = _nbr + 1;
			};
		} forEach [west, east, resistance, civilian];

		// Secondary check - will clear all controls if player is alive and stop the PFH - will not trigger for spectators sots (sideLogic)
		if (alive player && side player != sideLogic) then {
			_nbr = IMF_RSC_TIME;
			IMF_Spectator = false;
			("IMF_spectatorUI" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
		};

		// Clear all controls if spectator UI is not visible
		private _uiVisible = uiNamespace getVariable ["RscEGSpectator_interfaceVisible", false];
		if (!ace_spectator_uiVisible || !_uiVisible) then {
			_nbr = IMF_RSC_TIME;
		};

		// Clear the rest of the controls showing
		while {_nbr <= IMF_RSC_TEXT_4} do {
			_control = _dialog displayCtrl _nbr;
			_control ctrlSetBackgroundColor [0, 0, 0, 0];
			private _color = [0, 0, 0, 0];
			_control ctrlSetText "";
			_control ctrlCommit 0;
			_nbr = _nbr + 1;
		};

		// Show killfeed
		/*if (IMF_KILLFEED_ENABLED) then {
			private _layer = "IMF_KILLFEED_UI" call BIS_fnc_rscLayer;
			private _text = "";
			{
				_text = [_text, _x] joinString "<br />";
			} forEach IMF_KILL_FEED;
			[_text, safeZoneX + safezoneW * 0.7, safeZoneY + safeZoneH * 0.05, 1.5, 0, 0, _layer] spawn BIS_fnc_dynamicText;
		};*/
	}, 		// Code to be executed
	0,  	// Every frame
	[], 	// No parameters
	{}, 	// No start function
	{}, 	// No end function
	{true}, // Always run
	{!IMF_Spectator} // Will delete PFH if IMF_Spectator is false
] call CBA_fnc_createPerFrameHandlerObject;
