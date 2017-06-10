params ["_missionType", "_side"];

if (isServer) then {
        call compile format["AM5_aborted_%1_%2 = true; publicVariable 'AM5_aborted_%1_%2';", _missionType, _side];
} else {
        [[], "call compile format['AM5_aborted_%1_%2 = true; publicVariable 'AM5_aborted_%1_%2';, _missionType, _side]", false] spawn BIS_fnc_MP;
};
