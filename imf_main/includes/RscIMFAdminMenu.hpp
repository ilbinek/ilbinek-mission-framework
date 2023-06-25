#define IDD_ADMINMENU_ADMINMENU					64000
#define IDC_ADMINMENU_TITLE						64001
#define IDC_ADMINMENU_SERVERFPS					64002
#define IDC_ADMINMENU_MISSIONBUTTON				64003
#define IDC_ADMINMENU_TELEPORTBUTTON			64004
#define IDC_ADMINMENU_HEALBUTTON				64005
#define IDC_ADMINMENU_CHATBUTTON				64006
#define IDC_ADMINMENU_SPAWNBUTTON				64007
#define IDC_ADMINMENU_MISSIONSCREEN				64008
#define IDC_ADMINMENU_TELEPORTSCREEN			64009
#define IDC_ADMINMENU_HEALSCREEN				64010
#define IDC_ADMINMENU_CHATSCREEN				64011
#define IDC_ADMINMENU_SPAWNSCREEN				64012
#define IDC_ADMINMENU_MISSIONSCREEN_WARMUPTIME	64013

class RscIMFAdminMenu {
	idd = IDD_MENU_MAINMENU;
	onLoad = "";
	onUnload = "";

	class ControlsBackground {
		class Background: RscText {
			x = safeZoneX + safeZoneW * 0.2;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.6;
            h = safeZoneH * 0.6;
			colorBackground[] = {0,0,0,0.7};
		};

		class Title: RscText {
			idc = IDC_ADMINMENU_TITLE;
			x = safeZoneX + safeZoneW * 0.2;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.6;
			h = safeZoneH * 0.05;
			colorBackground[] = {0.543,0.5742,0.4102,1.0};
			text = "Admin Menu - Mission Screen";
		};
	};

	class Controls {
		class ServerFPS: RscText {
			idc = IDC_ADMINMENU_SERVERFPS;
			x = safeZoneX + safeZoneW * 0.6;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.2;
			h = safeZoneH * 0.05;
			style = 0x01;
			text = "Server FPS: 69";
		};

		// ControlsGroup containing all the UI for mission screen
		class MissionScreen: RscControlsGroupNoHScrollbars {
			idc = IDC_ADMINMENU_MISSIONSCREEN;
			x = safeZoneX + safeZoneW * 0.25;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.55;
			h = safeZoneH * 0.55;
			colorBackground[] = {0,0,0,0};

			class Controls {
				// Center of the controls group (there must be a better way) - x = safeZoneW * 0.25
				class WarmupRemove5: RscButton {
					x = 0.0;
					y = 0.0;
					w = safeZoneW * 0.15;
					h = safeZoneH * 0.05;
					colorBackground[] = {0,0,0,0.9};
					text = "-5 min";
				};

				class WarmupRemove1: RscButton {
					x = safeZoneW * 0.15;
					y = safeZoneH * 0.05;
					w = safeZoneW * 0.15;
					h = safeZoneH * 0.05;
					colorBackground[] = {1,0,0,0.9};
					text = "-1 min";
				};

				class WarmupTime: RscText {
					idc = IDC_ADMINMENU_MISSIONSCREEN_WARMUPTIME;
					x = safeZoneW * 0.25;
					y = safeZoneH * 0.05;
					w = safeZoneW * 0.1;
					h = safeZoneH * 0.05;
					style = 0x02;
					colorBackground[] = {1	,0,0,0.7};
					text = "--:--";
				};
				
				class WarmupAdd1: RscButton {
					x = safeZoneW * 0.25;
					y = safeZoneH * 0.1;
					w = safeZoneW * 0.15;
					h = safeZoneH * 0.05;
					colorBackground[] = {1,1,0,0.9};
					text = "+1 min";
				};

				class WarmupAdd5: RscButton {
					x = safeZoneW * 0.45;
					y = safeZoneH * 0.15;
					w = safeZoneW * 0.15;
					h = safeZoneH * 0.05;
					colorBackground[] = {1,0,0,0.9};
					text = "+5 min";
				};
			};
		};

		// ControlsGroup containing all the UI for teleport screen

		// ControlsGroup containing all the UI for healing screen

		// ControlsGroup containing all the UI for chat screen
		// TODO - For now only show the AdminChat dialog itself, maybe later I'll reimplement it

		// ControlsGroup containing all the UI for spawning screen

		// Definition of all the buttons to change screens
			// TODO - Possibly change it into a ActivePicture and use icons
		class MissionButton: RscButton {
			idc = IDC_ADMINMENU_MISSIONBUTTON;
			x = safeZoneX + safeZoneW * 0.2;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.05;
			h = safeZoneH * 0.11;
			text = "Mission";
			action = "['screen', ['mission', _this]] call IMF_fnc_adminMenuHandle";
		};

		class TeleportButton: RscButton {
			idc = IDC_ADMINMENU_TELEPORTBUTTON;
			x = safeZoneX + safeZoneW * 0.2;
			y = safeZoneY + safeZoneH * 0.36;
			w = safeZoneW * 0.05;
			h = safeZoneH * 0.11;
			text = "Teleport";
			action = "['screen', ['teleport', _this]] call IMF_fnc_adminMenuHandle";
		};

		class HealButton: RscButton {
			idc = IDC_ADMINMENU_HEALBUTTON;
			x = safeZoneX + safeZoneW * 0.2;
			y = safeZoneY + safeZoneH * 0.47;
			w = safeZoneW * 0.05;
			h = safeZoneH * 0.11;
			text = "Heal";
			action = "['screen', ['heal', _this]] call IMF_fnc_adminMenuHandle";
		};

		class ChatButton: RscButton {
			idc = IDC_ADMINMENU_CHATBUTTON;
			x = safeZoneX + safeZoneW * 0.2;
			y = safeZoneY + safeZoneH * 0.58;
			w = safeZoneW * 0.05;
			h = safeZoneH * 0.11;
			text = "Chat";
			action = "['screen', ['chat', _this]] call IMF_fnc_adminMenuHandle";
		};

		class SpawnButton: RscButton {
			idc = IDC_ADMINMENU_SPAWNBUTTON;
			x = safeZoneX + safeZoneW * 0.2;
			y = safeZoneY + safeZoneH * 0.69;
			w = safeZoneW * 0.05;
			h = safeZoneH * 0.11;
			text = "Spawn";
			action = "['screen', ['spawn', _this]] call IMF_fnc_adminMenuHandle";
		};
	};
};
