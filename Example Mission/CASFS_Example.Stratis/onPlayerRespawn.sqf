if !(vehicleVarName player in JWC_CASarray) exitWith {};
closeDialog 0;
[JWC_MaxD, JWC_lock, JWC_num] execVM "JWC_CASFS\addAction.sqf";
