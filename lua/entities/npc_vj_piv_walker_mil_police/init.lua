AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/military/national_guard_riot.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 150
ENT.PIV_HasShield = false

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 90

ENT.SoundTbl_Breath = {"ambient/levels/prison/radio_random1.wav","ambient/levels/prison/radio_random2.wav","ambient/levels/prison/radio_random3.wav","ambient/levels/prison/radio_random4.wav","ambient/levels/prison/radio_random5.wav","ambient/levels/prison/radio_random6.wav","ambient/levels/prison/radio_random7.wav","ambient/levels/prison/radio_random8.wav","ambient/levels/prison/radio_random9.wav","ambient/levels/prison/radio_random10.wav","ambient/levels/prison/radio_random11.wav","ambient/levels/prison/radio_random12.wav","ambient/levels/prison/radio_random13.wav","ambient/levels/prison/radio_random14.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnPreInitialize()
	if GetConVar("vj_piv_militaryskin"):GetInt() == 0 then
	self.Model = {"models/vj_piv/military/national_guard_riot.mdl"}
	elseif GetConVar("vj_piv_militaryskin"):GetInt() == 1 then
	self.Model = {"models/vj_piv/military/us_soldier_riot.mdl"}
	elseif GetConVar("vj_piv_militaryskin"):GetInt() == 2 then
	self.Model = {"models/vj_piv/military/us_desert_riot.mdl"}
	elseif GetConVar("vj_piv_militaryskin"):GetInt() == 3 then
	self.Model = {"models/vj_piv/military/us_snow_riot.mdl"}
	elseif GetConVar("vj_piv_militaryskin"):GetInt() == 4 then
	self.Model = {"models/vj_piv/military/national_guard_riot.mdl","models/vj_piv/military/us_soldier_riot.mdl","models/vj_piv/military/us_desert_riot.mdl","models/vj_piv/military/us_snow_riot.mdl"}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self.NextSoundTime_Breath = VJ_Set(7,20)
			self:SetBodygroup(3,math.random(0,1))

	if math.random(1,3) == 1 then
		self:SetBodygroup(2,math.random(1,2))	
	elseif math.random(1,3) == 2 then
		self:SetBodygroup(2,math.random(4,6))
	elseif math.random(1,3) == 3 then
		self:SetBodygroup(2,3)
		self.PIV_HasArmor = true
	end
	
if GetConVar("vj_piv_walk_voice"):GetInt() == 0 then
self.Voice = 1
elseif GetConVar("vj_piv_walk_voice"):GetInt() == 1 then
self.Voice = 2
elseif GetConVar("vj_piv_walk_voice"):GetInt() == 2 then
self.Voice = 3
elseif GetConVar("vj_piv_walk_voice"):GetInt() == 3 then
self.Voice = math.random(1,3)
end

if self.Voice == 1 then
	
self.SoundTbl_Idle = {
	"vj_piv/nmr_zomb2/idle1.wav",
	"vj_piv/nmr_zomb2/idle2.wav",
	"vj_piv/nmr_zomb2/idle3.wav",
	"vj_piv/nmr_zomb2/idle4.wav",
	"vj_piv/nmr_zomb2/idle5.wav",
	"vj_piv/nmr_zomb2/idle6.wav",
	"vj_piv/nmr_zomb2/idle7.wav",
	"vj_piv/nmr_zomb2/idle8.wav",
	"vj_piv/nmr_zomb2/idle9.wav",
	"vj_piv/nmr_zomb2/idle10.wav",
	"vj_piv/nmr_zomb2/idle11.wav",
	"vj_piv/nmr_zomb2/idle12.wav",
	"vj_piv/nmr_zomb2/idle13.wav",
	"vj_piv/nmr_zomb2/idle14.wav",
	"vj_piv/nmr_zomb2/idle15.wav"
}
self.SoundTbl_Alert = {
	"vj_piv/nmr_zomb2/alert_sham_m_01.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_02.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_03.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_04.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_05.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_06.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_07.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_08.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_09.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_10.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_11.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_12.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_13.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_14.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_15.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_16.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_17.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_18.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_19.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_20.wav",	
	"vj_piv/nmr_zomb2/alert_sham_m_21.wav"
}
self.SoundTbl_CombatIdle = {
	"vj_piv/nmr_zomb2/pursuit_sham_m_01.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_02.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_03.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_04.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_05.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_06.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_07.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_08.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_09.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_10.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_11.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_12.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_13.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_14.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_15.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_16.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_17.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_18.wav"
}
self.SoundTbl_BeforeMeleeAttack = {
	"vj_piv/nmr_zomb1/attack_sham_m_01.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_02.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_03.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_04.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_05.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_06.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_07.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_08.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_09.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_10.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_11.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_12.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_13.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_14.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_15.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_16.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_17.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_18.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_19.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_20.wav",	
	"vj_piv/nmr_zomb1/attack_sham_m_21.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_22.wav"	
}
self.SoundTbl_LeapAttackJump = {
	"vj_piv/nmr_zomb1/attack_sham_m_01.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_02.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_03.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_04.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_05.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_06.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_07.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_08.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_09.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_10.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_11.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_12.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_13.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_14.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_15.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_16.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_17.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_18.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_19.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_20.wav",	
	"vj_piv/nmr_zomb1/attack_sham_m_21.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_22.wav"
}
self.SoundTbl_Pain = {
	"vj_piv/nmr_zomb2/pain01.wav",
	"vj_piv/nmr_zomb2/pain02.wav",
	"vj_piv/nmr_zomb2/pain03.wav", 
	"vj_piv/nmr_zomb2/pain04.wav",
	"vj_piv/nmr_zomb2/pain05.wav"
}
self.SoundTbl_Death = {
	"vj_piv/nmr_zomb2/die01.wav",
	"vj_piv/nmr_zomb2/die02.wav",
	"vj_piv/nmr_zomb2/die03.wav",
	"vj_piv/nmr_zomb2/die04.wav",
	"vj_piv/nmr_zomb2/die05.wav"
}

elseif self.Voice == 2 then

self.SoundTbl_Idle = {
	"vj_piv/dl_bite_male/walker_male00_get_up_00_0.wav",
	"vj_piv/dl_bite_male/walker_male00_get_up_01_0.wav",
	"vj_piv/dl_bite_male/walker_male00_idle_calm_00_0.wav",
	"vj_piv/dl_bite_male/walker_male00_idle_calm_01_0.wav",
	"vj_piv/dl_bite_male/walker_male00_idle_calm_02_0.wav",
	"vj_piv/dl_bite_male/walker_male00_idle_calm_03_0.wav",
	"vj_piv/dl_bite_male/walker_male00_idle_calm_04_0.wav",
	"vj_piv/dl_bite_male/walker_male00_idle_calm_05_0.wav",
	"vj_piv/dl_bite_male/walker_male00_idle_alarmed_00_0.wav",
	"vj_piv/dl_bite_male/walker_male00_idle_alarmed_01_0.wav",
	"vj_piv/dl_bite_male/walker_male00_idle_alarmed_02_0.wav"
}
if self.PIV_Jogger == true then
self.SoundTbl_Alert = {
	"vj_piv/dl_bite_male/walker_male_call_nw_00_0.wav",
	"vj_piv/dl_bite_male/walker_male_call_nw_01_0.wav",
	"vj_piv/dl_bite_male/walker_male_call_nw_02_0.wav"
}
else
self.SoundTbl_Alert = {
	"vj_piv/dl_bite_male/walker_male00_enemy_spotted_00_0.wav",
	"vj_piv/dl_bite_male/walker_male00_enemy_spotted_01_0.wav",
	"vj_piv/dl_bite_male/walker_male00_enemy_spotted_02_0.wav",
	"vj_piv/dl_bite_male/walker_male00_enemy_spotted_03_0.wav",
	"vj_piv/dl_bite_male/walker_male00_enemy_spotted_04_0.wav",
	"vj_piv/dl_bite_male/walker_male00_falling_00_0.wav",
	"vj_piv/dl_bite_male/walker_male00_falling_01_0.wav",
	"vj_piv/dl_bite_male/walker_male00_falling_03_0.wav"
}
end
self.SoundTbl_CombatIdle = {
	"vj_piv/dl_bite_male/walker_male00_move_alarmed_00_0.wav",
	"vj_piv/dl_bite_male/walker_male00_move_alarmed_01_0.wav",
	"vj_piv/dl_bite_male/walker_male00_move_alarmed_02_0.wav",
	"vj_piv/dl_bite_male/walker_male00_berserker_long_00_0.wav",
	"vj_piv/dl_bite_male/walker_male00_berserker_long_01_0.wav",
	"vj_piv/dl_bite_male/walker_male00_berserker_long_02_0.wav",
	"vj_piv/dl_bite_male/walker_male00_berserker_long_03_0.wav",
	"vj_piv/dl_bite_male/walker_male00_berserker_long_04_0.wav",
	"vj_piv/dl_bite_male/walker_male00_berserker_short_00_0.wav",
	"vj_piv/dl_bite_male/walker_male00_berserker_short_01_0.wav",
	"vj_piv/dl_bite_male/walker_male00_berserker_short_02_0.wav",
	"vj_piv/dl_bite_male/walker_male00_berserker_short_03_0.wav",
	"vj_piv/dl_bite_male/walker_male00_berserker_short_04_0.wav",
	"vj_piv/dl_bite_male/walker_male00_berserker_short_05_0.wav",
	"vj_piv/dl_bite_male/walker_male00_berserker_short_06_0.wav"
}
self.SoundTbl_BeforeMeleeAttack = {
	"vj_piv/dl_bite_male/walker_male00_attack_00_0.wav",
	"vj_piv/dl_bite_male/walker_male00_attack_01_0.wav",
	"vj_piv/dl_bite_male/walker_male00_attack_02_0.wav",
	"vj_piv/dl_bite_male/walker_male00_attack_03_0.wav",
	"vj_piv/dl_bite_male/walker_male00_attack_04_0.wav"
}
self.SoundTbl_LeapAttackJump = {
	"vj_piv/dl_bite_male/walker_male00_attack_00_0.wav",
	"vj_piv/dl_bite_male/walker_male00_attack_01_0.wav",
	"vj_piv/dl_bite_male/walker_male00_attack_02_0.wav",
	"vj_piv/dl_bite_male/walker_male00_attack_03_0.wav",
	"vj_piv/dl_bite_male/walker_male00_attack_04_0.wav"
}
self.SoundTbl_Pain = {
	"vj_piv/dl_bite_male/walker_male00_pain_00_0.wav",
	"vj_piv/dl_bite_male/walker_male00_pain_01_0.wav",
	"vj_piv/dl_bite_male/walker_male00_pain_02_0.wav",
	"vj_piv/dl_bite_male/walker_male00_pain_03_0.wav",
	"vj_piv/dl_bite_male/walker_male00_pain_04_0.wav",
	"vj_piv/dl_bite_male/walker_male00_pain_05_0.wav",
	"vj_piv/dl_bite_male/walker_male00_pain_06_0.wav",
	"vj_piv/dl_bite_male/walker_male00_pain_07_0.wav",
	"vj_piv/dl_bite_male/walker_male00_pain_critical_00_0.wav",
	"vj_piv/dl_bite_male/walker_male00_pain_critical_01_0.wav",
	"vj_piv/dl_bite_male/walker_male00_pain_critical_02_0.wav",
	"vj_piv/dl_bite_male/walker_male00_pain_critical_03_0.wav",
	"vj_piv/dl_bite_male/walker_male00_neck_break_00_0.wav"
}
self.SoundTbl_Death = {
	"vj_piv/dl_bite_male/walker_male00_pain_burn_00_0.wav",
	"vj_piv/dl_bite_male/walker_male00_pain_burn_01_0.wav",
	"vj_piv/dl_bite_male/walker_male00_pain_burn_02_0.wav",
	"vj_piv/dl_bite_male/walker_male00_pain_burn_03_0.wav",
	"vj_piv/dl_bite_male/walker_male00_death_00_0.wav",
	"vj_piv/dl_bite_male/walker_male00_death_01_0.wav",
	"vj_piv/dl_bite_male/walker_male00_death_02_0.wav",
	"vj_piv/dl_bite_male/walker_male00_death_03_0.wav",
	"vj_piv/dl_bite_male/walker_male00_death_04_0.wav",
	"vj_piv/dl_bite_male/walker_male00_death_car_00_0.wav",
	"vj_piv/dl_bite_male/walker_male00_death_car_01_0.wav",
	"vj_piv/dl_bite_male/walker_male00_death_car_02_0.wav",
	"vj_piv/dl_bite_male/walker_male00_death_car_03_0.wav",
	"vj_piv/dl_bite_male/walker_male00_neck_break_00_0.wav"
	
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
	"vj_piv/l4d_common/alert/becomealert/male/become_alert60.wav",
	"vj_piv/l4d_common/alert/becomealert/male/become_alert61.wav",
	"vj_piv/l4d_common/alert/becomealert/male/become_alert62.wav",
	"vj_piv/l4d_common/alert/becomealert/male/become_alert63.wav"
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
	"vj_piv/l4d_common/alert/alert/male/alert50.wav",
	"vj_piv/l4d_common/alert/alert/male/alert51.wav",
	"vj_piv/l4d_common/alert/alert/male/alert52.wav",
	"vj_piv/l4d_common/alert/alert/male/alert53.wav",
	"vj_piv/l4d_common/alert/alert/male/alert53.wav",
	"vj_piv/l4d_common/alert/alert/male/alert53.wav",
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
	"vj_piv/l4d_common/action/rage/male/rage_50.wav",
	"vj_piv/l4d_common/action/rage/male/rage_51.wav",
	"vj_piv/l4d_common/action/rage/male/rage_52.wav",
	"vj_piv/l4d_common/action/rage/male/rage_53.wav",
	"vj_piv/l4d_common/action/rage/male/rage_54.wav",
	"vj_piv/l4d_common/action/rage/male/rage_55.wav",
	"vj_piv/l4d_common/action/rage/male/rage_56.wav",
	"vj_piv/l4d_common/action/rage/male/rage_57.wav",
	"vj_piv/l4d_common/action/rage/male/rage_58.wav",
	"vj_piv/l4d_common/action/rage/male/rage_59.wav",
	"vj_piv/l4d_common/action/rage/male/rage_60.wav",
	"vj_piv/l4d_common/action/rage/male/rage_61.wav",
	"vj_piv/l4d_common/action/rage/male/rage_62.wav",
	"vj_piv/l4d_common/action/rage/male/rage_64.wav",
	"vj_piv/l4d_common/action/rage/male/rage_65.wav",
	"vj_piv/l4d_common/action/rage/male/rage_66.wav",
	"vj_piv/l4d_common/action/rage/male/rage_67.wav",
	"vj_piv/l4d_common/action/rage/male/rage_68.wav",
	"vj_piv/l4d_common/action/rage/male/rage_69.wav",
	"vj_piv/l4d_common/action/rage/male/rage_70.wav",
	"vj_piv/l4d_common/action/rage/male/rage_71.wav",
	"vj_piv/l4d_common/action/rage/male/rage_72.wav",
	"vj_piv/l4d_common/action/rage/male/rage_73.wav",
	"vj_piv/l4d_common/action/rage/male/rage_74.wav",
	"vj_piv/l4d_common/action/rage/male/rage_75.wav",
	"vj_piv/l4d_common/action/rage/male/rage_76.wav",
	"vj_piv/l4d_common/action/rage/male/rage_77.wav",
	"vj_piv/l4d_common/action/rage/male/rage_78.wav",
	"vj_piv/l4d_common/action/rage/male/rage_79.wav",
	"vj_piv/l4d_common/action/rage/male/rage_80.wav",
	"vj_piv/l4d_common/action/rage/male/rage_81.wav",
	"vj_piv/l4d_common/action/rage/male/rage_82.wav"
}
self.SoundTbl_LeapAttackJump = {
	"vj_piv/l4d_common/action/rage/male/rage_50.wav",
	"vj_piv/l4d_common/action/rage/male/rage_51.wav",
	"vj_piv/l4d_common/action/rage/male/rage_52.wav",
	"vj_piv/l4d_common/action/rage/male/rage_53.wav",
	"vj_piv/l4d_common/action/rage/male/rage_54.wav",
	"vj_piv/l4d_common/action/rage/male/rage_55.wav",
	"vj_piv/l4d_common/action/rage/male/rage_56.wav",
	"vj_piv/l4d_common/action/rage/male/rage_57.wav",
	"vj_piv/l4d_common/action/rage/male/rage_58.wav",
	"vj_piv/l4d_common/action/rage/male/rage_59.wav",
	"vj_piv/l4d_common/action/rage/male/rage_60.wav",
	"vj_piv/l4d_common/action/rage/male/rage_61.wav",
	"vj_piv/l4d_common/action/rage/male/rage_62.wav",
	"vj_piv/l4d_common/action/rage/male/rage_64.wav",
	"vj_piv/l4d_common/action/rage/male/rage_65.wav",
	"vj_piv/l4d_common/action/rage/male/rage_66.wav",
	"vj_piv/l4d_common/action/rage/male/rage_67.wav",
	"vj_piv/l4d_common/action/rage/male/rage_68.wav",
	"vj_piv/l4d_common/action/rage/male/rage_69.wav",
	"vj_piv/l4d_common/action/rage/male/rage_70.wav",
	"vj_piv/l4d_common/action/rage/male/rage_71.wav",
	"vj_piv/l4d_common/action/rage/male/rage_72.wav",
	"vj_piv/l4d_common/action/rage/male/rage_73.wav",
	"vj_piv/l4d_common/action/rage/male/rage_74.wav",
	"vj_piv/l4d_common/action/rage/male/rage_75.wav",
	"vj_piv/l4d_common/action/rage/male/rage_76.wav",
	"vj_piv/l4d_common/action/rage/male/rage_77.wav",
	"vj_piv/l4d_common/action/rage/male/rage_78.wav",
	"vj_piv/l4d_common/action/rage/male/rage_79.wav",
	"vj_piv/l4d_common/action/rage/male/rage_80.wav",
	"vj_piv/l4d_common/action/rage/male/rage_81.wav",
	"vj_piv/l4d_common/action/rage/male/rage_82.wav"
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
	"vj_piv/l4d_common/action/been_shot/male/been_shot_30.wav",
	"vj_piv/l4d_common/action/been_shot/male/been_shot_31.wav",
	"vj_piv/l4d_common/action/been_shot/male/been_shot_32.wav",
	"vj_piv/l4d_common/action/been_shot/male/been_shot_32.wav",
	"vj_piv/l4d_common/action/been_shot/male/been_shot_34.wav",
	"vj_piv/l4d_common/action/been_shot/male/been_shot_35.wav",
	"vj_piv/l4d_common/action/been_shot/male/been_shot_36.wav",
	"vj_piv/l4d_common/action/been_shot/male/been_shot_37.wav",
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
	"vj_piv/l4d_common/action/die/male/death_40.wav",
	"vj_piv/l4d_common/action/die/male/death_41.wav",
	"vj_piv/l4d_common/action/die/male/death_42.wav",
	"vj_piv/l4d_common/action/die/male/death_43.wav",
	"vj_piv/l4d_common/action/die/male/death_44.wav",
	"vj_piv/l4d_common/action/die/male/death_45.wav",
	"vj_piv/l4d_common/action/die/male/death_46.wav",
	"vj_piv/l4d_common/action/die/male/death_47.wav",
	"vj_piv/l4d_common/action/die/male/death_48.wav",
	"vj_piv/l4d_common/action/die/male/death_49.wav",
	"vj_piv/l4d_common/action/die/mp/squeal_1.wav",
	"vj_piv/l4d_common/action/die/mp/squeal_2.wav",
	"vj_piv/l4d_common/action/die/mp/squeal_3.wav",
	"vj_piv/l4d_common/action/ignite/male/ignite10.wav",
	"vj_piv/l4d_common/action/ignite/male/ignite11.wav",
	"vj_piv/l4d_common/action/ignite/male/ignite12.wav",
	"vj_piv/l4d_common/action/ignite/male/ignite13.wav",
	"vj_piv/l4d_common/action/ignite/male/ignite14.wav"
}

end
	
	
	if math.random(1,3) == 1 then
		self:SetBodygroup(4,0)
		self:SetBodygroup(1,math.random(0,1))
		self.ImmuneDamagesTable = {DMG_RADIATION,DMG_NERVEGAS}
	self.NextSoundTime_Idle = VJ_Set(16, 23)
	self.SoundTbl_CombatIdle = {"vj_piv/mil_zomb/gasmask/walker_combatidle_1.wav","vj_piv/mil_zomb/gasmask/walker_combatidle_2.wav","vj_piv/mil_zomb/gasmask/walker_combatidle_3.wav","vj_piv/mil_zomb/gasmask/walker_combatidle_4.wav"}
	self.SoundTbl_Idle = {"vj_piv/mil_zomb/gasmask/idle_1.wav","vj_piv/mil_zomb/gasmask/idle_2.wav","vj_piv/mil_zomb/gasmask/idle_3.wav"}
	self.SoundTbl_Alert = {"vj_piv/mil_zomb/gasmask/alert_1.wav","vj_piv/mil_zomb/gasmask/alert_2.wav","vj_piv/mil_zomb/gasmask/alert_3.wav","vj_piv/mil_zomb/gasmask/alert_4.wav"}
	self.SoundTbl_Pain = {"vj_piv/mil_zomb/gasmask/pain_1.wav","vj_piv/mil_zomb/gasmask/pain_2.wav","vj_piv/mil_zomb/gasmask/pain_3.wav","vj_piv/mil_zomb/gasmask/pain_4.wav","vj_piv/mil_zomb/gasmask/pain_5.wav","vj_piv/mil_zomb/gasmask/pain_6.wav"}
	self.SoundTbl_Death = {"vj_piv/mil_zomb/gasmask/death_1.wav","vj_piv/mil_zomb/gasmask/death_2.wav","vj_piv/mil_zomb/gasmask/death_3.wav"}
	self.SoundTbl_BeforeMeleeAttack = {"vj_piv/mil_zomb/gasmask/attack_1.wav","vj_piv/mil_zomb/gasmask/attack_2.wav","vj_piv/mil_zomb/gasmask/attack_3.wav","vj_piv/mil_zomb/gasmask/attack_4.wav"}
    elseif math.random(1,3) == 2 then
		if math.random(1,2) == 1 then
			self:SetBodygroup(4,1)
		else
			self:SetBodygroup(4,2)
		end
		self:SetBodygroup(1,0)
    elseif math.random(1,3) == 3 then
		self:SetBodygroup(4,2)
		self:SetBodygroup(1,1)
		self.SoundTbl_Idle = {"vj_piv/mil_zomb/radio/idle_1.wav","vj_piv/mil_zomb/radio/idle_2.wav","vj_piv/mil_zomb/radio/idle_3.wav","vj_piv/mil_zomb/radio/idle_4.wav"}
		self.SoundTbl_CombatIdle = {"vj_piv/mil_zomb/radio/idle_1.wav","vj_piv/mil_zomb/radio/idle_2.wav","vj_piv/mil_zomb/radio/idle_3.wav","vj_piv/mil_zomb/radio/idle_4.wav"}
self.SoundTbl_Alert = {"vj_piv/mil_zomb/radio/alert_1.wav","vj_piv/mil_zomb/radio/alert_2.wav","vj_piv/mil_zomb/radio/alert_3.wav","vj_piv/mil_zomb/radio/alert_4.wav","vj_piv/mil_zomb/radio/alert_5.wav","vj_piv/mil_zomb/radio/alert_6.wav","vj_piv/mil_zomb/radio/alert_7.wav"}
self.SoundTbl_Pain = {"vj_piv/mil_zomb/radio/pain_1.wav","vj_piv/mil_zomb/radio/pain_2.wav","vj_piv/mil_zomb/radio/pain_3.wav","vj_piv/mil_zomb/radio/pain_4.wav"}
self.SoundTbl_Death = {"vj_piv/mil_zomb/radio/death_1.wav","vj_piv/mil_zomb/radio/death_2.wav"}
self.SoundTbl_BeforeMeleeAttack = {"vj_piv/mil_zomb/radio/alert_1.wav","vj_piv/mil_zomb/radio/alert_2.wav","vj_piv/mil_zomb/radio/alert_3.wav","vj_piv/mil_zomb/radio/alert_4.wav","vj_piv/mil_zomb/radio/alert_5.wav","vj_piv/mil_zomb/radio/alert_6.wav","vj_piv/mil_zomb/radio/alert_7.wav"}
end
	
	if math.random(1,3) == 1 && self.PIV_WeHaveAWeapon == false && self.PIV_FuckingCrawlingLittleCunt == false then
		local ShieldPlacement = self:LookupBone("ValveBiped.Bip01_L_Forearm")
		self.ZombieShield = ents.Create("prop_physics")
		self.ZombieShield:SetModel("models/riotshield/shield.mdl")
		self.ZombieShield:SetPos(self:GetPos() + Vector(0,0,0))
		self.ZombieShield:SetAngles(self:GetAngles() + Angle(0,0,0))
		self.ZombieShield:Fire("SetParentAttachment","shield")
		self.ZombieShield:SetOwner(self) 
		self.ZombieShield:SetParent(self)
		self:ManipulateBoneAngles(ShieldPlacement, Angle(0,-80,-20))
		self.ZombieShield:Spawn()
		self.ZombieShield:Activate()	
		self.ZombieShield:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
		self.AnimTbl_Walk = {ACT_WALK_AIM_AGITATED}
		self.AnimTbl_Run = {ACT_WALK_AIM_AGITATED}
		self.AnimTbl_IdleStand = {ACT_IDLE_AIM_AGITATED}
		self.PIV_CanClimb = false
		self.PIV_HasShield = true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SpawnBloodParticles(dmginfo,hitgroup)
if self.PIV_HasArmor == true then
	if hitgroup == HITGROUP_HEAD then
		local p_name = VJ_PICK(self.CustomBlood_Particle)
		if p_name == false then return end
		
		local dmg_pos = dmginfo:GetDamagePosition()
		if dmg_pos == Vector(0,0,0) then dmg_pos = self:GetPos() + self:OBBCenter() end
		
		local spawnparticle = ents.Create("info_particle_system")
		spawnparticle:SetKeyValue("effect_name",p_name)
		spawnparticle:SetPos(dmg_pos)
		spawnparticle:Spawn()
		spawnparticle:Activate()
		spawnparticle:Fire("Start","",0)
		spawnparticle:Fire("Kill","",0.1)
	end
end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
if self.PIV_HasArmor == true then
	if hitgroup == HITGROUP_HEAD then return end
	if (dmginfo:IsBulletDamage()) then
		local attacker = dmginfo:GetAttacker()
		self.DamageSpark1 = ents.Create("env_spark")
		self.DamageSpark1:SetKeyValue("Magnitude","1")
		self.DamageSpark1:SetKeyValue("Spark Trail Length","1")
		self.DamageSpark1:SetPos(dmginfo:GetDamagePosition())
		self.DamageSpark1:SetAngles(self:GetAngles())
		//self.DamageSpark1:Fire("LightColor", "255 255 255")
		self.DamageSpark1:SetParent(self)
		self.DamageSpark1:Spawn()
		self.DamageSpark1:Activate()
		self.DamageSpark1:Fire("StartSpark", "", 0)
		self.DamageSpark1:Fire("StopSpark", "", 0.001)
		self:DeleteOnRemove(self.DamageSpark1)
	end
	if self.HasSounds == true && self.HasImpactSounds == true then VJ_EmitSound(self,"vj_impact_metal/bullet_metal/metalsolid"..math.random(1,10)..".wav",70) end
	dmginfo:ScaleDamage(0.50)
end
	if hitgroup == HITGROUP_HEAD && GetConVar("vj_piv_headshot_damage"):GetInt() == 1 then
		dmginfo:ScaleDamage(GetConVarNumber("vj_piv_headshot_damage_mult"))
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DropTheShield()
	if IsValid(self.ZombieShield) then
		self.AnimTbl_Walk = {ACT_WALK}
		self.AnimTbl_Run = {ACT_WALK}
		self.AnimTbl_IdleStand = {ACT_IDLE}
		if self.PIV_Jogger == true then
			self.AnimTbl_Walk = {ACT_WALK}
			self.AnimTbl_Run = {ACT_RUN}
		end
		if self.PIV_Shambler == true then
			self.AnimTbl_Walk = {ACT_WALK_RELAXED}
			self.AnimTbl_Run = {ACT_WALK_RELAXED}
		end
		if self.PIV_FuckingCrawlingLittleCunt == true or self.PIV_Crippled == true then
			self.AnimTbl_IdleStand = {ACT_IDLE_STIMULATED}
			self.AnimTbl_Walk = {ACT_WALK_STIMULATED}
			self.AnimTbl_Run = {ACT_WALK_STIMULATED}
		end
		self.PIV_HasShield = false
		self:CreateGibEntity("prop_physics",self.ZombieShield:GetModel(),{Pos=self:GetAttachment(self:LookupAttachment("shield")).Pos,Ang=self:GetAngles()}) self.ZombieShield:SetMaterial("nodraw") self.ZombieShield:DrawShadow(false)
		self.ZombieShield:Remove()	
    local ShieldPlacement = self:LookupBone("ValveBiped.Bip01_L_Forearm")
        self:ManipulateBoneAngles(ShieldPlacement, Angle(0,0,0))	
	if GetConVar("vj_piv_climbing"):GetInt() == 1 && self.PIV_FuckingCrawlingLittleCunt == false && self.PIV_Crippled == false then
		self.PIV_CanClimb = true
	end

	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/