params ["_requestingFaction", "_missionType", ["_taskDestination", objNull], ["_taskDestinationText", ""]];

if (!isServer) exitWith { // If client, only show notification

[
	"Task" + (["Task_" + str(_missionType) + "_" + str(_requestingFaction)] call BIS_fnc_taskState) + "Icon",
	[[["Task_" + str(_missionType) + "_" + str(_requestingFaction)] call BIS_fnc_taskType] call bis_fnc_taskTypeIcon,
	(["Task_" + str(_missionType) + "_" + str(_requestingFaction)] call BIS_fnc_taskDescription) select 1 select 0]
] call bis_fnc_showNotification;
};

// If server create task

private ["_description", "_taskType"];

if ((typeName (_missionType)) isEqualTo "STRING") exitWith {};

switch (_missionType) do
{
	case 0 :
	{
		_description = ["Defeat the Enemy once and for all","Defeat the Enemy","Defeat the Enemy"];
		_taskType = "kill";
	};
	case 1 :
	{
		_description = ["Destroy all the FOB's of the Enemy","Destroy all the FOB's","Destroy all the FOB's"];
		_taskType = "destroy";
	};
	case 2 :
	{
		_description = [format["Deploy the FOB at GRID %1", _taskDestinationText],"Deploy FOB","Deploy FOB"];
		_taskType = "move";
	};
	case 3 :
	{
		_description = [format["Deploy the JAMMER at GRID %1", _taskDestinationText],"Deploy JAMMER","Deploy JAMMER"];
		_taskType = "repair";
	};
};

[
	_requestingFaction,
	["Task_" + str(_missionType) + "_" + str(_requestingFaction)],
	_description,
	_taskDestination,
	true,
	2,
	true,
	_taskType,
	true
] call BIS_fnc_taskCreate;
