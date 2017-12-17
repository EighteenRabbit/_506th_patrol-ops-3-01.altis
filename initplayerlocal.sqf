waituntil {! isnull player};

// Reserved if needed
if (player == player) then { 
} else {};

execVM "scripts\Ground_List.sqf";
execVM "scripts\Air_List.sqf";
//execVM "scripts\Boat_List.sqf";


deploy1 = haloFlag addAction ["<t size='1.5' shadow='2' color='#00ffff'>Deploy for HALO</t> <img size='4' color='#00ffff' shadow='2' image='\A3\Air_F_Beta\Parachute_01\Data\UI\Portrait_Parachute_01_CA.paa'/>", "Scripts\HALO_Drop.sqf", [], 6, False, True, "", "_this distance _target < 5"];


["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

Skip1 = haloFlag addAction ["Skip Current Task", "Call PO3_fnc_SkipTask", [], 6, False, True, "", "leader group player == leader player;_this distance _target < 5"];

deploy2 = haloFlag addAction ["Marina Base S","Scripts\Teleport.sqf",["redeploy_west_marine"]];
deploy3 = haloFlag addAction ["Marina Base N","Scripts\Teleport.sqf",["redeploy_west_marine_1"]];
deploy4 = haloFlag_1 addAction ["FOB Shifty","Scripts\Teleport.sqf",["redeploy_west"]];
deploy5 = haloFlag_2 addAction ["FOB Shifty","Scripts\Teleport.sqf",["redeploy_west"]];