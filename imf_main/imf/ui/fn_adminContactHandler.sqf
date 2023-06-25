/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// TODO REWRITE TO USE CBA HANDLERS AND BE VERSITALE, SO IT CAN BE USED BOTH BY ADMIN AND PLAYER

#define IDD_ADMINCONTACT_FEEDBACK 	63000
#define IDC_ADMINCONTACT_MESSAGES 	63001
#define IDC_ADMINCONTACT_TEXT 		63002

params ["_event", "_arg"];
switch (_event) do {
	case "init" : {
		private _dialog = _arg select 0;

		private _text = _dialog displayCtrl IDC_ADMINCONTACT_TEXT;
		ctrlSetFocus _text;

		private _chat = IMF_GLOBAL_CHAT getOrDefault [getPlayerUID player, []];
		
		// First fill of the chat
		private _msgs = _dialog displayCtrl IDC_ADMINCONTACT_MESSAGES;
		_msgs ctrlSetText "";
		{
			_x params ["_sender", "_time", "_text"];
			private _name = name (_sender call BIS_fnc_getUnitByUID);
			private _text = format ["%1 - %2: %3", _name, _time, _text] + endl;
			_msgs ctrlSetText (ctrlText _msgs + _text);
		} forEach _chat;

		uiNamespace setVariable ["ChatDialog", _dialog];
		["loop", _arg] call IMF_fnc_adminContactHandler;
	};

	case "loop" : {
		[_arg] spawn {
			disableSerialization;
			private _dialog = (_this#0)#0;
			private _msgs = _dialog displayCtrl IDC_ADMINCONTACT_MESSAGES;
			private _chat = IMF_GLOBAL_CHAT getOrDefault [getPLayerUID player, []];
			private _nbr = count _chat;
			while {(uiNamespace getVariable ["ChatDialog", displayNull]) == _dialog} do {
				_chat = IMF_GLOBAL_CHAT getOrDefault [getPLayerUID player, []];
				if (count _chat != _nbr) then {
					_nbr = count _chat;
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

	case "send": {
		private _dialog = uiNamespace getVariable "ChatDialog";
		private _textDiag = _dialog displayCtrl IDC_ADMINCONTACT_TEXT;
		private _text = ctrlText _textDiag;
		if (_text == "") exitWith {};
		private _daytime = dayTime;
		private _hours = floor _daytime;
		private _minutes = floor ((_daytime - _hours) * 60);
		private _time = format ["%1:%2", _hours, _minutes];
		private _msg = [getPLayerUID player, _time, _text];
		private _chat = IMF_GLOBAL_CHAT getOrDefault [getPLayerUID player, []];
		_chat pushBack _msg;
		IMF_GLOBAL_CHAT set [getPLayerUID player, _chat];
		publicVariable "IMF_GLOBAL_CHAT";
		_textDiag ctrlSetText "";
		["IMF_ADMIN_CHAT_UPDATE", [name player, _text]] call CBA_fnc_globalEvent;
	};

	case "close" : {
		uiNamespace setVariable ["ChatDialog", nil];
	};
};
