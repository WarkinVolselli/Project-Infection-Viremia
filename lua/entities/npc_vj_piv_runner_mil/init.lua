AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/military/national_guard_1.mdl","models/vj_piv/military/national_guard_2.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 125

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 90

ENT.SoundTbl_Breath = {"ambient/levels/prison/radio_random1.wav","ambient/levels/prison/radio_random2.wav","ambient/levels/prison/radio_random3.wav","ambient/levels/prison/radio_random4.wav","ambient/levels/prison/radio_random5.wav","ambient/levels/prison/radio_random6.wav","ambient/levels/prison/radio_random7.wav","ambient/levels/prison/radio_random8.wav","ambient/levels/prison/radio_random9.wav","ambient/levels/prison/radio_random10.wav","ambient/levels/prison/radio_random11.wav","ambient/levels/prison/radio_random12.wav","ambient/levels/prison/radio_random13.wav","ambient/levels/prison/radio_random14.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnPreInitialize()
	if GetConVar("vj_piv_militaryskin"):GetInt() == 0 then
	self.Model = {"models/vj_piv/military/national_guard_1.mdl","models/vj_piv/military/national_guard_2.mdl"}
	elseif GetConVar("vj_piv_militaryskin"):GetInt() == 1 then
	self.Model = {"models/vj_piv/military/us_soldier1.mdl","models/vj_piv/military/us_soldier2.mdl"}
	elseif GetConVar("vj_piv_militaryskin"):GetInt() == 2 then
	self.Model = {"models/vj_piv/military/us_desert_1.mdl","models/vj_piv/military/us_desert_2.mdl"}
	elseif GetConVar("vj_piv_militaryskin"):GetInt() == 3 then
	self.Model = {"models/vj_piv/military/us_snow_1.mdl","models/vj_piv/military/us_snow_2.mdl"}
	elseif GetConVar("vj_piv_militaryskin"):GetInt() == 4 then
	self.Model = {"models/vj_piv/military/national_guard_1.mdl","models/vj_piv/military/national_guard_2.mdl","models/vj_piv/military/us_soldier1.mdl","models/vj_piv/military/us_soldier2.mdl","models/vj_piv/military/us_desert_1.mdl","models/vj_piv/military/us_desert_2.mdl","models/vj_piv/military/us_snow_1.mdl","models/vj_piv/military/us_snow_2.mdl"}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self.NextSoundTime_Breath = VJ_Set(7,20)
			self:SetBodygroup(1,math.random(0,1))
			self:SetBodygroup(3,math.random(0,1))
			self:SetBodygroup(4,math.random(1,6))

	if math.random(1,3) == 1 then
		self:SetBodygroup(2,math.random(1,2))	
	elseif math.random(1,3) == 2 then
		self:SetBodygroup(2,math.random(4,6))
	elseif math.random(1,3) == 3 then
		self:SetBodygroup(2,3)
		self.PIV_HasArmor = true
	end
	
if GetConVar("vj_piv_run_voice"):GetInt() == 0 then
self.Voice = 1
elseif GetConVar("vj_piv_run_voice"):GetInt() == 1 then
self.Voice = 2
elseif GetConVar("vj_piv_run_voice"):GetInt() == 2 then
self.Voice = 3
elseif GetConVar("vj_piv_run_voice"):GetInt() == 3 then
self.Voice = math.random(1,3)
end

if self.Voice == 1 then
	
self.SoundTbl_Idle = {
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-01.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-02.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-03.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-04.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-05.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-06.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-07.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-08.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-09.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-10.wav"
}
self.SoundTbl_Alert = {
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-01.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-02.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-03.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-04.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-05.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-06.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-07.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-08.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-09.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-10.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-11.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-12.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-13.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-14.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-15.wav"
}
self.SoundTbl_CombatIdle = {
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-01.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-02.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-03.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-04.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-05.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-06.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-07.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-08.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-09.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-10.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-11.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-12.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-13.wav"	
}
self.SoundTbl_BeforeMeleeAttack = {
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack01.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack02.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack03.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack04.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack05.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack06.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack07.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack08.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack09.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack10.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack11.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack12.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack13.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack14.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack15.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack16.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack17.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack18.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack19.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack20.wav"	
}
self.SoundTbl_Pain = {
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain01.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain02.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain03.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain04.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain05.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain06.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain07.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain08.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain09.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain10.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain11.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain12.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain13.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain14.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain15.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain16.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain17.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain18.wav"
}
self.SoundTbl_Death = {
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-01.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-02.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-03.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-04.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-05.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-06.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-07.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-08.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-09.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-10.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-11.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-12.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-13.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-14.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-15.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-16.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-17.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-18.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-19.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-20.wav"
}

elseif self.Voice == 2 then

self.SoundTbl_Idle = {
	"vj_piv/dl_inf_male/infected_male00_get_up_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_get_up_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_idle_calm_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_idle_calm_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_idle_upset_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_idle_upset_01_0.wav"
}
self.SoundTbl_Alert = {
	"vj_piv/dl_inf_male/infected_male00_enemy_spotted_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_enemy_spotted_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_taunt_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_taunt_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_buggy_grab_taunt_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_buggy_grab_taunt_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_enemy_spotted_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_enemy_spotted_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_taunt_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_taunt_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_buggy_grab_taunt_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_buggy_grab_taunt_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_humanity_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_humanity_02_0.wav"
}
self.SoundTbl_CombatIdle = {
	"vj_piv/dl_inf_male/infected_male00_dodge_long_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_dodge_long_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_dodge_short_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_dodge_short_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_move_alarmed_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_move_alarmed_01_0.wav"
}
self.SoundTbl_BeforeMeleeAttack = {
	"vj_piv/dl_inf_male/infected_male00_attack_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_attack_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_attack_02_0.wav",
	"vj_piv/dl_inf_male/infected_male00_attack_03_0.wav",
	"vj_piv/dl_inf_male/infected_male00_attack_04_0.wav",
	"vj_piv/dl_inf_male/infected_male00_buggy_grab_attack_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_buggy_grab_attack_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_buggy_grab_attack_02_0.wav"
}
self.SoundTbl_LeapAttackJump = {
	"vj_piv/dl_inf_male/infected_male00_buggy_grab_taunt_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_buggy_grab_taunt_01_0.wav",
}
self.SoundTbl_Pain = {
	"vj_piv/dl_inf_male/infected_male00_pain_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_pain_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_pain_critical_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_pain_electro_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_pain_light_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_pain_light_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_buggy_grab_drop_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_buggy_grab_drop_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_pain_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_pain_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_pain_critical_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_pain_electro_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_pain_light_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_pain_light_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_buggy_grab_drop_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_buggy_grab_drop_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_humanity_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_humanity_03_0.wav",
	"vj_piv/dl_inf_male/infected_male00_humanity_04_0.wav"
}
self.SoundTbl_Death = {
	"vj_piv/dl_inf_male/infected_male00_death_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_death_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_death_car_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_death_car_01_0.wav",
	"vj_piv/dl_inf_male/infected_male00_death_car_02_0.wav",
	"vj_piv/dl_inf_male/infected_male00_pain_burn_00_0.wav",
	"vj_piv/dl_inf_male/infected_male00_pain_burn_01_0.wav",
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
	"vj_piv/l4d_common/alert/becomeenraged/alert24.wav",
	"vj_piv/l4d_common/alert/becomeenraged/become_enraged01.wav",
	"vj_piv/l4d_common/alert/becomeenraged/become_enraged02.wav",
	"vj_piv/l4d_common/alert/becomeenraged/become_enraged03.wav",
	"vj_piv/l4d_common/alert/becomeenraged/become_enraged06.wav",
	"vj_piv/l4d_common/alert/becomeenraged/become_enraged07.wav",
	"vj_piv/l4d_common/alert/becomeenraged/become_enraged09.wav",
	"vj_piv/l4d_common/alert/becomeenraged/become_enraged10.wav",
	"vj_piv/l4d_common/alert/becomeenraged/become_enraged11.wav",
	"vj_piv/l4d_common/alert/becomeenraged/become_enraged30.wav",
	"vj_piv/l4d_common/alert/becomeenraged/become_enraged50.wav",
	"vj_piv/l4d_common/alert/becomeenraged/become_enraged51.wav",
	"vj_piv/l4d_common/alert/becomeenraged/become_enraged52.wav",
	"vj_piv/l4d_common/alert/becomeenraged/become_enraged53.wav",
	"vj_piv/l4d_common/alert/becomeenraged/become_enraged54.wav",
	"vj_piv/l4d_common/alert/becomeenraged/become_enraged55.wav",
	"vj_piv/l4d_common/alert/becomeenraged/become_enraged55.wav",
	"vj_piv/l4d_common/alert/becomeenraged/become_enraged57.wav",
	"vj_piv/l4d_common/alert/becomeenraged/become_enraged58.wav",
	"vj_piv/l4d_common/alert/becomeenraged/male/become_enraged40.wav",
	"vj_piv/l4d_common/alert/becomeenraged/male/become_enraged41.wav",
	"vj_piv/l4d_common/alert/becomeenraged/male/become_enraged42.wav",
	"vj_piv/l4d_common/alert/becomeenraged/male/become_enraged43.wav",
	"vj_piv/l4d_common/alert/becomealert/shout01.wav",
	"vj_piv/l4d_common/alert/becomealert/shout02.wav",
	"vj_piv/l4d_common/alert/becomealert/shout02.wav",
	"vj_piv/l4d_common/alert/becomealert/shout04.wav",
	"vj_piv/l4d_common/alert/becomealert/shout06.wav",
	"vj_piv/l4d_common/alert/becomealert/shout07.wav",
	"vj_piv/l4d_common/alert/becomealert/shout08.wav",
	"vj_piv/l4d_common/alert/becomealert/shout09.wav"
}
self.SoundTbl_CombatIdle = {
	"vj_piv/l4d_common/action/rageat/rage_at_victim01.wav",
	"vj_piv/l4d_common/action/rageat/rage_at_victim02.wav",
	"vj_piv/l4d_common/action/rageat/rage_at_victim02.wav",
	"vj_piv/l4d_common/action/rageat/rage_at_victim21.wav",
	"vj_piv/l4d_common/action/rageat/rage_at_victim22.wav",
	"vj_piv/l4d_common/action/rageat/rage_at_victim25.wav",
	"vj_piv/l4d_common/action/rageat/rage_at_victim26.wav",
	"vj_piv/l4d_common/action/rageat/rage_at_victim34.wav",
	"vj_piv/l4d_common/action/rageat/rage_at_victim35.wav",
	"vj_piv/l4d_common/action/rageat/snarl_4.wav",
	"vj_piv/l4d_common/action/rageat/male/rage_at_victim20.wav",
	"vj_piv/l4d_common/action/rageat/male/rage_at_victim21.wav",
	"vj_piv/l4d_common/action/rageat/male/rage_at_victim22.wav",
	"vj_piv/l4d_common/action/rageat/male/rage_at_victim23.wav",
	"vj_piv/l4d_common/action/rageat/male/rage_at_victim24.wav",
	"vj_piv/l4d_common/action/rageat/male/rage_at_victim25.wav",
	"vj_piv/l4d_common/action/rageat/male/rage_at_victim26.wav",
	"vj_piv/l4d_common/action/rageat/male/rage_at_victim27.wav",
	"vj_piv/l4d_common/action/rageat/male/rage_at_victim28.wav",
	"vj_piv/l4d_common/action/rageat/male/rage_at_victim29.wav",
	"vj_piv/l4d_common/action/rageat/male/rage_at_victim30.wav",
	"vj_piv/l4d_common/action/rageat/male/rage_at_victim31.wav",
	"vj_piv/l4d_common/action/rageat/male/rage_at_victim32.wav",
	"vj_piv/l4d_common/action/rageat/male/rage_at_victim33.wav",
	"vj_piv/l4d_common/action/rageat/male/rage_at_victim34.wav",
	"vj_piv/l4d_common/action/rageat/male/rage_at_victim35.wav",
	"vj_piv/l4d_common/action/rageat/male/rage_at_victim36.wav",
	"vj_piv/l4d_common/action/rageat/male/rage_at_victim37.wav",
	"vj_piv/l4d_common/alert/becomealert/shout01.wav",
	"vj_piv/l4d_common/alert/becomealert/shout02.wav",
	"vj_piv/l4d_common/alert/becomealert/shout02.wav",
	"vj_piv/l4d_common/alert/becomealert/shout04.wav",
	"vj_piv/l4d_common/alert/becomealert/shout06.wav",
	"vj_piv/l4d_common/alert/becomealert/shout07.wav",
	"vj_piv/l4d_common/alert/becomealert/shout08.wav",
	"vj_piv/l4d_common/alert/becomealert/shout09.wav"
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
	"vj_piv/l4d_common/action/ignite/ignite01.wav",
	"vj_piv/l4d_common/action/ignite/ignite07.wav",
	"vj_piv/l4d_common/action/ignite/ignite08.wav",
	"vj_piv/l4d_common/action/ignite/ignite09.wav",
	"vj_piv/l4d_common/action/ignite/male/ignite10.wav",
	"vj_piv/l4d_common/action/ignite/male/ignite11.wav",
	"vj_piv/l4d_common/action/ignite/male/ignite12.wav",
	"vj_piv/l4d_common/action/ignite/male/ignite13.wav",
	"vj_piv/l4d_common/action/ignite/male/ignite14.wav"
}

end
	
	if math.random(1,5) == 5 then
		self:SetBodygroup(4,math.random(0,0))
		self.ImmuneDamagesTable = {DMG_RADIATION,DMG_NERVEGAS}
	self.NextSoundTime_Idle = VJ_Set(16, 23)
	self.SoundTbl_CombatIdle = {"vj_piv/mil_zomb/gasmask/combatidle_1.wav","vj_piv/mil_zomb/gasmask/combatidle_2.wav","vj_piv/mil_zomb/gasmask/combatidle_3.wav","vj_piv/mil_zomb/gasmask/combatidle_4.wav"}
	self.SoundTbl_Idle = {"vj_piv/mil_zomb/gasmask/idle_1.wav","vj_piv/mil_zomb/gasmask/idle_2.wav","vj_piv/mil_zomb/gasmask/idle_3.wav"}
	self.SoundTbl_Alert = {"vj_piv/mil_zomb/gasmask/alert_1.wav","vj_piv/mil_zomb/gasmask/alert_2.wav","vj_piv/mil_zomb/gasmask/alert_3.wav","vj_piv/mil_zomb/gasmask/alert_4.wav"}
	self.SoundTbl_Pain = {"vj_piv/mil_zomb/gasmask/pain_1.wav","vj_piv/mil_zomb/gasmask/pain_2.wav","vj_piv/mil_zomb/gasmask/pain_3.wav","vj_piv/mil_zomb/gasmask/pain_4.wav","vj_piv/mil_zomb/gasmask/pain_5.wav","vj_piv/mil_zomb/gasmask/pain_6.wav"}
	self.SoundTbl_Death = {"vj_piv/mil_zomb/gasmask/infected_death_1.wav","vj_piv/mil_zomb/gasmask/infected_death_2.wav","vj_piv/mil_zomb/gasmask/infected_death_3.wav"}
	self.SoundTbl_BeforeMeleeAttack = {"vj_piv/mil_zomb/gasmask/attack_1.wav","vj_piv/mil_zomb/gasmask/attack_2.wav","vj_piv/mil_zomb/gasmask/attack_3.wav","vj_piv/mil_zomb/gasmask/attack_4.wav"}
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
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/