params ["_missionType", "_side"];

switch (_missionType) do {
        case (2): {
                private ["_destination", "_log_spawn_point"];
                if (_side == east) then {_log_spawn_point = getPos east_log_point;} else {_log_spawn_point = getPos west_log_point;};
                _destination = [] call AM5_fnc_common_selectFlatLocation;
                if (_destination isEqualTo [] || _destination isEqualTo "") exitWith {
                        _destination = [];
                        _log_spawn_point = "";
                };
                if ((_destination distance _log_spawn_point) < 1250) exitWith {
                        cutText ["FOB cannot be within a kilometer radius of Base", "PLAIN DOWN"];
                        _destination = [];
                        _log_spawn_point = "";
                };
                hint format ["Deploy FOB in GRID %1", [_destination] call AM5_fnc_common_getGridCoords];
                [_side, _log_spawn_point, _destination] remoteExec ["AM5_fnc_mission_LOG_FOB", 2, false];
        };
};
