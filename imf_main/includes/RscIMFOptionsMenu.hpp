#define IDD_OPTIONS_OPTIONS		62000
#define IDC_OPTIONS_TERRAIN_0	62001
#define IDC_OPTIONS_OBJECT_0	62002
#define IDC_OPTIONS_TERRAIN_1	62003
#define IDC_OPTIONS_OBJECT_1	62004
#define IDC_OPTIONS_TERRAIN_2	62005
#define IDC_OPTIONS_OBJECT_2	62006

class RscIMFXSliderH: RscXSliderH {
	color[] = {1, 1, 1, 0.4};
    colorActive[] = {1, 1, 1, 1};
    colorDisabled[] = {1, 1, 1, 0.2};
	sliderRange[] = {0, 100};
	sliderStep = 1;
};

class RscIMFOptions {
	idd = IDD_OPTIONS_OPTIONS;
	onLoad = "['init', 0, _this] call IMF_fnc_optionsHandler";
	onUnload = "['close', 0, _this] call IMF_fnc_optionsHandler;";

	class ControlsBackground {
		class Background: RscText {
			x = safeZoneX + safeZoneW * 0.3;
            y = safeZoneY + safeZoneH * 0.215;
            w = safeZoneW * 0.178;
            h = safeZoneH * 0.200;
			colorBackground[] = {0,0,0,0.50};
		};

		class Title: RscText {
			x = safeZoneX + safeZoneW * 0.3;
            y = safeZoneY + safeZoneH * 0.215;
            w = safeZoneW * 0.13;
            h = safeZoneH * 0.04;
			text = "OPTIONS";
		};
	};

	class Controls {
		class TextTerrain0: RscText {
			text = "1. Terrain";
			x = safeZoneX + safeZoneW * 0.3;
            y = safeZoneY + safeZoneH * 0.255;
            w = safeZoneW * 0.05;
            h = safeZoneH * 0.04;
            tooltip = "Distance of terrain view in first preset";
		};

		class SliderTerrain0: RscIMFXSliderH {
			idc = IDC_OPTIONS_TERRAIN_0;
			x = safeZoneX + safeZoneW * 0.355;
            y = safeZoneY + safeZoneH * 0.26;
            w = safeZoneW * 0.12;
            h = safeZoneH * 0.03;
			onSliderPosChanged = "['setTerrain', 0, _this] call IMF_fnc_optionsHandler";
		};

		class TextObject0: RscText {
			text = "1. Objects";
			x = safeZoneX + safeZoneW * 0.3;
            y = safeZoneY + safeZoneH * 0.295;
            w = safeZoneW * 0.05;
            h = safeZoneH * 0.04;
            tooltip = "Distance of objects view in first preset";
		};

		class SliderObject0: RscIMFXSliderH {
			idc = IDC_OPTIONS_OBJECT_0;
			x = safeZoneX + safeZoneW * 0.355;
            y = safeZoneY + safeZoneH * 0.300;
            w = safeZoneW * 0.12;
            h = safeZoneH * 0.03;
			onSliderPosChanged = "['setObject', 0, _this] call IMF_fnc_optionsHandler";
		};

		/*class TextTerrain1: RscText {
			text = "2. Terrain";
			x = safeZoneX + safeZoneW * 0.3;
            y = safeZoneY + safeZoneH * 0.335;
            w = safeZoneW * 0.05;
            h = safeZoneH * 0.04;
            tooltip = "Distance of terrain view in second preset";
		};

		class SliderTerrain1: RscIMFXSliderH {
			idc = IDC_OPTIONS_TERRAIN_1;
			x = safeZoneX + safeZoneW * 0.355;
            y = safeZoneY + safeZoneH * 0.340;
            w = safeZoneW * 0.12;
            h = safeZoneH * 0.03;
			onSliderPosChanged = "['setTerrain', 1, _this] call IMF_fnc_optionsHandler";
		};*/

		class TextObject1: RscText {
			text = "2. Objects";
			x = safeZoneX + safeZoneW * 0.3;
            y = safeZoneY + safeZoneH * 0.335;
            w = safeZoneW * 0.05;
            h = safeZoneH * 0.04;
            tooltip = "Distance of objects and terrain view in second preset";
		};

		class SliderObject1: RscIMFXSliderH {
			idc = IDC_OPTIONS_OBJECT_1;
			x = safeZoneX + safeZoneW * 0.355;
            y = safeZoneY + safeZoneH * 0.340;
            w = safeZoneW * 0.12;
            h = safeZoneH * 0.03;
			onSliderPosChanged = "['setObject', 1, _this] call IMF_fnc_optionsHandler";
		};

		/*class TextTerrain2: RscText {
			text = "3. Terrain";
			x = safeZoneX + safeZoneW * 0.3;
            y = safeZoneY + safeZoneH * 0.415;
            w = safeZoneW * 0.05;
            h = safeZoneH * 0.04;
            tooltip = "Distance of terrain view in third preset";
		};

		class SliderTerrain2: RscIMFXSliderH {
			idc = IDC_OPTIONS_TERRAIN_2;
			x = safeZoneX + safeZoneW * 0.355;
            y = safeZoneY + safeZoneH * 0.420;
            w = safeZoneW * 0.12;
            h = safeZoneH * 0.03;
			onSliderPosChanged = "['setTerrain', 2, _this] call IMF_fnc_optionsHandler";
		};*/

		class TextObject2: RscText {
			text = "3. Objects";
			x = safeZoneX + safeZoneW * 0.3;
            y = safeZoneY + safeZoneH * 0.375;
            w = safeZoneW * 0.05;
            h = safeZoneH * 0.04;
            tooltip = "Distance of objects and terrain view in third preset";
		};

		class SliderObject2: RscIMFXSliderH {
			idc = IDC_OPTIONS_OBJECT_2;
			x = safeZoneX + safeZoneW * 0.355;
            y = safeZoneY + safeZoneH * 0.380;
            w = safeZoneW * 0.12;
            h = safeZoneH * 0.03;
			onSliderPosChanged = "['setObject', 2, _this] call IMF_fnc_optionsHandler";
		};
	};
};
