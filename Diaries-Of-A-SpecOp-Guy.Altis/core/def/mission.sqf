// Mission specific definitions of variables

/* MISSIONS

FORMAT:
%TYPE   = Mission Type (numerical value )
%SIDE   = EAST | WEST
%VAR    = Variable Name
tasks:
        Task_%TYPE_%SIDE
        Task_0_EAST             = Task FOB EAST
variables
        AM5_%VAR_%TYPE_%SIDE
        AM5_assigned_0_WEST
*/

// Initialise mission variables
{
        call compile format ["AM5_aborted_%1_%2 = false;", _x, east];
        call compile format ["AM5_assigned_%1_%2 = false;", _x, east];
        call compile format ["AM5_done_%1_%2 = false;", _x, east];
        call compile format ["AM5_failed_%1_%2 = false;", _x, east];
} forEach [0, 1, 2, 3];
{
        call compile format ["AM5_aborted_%1_%2 = false;", _x, west];
        call compile format ["AM5_assigned_%1_%2 = false;", _x, west];
        call compile format ["AM5_done_%1_%2 = false;", _x, west];
        call compile format ["AM5_failed_%1_%2 = false;", _x, west];
} forEach [0, 1, 2, 3];

jamRadius = 5000;
jamStr = 100;
jamDEBUG = true;
