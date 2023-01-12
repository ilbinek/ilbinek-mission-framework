class CfgFunctions {
	class IMF {
		class server {
			file = "imf\server";
			class serverInit {};
			class serverInitCall {postInit = 1;};
			class prepareBriefing {};
			class initVars {};
			class generateFreqs {};
			class disableTI {};
			class createHandlers {};
		};

		class client {
			file = "imf\client";
			class clientInit {};
			class clientInitCall {postInit = 1;};
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
		};

		class briefing {
			file = "imf\client\briefing";
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
			file = "imf\warmup";
			class warmupStart {};
			class warmupStartServer {};
			class warmupAddTime {};
			class warmupSubstractTime {};
			class warmupUI {};
		};

		class util {
			file = "imf\util";
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
		};

		class mission {
			file = "imf\mission";
			class missionStart {};
			class missionEnd {};
			class missionInterupt {};
			class calculateObjectives {};
			class missionFreeze {};
			class missionAddTime {};
			class missionSubstracttime {};
			class initObjectives {};
		};

		class objectives {
			file = "imf\objectives";
			class newAreaObjective {};
			class newKillObjective {};
			class newProtectObjective {};
			class area {};
		};

		class admin {
			file = "imf\admin";
			class openMenu {};
			class handleAdminMenu {};
			class populatePlayers {};
		};
	};
};
