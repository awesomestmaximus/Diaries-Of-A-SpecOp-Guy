private ["_action"];

// Missions
_action = [   // Side Mission Main Node
        "missions_actions",
        "Missions",
        "\A3\ui_f\data\igui\cfg\simpleTasks\types\whiteboard_ca.paa",
        {},
        {(_this select 0) distance (west_log_point) < 50 || (_this select 0) distance (east_log_point) < 50}
] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = [   // Abort FOB Mission
        "missions_actions",
        "Abort FOB Mission",
        "\A3\ui_f\data\igui\cfg\simpleTasks\types\exit_ca.paa",
        {[2, side player] call AM5_fnc_missions_abort},
        {(call compile format ["AM5_assigned_%1_%2", 2, side player])}
] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "missions_actions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = [   // Request FOB Mission
        "missions_actions",
        "Request FOB",
        "\A3\ui_f\data\igui\cfg\simpleTasks\types\default_ca.paa",
        {[2, side player] spawn AM5_fnc_missions_request},
        {(call compile format ["!AM5_assigned_%1_%2", 2, side player])}
] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "missions_actions"], _action] call ace_interact_menu_fnc_addActionToObject;
