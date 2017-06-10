params ["_sideType", "_sidePlayer"];

if (isServer) exitWith {
        ["Task_" + str(_sideType) + "_" + str(_sidePlayer), "FAILED", false] spawn BIS_fnc_taskSetState;
        ["Task_" + str(_sideType) + "_" + str(_sidePlayer)] call BIS_fnc_deleteTask;
};

private ["_description"];

switch (_sideType) do
{
	case 2 :
	{
		_description = ["Side mission failed!","The FOB has not been Deployed"];
	};
	default
        {
		_description = ["Side mission failed!","You failed even when doing nothing"];
	};
};
[
        "task" + "FAILED" + "Icon",
        [
                [["Task_" + str(_sideType) + "_" + str(_sidePlayer)] call BIS_fnc_taskType] call bis_fnc_taskTypeIcon,
                 _description select 1
        ]
] call bis_fnc_showNotification;
["Task_" + str(_sideType) + "_" + str(_sidePlayer)] call BIS_fnc_deleteTask;
