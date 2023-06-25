//("IMF_spectatorUI" call BIS_fnc_rscLayer) cutRsc ["IMF_spectatorUIRsc", "PLAIN"];	// show
//("IMF_spectatorUI" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];				// remove

#define IMF_RSC_TIME 	6000
#define IMF_RSC_TEXT_1 	6001
#define IMF_RSC_TEXT_2 	6002
#define IMF_RSC_TEXT_3 	6003
#define IMF_RSC_TEXT_4 	6004

class IMF_spectatorUIRsc {
	idd = -1;
	duration = 1e+011; 
	movingenable = true;
	onLoad = "uiNamespace setVariable ['IMF_spectatorUI', _this #0]; IMF_spectator = true; call IMF_fnc_spectatorUIhandler;";
	onUnload = "IMF_spectator = false; uiNamespace setVariable ['IMF_spectatorUI', nil];";

	class Controls {
		
		class IMFtimer:RscText {    
			idc = IMF_RSC_TIME;
			style = 2;
			x = safeZoneX; 
			y = safeZoneY + safeZoneH * 0.95;
			h = safezoneH * 0.05;
			w = safezoneW * 0.1; //w == h
			lineSpacing = 1;
			sizeEx = 0.045;
			fixedWidth = 1;
			deletable = 0;
			fade = 0;
			access = 0;
			type = 0;
			shadow = 1;
			font = "RobotoCondensed";
			colorBackground[] = {0,0,0,0.5}; // timer backround color
			colorShadow[] = {0,0,0,1};
			tooltipColorText[] = {1,1,1,1};
			tooltipColorBox[] = {1,1,1,1};
			tooltipColorShade[] = {0,0,0,0.65};
			colorText[] = {1,1,1,1};
			text = "";
		};
		
		class IMFalive1:RscText {  
			idc = IMF_RSC_TEXT_1;
			style = 2;
			sizeEx = 0.045;
			x = safeZoneX + safezoneW * 0.1;
			y = safeZoneY + safeZoneH * 0.95;
			w = 0.05 * safezoneW;
			h = 0.05 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};

		class IMFalive2:RscText {   
			idc = IMF_RSC_TEXT_2;
			style = 2;
			sizeEx = 0.045;
			x = safeZoneX + safezoneW * 0.15;
			y = safeZoneY + safeZoneH * 0.95;
			w = 0.05 * safezoneW;
			h = 0.05 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};

		class IMFalive3:RscText {   
			idc = IMF_RSC_TEXT_3;
			style = 2;
			sizeEx = 0.045;
			x = safeZoneX + safezoneW * 0.2;
			y = safeZoneY + safeZoneH * 0.95;
			w = 0.05 * safezoneW;
			h = 0.05 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};

		class IMFalive4:RscText {   
			idc = IMF_RSC_TEXT_4;
			style = 2;
			sizeEx = 0.045;
			x = safeZoneX  + safezoneW * 0.25; 
			y = safeZoneY + safeZoneH * 0.95;
			w = 0.05 * safezoneW;
			h = 0.05 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
	};
};
