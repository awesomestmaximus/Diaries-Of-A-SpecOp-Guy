/* =========================
# Playbook
1. Open Map
2. Map click = JAM deploy position
3. Spawn Vehicle
4. Create Task
5. Add action to vehicle
6. Wait for vehicle to be outside of 2 km from base
7. Action "DEPLOY"
        a. Remove vehicle
        b. Create JAM composition at vehicle position
        c. Change task description to "SUCCESS"

*/
params ["_side", "_log_spawn_point", "_destination"];
private ["_utilityVehicle", "_destinationText", "_area", "_marker"];

// Define FOB Vehicle based on side     ================== [3]
// SPAWN VEHICLE
// Initialise variables
if (_side == east) then {
        _utilityVehicle = "rhs_gaz66_ammo_vdv" createVehicle _log_spawn_point;
} else {
        _utilityVehicle = "rhsusf_M977A4_REPAIR_usarmy_d" createVehicle _log_spawn_point;
};
call compile format ["AM5_aborted_%1_%2 = false;", 3, _side];
call compile format ["AM5_done_%1_%2 = false;", 3, _side];
call compile format ["AM5_failed_%1_%2 = false;", 3, _side];

// Create Task                          ================== [4]
_destinationText = [_destination] call AM5_fnc_common_getGridCoords;
[_side, 3, _utilityVehicle, _destinationText] call btc_fnc_task_create;
sleep 1;
call compile format["AM5_assigned_%1_%2 = true; publicVariable 'AM5_assigned_%1_%2';", 3, _side];

// Draw Markers
_area = createmarker [format ["sm_%1",_destination],_destination];
_area setMarkerShape "ELLIPSE";
_area setMarkerBrush "SolidBorder";
_area setMarkerSize [250, 250];
_area setMarkerAlpha 0.3;
_area setmarkercolor "colorBlue";
_marker = createmarker [format ["sm_2_%1",_destination],_destination];
_marker setmarkertype "hd_flag";
_marker setmarkertext "Jammer Deploy Location";
_marker setMarkerSize [0.6, 0.6];

// Add Deploy Action To Vehicle
[_utilityVehicle, _side, _log_spawn_point, getMarkerPos _marker, 3] remoteExec ["AM5_fnc_int_addActionVehicle", 0, false]; //must be -2 for target on dedicated

// MISSION OUTCOME
waitUntil {
        sleep 5;
        (
                call compile format["AM5_aborted_%1_%2", 3, _side] ||
                call compile format["AM5_failed_%1_%2", 3, _side] ||
                call compile format["AM5_done_%1_%2", 3, _side] ||
                !(alive _utilityVehicle)
        )
};

{deleteMarker _x} forEach [_area, _marker];

if (call compile format["AM5_done_%1_%2", 3, _side]) exitWith {
        {
                cutText ["Deploying FOB stay clear of the area", "PLAIN DOWN"];
        } forEach [(playableUnits) select {side _x == _side}];
        sleep 1;
        [3, _side] call btc_fnc_task_set_done;
        sleep 1;
        deleteVehicle _utilityVehicle;
        ["jam", _side, getPos _utilityVehicle, getDir _utilityVehicle] call AM5_comp_spawn;
	call compile format["AM5_assigned_%1_%2 = false; publicVariable 'AM5_assigned_%1_%2';", 3, _side];
};

call compile format["AM5_assigned_%1_%2 = false; publicVariable 'AM5_assigned_%1_%2';", 3, _side];
[3, _side] call btc_fnc_task_fail;
sleep 1;
deleteVehicle _utilityVehicle;
