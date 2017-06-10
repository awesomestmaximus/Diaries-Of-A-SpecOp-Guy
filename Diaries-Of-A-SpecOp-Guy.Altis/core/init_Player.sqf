// PLAYER INIT FILE
[] spawn {
        waitUntil {!isNull player};

        // Add Missions Actions to commander
        if (player getVariable ["commander", false]) then {
                //hint "adding actions";
                call AM5_fnc_int_addActionMissions;
        };

        sleep 2;

        //waitUntil {scriptDone AM5_intro_play};
};
