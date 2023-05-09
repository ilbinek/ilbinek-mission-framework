/*
*
*	DOCS MAYBE SOMEDAY
*
*/

params ["_time"];
IMF_warmup_time = IMF_warmup_time - _time;
publicVariable "IMF_warmup_time";
