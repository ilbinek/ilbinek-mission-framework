/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// TODO REWRITE TO USE CBA HANDLERS

#define IDD_FEEDBACK_FEEDBACK 	63000
#define IDC_FEEDBACK_MESSAGES 	63001
#define IDC_FEEDBACK_TEXT 		63002
#define IDC_FEEDBACK_SEARCH		63003
#define IDC_FEEDBACK_LIST 		63004

params ["_event", "_arg"];
switch (_event) do {
	case "init" : {
		private _dialog = _arg select 0;

		// Fill the list box with names of people that already messaged
		private _list = _dialog displayCtrl IDC_FEEDBACK_LIST;
		lbClear _list;
		{
			private _name = name (_x call BIS_fnc_getUnitByUID);
			private _index = _list lbAdd _name;
			_list lbSetData [_index, _x];
		} forEach IMF_GLOBAL_CHAT;

		uiNamespace setVariable ["AdminChatDialog", _dialog];
		uiNamespace setVariable ["SelectedUID", "-1"];
		["loop", _arg] call IMF_fnc_adminContactAdminHandler;
	};

	case "loop" : {
		[_arg] spawn {
			disableSerialization;
			private _dialog = (_this#0)#0;
			private _msgs = _dialog displayCtrl IDC_FEEDBACK_MESSAGES;
			private _oldUID = uiNamespace getVariable "SelectedUID";
			private _chat = IMF_GLOBAL_CHAT getOrDefault [_oldUID, []];
			private _nbr = count _chat;
			while {(uiNamespace getVariable ["AdminChatDialog", displayNull]) == _dialog} do {
				private _uid = uiNamespace getVariable "SelectedUID";
				_chat = IMF_GLOBAL_CHAT getOrDefault [_uid, []];
				if ((count _chat != _nbr) || (_oldUID != _uid)) then {
					_nbr = count _chat;
					_oldUID = _uid;
					_msgs ctrlSetText "";
					{
						_x params ["_sender", "_time", "_text"];
						private _name = name (_sender call BIS_fnc_getUnitByUID);
						private _text = format ["%1 - %2: %3", _name, _time, _text] + endl;
						_msgs ctrlSetText (ctrlText _msgs + _text);
					} forEach _chat;
				};
				sleep 0.1;
			};
		};
	};

	case "update" : {
		private _dialog = uiNamespace getVariable "AdminChatDialog";
		private _text = _arg#1;
		private _list = _dialog displayCtrl IDC_FEEDBACK_LIST;
		lbClear _list;
		if (_text != "") then {
			{
				if ([_text, name _x] call BIS_fnc_inString) then {
					private _index = _list lbAdd name _x;
					_list lbSetData [_index, getPlayerUID _x];
				};
			} forEach (call BIS_fnc_listPlayers);
		} else {
			{
				private _name = name (_x call BIS_fnc_getUnitByUID);
				private _index = _list lbAdd _name;
				_list lbSetData [_index, _x];
			} forEach IMF_GLOBAL_CHAT;
		};
	};

	case "selected" : {
		private _dialog = uiNamespace getVariable "AdminChatDialog";
		private _list = _dialog displayCtrl IDC_FEEDBACK_LIST;
		if (_arg#1 == -1) exitWith {uiNamespace setVariable ["SelectedUID", "-1"]};
		uiNamespace setVariable ["SelectedUID", _list lbData _arg#1];
	};

	case "send" : {
		private _dialog = uiNamespace getVariable "AdminChatDialog";
		private _textDiag = _dialog displayCtrl IDC_FEEDBACK_TEXT;
		private _text = ctrlText _textDiag;
		private _uid = uiNamespace getVariable "SelectedUID";
		if (_text == "" || _uid == "-1") exitWith {};
		private _daytime = dayTime;
		private _hours = floor _daytime;
		private _minutes = floor ((_daytime - _hours) * 60);
		private _time = format ["%1:%2", _hours, _minutes];
		private _msg = [getPLayerUID player, _time, _text];
		private _chat = IMF_GLOBAL_CHAT getOrDefault [_uid, []];
		_chat pushBack _msg;
		IMF_GLOBAL_CHAT set [_uid, _chat];
		publicVariable "IMF_GLOBAL_CHAT";
		_textDiag ctrlSetText "";
		["IMF_CHAT_UPDATE", [name player, _text], (_uid call BIS_fnc_getUnitByUID)] call CBA_fnc_targetEvent;
	};

	case "teleport" : {
		if (_arg == "to") then {
			IMF_ORIGINAL_POS = getPos player;
			private _uid = uiNamespace getVariable "SelectedUID";
			if (_uid == "-1") exitWith {};
			private _name = name (_uid call BIS_fnc_getUnitByUID);
			[name player, _name] call IMF_fnc_teleport;
		} else {
			if (isNil "IMF_ORIGINAL_POS") exitWith {};
			player setPos IMF_ORIGINAL_POS;
			IMF_ORIGINAL_POS = nil;
		};
	};

	case "close" : {
		uiNamespace setVariable ["AdminChatDialog", nil];
		uiNamespace setVariable ["SelectedUID", "-1"];
	};
};
