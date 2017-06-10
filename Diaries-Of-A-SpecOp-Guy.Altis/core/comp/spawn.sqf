params ["_compositionType", "_side", "_position", "_azimuth"];
private ["_arsenalClass", "_respawn"];

switch (_compositionType) do {/*
        switch ("fob") do {
                _fobActual = [_position, _azimuth, call am5_comp_fob] call BIS_fnc_ObjectsMapper;
                _arsenalClass = [_side, _position] call am5_comp_flag_arsenal;
                _arsenalClass setVariable ["ace_cookoff_enable", false, true];
                _respawn = [_side, _arsenalClass, "FOB " + str([_position] call AM5_fnc_common_getGridCoords)] call BIS_fnc_addRespawnPosition;
                _arsenalClass addeventhandler ["HitPart", {[_this select 0] call AM5_fnc_EH_FOB_hit;}];
        };*/
        switch ("jam") do {
                private ["_sideToJam"];
                if (_side == east) then {_sideToJam = west;} else {_sideToJam = east;};
                _jamComp = [_position, _azimuth, call AM5_comp_jam] call BIS_fnc_ObjectsMapper;
                _jamActual = "Land_TTowerSmall_2_F" createVehicle [(_position select 0) + 4.38477, (_position select 1) - 0.5802, 0];
                [[[_jamActual], jamRadius, jamStr, jamDEBUG], "core\scripts\TFARjamRadios.sqf"] remoteExec ["execVM", _sideToJam, true];
        };
};
