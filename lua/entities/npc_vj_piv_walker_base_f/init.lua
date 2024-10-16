AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/hl2/citizens/female_01.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.Voice = 1
ENT.PIV_Gender = 2
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()

if GetConVar("vj_piv_walk_voice"):GetInt() == 0 then
self.Voice = 1
elseif GetConVar("vj_piv_walk_voice"):GetInt() == 1 then
self.Voice = 2
elseif GetConVar("vj_piv_walk_voice"):GetInt() == 2 then
self.Voice = 3
elseif GetConVar("vj_piv_walk_voice"):GetInt() == 3 then
self.Voice = 4
elseif GetConVar("vj_piv_walk_voice"):GetInt() == 4 then
self.Voice = math.random(1,4)
end

if self.Voice == 1 then
	
self.SoundTbl_Idle = {
	"vj_piv/nmr_zomb_female/femzom_idle01.wav",
	"vj_piv/nmr_zomb_female/femzom_idle02.wav",
	"vj_piv/nmr_zomb_female/femzom_idle03.wav",
	"vj_piv/nmr_zomb_female/femzom_idle04.wav",
	"vj_piv/nmr_zomb_female/femzom_idle05.wav",
	"vj_piv/nmr_zomb_female/femzom_idle06.wav",
	"vj_piv/nmr_zomb_female/femzom_idle07.wav",
	"vj_piv/nmr_zomb_female/femzom_idle08.wav",
	"vj_piv/nmr_zomb_female/femzom_idle09.wav",
	"vj_piv/nmr_zomb_female/femzom_idle10.wav",
	"vj_piv/nmr_zomb_female/femzom_idle11.wav"
}
self.SoundTbl_Alert = {
	"vj_piv/nmr_zomb_female/femzom_sighted01.wav",
	"vj_piv/nmr_zomb_female/femzom_sighted02.wav",
	"vj_piv/nmr_zomb_female/femzom_sighted03.wav",
	"vj_piv/nmr_zomb_female/femzom_sighted04.wav",
	"vj_piv/nmr_zomb_female/femzom_sighted05.wav",
	"vj_piv/nmr_zomb_female/femzom_sighted06.wav",
	"vj_piv/nmr_zomb_female/femzom_sighted07.wav",
	"vj_piv/nmr_zomb_female/femzom_sighted08.wav",
	"vj_piv/nmr_zomb_female/femzom_sighted09.wav",
	"vj_piv/nmr_zomb_female/femzom_sighted10.wav",
	"vj_piv/nmr_zomb_female/femzom_sighted11.wav"
}
self.SoundTbl_CombatIdle = {
	"vj_piv/nmr_zomb_female/femzom_sighted01.wav",
	"vj_piv/nmr_zomb_female/femzom_sighted02.wav",
	"vj_piv/nmr_zomb_female/femzom_sighted03.wav",
	"vj_piv/nmr_zomb_female/femzom_sighted04.wav",
	"vj_piv/nmr_zomb_female/femzom_sighted05.wav",
	"vj_piv/nmr_zomb_female/femzom_sighted06.wav",
	"vj_piv/nmr_zomb_female/femzom_sighted07.wav",
	"vj_piv/nmr_zomb_female/femzom_sighted08.wav",
	"vj_piv/nmr_zomb_female/femzom_sighted09.wav",
	"vj_piv/nmr_zomb_female/femzom_sighted10.wav",
	"vj_piv/nmr_zomb_female/femzom_sighted11.wav"
}
self.SoundTbl_BeforeMeleeAttack = {
	"vj_piv/nmr_zomb_female/femzom_attack01.wav",
	"vj_piv/nmr_zomb_female/femzom_attack02.wav",
	"vj_piv/nmr_zomb_female/femzom_attack03.wav",
	"vj_piv/nmr_zomb_female/femzom_attack04.wav",
	"vj_piv/nmr_zomb_female/femzom_attack05.wav",
	"vj_piv/nmr_zomb_female/femzom_attack06.wav",
	"vj_piv/nmr_zomb_female/femzom_attack07.wav"

}
self.SoundTbl_LeapAttackJump = {
	"vj_piv/nmr_zomb_female/femzom_attack01.wav",
	"vj_piv/nmr_zomb_female/femzom_attack02.wav",
	"vj_piv/nmr_zomb_female/femzom_attack03.wav",
	"vj_piv/nmr_zomb_female/femzom_attack04.wav",
	"vj_piv/nmr_zomb_female/femzom_attack05.wav",
	"vj_piv/nmr_zomb_female/femzom_attack06.wav",
	"vj_piv/nmr_zomb_female/femzom_attack07.wav"
}
self.SoundTbl_Pain = {
	"vj_piv/nmr_zomb_female/femzom_pain01.wav",
	"vj_piv/nmr_zomb_female/femzom_pain02.wav",
	"vj_piv/nmr_zomb_female/femzom_pain03.wav",
	"vj_piv/nmr_zomb_female/femzom_pain04.wav",
	"vj_piv/nmr_zomb_female/femzom_pain05.wav",
	"vj_piv/nmr_zomb_female/femzom_pain06.wav",
	"vj_piv/nmr_zomb_female/femzom_pain07.wav"
}
self.SoundTbl_Death = {
	"vj_piv/nmr_zomb_female/femzom_pain01.wav",
	"vj_piv/nmr_zomb_female/femzom_pain02.wav",
	"vj_piv/nmr_zomb_female/femzom_pain03.wav",
	"vj_piv/nmr_zomb_female/femzom_pain04.wav",
	"vj_piv/nmr_zomb_female/femzom_pain05.wav",
	"vj_piv/nmr_zomb_female/femzom_pain06.wav",
	"vj_piv/nmr_zomb_female/femzom_pain07.wav"
}

elseif self.Voice == 2 then

self.SoundTbl_Idle = {
	"vj_piv/dl_bite_female/walker_female00_idle_calm_00_0.wav",
	"vj_piv/dl_bite_female/walker_female00_idle_calm_01_0.wav",
	"vj_piv/dl_bite_female/walker_female00_idle_calm_02_0.wav",
	"vj_piv/dl_bite_female/walker_female00_enemy_spotted_00_0.wav",
	"vj_piv/dl_bite_female/walker_female00_enemy_spotted_01_0.wav",
	"vj_piv/dl_bite_female/walker_female00_enemy_spotted_02_0.wav",
	"vj_piv/dl_bite_female/walker_female00_enemy_spotted_03_0.wav",
	"vj_piv/dl_bite_female/walker_female00_enemy_spotted_04_0.wav"
	
}
if self.PIV_Jogger == true then
self.SoundTbl_Alert = {
	"vj_piv/dl_bite_male/walker_male_call_nw_00_0.wav",
	"vj_piv/dl_bite_male/walker_male_call_nw_01_0.wav",
	"vj_piv/dl_bite_male/walker_male_call_nw_02_0.wav"
}
self.AlertSoundPitch = VJ.SET(115, 115)
else
self.SoundTbl_Alert = {
	"vj_piv/dl_bite_female/walker_female00_berserker_00_0.wav",
	"vj_piv/dl_bite_female/walker_female00_berserker_01_0.wav",
	"vj_piv/dl_bite_female/walker_female00_berserker_02_0.wav",
	"vj_piv/dl_bite_female/walker_female00_berserker_03_0.wav",
	"vj_piv/dl_bite_female/walker_female00_move_alarmed_00_0.wav",
	"vj_piv/dl_bite_female/walker_female00_move_alarmed_01_0.wav",
	"vj_piv/dl_bite_female/walker_female00_move_alarmed_02_0.wav",
	"vj_piv/dl_bite_female/walker_female00_falling_00_0.wav",
	"vj_piv/dl_bite_female/walker_female00_falling_01_0.wav",
	"vj_piv/dl_bite_female/walker_female00_falling_02_0.wav"
}
end
self.SoundTbl_CombatIdle = {
	"vj_piv/dl_bite_female/walker_female00_berserker_00_0.wav",
	"vj_piv/dl_bite_female/walker_female00_berserker_01_0.wav",
	"vj_piv/dl_bite_female/walker_female00_berserker_02_0.wav",
	"vj_piv/dl_bite_female/walker_female00_berserker_03_0.wav",
	"vj_piv/dl_bite_female/walker_female00_move_alarmed_00_0.wav",
	"vj_piv/dl_bite_female/walker_female00_move_alarmed_01_0.wav",
	"vj_piv/dl_bite_female/walker_female00_move_alarmed_02_0.wav",
	"vj_piv/dl_bite_female/walker_female00_falling_00_0.wav",
	"vj_piv/dl_bite_female/walker_female00_falling_01_0.wav",
	"vj_piv/dl_bite_female/walker_female00_falling_02_0.wav"
}
self.SoundTbl_BeforeMeleeAttack = {
	"vj_piv/dl_bite_female/walker_female00_attack_00_0.wav",
	"vj_piv/dl_bite_female/walker_female00_attack_01_0.wav",
	"vj_piv/dl_bite_female/walker_female00_attack_02_0.wav",
	"vj_piv/dl_bite_female/walker_female00_attack_03_0.wav",
	"vj_piv/dl_bite_female/walker_female00_attack_04_0.wav",
	"vj_piv/dl_bite_female/walker_female00_attack_05_0.wav"
}
self.SoundTbl_LeapAttackJump = {
	"vj_piv/dl_bite_female/walker_female00_attack_00_0.wav",
	"vj_piv/dl_bite_female/walker_female00_attack_01_0.wav",
	"vj_piv/dl_bite_female/walker_female00_attack_02_0.wav",
	"vj_piv/dl_bite_female/walker_female00_attack_03_0.wav",
	"vj_piv/dl_bite_female/walker_female00_attack_04_0.wav",
	"vj_piv/dl_bite_female/walker_female00_attack_05_0.wav"
}
self.SoundTbl_Pain = {
	"vj_piv/dl_bite_female/walker_female00_neck_break_00_0.wav",
	"vj_piv/dl_bite_female/walker_female00_pain_00_0.wav",
	"vj_piv/dl_bite_female/walker_female00_pain_01_0.wav",
	"vj_piv/dl_bite_female/walker_female00_pain_02_0.wav",
	"vj_piv/dl_bite_female/walker_female00_pain_03_0.wav",
	"vj_piv/dl_bite_female/walker_female00_pain_04_0.wav",
	"vj_piv/dl_bite_female/walker_female00_pain_05_0.wav",
	"vj_piv/dl_bite_female/walker_female00_pain_critical_00_0.wav",
	"vj_piv/dl_bite_female/walker_female00_pain_critical_01_0.wav",
	"vj_piv/dl_bite_female/walker_female00_pain_critical_02_0.wav"
}
self.SoundTbl_Death = {
	"vj_piv/dl_bite_female/walker_female00_neck_break_00_0.wav",
	"vj_piv/dl_bite_female/walker_female00_pain_burn_00_0.wav",
	"vj_piv/dl_bite_female/walker_female00_pain_burn_01_0.wav",
	"vj_piv/dl_bite_female/walker_female00_death_00_0.wav",
	"vj_piv/dl_bite_female/walker_female00_death_01_0.wav",
	"vj_piv/dl_bite_female/walker_female00_death_02_0.wav",
	"vj_piv/dl_bite_female/walker_female00_death_03_0.wav",
	"vj_piv/dl_bite_female/walker_female00_death_car_00_0.wav",
	"vj_piv/dl_bite_female/walker_female00_death_car_01_0.wav",
	"vj_piv/dl_bite_female/walker_female00_death_car_02_0.wav",
	"vj_piv/dl_bite_female/walker_female00_death_car_03_0.wav",
}

elseif self.Voice == 3 then

self.SoundTbl_Idle = {
	"vj_piv/l4d_common/idle/breathing/breathing01.wav",
	"vj_piv/l4d_common/idle/breathing/breathing08.wav",
	"vj_piv/l4d_common/idle/breathing/breathing09.wav",
	"vj_piv/l4d_common/idle/breathing/breathing10.wav",
	"vj_piv/l4d_common/idle/breathing/breathing13.wav",
	"vj_piv/l4d_common/idle/breathing/breathing16.wav",
	"vj_piv/l4d_common/idle/breathing/breathing18.wav",
	"vj_piv/l4d_common/idle/breathing/breathing25.wav",
	"vj_piv/l4d_common/idle/breathing/breathing26.wav",
	"vj_piv/l4d_common/idle/breathing/idle_breath_01.wav",
	"vj_piv/l4d_common/idle/breathing/idle_breath_02.wav",
	"vj_piv/l4d_common/idle/breathing/idle_breath_03.wav",
	"vj_piv/l4d_common/idle/breathing/idle_breath_04.wav",
	"vj_piv/l4d_common/idle/breathing/idle_breath_06.wav",
	"vj_piv/l4d_common/idle/moaning/moan01.wav",
	"vj_piv/l4d_common/idle/moaning/moan02.wav",
	"vj_piv/l4d_common/idle/moaning/moan03.wav",
	"vj_piv/l4d_common/idle/moaning/moan04.wav",
	"vj_piv/l4d_common/idle/moaning/moan05.wav",
	"vj_piv/l4d_common/idle/moaning/moan06.wav",
	"vj_piv/l4d_common/idle/moaning/moan07.wav",
	"vj_piv/l4d_common/idle/moaning/moan08.wav",
	"vj_piv/l4d_common/idle/moaning/moan09.wav",
	"vj_piv/l4d_common/idle/mumbling/mumbling01.wav",
	"vj_piv/l4d_common/idle/mumbling/mumbling02.wav",
	"vj_piv/l4d_common/idle/mumbling/mumbling03.wav",
	"vj_piv/l4d_common/idle/mumbling/mumbling03.wav",
	"vj_piv/l4d_common/idle/mumbling/mumbling05.wav",
	"vj_piv/l4d_common/idle/mumbling/mumbling06.wav",
	"vj_piv/l4d_common/idle/mumbling/mumbling07.wav",
	"vj_piv/l4d_common/idle/mumbling/mumbling08.wav"
}
self.SoundTbl_Alert = {
	"vj_piv/l4d_common/alert/becomealert/become_alert01.wav",
	"vj_piv/l4d_common/alert/becomealert/become_alert04.wav",
	"vj_piv/l4d_common/alert/becomealert/become_alert09.wav",
	"vj_piv/l4d_common/alert/becomealert/become_alert11.wav",
	"vj_piv/l4d_common/alert/becomealert/become_alert12.wav",
	"vj_piv/l4d_common/alert/becomealert/become_alert14.wav",
	"vj_piv/l4d_common/alert/becomealert/become_alert17.wav",
	"vj_piv/l4d_common/alert/becomealert/become_alert18.wav",
	"vj_piv/l4d_common/alert/becomealert/become_alert21.wav",
	"vj_piv/l4d_common/alert/becomealert/become_alert23.wav",
	"vj_piv/l4d_common/alert/becomealert/become_alert25.wav",
	"vj_piv/l4d_common/alert/becomealert/become_alert26.wav",
	"vj_piv/l4d_common/alert/becomealert/become_alert29.wav",
	"vj_piv/l4d_common/alert/becomealert/become_alert38.wav",
	"vj_piv/l4d_common/alert/becomealert/become_alert41.wav",
	"vj_piv/l4d_common/alert/becomealert/become_alert54.wav",
	"vj_piv/l4d_common/alert/becomealert/become_alert55.wav",
	"vj_piv/l4d_common/alert/becomealert/become_alert56.wav",
	"vj_piv/l4d_common/alert/becomealert/become_alert57.wav",
	"vj_piv/l4d_common/alert/becomealert/become_alert58.wav",
	"vj_piv/l4d_common/alert/becomealert/become_alert58.wav",
	"vj_piv/l4d_common/alert/becomealert/howl01.wav",
	"vj_piv/l4d_common/alert/becomealert/female/become_alert60.wav",
	"vj_piv/l4d_common/alert/becomealert/female/become_alert61.wav",
	"vj_piv/l4d_common/alert/becomealert/female/become_alert62.wav",
	"vj_piv/l4d_common/alert/becomealert/female/become_alert63.wav"
}
self.SoundTbl_CombatIdle = {
	"vj_piv/l4d_common/alert/alert/alert13.wav",
	"vj_piv/l4d_common/alert/alert/alert16.wav",
	"vj_piv/l4d_common/alert/alert/alert22.wav",
	"vj_piv/l4d_common/alert/alert/alert23.wav",
	"vj_piv/l4d_common/alert/alert/alert25.wav",
	"vj_piv/l4d_common/alert/alert/alert26.wav",
	"vj_piv/l4d_common/alert/alert/alert27.wav",
	"vj_piv/l4d_common/alert/alert/alert36.wav",
	"vj_piv/l4d_common/alert/alert/alert38.wav",
	"vj_piv/l4d_common/alert/alert/alert39.wav",
	"vj_piv/l4d_common/alert/alert/alert40.wav",
	"vj_piv/l4d_common/alert/alert/alert41.wav",
	"vj_piv/l4d_common/alert/alert/alert42.wav",
	"vj_piv/l4d_common/alert/alert/alert43.wav",
	"vj_piv/l4d_common/alert/alert/alert44.wav",
	"vj_piv/l4d_common/alert/alert/female/alert50.wav",
	"vj_piv/l4d_common/alert/alert/female/alert51.wav",
	"vj_piv/l4d_common/alert/alert/female/alert52.wav",
	"vj_piv/l4d_common/alert/alert/female/alert53.wav",
	"vj_piv/l4d_common/alert/alert/female/alert53.wav",
	"vj_piv/l4d_common/alert/alert/female/alert53.wav",
	"vj_piv/l4d_common/alert/becomealert/hiss01.wav",
	"vj_piv/l4d_common/alert/becomealert/recognize01.wav",
	"vj_piv/l4d_common/alert/becomealert/recognize02.wav",
	"vj_piv/l4d_common/alert/becomealert/recognize03.wav",
	"vj_piv/l4d_common/alert/becomealert/recognize04.wav",
	"vj_piv/l4d_common/alert/becomealert/recognize05.wav",
	"vj_piv/l4d_common/alert/becomealert/recognize06.wav",
	"vj_piv/l4d_common/alert/becomealert/recognize07.wav",
	"vj_piv/l4d_common/alert/becomealert/recognize08.wav",
	"vj_piv/l4d_common/action/shoved/mp/shoved_long_1.wav",
	"vj_piv/l4d_common/action/shoved/mp/shoved_long_2.wav",
	"vj_piv/l4d_common/action/shoved/mp/shoved_long_2.wav",
	"vj_piv/l4d_common/action/shoved/mp/shoved_01.wav",
	"vj_piv/l4d_common/action/shoved/mp/shoved_02.wav",
	"vj_piv/l4d_common/action/shoved/mp/shoved_03.wav",
	"vj_piv/l4d_common/action/shoved/mp/shoved_04.wav",
	"vj_piv/l4d_common/action/shoved/mp/shoved_05.wav",
	"vj_piv/l4d_common/action/shoved/mp/shoved_06.wav",
	"vj_piv/l4d_common/action/shoved/mp/shoved_07.wav",
	"vj_piv/l4d_common/action/shoved/mp/shoved_08.wav",
	"vj_piv/l4d_common/action/shoved/mp/shoved_09.wav",
	"vj_piv/l4d_common/action/shoved/mp/shoved_10.wav",
	"vj_piv/l4d_common/action/shoved/mp/shoved_11.wav",
	"vj_piv/l4d_common/action/shoved/mp/shoved_12.wav",
	"vj_piv/l4d_common/action/shoved/mp/shoved_13.wav",
	"vj_piv/l4d_common/action/shoved/mp/shoved_14.wav",
	"vj_piv/l4d_common/action/shoved/mp/shoved_15.wav",
	"vj_piv/l4d_common/action/shoved/mp/shoved_16.wav",
	"vj_piv/l4d_common/action/shoved/mp/shoved_17.wav"
}
self.SoundTbl_BeforeMeleeAttack = {
	"vj_piv/l4d_common/action/rage/female/rage_50.wav",
	"vj_piv/l4d_common/action/rage/female/rage_51.wav",
	"vj_piv/l4d_common/action/rage/female/rage_52.wav",
	"vj_piv/l4d_common/action/rage/female/rage_53.wav",
	"vj_piv/l4d_common/action/rage/female/rage_54.wav",
	"vj_piv/l4d_common/action/rage/female/rage_55.wav",
	"vj_piv/l4d_common/action/rage/female/rage_56.wav",
	"vj_piv/l4d_common/action/rage/female/rage_57.wav",
	"vj_piv/l4d_common/action/rage/female/rage_58.wav",
	"vj_piv/l4d_common/action/rage/female/rage_59.wav",
	"vj_piv/l4d_common/action/rage/female/rage_60.wav",
	"vj_piv/l4d_common/action/rage/female/rage_61.wav",
	"vj_piv/l4d_common/action/rage/female/rage_62.wav",
	"vj_piv/l4d_common/action/rage/female/rage_64.wav",
	"vj_piv/l4d_common/action/rage/female/rage_65.wav",
	"vj_piv/l4d_common/action/rage/female/rage_66.wav",
	"vj_piv/l4d_common/action/rage/female/rage_67.wav",
	"vj_piv/l4d_common/action/rage/female/rage_68.wav",
	"vj_piv/l4d_common/action/rage/female/rage_69.wav",
	"vj_piv/l4d_common/action/rage/female/rage_70.wav",
	"vj_piv/l4d_common/action/rage/female/rage_71.wav",
	"vj_piv/l4d_common/action/rage/female/rage_72.wav",
	"vj_piv/l4d_common/action/rage/female/rage_73.wav",
	"vj_piv/l4d_common/action/rage/female/rage_74.wav",
	"vj_piv/l4d_common/action/rage/female/rage_75.wav",
	"vj_piv/l4d_common/action/rage/female/rage_76.wav",
	"vj_piv/l4d_common/action/rage/female/rage_77.wav",
	"vj_piv/l4d_common/action/rage/female/rage_78.wav",
	"vj_piv/l4d_common/action/rage/female/rage_79.wav",
	"vj_piv/l4d_common/action/rage/female/rage_80.wav",
	"vj_piv/l4d_common/action/rage/female/rage_81.wav",
	"vj_piv/l4d_common/action/rage/female/rage_82.wav"
}
self.SoundTbl_LeapAttackJump = {
	"vj_piv/l4d_common/action/rage/female/rage_50.wav",
	"vj_piv/l4d_common/action/rage/female/rage_51.wav",
	"vj_piv/l4d_common/action/rage/female/rage_52.wav",
	"vj_piv/l4d_common/action/rage/female/rage_53.wav",
	"vj_piv/l4d_common/action/rage/female/rage_54.wav",
	"vj_piv/l4d_common/action/rage/female/rage_55.wav",
	"vj_piv/l4d_common/action/rage/female/rage_56.wav",
	"vj_piv/l4d_common/action/rage/female/rage_57.wav",
	"vj_piv/l4d_common/action/rage/female/rage_58.wav",
	"vj_piv/l4d_common/action/rage/female/rage_59.wav",
	"vj_piv/l4d_common/action/rage/female/rage_60.wav",
	"vj_piv/l4d_common/action/rage/female/rage_61.wav",
	"vj_piv/l4d_common/action/rage/female/rage_62.wav",
	"vj_piv/l4d_common/action/rage/female/rage_64.wav",
	"vj_piv/l4d_common/action/rage/female/rage_65.wav",
	"vj_piv/l4d_common/action/rage/female/rage_66.wav",
	"vj_piv/l4d_common/action/rage/female/rage_67.wav",
	"vj_piv/l4d_common/action/rage/female/rage_68.wav",
	"vj_piv/l4d_common/action/rage/female/rage_69.wav",
	"vj_piv/l4d_common/action/rage/female/rage_70.wav",
	"vj_piv/l4d_common/action/rage/female/rage_71.wav",
	"vj_piv/l4d_common/action/rage/female/rage_72.wav",
	"vj_piv/l4d_common/action/rage/female/rage_73.wav",
	"vj_piv/l4d_common/action/rage/female/rage_74.wav",
	"vj_piv/l4d_common/action/rage/female/rage_75.wav",
	"vj_piv/l4d_common/action/rage/female/rage_76.wav",
	"vj_piv/l4d_common/action/rage/female/rage_77.wav",
	"vj_piv/l4d_common/action/rage/female/rage_78.wav",
	"vj_piv/l4d_common/action/rage/female/rage_79.wav",
	"vj_piv/l4d_common/action/rage/female/rage_80.wav",
	"vj_piv/l4d_common/action/rage/female/rage_81.wav",
	"vj_piv/l4d_common/action/rage/female/rage_82.wav"
}
self.SoundTbl_Pain = {
	"vj_piv/l4d_common/action/been_shot/been_shot_01.wav",
	"vj_piv/l4d_common/action/been_shot/been_shot_02.wav",
	"vj_piv/l4d_common/action/been_shot/been_shot_04.wav",
	"vj_piv/l4d_common/action/been_shot/been_shot_05.wav",
	"vj_piv/l4d_common/action/been_shot/been_shot_06.wav",
	"vj_piv/l4d_common/action/been_shot/been_shot_08.wav",
	"vj_piv/l4d_common/action/been_shot/been_shot_09.wav",
	"vj_piv/l4d_common/action/been_shot/been_shot_12.wav",
	"vj_piv/l4d_common/action/been_shot/been_shot_13.wav",
	"vj_piv/l4d_common/action/been_shot/been_shot_14.wav",
	"vj_piv/l4d_common/action/been_shot/been_shot_18.wav",
	"vj_piv/l4d_common/action/been_shot/been_shot_19.wav",
	"vj_piv/l4d_common/action/been_shot/been_shot_20.wav",
	"vj_piv/l4d_common/action/been_shot/been_shot_21.wav",
	"vj_piv/l4d_common/action/been_shot/been_shot_22.wav",
	"vj_piv/l4d_common/action/been_shot/been_shot_24.wav",
	"vj_piv/l4d_common/action/been_shot/female/been_shot_30.wav",
	"vj_piv/l4d_common/action/been_shot/female/been_shot_31.wav",
	"vj_piv/l4d_common/action/been_shot/female/been_shot_32.wav",
	"vj_piv/l4d_common/action/been_shot/female/been_shot_32.wav",
	"vj_piv/l4d_common/action/been_shot/female/been_shot_34.wav",
	"vj_piv/l4d_common/action/been_shot/female/been_shot_35.wav",
	"vj_piv/l4d_common/action/been_shot/female/been_shot_36.wav",
	"vj_piv/l4d_common/action/been_shot/female/been_shot_37.wav",
	"vj_piv/l4d_common/action/rage/shoved_1.wav",
	"vj_piv/l4d_common/action/rage/shoved_2.wav",
	"vj_piv/l4d_common/action/rage/shoved_3.wav",
	"vj_piv/l4d_common/action/rage/shoved_4.wav",
	"vj_piv/l4d_common/action/die/mp/odd_2.wav",
	"vj_piv/l4d_common/action/die/mp/odd_3.wav",
	"vj_piv/l4d_common/action/die/mp/odd_3.wav",
	"vj_piv/l4d_common/action/die/mp/odd_5.wav",
}
self.SoundTbl_Death = {
	"vj_piv/l4d_common/action/die/death_14.wav",
	"vj_piv/l4d_common/action/die/death_17.wav",
	"vj_piv/l4d_common/action/die/death_17.wav",
	"vj_piv/l4d_common/action/die/death_19.wav",
	"vj_piv/l4d_common/action/die/death_22.wav",
	"vj_piv/l4d_common/action/die/death_23.wav",
	"vj_piv/l4d_common/action/die/death_24.wav",
	"vj_piv/l4d_common/action/die/death_25.wav",
	"vj_piv/l4d_common/action/die/death_26.wav",
	"vj_piv/l4d_common/action/die/death_27.wav",
	"vj_piv/l4d_common/action/die/death_28.wav",
	"vj_piv/l4d_common/action/die/death_29.wav",
	"vj_piv/l4d_common/action/die/death_30.wav",
	"vj_piv/l4d_common/action/die/death_32.wav",
	"vj_piv/l4d_common/action/die/death_33.wav",
	"vj_piv/l4d_common/action/die/death_34.wav",
	"vj_piv/l4d_common/action/die/death_35.wav",
	"vj_piv/l4d_common/action/die/death_35.wav",
	"vj_piv/l4d_common/action/die/death_37.wav",
	"vj_piv/l4d_common/action/die/death_38.wav",
	"vj_piv/l4d_common/action/die/female/death_40.wav",
	"vj_piv/l4d_common/action/die/female/death_41.wav",
	"vj_piv/l4d_common/action/die/female/death_42.wav",
	"vj_piv/l4d_common/action/die/female/death_43.wav",
	"vj_piv/l4d_common/action/die/female/death_44.wav",
	"vj_piv/l4d_common/action/die/female/death_45.wav",
	"vj_piv/l4d_common/action/die/female/death_46.wav",
	"vj_piv/l4d_common/action/die/female/death_47.wav",
	"vj_piv/l4d_common/action/die/female/death_48.wav",
	"vj_piv/l4d_common/action/die/female/death_49.wav",
	"vj_piv/l4d_common/action/die/mp/squeal_1.wav",
	"vj_piv/l4d_common/action/die/mp/squeal_2.wav",
	"vj_piv/l4d_common/action/die/mp/squeal_3.wav",
	"vj_piv/l4d_common/action/ignite/female/ignite10.wav",
	"vj_piv/l4d_common/action/ignite/female/ignite11.wav",
	"vj_piv/l4d_common/action/ignite/female/ignite12.wav",
	"vj_piv/l4d_common/action/ignite/female/ignite13.wav",
	"vj_piv/l4d_common/action/ignite/female/ignite14.wav"
}

elseif self.Voice == 4 then

	self.IdleSoundPitch = VJ.SET(120, 120)
	self.CombatIdleSoundPitch = VJ.SET(120, 120)
	self.AlertSoundPitch = VJ.SET(120, 120)
	self.CallForHelpSoundPitch = VJ.SET(120, 120)
	self.BeforeMeleeAttackSoundPitch = VJ.SET(120, 120)
	self.PainSoundPitch = VJ.SET(120, 120)
	self.DeathSoundPitch = VJ.SET(120, 120)


    local ContagionVoice = math.random(1,4)
	
    if ContagionVoice == 1 then
       self.SoundTbl_Idle = {"vj_piv/contagion/z_sham/shared/0245.wav","vj_piv/contagion/z_sham/shared/0244.wav","vj_piv/contagion/z_sham/idle/0128.wav","vj_piv/contagion/z_sham/idle/0123.wav","vj_piv/contagion/z_sham/idle/0122.wav","vj_piv/contagion/z_sham/idle/0121.wav","vj_piv/contagion/z_sham/idle/0120.wav","vj_piv/contagion/z_sham/idle/0119.wav","vj_piv/contagion/z_sham/idle/0118.wav","vj_piv/contagion/z_sham/idle/0117.wav","vj_piv/contagion/z_sham/idle/0116.wav","vj_piv/contagion/z_sham/idle/0115.wav","vj_piv/contagion/z_sham/idle/0114.wav","vj_piv/contagion/z_sham/idle/0113.wav","vj_piv/contagion/z_sham/idle/0112.wav","vj_piv/contagion/z_sham/idle/0111.wav","vj_piv/contagion/z_sham/idle/0110.wav","vj_piv/contagion/z_sham/idle/0109.wav","vj_piv/contagion/z_sham/idle/0108.wav","vj_piv/contagion/z_sham/idle/0107.wav","vj_piv/contagion/z_sham/idle/0106.wav","vj_piv/contagion/z_sham/idle/0105.wav","vj_piv/contagion/z_sham/idle/0104.wav","vj_piv/contagion/z_sham/idle/0103.wav","vj_piv/contagion/z_sham/idle/0102.wav","vj_piv/contagion/z_sham/idle/0101.wav","vj_piv/contagion/z_sham/idle/0100.wav","vj_piv/contagion/z_sham/idle/0099.wav","vj_piv/contagion/z_sham/idle/0098.wav","vj_piv/contagion/z_sham/idle/0097.wav","vj_piv/contagion/z_sham/idle/0096.wav","vj_piv/contagion/z_sham/idle/0095.wav","vj_piv/contagion/z_sham/idle/0094.wav","vj_piv/contagion/z_sham/idle/0093.wav","vj_piv/contagion/z_sham/idle/0092.wav","vj_piv/contagion/z_sham/idle/0091.wav","vj_piv/contagion/z_sham/idle/0090.wav","vj_piv/contagion/z_sham/idle/0089.wav","vj_piv/contagion/z_sham/idle/0088.wav","vj_piv/contagion/z_sham/idle/0087.wav","vj_piv/contagion/z_sham/idle/0086.wav","vj_piv/contagion/z_sham/idle/0085.wav","vj_piv/contagion/z_sham/idle/0084.wav","vj_piv/contagion/z_sham/idle/0083.wav","vj_piv/contagion/z_sham/idle/0082.wav","vj_piv/contagion/z_sham/idle/0081.wav","vj_piv/contagion/z_sham/idle/0080.wav","vj_piv/contagion/z_sham/idle/0079.wav","vj_piv/contagion/z_sham/idle/0077.wav","vj_piv/contagion/z_sham/idle/0076.wav"}
       self.SoundTbl_Alert = {"vj_piv/contagion/z_sham/alert/0170.wav","vj_piv/contagion/z_sham/alert/0169.wav","vj_piv/contagion/z_sham/alert/0168.wav","vj_piv/contagion/z_sham/alert/0167.wav","vj_piv/contagion/z_sham/alert/0166.wav","vj_piv/contagion/z_sham/alert/0165.wav","vj_piv/contagion/z_sham/alert/0164.wav","vj_piv/contagion/z_sham/alert/0163.wav","vj_piv/contagion/z_sham/alert/0162.wav","vj_piv/contagion/z_sham/alert/0161.wav","vj_piv/contagion/z_sham/alert/0152.wav","vj_piv/contagion/z_sham/alert/0061.wav","vj_piv/contagion/z_sham/alert/0060.wav","vj_piv/contagion/z_sham/alert/0058.wav","vj_piv/contagion/z_sham/alert/0056.wav","vj_piv/contagion/z_sham/alert/0030.wav","vj_piv/contagion/z_sham/alert/0029.wav","vj_piv/contagion/z_sham/alert/0028.wav","vj_piv/contagion/z_sham/alert/0027.wav","vj_piv/contagion/z_sham/alert/0026.wav","vj_piv/contagion/z_sham/alert/0025.wav","vj_piv/contagion/z_sham/alert/0023.wav","vj_piv/contagion/z_sham/alert/0022.wav","vj_piv/contagion/z_sham/alert/0021.wav","vj_piv/contagion/z_arne/alert/0207.wav"}
       self.SoundTbl_CallForHelp = {"vj_piv/contagion/z_sham/roar/0075.wav","vj_piv/contagion/z_sham/roar/0074.wav","vj_piv/contagion/z_sham/roar/0073.wav","vj_piv/contagion/z_sham/roar/0072.wav","vj_piv/contagion/z_sham/roar/0071.wav","vj_piv/contagion/z_sham/roar/0070.wav"}
       self.SoundTbl_CombatIdle = {"vj_piv/contagion/z_sham/spot_player/0178.wav","vj_piv/contagion/z_sham/spot_player/0173.wav","vj_piv/contagion/z_sham/spot_player/0159.wav","vj_piv/contagion/z_sham/spot_player/0158.wav","vj_piv/contagion/z_sham/spot_player/0157.wav","vj_piv/contagion/z_sham/spot_player/0156.wav","vj_piv/contagion/z_sham/spot_player/0155.wav","vj_piv/contagion/z_sham/spot_player/0153.wav","vj_piv/contagion/z_sham/spot_player/0145.wav","vj_piv/contagion/z_sham/spot_player/0134.wav","vj_piv/contagion/z_sham/spot_player/0059.wav","vj_piv/contagion/z_sham/spot_player/0055.wav","vj_piv/contagion/z_sham/spot_player/0054.wav","vj_piv/contagion/z_sham/spot_player/0018.wav","vj_piv/contagion/z_sham/spot_player/0017.wav","vj_piv/contagion/z_sham/spot_player/0016.wav","vj_piv/contagion/z_sham/spot_player/0015.wav","vj_piv/contagion/z_sham/spot_player/0014.wav","","vj_piv/contagion/z_sham/spot_player/0013.wav","vj_piv/contagion/z_sham/spot_player/0003.wav","vj_piv/contagion/z_sham/spot_player/0002.wav","vj_piv/contagion/z_sham/spot_player/0001.wav"}
       self.SoundTbl_BeforeMeleeAttack = {"vj_piv/contagion/z_sham/attacking/0053.wav","vj_piv/contagion/z_sham/attacking/0052.wav","vj_piv/contagion/z_sham/attacking/0051.wav","vj_piv/contagion/z_sham/attacking/0050.wav","vj_piv/contagion/z_sham/attacking/0049.wav","vj_piv/contagion/z_sham/attacking/0048.wav","vj_piv/contagion/z_sham/attacking/0047.wav","vj_piv/contagion/z_sham/attacking/0045.wav","vj_piv/contagion/z_sham/attacking/0044.wav","vj_piv/contagion/z_sham/attacking/0043.wav","vj_piv/contagion/z_sham/attacking/0042.wav","vj_piv/contagion/z_sham/attacking/0041.wav","vj_piv/contagion/z_sham/attacking/0040.wav","vj_piv/contagion/z_sham/attacking/0039.wav","vj_piv/contagion/z_sham/attacking/0038.wav","vj_piv/contagion/z_sham/attacking/0037.wav","vj_piv/contagion/z_sham/attacking/0036.wav","vj_piv/contagion/z_sham/attacking/0034.wav","vj_piv/contagion/z_sham/attacking/0033.wav"}
       self.SoundTbl_Pain = {"vj_piv/contagion/z_sham/shared/0187.wav","vj_piv/contagion/z_sham/shared/0186.wav","vj_piv/contagion/z_sham/shared/0185.wav","vj_piv/contagion/z_sham/shared/0184.wav","vj_piv/contagion/z_sham/shared/0183.wav","vj_piv/contagion/z_sham/shared/0182.wav","vj_piv/contagion/z_sham/shared/0181.wav","vj_piv/contagion/z_sham/shared/0180.wav","vj_piv/contagion/z_sham/shared/0179.wav","vj_piv/contagion/z_sham/shared/0177.wav","vj_piv/contagion/z_sham/shared/0176.wav","vj_piv/contagion/z_sham/shared/0175.wav","vj_piv/contagion/z_sham/shared/0174.wav","vj_piv/contagion/z_sham/shared/0174.wav"}
       self.SoundTbl_Death = {"vj_piv/contagion/z_sham/death/0032.wav"}

    elseif ContagionVoice == 2 then
       self.SoundTbl_Idle = {"vj_piv/contagion/z_arne/idle/0219.wav","vj_piv/contagion/z_arne/idle/0220.wav","vj_piv/contagion/z_arne/idle/0221.wav","vj_piv/contagion/z_arne/idle/0243.wav","vj_piv/contagion/z_arne/idle/0246.wav","vj_piv/contagion/z_arne/idle/0247.wav","vj_piv/contagion/z_arne/idle/0248.wav","vj_piv/contagion/z_arne/idle/0249.wav","vj_piv/contagion/z_arne/idle/0250.wav","vj_piv/contagion/z_arne/idle/0251.wav","vj_piv/contagion/z_arne/idle/0252.wav","vj_piv/contagion/z_arne/idle/0253.wav","vj_piv/contagion/z_arne/idle/0254.wav","vj_piv/contagion/z_arne/idle/0255.wav"}
       self.SoundTbl_Alert = {"vj_piv/contagion/z_arne/alert/0208.wav","vj_piv/contagion/z_arne/alert/0209.wav","vj_piv/contagion/z_arne/alert/0210.wav","vj_piv/contagion/z_arne/alert/0211.wav","vj_piv/contagion/z_arne/alert/0212.wav","vj_piv/contagion/z_arne/alert/0213.wav","vj_piv/contagion/z_arne/alert/0214.wav","vj_piv/contagion/z_arne/alert/0215.wav","vj_piv/contagion/z_arne/alert/0216.wav","vj_piv/contagion/z_arne/alert/0217.wav","vj_piv/contagion/z_arne/alert/0218.wav"}
       self.SoundTbl_CallForHelp = {"vj_piv/contagion/z_arne/alert/0208.wav","vj_piv/contagion/z_arne/alert/0209.wav","vj_piv/contagion/z_arne/alert/0210.wav","vj_piv/contagion/z_arne/alert/0211.wav","vj_piv/contagion/z_arne/alert/0212.wav","vj_piv/contagion/z_arne/alert/0213.wav","vj_piv/contagion/z_arne/alert/0214.wav","vj_piv/contagion/z_arne/alert/0215.wav","vj_piv/contagion/z_arne/alert/0216.wav","vj_piv/contagion/z_arne/alert/0217.wav","vj_piv/contagion/z_arne/alert/0218.wav"}
       self.SoundTbl_BeforeMeleeAttack = {"vj_piv/contagion/z_arne/attack/0226.wav","vj_piv/contagion/z_arne/attack/0227.wav","vj_piv/contagion/z_arne/attack/0229.wav","vj_piv/contagion/z_arne/attack/0231.wav","vj_piv/contagion/z_arne/attack/0233.wav","vj_piv/contagion/z_arne/attack/0234.wav","vj_piv/contagion/z_arne/attack/0235.wav","vj_piv/contagion/z_arne/attack/0236.wav","vj_piv/contagion/z_arne/attack/0238.wav","vj_piv/contagion/z_arne/attack/0239.wav","vj_piv/contagion/z_arne/attack/0240.wav","vj_piv/contagion/z_arne/attack/0241.wav","vj_piv/contagion/z_arne/attack/0256.wav"}
       self.SoundTbl_Pain = {"vj_piv/contagion/z_sham/pain/0148.wav","vj_piv/contagion/z_sham/pain/0149.wav","vj_piv/contagion/z_sham/pain/0147.wav","vj_piv/contagion/z_sham/pain/0146.wav","vj_piv/contagion/z_sham/pain/0143.wav","vj_piv/contagion/z_sham/pain/0141.wav","vj_piv/contagion/z_sham/pain/0140.wav","vj_piv/contagion/z_sham/pain/0139.wav","vj_piv/contagion/z_sham/pain/0138.wav","vj_piv/contagion/z_sham/pain/0137.wav","vj_piv/contagion/z_sham/pain/0136.wav","vj_piv/contagion/z_sham/pain/0135.wav","vj_piv/contagion/z_sham/pain/0133.wav","vj_piv/contagion/z_sham/pain/0132.wav","vj_piv/contagion/z_sham/pain/0131.wav","vj_piv/contagion/z_sham/pain/0130.wav","vj_piv/contagion/z_sham/pain/0129.wav","vj_piv/contagion/z_sham/pain/0127.wav","vj_piv/contagion/z_sham/pain/0126.wav","vj_piv/contagion/z_sham/pain/0125.wav","vj_piv/contagion/z_sham/pain/0124.wav","vj_piv/contagion/z_sham/pain/0069.wav","vj_piv/contagion/z_sham/pain/0066.wav","vj_piv/contagion/z_sham/pain/0065.wav","vj_piv/contagion/z_sham/pain/0064.wav","vj_piv/contagion/z_sham/pain/0063.wav","vj_piv/contagion/z_sham/pain/0062.wav"}
       self.SoundTbl_Death = {"vj_piv/contagion/z_arne/die/0223.wav","vj_piv/contagion/z_arne/die/0224.wav","vj_piv/contagion/z_arne/die/0225.wav"}

    elseif ContagionVoice == 3 then
       self.SoundTbl_Idle = {"vj_piv/contagion/growler/zombie_voice_shared-1.wav","vj_piv/contagion/growler/zombie_voice_shared-10.wav","vj_piv/contagion/growler/zombie_voice_shared-12.wav","vj_piv/contagion/growler/zombie_voice_shared-13.wav","vj_piv/contagion/growler/zombie_voice_shared-14.wav","vj_piv/contagion/growler/zombie_voice_shared-2.wav","vj_piv/contagion/growler/zombie_voice_shared-3.wav","vj_piv/contagion/growler/zombie_voice_shared-4.wav","vj_piv/contagion/growler/zombie_voice_shared-5.wav","vj_piv/contagion/growler/zombie_voice_shared-6.wav","vj_piv/contagion/growler/zombie_voice_shared-7.wav","vj_piv/contagion/growler/zombie_voice_shared-8.wav","vj_piv/contagion/growler/zombie_voice_shared-9.wav"}
       self.SoundTbl_Alert = {"vj_piv/contagion/growler/zombie_voice_alert-1.wav","vj_piv/contagion/growler/zombie_voice_alert-2.wav","vj_piv/contagion/growler/zombie_voice_alert-3.wav","vj_piv/contagion/growler/zombie_voice_alert-4.wav"}
       self.SoundTbl_CallForHelp = {"vj_piv/contagion/growler/zombie_voice_alert-1.wav","vj_piv/contagion/growler/zombie_voice_alert-2.wav","vj_piv/contagion/growler/zombie_voice_alert-3.wav","vj_piv/contagion/growler/zombie_voice_alert-4.wav"}
       self.SoundTbl_BeforeMeleeAttack = {"vj_piv/contagion/growler/zombie_voice_shared-1.wav","vj_piv/contagion/growler/zombie_voice_shared-10.wav","vj_piv/contagion/growler/zombie_voice_shared-12.wav","vj_piv/contagion/growler/zombie_voice_shared-13.wav","vj_piv/contagion/growler/zombie_voice_shared-14.wav","vj_piv/contagion/growler/zombie_voice_shared-2.wav","vj_piv/contagion/growler/zombie_voice_shared-3.wav","vj_piv/contagion/growler/zombie_voice_shared-4.wav","vj_piv/contagion/growler/zombie_voice_shared-5.wav","vj_piv/contagion/growler/zombie_voice_shared-6.wav","vj_piv/contagion/growler/zombie_voice_shared-7.wav","vj_piv/contagion/growler/zombie_voice_shared-8.wav","vj_piv/contagion/growler/zombie_voice_shared-9.wav"}
       self.SoundTbl_Pain = {"vj_piv/contagion/z_sham/pain/0148.wav","vj_piv/contagion/z_sham/pain/0149.wav","vj_piv/contagion/z_sham/pain/0147.wav","vj_piv/contagion/z_sham/pain/0146.wav","vj_piv/contagion/z_sham/pain/0143.wav","vj_piv/contagion/z_sham/pain/0141.wav","vj_piv/contagion/z_sham/pain/0140.wav","vj_piv/contagion/z_sham/pain/0139.wav","vj_piv/contagion/z_sham/pain/0138.wav","vj_piv/contagion/z_sham/pain/0137.wav","vj_piv/contagion/z_sham/pain/0136.wav","vj_piv/contagion/z_sham/pain/0135.wav","vj_piv/contagion/z_sham/pain/0133.wav","vj_piv/contagion/z_sham/pain/0132.wav","vj_piv/contagion/z_sham/pain/0131.wav","vj_piv/contagion/z_sham/pain/0130.wav","vj_piv/contagion/z_sham/pain/0129.wav","vj_piv/contagion/z_sham/pain/0127.wav","vj_piv/contagion/z_sham/pain/0126.wav","vj_piv/contagion/z_sham/pain/0125.wav","vj_piv/contagion/z_sham/pain/0124.wav","vj_piv/contagion/z_sham/pain/0069.wav","vj_piv/contagion/z_sham/pain/0066.wav","vj_piv/contagion/z_sham/pain/0065.wav","vj_piv/contagion/z_sham/pain/0064.wav","vj_piv/contagion/z_sham/pain/0063.wav","vj_piv/contagion/z_sham/pain/0062.wav"}
       self.SoundTbl_Death = {"vj_piv/contagion/z_arne/die/0223.wav","vj_piv/contagion/z_arne/die/0224.wav","vj_piv/contagion/z_arne/die/0225.wav"}

    elseif ContagionVoice == 4 then
       self.SoundTbl_Idle = {"vj_piv/contagion/oldman/zombie_voice_shared-1.wav","vj_piv/contagion/oldman/zombie_voice_shared-2.wav","vj_piv/contagion/oldman/zombie_voice_shared-3.wav","vj_piv/contagion/oldman/zombie_voice_shared-4.wav","vj_piv/contagion/oldman/zombie_voice_shared-5.wav","vj_piv/contagion/oldman/zombie_voice_shared-6.wav","vj_piv/contagion/oldman/zombie_voice_shared-7.wav","vj_piv/contagion/oldman/zombie_voice_shared-8.wav","vj_piv/contagion/oldman/zombie_voice_shared-9.wav"}
       self.SoundTbl_Alert = {"vj_piv/contagion/oldman/zombie_voice_shared-1.wav","vj_piv/contagion/oldman/zombie_voice_shared-2.wav","vj_piv/contagion/oldman/zombie_voice_shared-3.wav","vj_piv/contagion/oldman/zombie_voice_shared-4.wav","vj_piv/contagion/oldman/zombie_voice_shared-5.wav","vj_piv/contagion/oldman/zombie_voice_shared-6.wav","vj_piv/contagion/oldman/zombie_voice_shared-7.wav","vj_piv/contagion/oldman/zombie_voice_shared-8.wav","vj_piv/contagion/oldman/zombie_voice_shared-9.wav"}
       self.SoundTbl_CallForHelp = {"vj_piv/contagion/oldman/zombie_voice_shared-1.wav","vj_piv/contagion/oldman/zombie_voice_shared-2.wav","vj_piv/contagion/oldman/zombie_voice_shared-3.wav","vj_piv/contagion/oldman/zombie_voice_shared-4.wav","vj_piv/contagion/oldman/zombie_voice_shared-5.wav","vj_piv/contagion/oldman/zombie_voice_shared-6.wav","vj_piv/contagion/oldman/zombie_voice_shared-7.wav","vj_piv/contagion/oldman/zombie_voice_shared-8.wav","vj_piv/contagion/oldman/zombie_voice_shared-9.wav"}
       self.SoundTbl_BeforeMeleeAttack = {"vj_piv/contagion/oldman/zombie_voice_shared-1.wav","vj_piv/contagion/oldman/zombie_voice_shared-2.wav","vj_piv/contagion/oldman/zombie_voice_shared-3.wav","vj_piv/contagion/oldman/zombie_voice_shared-4.wav","vj_piv/contagion/oldman/zombie_voice_shared-5.wav","vj_piv/contagion/oldman/zombie_voice_shared-6.wav","vj_piv/contagion/oldman/zombie_voice_shared-7.wav","vj_piv/contagion/oldman/zombie_voice_shared-8.wav","vj_piv/contagion/oldman/zombie_voice_shared-9.wav"}
       self.SoundTbl_Pain = {"vj_piv/contagion/z_sham/pain/0148.wav","vj_piv/contagion/z_sham/pain/0149.wav","vj_piv/contagion/z_sham/pain/0147.wav","vj_piv/contagion/z_sham/pain/0146.wav","vj_piv/contagion/z_sham/pain/0143.wav","vj_piv/contagion/z_sham/pain/0141.wav","vj_piv/contagion/z_sham/pain/0140.wav","vj_piv/contagion/z_sham/pain/0139.wav","vj_piv/contagion/z_sham/pain/0138.wav","vj_piv/contagion/z_sham/pain/0137.wav","vj_piv/contagion/z_sham/pain/0136.wav","vj_piv/contagion/z_sham/pain/0135.wav","vj_piv/contagion/z_sham/pain/0133.wav","vj_piv/contagion/z_sham/pain/0132.wav","vj_piv/contagion/z_sham/pain/0131.wav","vj_piv/contagion/z_sham/pain/0130.wav","vj_piv/contagion/z_sham/pain/0129.wav","vj_piv/contagion/z_sham/pain/0127.wav","vj_piv/contagion/z_sham/pain/0126.wav","vj_piv/contagion/z_sham/pain/0125.wav","vj_piv/contagion/z_sham/pain/0124.wav","vj_piv/contagion/z_sham/pain/0069.wav","vj_piv/contagion/z_sham/pain/0066.wav","vj_piv/contagion/z_sham/pain/0065.wav","vj_piv/contagion/z_sham/pain/0064.wav","vj_piv/contagion/z_sham/pain/0063.wav","vj_piv/contagion/z_sham/pain/0062.wav"}
       self.SoundTbl_Death = {"vj_piv/contagion/z_arne/die/0222.wav","vj_piv/contagion/z_arne/die/0223.wav","vj_piv/contagion/z_arne/die/0224.wav","vj_piv/contagion/z_arne/die/0225.wav"}
    end

end

	self:Zombie_CustomOnInitialize()

end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contselfs may be reproduced, copied, modified or adapted,
	without the prior written consself of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/