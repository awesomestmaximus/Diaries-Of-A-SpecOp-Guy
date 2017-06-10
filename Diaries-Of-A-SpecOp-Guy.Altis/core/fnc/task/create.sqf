params ["_sidePlayer", "_sideType", ["_destination", objNull], ["_destinationText", ""]];

if (!isServer) exitWith { // If client, only show notification

[
	"Task" + (["Task_" + str(_sideType) + "_" + str(_sidePlayer)] call BIS_fnc_taskState) + "Icon",
	[[["Task_" + str(_sideType) + "_" + str(_sidePlayer)] call BIS_fnc_taskType] call bis_fnc_taskTypeIcon,
	(["Task_" + str(_sideType) + "_" + str(_sidePlayer)] call BIS_fnc_taskDescription) select 1 select 0]
] call bis_fnc_showNotification;
};

// If server create task

private ["_location", "_description", "_type"];

if ((typeName (_sideType)) isEqualTo "STRING") exitWith {};

switch (_sideType) do
{
	case 0 :
	{
		_description = ["Defeat the Enemy once and for all","Defeat the Enemy","Defeat the Enemy"];
		_type = "kill";
	};
	case 1 :
	{
		_description = ["Destroy all the FOB's of the Enemy","Destroy all the FOB's","Destroy all the FOB's"];
		_type = "destroy";
	};
	case 2 :
	{
		_description = [format["Deploy the FOB at GRID %1", _destinationText],"Deploy FOB","Deploy FOB"];
		_type = "move";
	};
};

[
	_sidePlayer,
	["Task_" + str(_sideType) + "_" + str(_sidePlayer)],
	_description,
	_destination,
	true,
	2,
	true,
	_type,
	true
] call BIS_fnc_taskCreate;
