params ["_fob_vehicle", "_sidePlayer", "_logPos", "_marker"];
private ["_action"];

// Side Missions
_action = [   // Side Mission Main Node
        "mission_fob",
        "FOB Mission",
        "\A3\ui_f\data\igui\cfg\simpleTasks\types\whiteboard_ca.paa",
        {},
        {true}
] call ace_interact_menu_fnc_createAction;
[_fob_vehicle, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = [   // Deploy FOB
        "mission_fob",
        "Deploy FOB",
        "\A3\ui_f\data\igui\cfg\simpleTasks\types\exit_ca.paa",
        {
                if ((_this select 0) distance (_this select 2 select 3) > 250) exitWith {
                        cutText ["FOB needs to be withing 250m of designated marker", "PLAIN DOWN"];
                };
                call compile format["AM5_done_%1_%2 = true; publicVariable 'AM5_done_%1_%2'", 2, _this select 2 select 1];
        },
        {true},
        {},
        [_fob_vehicle, _sidePlayer, _logPos, _marker]
] call ace_interact_menu_fnc_createAction;
[_fob_vehicle, 0, ["ACE_MainActions", "mission_fob"], _action] call ace_interact_menu_fnc_addActionToObject;
