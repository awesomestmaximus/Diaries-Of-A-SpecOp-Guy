params ["_fob"];

if ((getDammage (_fob select 0)) > 0.95) exitWith {
        hint "FOB Destroyed";
        [_sidePlayer, _fob] call BIS_fnc_removeRespawnPosition;
};

hint "FOB Under Attack!!!";
