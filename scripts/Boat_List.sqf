//Aircraft Spawn
boatspawn setObjectTexture [0, ""];
boatspawn addAction ["<t size='1.5' shadow='2' color='#FFA000'>Deploy Sea Vehicle</t> <img size='4' color='#FFA000' shadow='2' image='\A3\Air_F_EPC\Plane_CAS_01\Data\UI\Plane_CAS_01_CA.paa'/>", {[["boats"], [
"B_Boat_Armed_01_minigun_F",
"B_Lifeboat",
"B_Boat_Transport_01_F",
"B_SDV_01_F"], "boat_spawn", 5] execvm "ASORVS\open.sqf";}];