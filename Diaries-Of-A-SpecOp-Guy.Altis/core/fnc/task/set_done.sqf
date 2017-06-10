params ["_missionType", "_requestingFaction"];

if (isServer) exitWith {
	["Task_" + str(_missionType) + "_" + str(_requestingFaction), "SUCCEEDED", false] spawn BIS_fnc_taskSetState;
	//if (_missionType isEqualTo 1) then {[2] call btc_fnc_task_create};
};

private ["_description", "_spacer"];

_spacer = "                              ";

switch _missionType do
{
	case 0 : {
		_description = ["Misison accomplished!","The Enemy has been finally defeated!" + _spacer + "Misison accomplished!"];
	};
	case 1 : {
		_description = ["Misison accomplished!","All enemy FOBs have been destroyed!"];
	};
	case 2 : {
		_description = ["Side Misison accomplished!","FOB has been deployed!" + _spacer + "New Spawn Point Available!"];
	};
	case 3 : {
		_description = ["Side Misison accomplished!","JAM has been deployed!" + _spacer + "Enemy Communications Disrupted!"];
	};
};
[
	"task" + "SUCCEEDED" + "Icon",
	[
		[["Task_" + str(_missionType) + "_" + str(_requestingFaction)] call BIS_fnc_taskType] call bis_fnc_taskTypeIcon,
		_description select 1
	]
] call bis_fnc_showNotification;
["Task_" + str(_missionType) + "_" + str(_requestingFaction)] call BIS_fnc_deleteTask;
