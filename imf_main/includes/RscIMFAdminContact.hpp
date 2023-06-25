#define IDD_ADMINCONTACT_FEEDBACK 	63000
#define IDC_ADMINCONTACT_MESSAGES 	63001
#define IDC_ADMINCONTACT_TEXT 		63002

class RscIMFAdminContact {
	idd = IDD_ADMINCONTACT_FEEDBACK;
	onLoad = "['init', _this] call IMF_fnc_adminContactHandler";
	onUnload = "['close', _this] call IMF_fnc_adminContactHandler";

	class ControlsBackground {
		class Background: RscText {
			x = safeZoneX + safeZoneW * 0.2;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.6;
			h = safeZoneH * 0.55;
			colorBackground[] = {0,0,0,1};
		};

		class Title: Rsctext {
			x = safeZoneX + safeZoneW * 0.2;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.6;
			h = safeZoneH * 0.05;
			colorBackground[] = {0.543,0.5742,0.4102,1.0};
			text = "Admin Contact";
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
				class Messages: RscEditMulti {
					idc = IDC_ADMINCONTACT_MESSAGES;
					x = 0;
					y = 0;	
					w = safeZoneW * 0.6;
					h = safeZoneH * 0.50;
					colorBackground[] = {0,0,0,0};
					canModify = 0;
					text = "";
					linespacing = 1;
				};
			};
		};

		class Text: RscEdit {
			idc = IDC_ADMINCONTACT_TEXT;
			x = safeZoneX + safeZoneW * 0.2;
			y = safeZoneY + safeZoneH * 0.75;
			h = safeZoneH * 0.05;
			w = safeZoneW * 0.5;
			colorBackground[] = {0, 0, 0, 1};
			colorBorder[] = {0.543,0.5742,0.4102,1.0};
			text = "";
			tooltip = "Text of the message";
			onKeyUp = "if ((_this select 1) == 28) then {['send', _this] call IMF_fnc_adminContactHandler;};";
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
			onButtonClick = "['send', _this] call IMF_fnc_adminContactHandler";
			text = "SEND";
			tooltip = "Send message";
		};
	};
};
