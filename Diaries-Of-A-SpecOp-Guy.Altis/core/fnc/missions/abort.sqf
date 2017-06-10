params ["_missionType", "_requestingFaction"];

if (isServer) then {
        call compile format["AM5_aborted_%1_%2 = true; publicVariable 'AM5_aborted_%1_%2';", _missionType, _requestingFaction];
} else {
        [[], "call compile format['AM5_aborted_%1_%2 = true; publicVariable 'AM5_aborted_%1_%2';, _missionType, _requestingFaction]", false] spawn BIS_fnc_MP;
};
