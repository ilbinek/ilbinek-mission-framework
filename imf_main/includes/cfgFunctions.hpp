class CfgFunctions {
	class IMF {
		class server {
			file = "imf_main\imf\server";
			class serverInit {};
			class serverInitCall {};
			class prepareBriefing {};
			class initVars {};
			class generateFreqs {};
			class disableTI {};
			class createHandlers {};
		};

		class client {
			file = "imf_main\imf\client";
			class clientInit {};
			class clientInitCall {};
			class spectatorUI {};
			class clientLoop {};
			class createBriefing {};
			class setRadioFreqs {};
			class addKeybinds {};
			class setVDistance {};
			class fixUniformBug {};
			class createClientHandlers {};
			class showKills {};
			class startVLoop {};
			class clientMissionEnd {};
		};

		class briefing {
			file = "imf_main\imf\client\briefing";
			class briefingSideNumbers {};
			class briefingTimer {};
			class briefingMission {};
			class briefingExtended {};
			class briefingInventory {};
			class briefingSquads {};
			class briefingUniforms {};
			class briefingFrequencies {};
		}

		class warmup {
			file = "imf_main\imf\warmup";
			class warmupStart {};
			class warmupStartServer {};
			class warmupAddTime {};
			class warmupSubstractTime {};
			class warmupUI {};
		};

		class util {
			file = "imf_main\imf\util";
			class createLocalMarker {};
			class disableAI {};
			class removeAI {};
			class spectatorWest {};
			class spectatorEast {};
			class spectatorTimer {};
			class warn {};
			class respawn {};
			class teleport {};
			class chooseSpawn {};
			class init {};
		};

		class mission {
			file = "imf_main\imf\mission";
			class missionStart {};
			class missionEnd {};
			class missionInterupt {};
			class calculateObjectives {};
			class missionFreeze {};
			class missionAddTime {};
			class missionSubstracttime {};
			class initObjectives {};
		};

		class admin {
			file = "imf_main\imf\admin";
			class handleAdminMenu {};
			class populatePlayers {};
		};

		class ui {
			file = "imf_main\imf\ui";
			class openMenu {};
			class mainMenuHandler {};
		};
	};
};
