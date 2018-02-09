// addHeliDepartAction.sqf
// � OCTOBER 2011 - norrin
private ["_unit","_heli"];
_unit = _this select 0;
if(!local _unit) exitWith {};
_heli = player getVariable "NORRN_taxiHeli";

_heli setFuel 1;
_heli setVehicleAmmo 1;

sleep 1;
while {!(player in crew _heli)} do {sleep 0.1};
NORRN_getTheFoutOfDodge_action = _heli addAction ["Give chopper all clear for takeoff", "scripts\heloGoTo\heliDepartAction.sqf",[_unit, _heli],1, false];
hint "Give chopper all clear for takeoff";
while {(getPos _heli select 2) < 20} do {sleep 0.1};
NORRN_heliGoToRTB_action = _heli addAction  ["Return to base", "scripts\heloGoTo\RTBaction.sqf", _heli];

_heli setVariable ["NORRN_H_commandingUnit", _unit, true];
player setVariable ["NORRN_taxiHeli", _heli, true];
NORRN_heliGoToLand_action = _heli addAction  ["Set chopper destination", "scripts\heloGoTo\landMapClick.sqf", [_heli, _unit]];

_heli setVariable ["NORRN_H_destChosen", false, true];
