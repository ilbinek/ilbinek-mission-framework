/*
	FILE: fn_disableAI.sqf
	
	name: IMF_fnc_disableAI
	
	Author(s):
	ilbinek
	
	Description:
	Disables AI for all units
	
	Parameters:
	None
	
	Returns:
	Nothing
	
	Examples:
	> call IMF_fnc_disableAI;
	
	Public:
	Yes
*/

{
	_x disableAI "AUTOTARGET";
	_x disableAI "TARGET";
	_x disableAI "FSM";
	_x disableAI "move";
	_x stop true;
	_x setBehaviour "CARELESS";
	_x allowFleeing 0;
	_x disableConversation true;
	_x setVariable ["BIS_noCoreConversations", false];
	_x setspeaker "NoVoice";
} forEach (if (count playableUnits == 0) then {
	allUnits
} else {
	playableUnits
});
