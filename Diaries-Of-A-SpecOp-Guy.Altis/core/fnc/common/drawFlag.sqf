params ["_selectedDestination", "_text"];
private ["_flagMarker"];
_flagMarker = createmarker [format ["sm_2_%1",_selectedDestination],_selectedDestination];
_flagMarker setmarkertype "hd_flag";
_flagMarker setmarkertext _text;
_flagMarker setMarkerSize [0.6, 0.6];
_flagMarker;
