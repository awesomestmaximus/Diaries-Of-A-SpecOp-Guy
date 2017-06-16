params ["_compositionType", "_requestingFaction", "_position", "_azimuth"];
private ["_fobActual", "_arsenalClass", "_respawnClass", "_sideToJam", "_jamComp", "_jamActual"];


switch (_compositionType) do {
  case (2) : {
    //if (true) exitWith {cutText [format["%1", _compositionType],"PLAIN"];};
    _fobActual = [_position, _azimuth, call am5_comp_fob] call BIS_fnc_ObjectsMapper;
    _arsenalClass = [_requestingFaction, _position] call am5_comp_flag_arsenal;
    _arsenalClass setVariable ["ace_cookoff_enable", false, true];
    _respawnClass = [_requestingFaction, _arsenalClass, "FOB " + str([_position] call AM5_fnc_common_getGridCoords)] call BIS_fnc_addRespawnPosition;
    _arsenalClass addeventhandler ["HitPart", {[_this select 0] call AM5_fnc_EH_FOB_hit;}];
  };
  case (3) : {
    //if (true) exitWith {cutText [format["%1", _compositionType],"PLAIN"];};
    if (_requestingFaction == east) then {_sideToJam = west;} else {_sideToJam = east;};
    _jamComp = [_position, _azimuth, call AM5_comp_jam] call BIS_fnc_ObjectsMapper;
    _jamActual = "Land_TTowerSmall_2_F" createVehicle [(_position select 0) + 4.38477, (_position select 1) - 0.5802, 0];
    [[[_jamActual], jamRadius, jamStr, jamDEBUG], "core\scripts\TFARjamRadios.sqf"] remoteExec ["execVM", 0, true];
    // Draw Markers
    //_areaMarker = [_position, jamRadius] call AM5_fnc_common_drawArea;
    _jamActual addeventhandler ["HitPart", {[_this select 0] call AM5_fnc_EH_JAM_hit;}];
  };
};
