params ["_missionType", "_requestingFaction"];
private ["_selectedDestination", "_logSpawnPoint"];

switch (_missionType) do {
        case (2): {
                if (_requestingFaction == east) then {_logSpawnPoint = getPos east_log_point;} else {_logSpawnPoint = getPos west_log_point;};
                _selectedDestination = [] call AM5_fnc_common_selectFlatLocation;
                if (_selectedDestination isEqualTo [] || _selectedDestination isEqualTo "") exitWith {
                        _selectedDestination = [];
                        _logSpawnPoint = "";
                };
                if ((_selectedDestination distance _logSpawnPoint) < 1250) exitWith {
                        cutText ["FOB cannot be within a kilometer radius of Base", "PLAIN DOWN"];
                        _selectedDestination = [];
                        _logSpawnPoint = "";
                };
                hint format ["Deploy FOB in GRID %1", [_selectedDestination] call AM5_fnc_common_getGridCoords];
                [_requestingFaction, _logSpawnPoint, _selectedDestination] remoteExec ["AM5_fnc_mission_LOG_FOB", 2, false];
        };
        case (3): {
                if (_requestingFaction == east) then {_logSpawnPoint = getPos east_log_point;} else {_logSpawnPoint = getPos west_log_point;};
                _selectedDestination = [] call AM5_fnc_common_selectFlatLocation;
                if (_selectedDestination isEqualTo [] || _selectedDestination isEqualTo "") exitWith {
                        _selectedDestination = [];
                        _logSpawnPoint = "";
                };
                if ((_selectedDestination distance _logSpawnPoint) < 1250) exitWith {
                        cutText ["FOB cannot be within a kilometer radius of Base", "PLAIN DOWN"];
                        _selectedDestination = [];
                        _logSpawnPoint = "";
                };
                hint format ["Deploy FOB in GRID %1", [_selectedDestination] call AM5_fnc_common_getGridCoords];
                [_requestingFaction, _logSpawnPoint, _selectedDestination] remoteExec ["AM5_fnc_mission_PvP_JAM", 2, false];
        };
};
