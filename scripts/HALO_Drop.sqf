//////////////////////////////////////////////////////////////////
// HALO Jumping script script
// Created by: 506th IR Realism Unit - McKelvie
//////////////////////////////////////////////////////////////////

// For team jumps do something like a addaction to each member and 
// when he jumps it removes it from all members

_halo_c130 = _this select 0;
_unit = _this select 1;
_saveLoadOut = [_this, 4, true, [true]] call BIS_fnc_param;

private ["_saveLoadOut","_halo_c130","_chemlight","_unit"];



Hint "Point on your map where you want to Drop.";

openMap true;

MapClicked = false;
publicVariable "MapClicked";

onMapSingleClick "	clickPos = _pos; 
					MapClicked = true; 
					onMapSingleClick {};
				 ";

waituntil {MapClicked or !(visiblemap)};
if (!visibleMap) exitwith {
	hint "HALO Drop Cancelled";
};

	sleep 1;

	hint "Stand-By. . . Preparing Flight Plan";
	
	sleep 1;

	_newClick = "Sign_Sphere10cm_F" createVehicle clickPos;
	_newClick hideObjectGlobal true;
	_newClick setVectorUp [0,0,1];
	_newClick setDir 0;
	
// Randomize Height to prevent any potential collisions
	_Height = 2015 + random 827;
	//publicVariable "_Height";
	
// Create the C130
	_halo_c130 = createvehicle ["RHS_C130J",[0,0,0], [], 0, "NONE"];
	_halo_c130 setVectorUp [0,0,1];
	_halo_c130 attachTo [_newClick,[0,0,(_Height)]];
	_halo_c130 engineOn true;
	_halo_c130 allowdamage false;
	_halo_c130 animate["ramp_bottom", 1];
	_halo_c130 animate["ramp_top", 1];
	_chemlight = "Chemlight_green" createVehicle [0,0,0]; 
	_chemlight attachTo [_halo_c130,[0,0,1.2]];

	clearMagazineCargoGlobal _halo_c130; 
	clearBackpackCargoGlobal _halo_c130; 
	clearWeaponCargoGlobal _halo_c130; 
	clearItemCargoGlobal _halo_c130;


	sleep 2;

	openMap false;

	["BIS_blackStart", true] call BIS_fnc_blackOut;

	0 fadeSound 0;

	sleep 3 + random 2;

_MissionIntro = [] spawn {	

	[["Arrived at your Drop Zone"] , 0, 0.7, "<t align = 'center' shadow = '1' size = '1.0'>%1</t>"] spawn BIS_fnc_typeText;
	
	sleep 2;
	
	["BIS_blackStart", true] call BIS_fnc_blackIn;
};

hint "";

//private ["_saveLoadOut"];

// Save the backpack and its contents, also adds fake pack to front of unit
if (_saveLoadOut && !isNull (unitBackpack _unit) && (backpack _unit) != "b_parachute") then {
	private ["_pack","_class","_magazines","_weapons","_items"];
	_pack	   = unitBackpack _unit;
	_class	   = typeOf _pack;
	_magazines = getMagazineCargo _pack;
	_weapons   = getWeaponCargo _pack;
	_items	   = getItemCargo _pack;
 
	removeBackpack _unit; //remove the backpack
	_unit addBackpack "b_parachute"; //add the parachute

	[_unit,_class,_magazines,_weapons,_items] spawn {
		private ["_unit","_class","_magazines","_weapons","_items"];
		_unit		= _this select 0;
		_class		= _this select 1;
		_magazines	= _this select 2;
		_weapons 	= _this select 3;
		_items 		= _this select 4;
		
		private "_packHolder";
		_packHolder = createVehicle ["groundWeaponHolder", [0,0,0], [], 0, "can_collide"];
		_packHolder addBackpackCargoGlobal [_class, 1];
				
		_packHolder attachTo [_unit,[-0.07,0.67,-0.13],"pelvis"]; 
		_packHolder setVectorDirAndUp [[0,-0.2,-1],[0,1,0]];
				
		waitUntil {animationState _unit == "HaloFreeFall_non"};
		_packHolder attachTo [_unit,[-0.12,-0.02,-.74],"pelvis"]; 
		_packHolder setVectorDirAndUp [[0,-1,-0.05],[0,0,-1]];
				
		waitUntil {animationState _unit == "para_pilot"};
		_packHolder attachTo [vehicle _unit,[-0.07,0.67,-0.13],"pelvis"]; 
		_packHolder setVectorDirAndUp [[0,-0.2,-1],[0,1,0]];
		
		waitUntil {isTouchingGround _unit || (getPos _unit select 2) < 1};
		detach _packHolder;
		deleteVehicle _packHolder; //delete the backpack in front
		removeBackpack _unit;
		_unit addBackpack _class; //return the backpack
		clearAllItemsFromBackpack _unit; //clear all gear from new backpack
		
		for "_i" from 0 to (count (_magazines select 0) - 1) do {
			(unitBackpack _unit) addMagazineCargoGlobal [(_magazines select 0) select _i,(_magazines select 1) select _i]; //return the magazines
		};
		for "_i" from 0 to (count (_weapons select 0) - 1) do {
			(unitBackpack _unit) addWeaponCargoGlobal [(_weapons select 0) select _i,(_weapons select 1) select _i]; //return the weapons
		};
		for "_i" from 0 to (count (_items select 0) - 1) do {
			(unitBackpack _unit) addItemCargoGlobal [(_items select 0) select _i,(_items select 1) select _i]; //return the items
		};
	};
	} else {
		if ((backpack _unit) != "b_parachute") then {_unit addBackpack "B_parachute"}; //add the parachute if unit has no backpack
};
 

	_unit attachTo [_halo_c130 ,[.7,0,1]];
	detach _unit;
	_unit setdir 180;
	5 fadeSound 1;

/*
	{	_radX = -1 + random 2;
		_radY = -1 + random 2;
		publicVariable "_radX";
		publicVariable "_radY";
		_x attachTo [_halo_c130 ,[(_radX),(_radY),1]];
		detach _x;
		_x setdir 180;
		5 fadeSound 1;
	} forEach units group _unit;
*/
waitUntil {
	((animationState _unit == "HaloFreeFall_non") || 
		(animationState _unit == "HaloFreeFall_F") || 
			(animationState _unit == "HaloFreeFall_B"))
};

	_Speed = -20 + random -20;

	_unit setVelocity [0, (_Speed), 0];

//power, duration, frequency
	addCamShake [8, 20, 10]; //power, duration, frequency - Reference use

		"DynamicBlur" 	ppEffectEnable true;  
		"DynamicBlur" 	ppEffectAdjust [5];  
		"DynamicBlur" 	ppEffectCommit 0.01;
		
		sleep 1;
		
		"DynamicBlur" 	ppEffectAdjust [0.0]; 
		"DynamicBlur" 	ppEffectCommit 13;
		
		sleep 5;
		
		"DynamicBlur" 	ppEffectEnable false;
		"RadialBlur" 	ppEffectAdjust [0.0, 0.0, 0.0, 0.0]; //WIP
		"RadialBlur" 	ppEffectCommit 1.0; 
		"RadialBlur" 	ppEffectEnable false;

		_halo_c130 hideObjectGlobal true; 
		_halo_c130 hideObject true; 

	sleep 1 + random 5;

	while {animationState _unit == "HaloFreeFall_non"} do {
		addCamShake [5, 4.2, 4];
			sleep 2 + random 2;
	};

waitUntil {animationState _unit == "para_pilot"};

		33 cutText ["", "BLACK IN", 2];
		addCamShake [50, 5, 4];

	Sleep 5;			

	waitUntil {isTouchingGround _unit || (getPos _unit select 2) < 1.5};
	
if (true) then {	
// Landing Immersion EFX
	addCamShake [20, 5, 5];
	"dynamicBlur" ppEffectEnable true;   
	"dynamicBlur" ppEffectAdjust [6];   
	"dynamicBlur" ppEffectCommit 0;     
	"dynamicBlur" ppEffectAdjust [0.0];  
	"dynamicBlur" ppEffectCommit 5;
};

deleteVehicle _newClick;
deleteVehicle _halo_c130;
deleteVehicle _chemlight;