params ["_control"];

[_control] spawn {
    params ["_control"];
	while {IMF_spectator} do {
        _count = ({alive _x && isPlayer _x} count units west);
		if (_count > 0) then {
            _control ctrlShow true;
            _control ctrlSetText (str _count);
        } else {
            _control ctrlShow false;
        };
		sleep 5;
	};
};
