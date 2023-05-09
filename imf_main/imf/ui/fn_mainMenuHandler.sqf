#define IDD_MENU_MAINMENU 	61000
#define IDC_MENU_OPTIONS 	61001
#define IDC_MENU_UNIFORM	61002
#define IDC_MENU_CONTACT	61003
#define IDC_MENU_CLOSE		61004
#define IDC_MENU_ADMIN		61005
#define IDC_MENU_CONSOLE	61006
#define IDC_MENU_FEEDBACK	61007

params ["_event", "_arg"];

private _diag = _arg select 0;

switch (_event) do {
	case "init": {
		private _uid = getPlayerUID player;
		if (serverCommandAvailable "#kick" or _uid == "76561197993230499" or _uid == "76561198018749868") then {
			(_diag displayCtrl IDC_MENU_ADMIN) ctrlShow true;
			(_diag displayCtrl IDC_MENU_CONSOLE) ctrlShow true;
			(_diag displayCtrl IDC_MENU_FEEDBACK) ctrlShow true;
		} else {
			(_diag displayCtrl IDC_MENU_ADMIN) ctrlShow false;
			(_diag displayCtrl IDC_MENU_CONSOLE) ctrlShow false;
			(_diag displayCtrl IDC_MENU_FEEDBACK) ctrlShow false;
		};
	};

	case "options": {
		// Close this dialog
		closeDialog 0;
		// Open dialog with options
		createDialog "RscIMFOptions";
	};

	case "contact": {
		// Close this dialog
		closeDialog 0;
		// Open feedback dialog
		hint "Not yet implemented";
	};
		
	case "fixUniformBug": {
		// Close this dialog
		closeDialog 0;
		// Show 10 second long timer and then fix it
		[10, [], {
			call IMF_fnc_fixUniformBug;
		}, {hint "Fixing aborted"}, "Fixing uniform bug", {true}, []] call ace_common_fnc_progressBar;
	};
		
	case "admin": {
		private _uid = getPlayerUID player;

		if !(serverCommandAvailable "#kick" or _uid == "76561197993230499" or _uid == "76561198018749868") exitWith {};

		// Open the admin dialog
		closeDialog 0;
		createDialog "AdminMenu";
	};
		
	case "feedback": {
		private _uid = getPlayerUID player;

		if !(serverCommandAvailable "#kick" or _uid == "76561197993230499" or _uid == "76561198018749868") exitWith {};

		// Open the feedback dialog
	};	
};
