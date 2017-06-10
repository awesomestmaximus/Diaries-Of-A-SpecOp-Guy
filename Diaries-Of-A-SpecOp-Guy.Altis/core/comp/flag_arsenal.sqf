params ["_sidePlayer", "_pos"];
private ["_fobFlag", "_fobArsenal", "_out"];

if (_sidePlayer == east) then {
        _fobFlag = "rhs_Flag_Russia_F" createVehicle [ (_pos select 0) + 0.0708008, (_pos select 1) + 2.19482, 0];
} else {
	_fobFlag = "Flag_US_F" createVehicle [ (_pos select 0) + 0.0708008,( _pos select 1) + 2.19482, 0];
};

_fobArsenal = "I_supplyCrate_F" createVehicle [ (_pos select 0) - 1.91406, (_pos select 1) + 2.21924,0];
_fobArsenal;
