/////////////////// SERVER \\\\\\\\\\\\\\\\\\\
if (isServer) then {
        // MISSIONS
        AM5_fnc_mission_LOG_FOB = compileFinal preprocessFileLineNumbers "core\fnc\missions\LOG\fob.sqf";
        AM5_fnc_mission_PvP_JAM = compileFinal preprocessFileLineNumbers "core\fnc\missions\PvP\JAM.sqf";

        // COMPOSITIONS
        AM5_comp_spawn = compile preprocessFileLineNumbers "core\comp\spawn.sqf";
        AM5_comp_fob = compile preprocessFileLineNumbers "core\comp\FOB.sqf";
        am5_comp_flag_arsenal = compile preprocessFileLineNumbers "core\comp\flag_arsenal.sqf";
        AM5_comp_jam = compile preprocessFileLineNumbers "core\comp\Radio.sqf";

        // EH
        AM5_fnc_EH_FOB_hit = compile preprocessFileLineNumbers "core\fnc\eh\FOB_hit.sqf";

        // INTERACTIONS
        AM5_fnc_int_test = compileFinal preprocessFileLineNumbers "core\fnc\int\test.sqf";
};

/////////////////// CLIENT AND SERVER \\\\\\\\\\\\\\\\\\\
//TASK
btc_fnc_task_create = compile preprocessFileLineNumbers "core\fnc\task\create.sqf";
btc_fnc_task_fail = compile preprocessFileLineNumbers "core\fnc\task\fail.sqf";
btc_fnc_task_set_done = compile preprocessFileLineNumbers "core\fnc\task\set_done.sqf";

AM5_fnc_missions_abort = compile preprocessFileLineNumbers "core\fnc\missions\abort.sqf";

// COMMON
AM5_fnc_common_getGridCoords = compileFinal preprocessFileLineNumbers "core\fnc\common\getGRIDCoords.sqf";
AM5_fnc_common_selectFlatLocation = compileFinal preprocessFileLineNumbers "core\fnc\common\selectFlatLandLocation.sqf";

// INTERACTIONS
AM5_fnc_int_addActionFOBVehicle = compileFinal preprocessFileLineNumbers "core\fnc\int\addActionFOBVehicle.sqf";
AM5_fnc_int_addActionVehicle = compileFinal preprocessFileLineNumbers "core\fnc\int\addActionVehicle.sqf";

/////////////////// CLIENT \\\\\\\\\\\\\\\\\\\
if (!isDedicated) then {
        // INTERACTIONS
        AM5_fnc_int_addActionMissions = compileFinal preprocessFileLineNumbers "core\fnc\int\addActionMissions.sqf";

        // MISSIONS
	AM5_fnc_missions_request = compileFinal preprocessFileLineNumbers "core\fnc\missions\request.sqf";
};
