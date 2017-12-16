/*
	Author: Eightysix

	Description:

*/
private["_lives","_gearList"];

closeDialog 0;

//[_this select 0,_this select 1] spawn PO3_fnc_onkilled_sitrep;
//[PO3_param_respawn_playertime] spawn PO3_fnc_onkilled_effects;

PO3_player_body = player;
PO3_player_respawned = true;