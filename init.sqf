//TFAR Options
TF_give_personal_radio_to_regular_soldier = true;
tf_no_auto_long_range_radio = true;

//Marina TP to home
fob_blue addAction ["To Base", "template\tpto_fob_blue_1.sqf"];
fob_blue_1 addAction ["To Base", "template\tpto_fob_blue_1.sqf"];

["INIT",format["Executing %1 init.sqf",missionName],true] call PO3_fnc_log;

[] execVM "Patrol_Ops_3.sqf";

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
