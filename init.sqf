// Teleports
haloFlag addAction ["To Airfield", "template\tpto_fob_blue_1.sqf"];
fob_blue_1 addAction ["To FOB Shifty", "template\tpto_fob_blue.sqf"];

//TFAR Options
TF_give_personal_radio_to_regular_soldier = true;
tf_no_auto_long_range_radio = true;

//ARES Additions
[] execVM "Ares additions\Ares_Reinforcement_Unit_Pools_RHS.sqf";
[] execVM "Ares additions\AresModuleAdditions.sqf";

// Saving disabled without autosave.
enableSaving [false, false];

waituntil {!isnil "bis_fnc_init"};

addMissionEventHandler ["HandleDisconnect",{deleteVehicle (_this select 0); false}];

["INIT",format["Executing %1 init.sqf",missionName],true] call PO3_fnc_log;

[] execVM "Patrol_Ops_3.sqf";

if(!isDedicated) then {
	Receiving_finish = false;
	onPreloadFinished { Receiving_finish = true; onPreloadFinished {}; };
	WaitUntil{ !(isNull player) && !isNil "PO3_core_init" && Receiving_finish };
}else{
	WaitUntil{!isNil "PO3_core_init"};
};

// if(!isDedicated && !PO3_debug) then {
// 	playMusic "LeadTrack01a_F";
// 	0 fadeMusic 1;
// 	[5,""] spawn PO3_fnc_camera_fadein;
// 	if!(PO3_debug) then { [270,900,150] call PO3_fnc_introsequence };
// 	[] spawn { sleep 20; 8 fadeMusic 0; };

// //External Injury system (Future Mod Support)
// 	TCB_AIS_PATH = "scripts\ais_injury\";
// 	{[_x] call compile preprocessFile (TCB_AIS_PATH+"init_ais.sqf")} forEach (if (isMultiplayer) then {playableUnits} else {switchableUnits});		// execute for every playable unit
// //External Logistics (Future Mod Support)
// 	[] execVM "scripts\IgiLoad\IgiLoadInit.sqf";
// };

["PO3_taskmaster"] call PO3_fnc_runTaskSequence;

[] call PO3_fnc_outrosequence;
