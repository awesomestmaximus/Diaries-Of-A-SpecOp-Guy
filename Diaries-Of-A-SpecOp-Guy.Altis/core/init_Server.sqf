// SERVER INIT FILE
for "_type" from 0 to 1 do {
        {[_x, _type] spawn btc_fnc_task_create} foreach [east, west];
};
