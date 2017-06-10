call compile preprocessFile "core\fnc\compile.sqf";
call compile preprocessFile "core\def\mission.sqf";

call compile preprocessFile "core\init_Common.sqf";
if (isServer) then {
	call compile preprocessFile "core\init_Server.sqf";
};
if (!isDedicated && hasInterface) then {
	call compile preprocessFile "core\init_Player.sqf";
};
