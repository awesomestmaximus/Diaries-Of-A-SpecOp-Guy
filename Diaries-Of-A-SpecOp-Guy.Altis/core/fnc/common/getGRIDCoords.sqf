params ["_pos"];
private ["_grid", "_xc", "_yc", "_xo", "_yo", "_calcMEM"];

_xi = _pos select 0;
_yi = _pos select 1;

_calcMEM = floor (_xi / 100);

if (_calcMEM < 10) then { _xo = "00" + str(_calcMEM);};
if (_calcMEM < 100) then { _xo = "0" + str(_calcMEM);} else { _xo = str(_calcMEM);};

_calcMEM = floor (_yi / 100);

if (_calcMEM < 10) then { _yo = "00" + str(_calcMEM);};
if (_calcMEM < 100) then { _yo = "0" + str(_calcMEM);} else { _yo = str(_calcMEM);};

_grid = _xo + " " + _yo;
_grid;
