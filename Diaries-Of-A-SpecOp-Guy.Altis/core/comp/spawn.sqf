params ["_compositionType", "_side", "_position", "_azimuth"];
private ["_arsenalClass", "_respawn"];

switch (_compositionType) do {
        switch ("fob") do {
                _fobActual = [_position, _azimuth, call am5_comp_fob] call BIS_fnc_ObjectsMapper;
                _arsenalClass = [_side, _position] call am5_comp_flag_arsenal;
                _arsenalClass setVariable ["ace_cookoff_enable", false, true];
                _respawn = [_side, _arsenalClass, "FOB " + str([_position] call AM5_fnc_common_getGridCoords)] call BIS_fnc_addRespawnPosition;
                _arsenalClass addeventhandler ["HitPart", {[_this select 0] call AM5_fnc_EH_FOB_hit;}];
        };
};
