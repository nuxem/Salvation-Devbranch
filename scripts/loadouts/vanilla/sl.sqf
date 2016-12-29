_unit = _this select 0;

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

sleep 0.5;

_unit addVest "V_TacVest_oli";
for "_i" from 1 to 2 do {_unit addItemToVest "FirstAidKit";};
for "_i" from 1 to 2 do {_unit addItemToVest "MiniGrenade";};
for "_i" from 1 to 3 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_Smoke_Grenade_shell";};
_unit addItemToVest "Chemlight_green";
for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_762x39_Mag_F";};
for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_762x39_Mag_Tracer_Green_F";};
for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
_unit addBackpack "B_AssaultPack_rgr";
_unit addHeadgear "H_Cap_oli_hs";
_unit addGoggles "G_Bandanna_oli";

_unit addWeapon "arifle_AK12_GL_F";
_unit addPrimaryWeaponItem "optic_MRCO";
_unit addWeapon "hgun_P07_F";
_unit addWeapon "Rangefinder";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemGPS";
_unit linkItem "NVGoggles_INDEP";
