/* =========================
# Playbook
1. Open Map
2. Map click = FOB deploy position
3. Spawn Vehicle
4. Create Task
5. Add action to vehicle
6. Wait for vehicle to be outside of 2 km from base
7. Action "DEPLOY"
        a. Remove vehicle
        b. Create FOB composition at vehicle position
        c. Change task description to "SUCCESS"
8. Add EH to vehicle "DESTROYED"
        a. Change task description to "FAILED"
        b. Add map marker on position "Lost FOB Equipment"

*/
params ["_requestingFaction", "_logSpawnPoint", "_selectedDestination"];
private ["_utilityVehicle", "_destinationText", "_areaMarker", "_flagMarker", "_missionType"];
_missionType = 2;
// Define FOB Vehicle based on side     ================== [3]
// SPAWN VEHICLE
// Initialise variables
if (_requestingFaction == east) then {
        _utilityVehicle = "rhs_gaz66_ammo_vdv" createVehicle _logSpawnPoint;
} else {
        _utilityVehicle = "rhsusf_M977A4_REPAIR_usarmy_d" createVehicle _logSpawnPoint;
};
call compile format ["AM5_aborted_%1_%2 = false;", _missionType, _requestingFaction];
call compile format ["AM5_done_%1_%2 = false;", _missionType, _requestingFaction];
call compile format ["AM5_failed_%1_%2 = false;", _missionType, _requestingFaction];

// Create Task                          ================== [4]
_destinationText = [_selectedDestination] call AM5_fnc_common_getGridCoords;
[_requestingFaction, _missionType, _utilityVehicle, _destinationText] call btc_fnc_task_create;
sleep 1;
call compile format["AM5_assigned_%1_%2 = true; publicVariable 'AM5_assigned_%1_%2';", _missionType, _requestingFaction];

// Draw Markers
_areaMarker = [_selectedDestination, 250] call AM5_fnc_common_drawArea;
_flagMarker = [_selectedDestination, "FOB Deploy Location"] call AM5_fnc_commmon_drawFlag;

// Add Deploy Action To Vehicle
[_utilityVehicle, _requestingFaction, _logSpawnPoint, getMarkerPos _flagMarker, _missionType] remoteExec ["AM5_fnc_int_addActionVehicle", 0, false]; //must be -2 for target on dedicated

// MISSION OUTCOME
waitUntil {
        sleep 5;
        (
                call compile format["AM5_aborted_%1_%2", _missionType, _requestingFaction] ||
                call compile format["AM5_failed_%1_%2", _missionType, _requestingFaction] ||
                call compile format["AM5_done_%1_%2", _missionType, _requestingFaction] ||
                !(alive _utilityVehicle)
        )
};

{deleteMarker _x} forEach [_areaMarker, _flagMarker];

if (call compile format["AM5_done_%1_%2", _missionType, _requestingFaction]) exitWith {
        {
                cutText ["Deploying FOB stay clear of the area", "PLAIN DOWN"];
        } forEach [(playableUnits) select {side _x == _requestingFaction}];
        sleep 1;
        [_missionType, _requestingFaction] call btc_fnc_task_set_done;
        sleep 1;
        deleteVehicle _utilityVehicle;
        [_missionType, _requestingFaction, getPos _utilityVehicle, getDir _utilityVehicle] call AM5_comp_spawn;
	call compile format["AM5_assigned_%1_%2 = false; publicVariable 'AM5_assigned_%1_%2';", _missionType, _requestingFaction];
};

call compile format["AM5_assigned_%1_%2 = false; publicVariable 'AM5_assigned_%1_%2';", _missionType, _requestingFaction];
[_missionType, _requestingFaction] call btc_fnc_task_fail;
sleep 1;
deleteVehicle _utilityVehicle;
