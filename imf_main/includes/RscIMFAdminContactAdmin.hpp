#define IDD_FEEDBACK_FEEDBACK 	63000
#define IDC_FEEDBACK_MESSAGES 	63001
#define IDC_FEEDBACK_TEXT 		63002
#define IDC_FEEDBACK_SEARCH		63003
#define IDC_FEEDBACK_LIST 		63004

class RscIMFAdminContactAdmin {
	idd = IDD_FEEDBACK_FEEDBACK;
	onLoad = "['init', _this] call IMF_fnc_adminContactAdminHandler";
	onUnload = "['close', _this] call IMF_fnc_adminContactAdminHandler";

	class ControlsBackground {
		class Background: RscText {
			x = safeZoneX + safeZoneW * 0.2;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.6;
			h = safeZoneH * 0.55;
			colorBackground[] = {0,0,0,1};
		};

		class Title: RscText {
			x = safeZoneX + safeZoneW * 0.2;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.6;
			h = safeZoneH * 0.05;
			colorBackground[] = {0.543,0.5742,0.4102,1.0};
			text = "Admin Contact - Admin version";
		};
	};

	class Controls {
		class Chat: RscControlsGroupNoHScrollbars {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.2;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.6;
			h = safeZoneH * 0.5;
			colorBackground[] = {1,1,1,1};

			class controls {
				class PlayerSearch: RscEdit {
					idc = IDC_FEEDBACK_SEARCH;
					x = 0;
					y = 0;
					w = safeZoneW * 0.15;
					h = safeZoneH * 0.05;
					colorBackground[] = {0,0,0,0};
					text = "";
					tooltip = "Search for a player";
					// Implementation when Arma 2.14 comes out
					//onEditChanged = "['update', _this] call IMF_fnc_adminContactAdminHandler;";

					// Before Arma 2.14 comes out
					onKeyUp = "['update', [_this, ctrlText (_this#0)]] call IMF_fnc_adminContactAdminHandler;";
				};

				class PlayerList: RscListBox {
					idc = IDC_FEEDBACK_LIST;
					x = 0;
					y = safezoneH * 0.05;
					w = safeZoneW * 0.15;
					h = safeZoneH * 0.45;
					colorBackground[] = {0,0,0,0};
					onLBSelChanged = "['selected', _this] call IMF_fnc_adminContactAdminHandler;";
				};

				class Messages: RscEditMulti {
					idc = IDC_FEEDBACK_MESSAGES;
					x = safeZoneW * 0.15;
					y = 0;
					w = safeZoneW * 0.45;
					h = safeZoneH * 0.50;
					colorBackground[] = {0,0,0,0};
					canModify = 0;
					text = "";
					linespacing = 1;
				};
			};
		};

		class Text: RscEdit {
			idc = IDC_FEEDBACK_TEXT;
			x = safeZoneX + safeZoneW * 0.2;
			y = safeZoneY + safeZoneH * 0.75;
			h = safeZoneH * 0.05;
			w = safeZoneW * 0.5;
			colorBackground[] = {0, 0, 0, 1};
			colorBorder[] = {0.543,0.5742,0.4102,1.0};
			text = "";
			tooltip = "Text of the message";
			onKeyUp = "if ((_this select 1) == 28) then {['send', _this] call IMF_fnc_adminContactAdminHandler;};";
		};

		class RscButtonFeedbackSend: RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.7;
			y = safeZoneY + safeZoneH * 0.75;
			h = safeZoneH * 0.05;
			w = safeZoneW * 0.1;
			style = 0x2;
			colorBackground[] = {0,0,0,0.75};
			colorActive[] = {0,0,0,0.75};
			onButtonClick = "['send', _this] call IMF_fnc_adminContactAdminHandler;";
			text = "SEND";
			tooltip = "Send message";
		};

		class RscButtonTeleportTo: RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.6;
			y = safeZoneY + safeZoneH * 0.2;
			h = safeZoneH * 0.05;
			w = safeZoneW * 0.1;
			style = 0x2;
			colorBackground[] = {0,0,0,0.75};
			colorActive[] = {0,0,0,0.75};
			onButtonClick = "['teleport', 'to'] call IMF_fnc_adminContactAdminHandler;";
			text = "TELEPORT TO";
			tooltip = "Teleport to selected player";
		};

		class RscButtonTeleportBack: RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.7;
			y = safeZoneY + safeZoneH * 0.2;
			h = safeZoneH * 0.05;
			w = safeZoneW * 0.1;
			style = 0x2;
			colorBackground[] = {0,0,0,0.75};
			colorActive[] = {0,0,0,0.75};
			onButtonClick = "['teleport', 'back'] call IMF_fnc_adminContactAdminHandler;";
			text = "TELEPORT BACK";
			tooltip = "Teleport back to original position";
		};
	};
};
