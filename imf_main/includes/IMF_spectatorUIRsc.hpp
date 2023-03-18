//("IMF_spectatorUI" call BIS_fnc_rscLayer) cutRsc ["IMF_spectatorUIRsc", "PLAIN"];	// show
//("IMF_spectatorUI" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];				// remove

class RscText;

class IMF_spectatorUIRsc {
	idd = -1;
	duration = 1e+011; 
	movingenable = true;
	onLoad = "uiNamespace setVariable ['IMF_spectatorUI', _this #0]; IMF_spectator = true;";
	onUnload = "IMF_spectator = false;";

	class Controls {
		
		class IMFtimer:RscText {    
			idc = -1;
			style = 2;
			onLoad = "[(_this #0)] call IMF_fnc_spectatorTimer;";
			x = safeZoneX + 0.005; 
			y = safeZoneY + safeZoneH - 0.09;
			h = 0.08;
			w = 0.32 * 3 / 4; //w == h
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
		
		class IMFaliveWEST:RscText {    
			idc = -1;
			style = 2;
			onLoad = "[(_this #0)] call IMF_fnc_spectatorWest;";
			x = safeZoneX + 0.245;    //Position
			y = safeZoneY + safeZoneH - 0.09;
			h = 0.08;
			w = 0.12 * 3 / 4; //w == h
			lineSpacing = 1;
			sizeEx = 0.045;
			fixedWidth = 1;
			deletable = 0;
			fade = 0;
			access = 0;
			type = 0;
			shadow = 1;
			font = "RobotoCondensed";
			colorBackground[] = {0,0.3,0.6,0.8}; // blufor side color
			colorShadow[] = {0,0,0,1};
			tooltipColorText[] = {1,1,1,1};
			tooltipColorBox[] = {1,1,1,1};
			tooltipColorShade[] = {0,0,0,0.65};
			colorText[] = {1,1,1,1};
			text = "";
		};

		class IMFaliveEAST:RscText {   
			idc = -1;
			style = 2;
			onLoad = "[(_this #0)] call IMF_fnc_spectatorEast;";
			x = safeZoneX + 0.335; 
			y = safeZoneY + safeZoneH - 0.09;
			h = 0.08;
			w = 0.12 * 3 / 4; //w == h
			lineSpacing = 1;
			sizeEx = 0.045;
			fixedWidth = 1;
			deletable = 0;
			fade = 0;
			access = 0;
			type = 0;
			shadow = 1;
			font = "RobotoCondensed";
			colorBackground[] = {0.5,0,0,1}; // east side color
			colorShadow[] = {0,0,0,1};
			tooltipColorText[] = {1,1,1,1};
			tooltipColorBox[] = {1,1,1,1};
			tooltipColorShade[] = {0,0,0,0.65};
			colorText[] = {1,1,1,1};
			text = "";
		};
	};
};
