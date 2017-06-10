params ["_utilityVehicle", "_sidePlayer", "_logPos", "_marker", "_missionType"];
private ["_action"];

// Side Missions
_action = [   // Side Mission Main Node
        "mission_vic",
        "Truck",
        "\A3\ui_f\data\igui\cfg\simpleTasks\types\whiteboard_ca.paa",
        {},
        {true}
] call ace_interact_menu_fnc_createAction;
[_utilityVehicle, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = [   // Deploy FOB
        "mission_vic",
        "Deploy",
        "\A3\ui_f\data\igui\cfg\simpleTasks\types\exit_ca.paa",
        {
                if ((_this select 0) distance (_this select 2 select 3) > 250) exitWith {
                        cutText ["Vehicle needs to be withing 250m of designated marker", "PLAIN DOWN"];
                };
                call compile format["AM5_done_%1_%2 = true; publicVariable 'AM5_done_%1_%2'", _this select 2 select 4, _this select 2 select 1];
        },
        {true},
        {},
        [_utilityVehicle, _sidePlayer, _logPos, _marker, _missionType]
] call ace_interact_menu_fnc_createAction;
[_utilityVehicle, 0, ["ACE_MainActions", "mission_vic"], _action] call ace_interact_menu_fnc_addActionToObject;
