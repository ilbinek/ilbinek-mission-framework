//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	Setup objectives here, hopefully can move into a module in the future with an addon. Or move everything into and addon and we would be happy and everything you know?	//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////
// Points based system is boring and will probably be removed in the future to allow for more interesting objectives
/////////////////

IMF_objective_declaration = [];

// Look at examples for every objective, more can (and will) come in the future
// Timed objectives can come in the future, REDACTED does not need them, only OFCRA needs them, so we'll see

//###########################################
//#				Kill objective				#
//###########################################
// This objective is used, if something needs to be destroyed
// Can define more objects that need to be destroyed - if more are defined, all need to be destroyed to award points
// Definition:
//	["KILL", points, side that will get the points if completed, array of object that need to be destroyed]
// Example:
// 	IMF_objective_declaration pushBack ["KILL", 5, west, [crate1]];
// 	IMF_objective_declaration pushBack ["KILL", 69, west, [crate1, crate2, crate3]];


//###########################################
//#				Protect objective			#
//###########################################
// This objective is used, if something needs to be protected
// Can define more objects that need to be protected - if more are defined, all need to be protected to award points
// Definition:
//	["PROTECT", points, side that will get the points if completed, array of object that need to be protected]
// Example:
// 	IMF_objective_declaration pushBack ["PROTECT", 5, west, [crate1]];
// 	IMF_objective_declaration pushBack ["PROTECT", 69, west, [crate1, crate2, crate3]];


//###########################################
//#				Area objective				#
//###########################################
// This objective is used to create an area that will be captured
// Can define more areas that all need to be captured for the points to be awarded
// Can define how long it takes to secure the are
// Can define whether the are is supposed to be recapturable
// Can define if the areas are sequential (in order they are written here)
/////////////////////////////////////////////
//	CAUTION: Can't be both recapturable and sequential - if recapturable sequential will be false by default - might be changed in future
/////////////////////////////////////////////
// Definition:
//	["AREA", points, side that will get the points if all captured (attackers), side that will get the points if not captured (defenders), number of seconds it takes to capture the area, is recapturable, is sequential, array of markers that represent the areas]
//	["AREA", points, attacker, defender, time, recapturable, sequential, [markers]]
// Example:
//	IMF_objective_declaration pushBack ["AREA", 2, west, east, 60, false, false, ["area1"]];
// 	IMF_objective_declaration pushBack ["AREA", 2, east, west, 1, true, false, ["area1", "area2"]];
// 	IMF_objective_declaration pushBack ["AREA", 4, west, east, 60, false, true, ["area1", "area2", "area3", "area4", "area5"]];
//	IMF_objective_declaration pushBack ["AREA", 2, west, east, 60, true, false, ["area1"]];

//////////////////////////////////////////
publicVariable "IMF_objective_declaration";
