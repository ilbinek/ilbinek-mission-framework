#include "includes\cfgFunctions.hpp"

class CfgPatches {
    class imf_tasks {
        author = "ilbinek";
        units[] = {};
        weapons[] = {};
        requiredVersion[] = {};
        requiredAddons[] = {"A3_Data_F_Tank_loadorder", "imf_main"};
    };
};

// IMF Task modules
class ArgumentsBaseUnits;
class AttributesBase;
class Edit;
class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class ModuleDescription {
            class AnyBrain;
        };
    };

    // IMF Task simple area module
    class IMF_Area: Module_F {
        scope = 2;
        author = "ilbinek";
        displayName = "Area";
        category = "IMF";
        function = "IMF_fnc_area";
        functionPriority = 1;
        icon = "\imf_main\tbdlogo.paa";
        isGlobal = 0;
        isTriggerActivated = 0;

        class Arguments: ArgumentsBaseUnits {
            class Marker {
                displayName = "Marker";
                description = "Marker that will be the objective";
                typeName = "STRING";
                defaultValue = "";
            };

            class Name {
                displayName = "Name";
                description = "Name of the zone";
                typeName = "STRING";
                defaultValue = "";
            };

            class Owner {
                displayName = "Defender (TOOD - east/west)";
                description = "Which side owns the area at start";
                typeName = "NUMBER";
                class values {
					class Empty {name = "$STR_IMF_Nobody"; value = 3; default = 3;};
					class East {name = "$STR_IMF_East"; value = 0;};
					class West {name = "$STR_IMF_West"; value = 1;};
					class Guer {name = "$STR_IMF_Resistance"; value = 2;};
				};
            };

            class Capturer {
                displayName = "Attacker (TOOD - east/west)";
                description = "Who will capture the area";
                typeName = "NUMBER";
                class values {
					class Empty {name = "Anyone"; value = 3; default = 3;};
					class East {name = "$STR_IMF_East"; value = 0;};
					class West {name = "$STR_IMF_West"; value = 1;};
					class Guer {name = "$STR_IMF_Resistance"; value = 2;};
				};
            };

            class TimeToCapture {
				displayName = "Capture time";
				description = "How many seconds does it take to capture the point";
				typeName = "NUMBER";
				defaultValue = 120;
			};

            class Recapturable {
				displayName = "Recapturable";
				description = "Can the area be recaptured by another side if it was already captured?";
				typeName = "BOOL";
				defaultValue = false;
			};

            class Advantage {
				displayName = "Advantage of capturer";
				description = "How many more player of capturing side needs to be on the objective than of the defending";
				typeName = "NUMBER";
				defaultValue = 1;
			};

            class Height {
                displayName = "Height";
				description = "How many meters over ground is counted as in zone";
				typeName = "NUMBER";
				defaultValue = 50;
            };

            class Condition {
                displayName = "Condition of activation";
                description = "The condition that will determine wether this area can be captured or not - true to be capturable";
                typeName = "STRING";
                defaultValue = "true";
            };
        };
    };

    // IMF Task manager module
    class IMF_Task_Manager: Module_F {
        scope = 2;
        author = "ilbinek";
        displayName = "Task Manager";
        category = "IMF";
        function = "IMF_fnc_objectiveManager";
        functionPriority = 1;
        icon = "\imf_main\tbdlogo.paa";
        isGlobal = 0;
        isTriggerActivated = 0;

        class Attributes: AttributesBase {
            class Code: Edit {
                property = "ModuleCode";
                displayName = "Code";
                tooltip = "";
                control = "EditMulti5";
                isLocalized = 1;
            };

            class Reason: Edit {
                property = "ModuleReason";
                displayName = "Reason";
                tooltip = "";
                control = "Edit";
                isLocalized = 1;
            };
        };

        class Arguments: ArgumentsBaseUnits {
            class Reason {
                displayName = "Winner text";
                description = "Winner text";
            };
            
            class Code {
                displayName = "Code";
                description = "Code that will return the side that wins";
            };
        };
    };

    // IMF Task simple VIP module
    class IMF_Task_VIP: Module_F {
        scope = 2;
        author = "ilbinek";
        displayName = "VIP";
        category = "IMF";
        function = "IMF_fnc_vip";
        functionPriority = 1;
        icon = "\imf_main\tbdlogo.paa";
        isGlobal = 0;
        isTriggerActivated = 0;

         class Arguments: ArgumentsBaseUnits {
            class Marker {
                displayName = "Marker";
                description = "Marker that will limit the area that the VIP can be in. If not limited, leave empty";
                typeName = "STRING";
                defaultValue = "";
            };

            class Time {
                displayName = "Time";
                description = "How long can the VIP be outside of the marker area";
                typeName = "NUMBER";
                defaultValue = "10";
            };

            class Object {
                displayName = "Object";
                description = "Object that is the VIP";
                typeName = "STRING";
                defaultValue = "";
            };

            class Name {
                displayName = "Name";
                description = "Name of the VIP";
                typeName = "STRING";
                defaultValue = "";
            };
        };
    };
};
