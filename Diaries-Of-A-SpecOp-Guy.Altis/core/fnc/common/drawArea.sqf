params ["_selectedDestination", "_areaSize"];
private ["_areaMarker"];
// Draw Markers
_areaMarker = createmarker [format ["sm_%1",_selectedDestination],_selectedDestination];
_areaMarker setMarkerShape "ELLIPSE";
_areaMarker setMarkerBrush "SolidBorder";
_areaMarker setMarkerSize [_areaSize, _areaSize];
_areaMarker setMarkerAlpha 0.3;
_areaMarker setmarkercolor "colorBlue";
_areaMarker;
