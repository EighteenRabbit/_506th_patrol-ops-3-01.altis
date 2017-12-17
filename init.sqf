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

// init.sqf
// � OCTOBER 2011 - norrin
////////////////////////////Code specific for aerial taxi scripts//////////////////////////////
// Add the following line for MP games
if (!isServer) then {while {isNull player} do {Sleep 0.1}};
// Start heli taxi scripts
// [slick1,escort1] execVM "scripts\heloGoTo\heliTaxi_init.sqf";
[slick1] execVM "scripts\heloGoTo\heliTaxi_init.sqf";
// For extraction action at start-up
player setVariable ["NORRN_taxiHeli", slick1, true];
// Set this var to true if you do not want the taxi or escort to respawn
//NORRN_aerialTaxiRespawnOff = true;
// Set these vars to true if you do not downed chopper or chopper crew deleted
NORRN_FR_keepOldCrew = true;
NORRN_FR_keepOldHeli = true;
///////////////////////////////////////////////////////////////////////////////////////
////////////////////////Cam scripts - not required for aerial taxi scripts///////////////////////
[player]execVM "NORRN_cam\start_cam.sqf";
///////////////////////////////////////////////////////////////////////////////////////
//////////////////Optional code for testing - not required for aerial taxi scripts//////////////////
private ["_units"];
// optional code:  make driver of slick1, slick1 and player immune to damage for testing scripts
slick1 allowDamage false;
{_x allowDamage false} forEach crew slick1;
escort1 allowDamage false;
{_x allowDamage false} forEach crew escort1;
//player allowDamage false;
// optional code: move player's group into chopper - local server or SP only
//_units = units (group player);
//{_x moveInCargo slick1} forEach _units;
///////////////////////////////////////////////////////////////////////////////////////