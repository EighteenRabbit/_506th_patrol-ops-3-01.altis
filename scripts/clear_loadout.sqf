/*
CHANGELOG

06JAN14
- Changed to patchless uniform
*/


removeallweapons player;
removeallassigneditems player;
removeuniform player;
removevest player;
removebackpack player;
removeheadgear player;
removebackpack player;
removegoggles player;
player adduniform "rhs_uniform_cu_ocp_101st";

if(!isNil {player getVariable ["leftWeapon", nil]}) then {
    detach wpnHolderLeft;
    deleteVehicle wpnHolderLeft;
	player setVariable ["leftWeapon",nil];
	check_backWeapon = true;
}
