cutText ["Click on the Map to indicate the desired location\nMust be on a relatively flat land surface", "PLAIN DOWN"];

posSelected = false;
mapClicked = false;
destination = "";

while {!posSelected} do {
        openMap true;
        mapClicked = false;
        onMapSingleClick {
                mapClicked = true;
                destination = _pos isFlatEmpty [-1, -1, 0.2, 50, 0, false, objNull];
                if (destination isEqualTo []) then {
                        hint "Location must be a relatively flat terrain.";
                        posSelected = false;
                } else {
                        hint format ["%1", _destination];
                        posSelected = true;
                };
        };
        waitUntil {mapClicked || !visibleMap};
        onMapSingleClick "";
        if (!visibleMap) exitWith {
                hint "No location selected, Try again!";
        };        
};
cutText ["", "PLAIN"];
openMap false;
destination;
