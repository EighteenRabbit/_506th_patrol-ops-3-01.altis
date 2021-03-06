//Marina TP to home
fob_blue_1 addAction ["To FOB Shifty", "template\tpto_fob_blue.sqf"];
fob_blue_2 addAction ["To FOB Shifty", "template\tpto_fob_blue.sqf"];
haloFlag addAction ["To Airfield", "template\tpto_fob_blue_1.sqf"];


["INIT",format["Executing %1 init.sqf",missionName],true] call PO3_fnc_log;

[] execVM "Patrol_Ops_3.sqf";

[] execVM "JWC_CASFS\initCAS.sqf";  // CAS Script

[] execVM "f\setAISKill\f_setAISkill.sqf";

if(!isDedicated) then {
	Receiving_finish = false;
	onPreloadFinished { Receiving_finish = true; onPreloadFinished {}; };
	WaitUntil{ !(isNull player) && !isNil "PO3_core_init" && Receiving_finish };
}else{
	WaitUntil{!isNil "PO3_core_init"};
};

//External Logistics (Future Mod Support)
[] execVM "scripts\IgiLoad\IgiLoadInit.sqf";

["PO3_taskmaster"] call PO3_fnc_runTaskSequence;

[] call PO3_fnc_outrosequence;

if (!isServer) then {while {isNull player} do {Sleep 0.1}};
null = [auto_phoenix,auto_warlord] execVM "scripts\heloGoTo\heloGoTo_init.sqf";
player setVariable ["NORRN_taxiHeli", auto_phoenix, true];

// Wait until postInit has run because the TFAR settings don't work before then
waitUntil {time > 2};
// The set TFAR Options that are ignored in description.ext and the ACE/CBA options
// No automatic long range radio
["TF_no_auto_long_range_radio", true, true, "mission"] call CBA_settings_fnc_set;
// No personal radios
["TF_give_personal_radio_to_regular_soldier", false, true, "mission"] call CBA_settings_fnc_set;
