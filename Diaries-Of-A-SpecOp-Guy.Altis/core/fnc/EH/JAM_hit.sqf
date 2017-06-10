params ["_jam"];

if ((getDammage (_jam select 0)) > 0.95) exitWith {
        hint "Jammer Destroyed";
        [_sidePlayer, _jam] call BIS_fnc_removeRespawnPosition;
};

hint "FOB Under Attack!!!";
