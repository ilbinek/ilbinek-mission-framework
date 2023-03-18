/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// Exit if not admin or UID is not bureau or ilbinek
/*
76561197993230499 - Tklama
76561198018749868 - ilbinek
*/

private _uid = getPlayerUID player;

if !(serverCommandAvailable "#kick" or _uid == "76561197993230499" or _uid == "76561198018749868") exitWith {};

// Open the menu lol
createDialog "AdminMenu";
