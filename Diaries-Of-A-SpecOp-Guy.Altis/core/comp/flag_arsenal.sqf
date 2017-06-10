params ["_requestingFaction", "_position"];
private ["_fobFlag", "_fobArsenal"];

if (_requestingFaction == east) then {
        _fobFlag = "rhs_Flag_Russia_F" createVehicle [ (_position select 0) + 0.0708008, (_position select 1) + 2.19482, 0];
} else {
	_fobFlag = "Flag_US_F" createVehicle [ (_position select 0) + 0.0708008,( _position select 1) + 2.19482, 0];
};

_fobArsenal = "I_supplyCrate_F" createVehicle [ (_position select 0) - 1.91406, (_position select 1) + 2.21924,0];
_fobArsenal;
