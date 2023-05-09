#define IDD_FEEDBACK_FEEDBACK 63000

class RscIMFFeedback {
	idd = IDD_FEEDBACK_FEEDBACK;
	onLoad = "";
	onUnload = "";

	class ControlsBackground {
		class Background: RscText {
			x = safeZoneX + safeZoneW * 0.3;
			y = safeZoneY + safeZoneH * 0.3;
			w = safeZoneW * 0.4;
			h = safeZoneH * 0.4;
			colorBackground[] = {0,0,0,0.50};
		};
	};

	class Controls {
		class TextPage: RscControlsGroupNoScrollbars {

		};















		/*class Text: RscEdit {
			idc = 63001;
			x = safeZoneX + safeZoneW * 0.3;
			y = safeZoneY + safeZoneH * 0.65;
			h = safeZoneH * 0.05;
			w = safeZoneW * 0.3;
			colorBackground[] = {0, 0, 0, 0.75};
			colorBorder[] = {0, 0, 0, 0.75};
			text = "";
		};

		class RscButtonFeedbackSend: RscButton {
			x = safeZoneX + safeZoneW * 0.600;
			y = safeZoneY + safeZoneH * 0.65;
			h = safeZoneH * 0.05;
			w = safeZoneW * 0.1;
			style = 0x2;
			text = "SEND";
		};*/
	};
};
