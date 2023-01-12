/*
*
*	DOCS MAYBE SOMEDAY
*
*/

// Check if server
if (!isServer) exitWith {};

// TODO: Read these variables from somewhere, so they can be edited
// Set warmup state to 0 - initialising
missionNamespace setVariable ["IMF_warmup_state", 0, true];
// Set warmup left time to 8 minutes
missionNamespace setVariable ["IMF_warmup_time", 300, true];
// Set warmup area to 150 meters
missionNamespace setVariable ["IMF_warmup_area", 150, true];
// Set warmup start time
missionNamespace setVariable ["IMF_wrarmup_start_time", dayTime, true];

// Keep info if everyone is supposed to be frozen - edited only by admin / possible to add autodetection of a lag
missionNamespace setVariable ["IMF_mission_freeze", false, true];

// Set max view distance to 2500 meters
missionNamespace setVariable ["IMF_max_view_distance", 2500, true];

// Set mission time to 90 minutes
missionNamespace setVariable ["IMF_mission_duration", 7200, true];
// Set mission time left to mission duration
missionNamespace setVariable ["IMF_mission_time_left", IMF_mission_duration, true];
// Set mission TI disable
missionNamespace setVariable ["IMF_mission_ti_disable", false, true];
// Set if mission should end if everyone from one side is dead
missionNamespace setVariable ["IMF_mission_end_if_dead", false, true];
// Set if mission should end if all objectives are done
missionNamespace setVariable ["IMF_mission_end_if_all_objectives", false, true];
// Set if mission ended
missionNamespace setVariable ["IMF_MISSION_ENDED", false, true];
