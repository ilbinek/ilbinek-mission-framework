/*
*
*	doCS MAYBE SOMEDAY
*
*/
{
    _x disableAI "AUtoTARGET";
    _x disableAI "TARGET";
    _x disableAI "FSM";
    _x disableAI "move";
    _x stop true;
    _x setBehaviour "CARELESS";
    _x allowfleeing 0;
    _x disableConversation true;
    _x setVariable ["BIS_noCoreConversations", false];
    _x setspeaker "NoVoice";
} forEach (if (count playableunits == 0) then {
    allunits
} else {
    playableunits
});
