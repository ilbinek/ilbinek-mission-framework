#include "includes\cfgFunctions.hpp"
#include "includes\defines.hpp"
#include "includes\BaseControls.hpp"
#include "includes\AdminMenu.hpp"
#include "includes\RscIMFAdminMenu.hpp"
#include "includes\RscIMFMainMenu.hpp"
#include "includes\RscIMFOptionsMenu.hpp"
#include "includes\RscIMFFeedback.hpp"

class CfgPatches {
	class imf_main {
		author = "ilbinek";
		units[] = {};
		weapons[] = {};
		requiredVersion[] = {};
		requiredAddons[] = {"A3_Data_F_Tank_Loadorder", "cba_keybinding"};
	};
};

// Include UI for spectators
class RscTitles {
	titles[] = {IMF_spectatorUIRsc};
	#include "includes\IMF_spectatorUIRsc.hpp"
};

class CfgFactionClasses {
	class IMF {
		displayName = "IMF";
		priority = 0;
		side = 7;
	};
};

// IMF Modules
class ArgumentsBaseUnits;
class CfgVehicles {
	class Logic;
	class Module_F: Logic {
		class ModuleDescription {
			class AnyBrain;
		};
	};

	// IMF Main module
	class IMF_Main: Module_F {
		scope = 2;
		author = "ilbinek";
		displayName = "Main";
		category = "IMF";
		function = "IMF_fnc_init";
		functionPriority = 2;
		icon = "\imf_main\tbdlogo.paa";
		isGlobal = 1;
		isTriggerActivated = 0;

		class Arguments: ArgumentsBaseUnits {

			class MissionTime {
				displayName = "$STR_IMF_MissionTime";
				description = "$STR_IMF_MissionTime_Desc";
				typeName = "NUMBER";
				defaultValue = 120;
			};

			class WarmupTime {
				displayName = "$STR_IMF_WarmupTime";
				description = "$STR_IMF_WarmupTime_Desc";
				typeName = "NUMBER";
				defaultValue = 5;
			};

			class WarmupArea {
				displayName = "$STR_IMF_WarmupArea";
				description = "$STR_IMF_WarmupArea_Desc";
				typeName = "NUMBER";
				defaultValue = 150;
			};

			class MaxViewDistance {
				displayName = "$STR_IMF_ViewDistance";
				description = "$STR_IMF_ViewDistance_Desc";
				typeName = "NUMBER";
				defaultValue = 2500;
			};

			class MaxViewDistanceTerrain {
				displayName = "$STR_IMF_ViewDistanceTerrain";
				description = "$STR_IMF_ViewDistanceTerrain_Desc";
				typeName = "NUMBER";
				defaultValue = 10000;
			};

			class ThermalImaging {
				displayName = "$STR_IMF_ThermalImaging";
				description = "$STR_IMF_ThermalImaging_Desc";
				typeName = "BOOL";
				defaultValue = true;
			};

			class SideEliminatedEnd {
				displayName = "End when side eliminated";
				description = "Will end the mission when a side is eliminated and show that the surviving side won";
				typeName = "BOOL";
				defaultValue = true;
			};

			class PeopleAlive {
				displayName = "Supremacy";
				description = "End mission when less than X number of people are alive on a side";
				typeName = "NUMBER";
				defaultValue = 5;
			}

			class TimeEndWinner {
				displayName = "$STR_IMF_TimeWinner";
				description = "$STR_IMF_TimeWinner_Desc";
				typeName = "NUMBER";
				class values {
					class East {name = "$STR_IMF_East"; value = 0; default = 0;};
					class West {name = "$STR_IMF_West"; value = 1;};
					class Guesr {name = "$STR_IMF_Resistance"; value = 2;};
					class Civ {name = "$STR_IMF_Civilian"; value = 3;};
				};
			};

			class TimeEndWinnerText {
				displayName = "$STR_IMF_TimeWinnerText";
				description = "$STR_IMF_TimeWinnerText_Desc";
				typeName = "STRING";
				defaultValue = "";
			};

			class ObjMissionEnd {
				displayName = "$STR_IMF_ObjMissionEnd";
				description = "$STR_IMF_ObjMissionEnd_Desc";
				typeName = "BOOL";
				defaultValue = true;
			};
		};
	};

	// IMF Teleport module
	class IMF_Teleport: Module_F {
		scope = 2;
		author = "ilbinek";
		displayName = "Teleport";
		category = "IMF";
		function = "IMF_fnc_chooseSpawn";
		icon = "\imf_main\tbdlogo.paa";
		isGlobal = 1;
		isTriggerActivated = 0;

		class Arguments: ArgumentsBaseUnits {
			class Owner {
				displayName = "Owner";
				description = "Squad Leader of the squad that will get teleported";
				typeName = "STRING";
				defaultValue = "";
			};

			class Vehicles {
				displayName = "Vehicles";
				description = "Vehicles that will be teleported with the squad, devided by a ','";
				typeName = "ARRAY";
				defaultValue = "";
			};

			class Positions {
				displayName = "Positions - Array []";
				description = "Positions that will be added to the SL to choose from, devided by a ','";
				typeName = "ARRAY";
				defaultValue = "";
			};
		};
	};
};
