/*
// this addAction ["Clear Loadout", "scripts\clear_loadout.sqf", [],6,true,true,"","_this distance _target < 5"];
*
* Clear Lodout Script by 506th IR RU Missions Team
* Last Modified: 20FEB18
*/

_unit = _this select 1;
     
if (!local _unit) exitWith {};

// Remove inventory     
removeallweapons _unit;
removeallassigneditems _unit;
removeuniform _unit;
removevest _unit;
removebackpack _unit;
removeheadgear _unit;
removebackpack _unit;
removegoggles _unit;

// Add a standard OCP uniform and Patrol Cap
_unit adduniform "rhs_uniform_cu_ocp_101st";
_unit addHeadgear "rhsusf_patrolcap_ocp";

// Remove any items stored in the "leftWeapon" possition by the AALSSW.pbo
if(!isNil {player getVariable ["leftWeapon", nil]}) then {
    detach wpnHolderLeft;
    deleteVehicle wpnHolderLeft;
	player setVariable ["leftWeapon",nil];
	check_backWeapon = true;
}

