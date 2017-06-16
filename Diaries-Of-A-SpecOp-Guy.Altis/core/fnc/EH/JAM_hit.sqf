//params ["_jam", "_areaMarker"];

/*
if ((getDammage (_jam select 0)) > 0.95) exitWith {
  hint "Jammer Destroyed";
  [_sidePlayer, _jam] call BIS_fnc_removeRespawnPosition;
};

hint "FOB Under Attack!!!";
*/

cutText [format ["%1", [getPosATL (_this select 0 select 0)] call AM5_fnc_common_getGridCoords], "PLAIN DOWN"];
format ["sm_%1",[_selectedDestination] call AM5_fnc_common_getGridCoords] setmarkercolor "ColorOrange";
