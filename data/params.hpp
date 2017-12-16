// =========================================================================================================
// !!  DO NOT MODIFY THIS FILE  !!
// =========================================================================================================
class PO3_param_missions_title {
	title = "====== PO3 Mission Options ======";
	values[]= {0};
	texts[]= {" "};
	default = 0;
	code = "";
};
	class param_PO3_missionhour {
		title = "Mission Hour";
		values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
		default=12;
		texts[]={"0000H","0100H","0200H","0300H","0400H","0500H","0600H","0700H","0800H","0900H","1000H","1100H","1200H","1300H","1400H","1500H","1600H","1700H","1800H","1900H","2000H","2100H","2200H","2300H"};
		code = "PO3_param_missionhour = %1;";
	};
	class param_PO3_missioncount {
		title = "Number of Missions";
		values[]={1,2,3,5,7,9,15,30,99};
		texts[]={"One","Two","Three","Five","Seven","Nine","Fifteen","Thirty","Unlimited"};
		default=15;
		code = "PO3_param_missioncount = if(%1 < 99)then{%1}else{-1};";
	};
	class param_PO3_missionskill {
		title =  "Mission Difficulty";
		values[]={1,2,4,6};
		texts[]={$STR_PO3_TEXT_LOW,$STR_PO3_TEXT_MED,$STR_PO3_TEXT_HIGH,$STR_PO3_TEXT_ULTRA};
		default=2;
		code = "PO3_param_missionskill = (%1/3);";
	};
	class param_PO3_ai_Tkill {
		title = $STR_PO3_PARAM_SETAITKILL;
		values[]={0,1};
		texts[]={$STR_PO3_TEXT_NO,$STR_PO3_TEXT_YES};
		default=1;
		code = "PO3_param_ai_easyKill = if(%1 > 0)then{true}else{false};";
	};
class PO3_param_ambient_title {
	title = "====== PO3 Ambient Options ======";
	values[]= {0};
	texts[]= {" "};
	default = 0;
	code = "";
};
	class param_PO3_ambientair {
		title = "Ambient Air Patrols";
		values[]={0,1};
		texts[]={$STR_PO3_TEXT_OFF,$STR_PO3_TEXT_ON};
		default=0;
		code = "PO3_param_ambientpatrolair = if(%1 > 0)then{true}else{false};";
	};
	class param_PO3_ambientgnd {
		title = "Ambient Ground Patrols";
		values[]={0,400,600,800,1200};
		texts[]={$STR_PO3_TEXT_OFF,$STR_PO3_TEXT_LOW,$STR_PO3_TEXT_MED,$STR_PO3_TEXT_HIGH,$STR_PO3_TEXT_ULTRA};
		default=600;
		code = "PO3_param_ambientpatrolgnd = if(%1 > 0)then{ PO3_count_ambientpatrolgnd = %1; true}else{false};";
	};
	class param_PO3_ambientradius {
		title = "Ambient Spawn Radius";
		values[]={0,500,1000,1500,2000,2500,5000,10000};
		texts[]={$STR_PO3_TEXT_OFF,"500","1000","1500","2000","2500","5000","10000"};
		default=1500;
		code = "PO3_radius_ambientpatrolgnd = %1;";
	};
	
class PO3_param_gameplay_title {
	title = $STR_PO3_PTITLE_GAMEOPTIONS;
	values[]= {0};
	texts[]= {" "};
	default = 0;
	code = "";
};
	class param_PO3_grpmark_icons {
		title = $STR_PO3_PARAM_GRPMARK_GRP;
		values[]={0,1};
		texts[]={$STR_PO3_TEXT_NO,$STR_PO3_TEXT_YES};
		default=1;
		code = "PO3_param_grpmark_allow = if(%1 > 0)then{true}else{false};";
	};
	class param_PO3_grpmark_squadicons {
		title = $STR_PO3_PARAM_GRPMARK_SQD;
		values[]={0,1};
		texts[]={$STR_PO3_TEXT_NO,$STR_PO3_TEXT_YES};
		default=1;
		code = "PO3_param_grpmark_squad_allow = if(%1 > 0)then{true}else{false};";
	};

class PO3_param_playergame_title {
	title = $STR_PO3_PTITLE_PLAYROPTIONS;
	values[]= {0};
	texts[]= {" "};
	default = 0;
	code = "";
};
	class param_PO3_player_fatigue {
		title = $STR_PO3_PARAM_PLAYRFATIGUE;
		values[]={0,1};
		texts[]={$STR_PO3_TEXT_DISABLED,$STR_PO3_TEXT_ENABLED};
		default=1;
		code = "PO3_param_player_fatigue = if(%1 > 0)then{true}else{false};";
	};

class PO3_param_enviro_title {
	title = $STR_PO3_PTITLE_AMBIENT;
	values[]= {0};
	texts[]= {" "};
	default = 0;
	code = "";
};
	class param_PO3_enviro_weather {
		title = $STR_PO3_PARAM_AMBWEATHER;
		values[]={0,1};
		texts[]={$STR_PO3_TEXT_NO,$STR_PO3_TEXT_YES};
		default=1;
		code = "PO3_param_ambient_weather_enable = if(%1 > 0)then{true}else{false};";
	};
