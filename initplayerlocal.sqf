waituntil {! isnull player};

// When a player logs in remove all gear from player and add only what is needed
if (player == player) then {
	// Remove the default RHS loadout
	removeallweapons player;
	removeallassigneditems player;
	removeuniform player;
	removevest player;
	removebackpack player;
	removeheadgear player;
	removebackpack player;
	removegoggles player;

	// Set baseline 101st Uniform and Patrol Cap
	player forceAddUniform "rhs_uniform_cu_ocp_101st";
	player addHeadgear "rhsusf_patrolcap_ocp";
	player additem "ItemMap";
	player assignItem "ItemMap";

	// Set the view distance settings
	view = player addAction ["Settings", "scripts\Viewdistance.sqf", [],-98,false,false];
 } else {};

//execVM "scripts\Ground_List.sqf";
//execVM "scripts\Air_List.sqf";
//execVM "scripts\Boat_List.sqf";


deploy1 = halo1 addAction ["<t size='1.5' shadow='2' color='#00ffff'>Deploy for HALO</t> <img size='4' color='#00ffff' shadow='2' image='\A3\Air_F_Beta\Parachute_01\Data\UI\Portrait_Parachute_01_CA.paa'/>", "Scripts\HALO_Drop.sqf", [], 6, False, True, "", "_this distance _target < 5"];
deploy2 = haloFlag_1 addAction ["<t size='1.5' shadow='2' color='#00ffff'>Deploy for HALO</t> <img size='4' color='#00ffff' shadow='2' image='\A3\Air_F_Beta\Parachute_01\Data\UI\Portrait_Parachute_01_CA.paa'/>", "Scripts\HALO_Drop.sqf", [], 6, False, True, "", "_this distance _target < 5"];
deploy3 = haloFlag_1_1 addAction ["<t size='1.5' shadow='2' color='#00ffff'>Deploy for HALO</t> <img size='4' color='#00ffff' shadow='2' image='\A3\Air_F_Beta\Parachute_01\Data\UI\Portrait_Parachute_01_CA.paa'/>", "Scripts\HALO_Drop.sqf", [], 6, False, True, "", "_this distance _target < 5"];


["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

Skip1 = skip1 addAction ["Skip Current Task", "Call PO3_fnc_SkipTask", [], 6, False, True, "", "leader group player == leader player;_this distance _target < 5"];

deploy4 = haloFlag addAction ["Marina Base S","Scripts\Teleport.sqf",["redeploy_west_marine"]];
deploy5 = haloFlag addAction ["Marina Base N","Scripts\Teleport.sqf",["redeploy_west_marine_1"]];
deploy6 = haloFlag_1 addAction ["FOB Shifty","Scripts\Teleport.sqf",["redeploy_west"]];
deploy7 = haloFlag_1_1 addAction ["FOB Shifty","Scripts\Teleport.sqf",["redeploy_west"]];

null = [auto_phoenix,auto_warlord] execVM "scripts\heloGoTo\heloGoTo_init.sqf";
player setVariable ["NORRN_taxiHeli", auto_phoenix, true];
