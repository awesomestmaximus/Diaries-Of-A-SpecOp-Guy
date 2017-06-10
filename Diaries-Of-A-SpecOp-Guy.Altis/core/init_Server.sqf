// SERVER INIT FILE
for "_missionType" from 0 to 1 do {
        {[_x, _missionType] spawn btc_fnc_task_create} foreach [east, west];
};
