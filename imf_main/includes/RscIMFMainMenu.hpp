#define IDD_MENU_MAINMENU 	61000
#define IDC_MENU_OPTIONS 	61001
#define IDC_MENU_UNIFORM	61002
#define IDC_MENU_CONTACT	61003
#define IDC_MENU_CLOSE		61004
#define IDC_MENU_ADMIN		61005
#define IDC_MENU_CONSOLE	61006
#define IDC_MENU_FEEDBACK	61007

class RscIMFButtonMenu: RscButtonMenu {
	h = safeZoneH * 0.05;
	w = safeZoneW * 0.15;
	color[] = {0.543,0.5742,0.4102,1.0};
	period = 0.5;
	size = 0.03921;
	sizeEx = 0.03921;

	class ShortcutPos {
		left = 0.0204;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
	};

	class TextPos {
		left = 0.03;
		top = 0.034;
		right = 0.005;
		bottom = 0.005;
		forceMiddle = true;
	};

	class Attributes {
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};

	class AttributesImage {
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "false";
	};
};

class RscIMFMainMenu {
	idd = IDD_MENU_MAINMENU;
	onLoad = "['init', _this] call IMF_fnc_mainMenuHandler;";
	onUnload = "['close', _this] call IMF_fnc_mainMenuHandler;";

	class ControlsBackground {
		class Background: RscText {
			x = safeZoneX + safeZoneW * 0.2;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.15;
			h = safeZoneH * 0.265;
			colorBackground[] = {0,0,0,0.7};
		};

		class Title: RscText {
			x = safeZoneX + safeZoneW * 0.2;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.15;
			h = safeZoneH * 0.05;
			colorBackground[] = {0.543,0.5742,0.4102,1.0};
			text = "IMF MAIN MENU";
		};
	};

	class Controls {
		class RscButtonMenuOptions: RscIMFButtonMenu {
			idc = IDC_MENU_OPTIONS;
			x = safeZoneX + safeZoneW * 0.2;
            y = safeZoneY + safeZoneH * 0.25;
            text = "OPTIONS";
            action = "['options', _this] call IMF_fnc_mainMenuHandler;";
		};

		class RscButtonMenuContact: RscIMFButtonMenu {
			idc = IDC_MENU_CONTACT;
			x = safeZoneX + safeZoneW * 0.2;
            y = safeZoneY + safeZoneH * 0.305;
            text = "CONTACT ADMIN";
            action = "['contact', _this] call IMF_fnc_mainMenuHandler;";
		};

		class RscButtonMenuUniform: RscIMFButtonMenu {
			idc = IDC_MENU_UNIFORM;
			x = safeZoneX + safeZoneW * 0.2;
            y = safeZoneY + safeZoneH * 0.36;
            text = "FIX UNIFORM BUG";
            action = "['fixUniformBug', _this] call IMF_fnc_mainMenuHandler;";
		};

		class RscButtonMenuClose: RscIMFButtonMenu {
			idc = IDC_MENU_CLOSE;
			x = safeZoneX + safeZoneW * 0.2;
            y = safeZoneY + safeZoneH * 0.415;
            text = "CLOSE";
            action = "closeDialog 0;";
		};

		class RscButtonMenuAdmin: RscIMFButtonMenu {
			idc = IDC_MENU_ADMIN;
			x = safeZoneX + safeZoneW * 0.6;
            y = safeZoneY + safeZoneH * 0.310;
            text = "ADMIN MENU";
            action = "['admin', _this] call IMF_fnc_mainMenuHandler;";
		};

		class RscButtonMenuConsole: RscIMFButtonMenu {
			idc = IDC_MENU_CONSOLE;
			x = safeZoneX + safeZoneW * 0.6;
            y = safeZoneY + safeZoneH * 0.365;
            text = "CONSOLE";
            action = "createDialog 'RscDisplayDebugPublic';";
		};

		class RscButtonMenuFeedback: RscIMFButtonMenu {
			idc = IDC_MENU_FEEDBACK;
			x = safeZoneX + safeZoneW * 0.6;
            y = safeZoneY + safeZoneH * 0.420;
            text = "FEEDBACK LOG";
            action = "['feedback', _this] call IMF_fnc_mainMenuHandler;";
		};
	};
};
