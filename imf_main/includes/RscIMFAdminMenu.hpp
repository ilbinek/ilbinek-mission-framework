#define IDD_MENU_ADMIN 		64000
#define IDD_MENU_FPS 		64001
#define IDC_WARMUP_TEXT 	64002
#define IDC_MISSION_TEXT	64003

class RscIMFAdminMenuButton: RscButton {
	colorText[] = {0.2, 0.5, 0.2, 1};
	colorBackground[] = {0, 0, 0, 1};
	colorBackgroundActive[] = {0.2, 0.2, 0.2, 1};
	colorFocused[] = {0,0,0,1};

};

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
			colorBackground[] = {0,0,0,0.8};
		};
	};

	class Controls {
		class RscServerFPS: RscText {
			x = safeZoneX + safeZoneW * 0.74;
            y = safeZoneY + safeZoneH * 0.2;
            w = safeZoneW * 0.045;
            h = safeZoneH * 0.04;
			text = "Server FPS: ";
		};

		class RscServerFPSNumber: RscText {
			idc = IDC_WARMUP_FPS;
			x = safeZoneX + safeZoneW * 0.785;
            y = safeZoneY + safeZoneH * 0.2;
            w = safeZoneW * 0.05;
            h = safeZoneH * 0.04;
			text = "69";
		};

		class RscWarmupTimer: RscText {
			idc = IDC_WARMUP_TEXT;
			x = safeZoneX + safeZoneW * 0.475;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.05;
            h = safeZoneH * 0.05;
			style = 0x2;
			text = "--:--";
			tooltip = "Warmup time left";	
		};

		class RscWarmupAdd1: RscIMFAdminMenuButton {
			x = safeZoneX + safeZoneW * 0.530;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.05;
            h = safeZoneH * 0.05;
			text = "+1 minute";
			tooltip = "+1 minute for warmup";
		};

		class RscWarmupAdd5: RscIMFAdminMenuButton {
			x = safeZoneX + safeZoneW * 0.585;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.05;
            h = safeZoneH * 0.05;
			text = "+5 minutes";
			tooltip = "+5 minutes for warmup";
		};

		class RscWarmupRemove1: RscIMFAdminMenuButton {
			x = safeZoneX + safeZoneW * 0.420;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.05;
            h = safeZoneH * 0.05;
			text = "-1 minute";
			tooltip = "-1 minute for warmup";
		};

		class RscWarmupRemove5: RscIMFAdminMenuButton {
			x = safeZoneX + safeZoneW * 0.365;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.05;
            h = safeZoneH * 0.05;
			text = "-5 minutes";
			tooltip = "-5 minutes for warmup";
		};

		class RscMissionTimer: RscText {
			idc = IDC_MISSION_TEXT;
			x = safeZoneX + safeZoneW * 0.475;
			y = safeZoneY + safeZoneH * 0.31;
			w = safeZoneW * 0.05;
            h = safeZoneH * 0.05;
			style = 0x2;
			text = "--:--";
			tooltip = "Mission time left";	
		};

		class RscMissionAdd1: RscIMFAdminMenuButton {
			x = safeZoneX + safeZoneW * 0.530;
			y = safeZoneY + safeZoneH * 0.31;
			w = safeZoneW * 0.05;
            h = safeZoneH * 0.05;
			text = "+1 minute";
			tooltip = "+1 minute for mission";
		};

		class RscMissionAdd5: RscIMFAdminMenuButton {
			x = safeZoneX + safeZoneW * 0.585;
			y = safeZoneY + safeZoneH * 0.31;
			w = safeZoneW * 0.05;
            h = safeZoneH * 0.05;
			text = "+5 minutes";
			tooltip = "+5 minute for mission";
		};

		class RscMissionRemove1: RscIMFAdminMenuButton {
			x = safeZoneX + safeZoneW * 0.420;
			y = safeZoneY + safeZoneH * 0.31;
			w = safeZoneW * 0.05;
            h = safeZoneH * 0.05;
			text = "-1 minute";
			tooltip = "-1 minute for mission";
		};

		class RscMissionRemove5: RscIMFAdminMenuButton {
			x = safeZoneX + safeZoneW * 0.365;
			y = safeZoneY + safeZoneH * 0.31;
			w = safeZoneW * 0.05;
            h = safeZoneH * 0.05;
			text = "-5 minutes";
			tooltip = "-5 minute for mission";
		};

		class RscAnnoucementText: RscEdit {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.365;
			y = safeZoneY + safeZoneH * 0.37;
			w = safeZoneW * 0.05;
            h = safeZoneH * 0.05;
			text = "-5 minutes";
		};
	};
};
