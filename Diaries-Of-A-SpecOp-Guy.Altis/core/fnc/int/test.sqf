params ["_fob_vehicle", "_sidePlayer", "_logPos", "_marker"];
private ["_action"];

// Side Missions
_action = [   // Side Mission Main Node
        "side_mission_vic",
        "Side mission",
        "\A3\ui_f\data\igui\cfg\simpleTasks\types\whiteboard_ca.paa",
        {},
        {true}
] call ace_interact_menu_fnc_createAction;
[_fob_vehicle, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = [   // Abort FOB Side Mission
        "side_mission_vic",
        "Abort FOB Mission",
        "\A3\ui_f\data\igui\cfg\simpleTasks\types\exit_ca.paa",
        {
                if ((_this select 0) distance (_this select 2 select 2) < 1000) exitWith {
                        cutText ["FOB needs to be deployed atleast a kilometer away from base", "PLAIN DOWN"];
                };
                if ((_this select 0) distance (_this select 2 select 3) > 250) exitWith {
                        cutText ["FOB needs to be withing 250m of designated marker", "PLAIN DOWN"];
                };
                call compile format["AM5_done_%1_%2 = true; publicVariable 'AM5_done_%1_%2'", 2, _this select 2 select 1];
        },
        {true},
        {},
        [_fob_vehicle, _sidePlayer, _logPos, _marker]
] call ace_interact_menu_fnc_createAction;
[_fob_vehicle, 0, ["ACE_MainActions", "side_mission_vic"], _action] call ace_interact_menu_fnc_addActionToObject;
