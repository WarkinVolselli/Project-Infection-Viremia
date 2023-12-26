AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/slammer/slammer.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.VJ_IsHugeMonster = true
ENT.StartHealth = 500
ENT.PIV_CanClimb = false
ENT.MeleeAttackDamageAngleRadius = 50

ENT.AnimTbl_Walk = {ACT_WALK}
ENT.AnimTbl_Run = {ACT_WALK_ANGRY}

ENT.MeleeAttackDistance = 70
ENT.MeleeAttackDamageDistance = 120

ENT.SoundTbl_Idle = {"vj_piv/dl_inf_big/infected_big_idle_calm_00_0.wav"}
ENT.SoundTbl_CombatIdle = {"vj_piv/dl_inf_big/infected_big_idle_alarmed_00_0.wav","vj_piv/dl_inf_big/infected_big_idle_alarmed_01_0.wav"}
ENT.SoundTbl_Alert = {"vj_piv/dl_inf_big/infected_big_get_up_00_0.wav","vj_piv/dl_inf_big/infected_big_get_up_01_0.wav","vj_piv/dl_inf_big/infected_big_taunt_00_0.wav","vj_piv/dl_inf_big/infected_big_taunt_01_0.wav","vj_piv/dl_inf_big/infected_big_taunt_02_0.wav","vj_piv/dl_inf_big/infected_big_taunt_03_0.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/dl_inf_big/infected_big_attack_00_0.wav","vj_piv/dl_inf_big/infected_big_attack_01_0.wav","vj_piv/dl_inf_big/infected_big_attack_02_0.wav","vj_piv/dl_inf_big/infected_big_attack_03_0.wav","vj_piv/dl_inf_big/infected_big_attack_04_0.wav"}
ENT.SoundTbl_Pain = {"vj_piv/dl_inf_big/infected_big_get_up_01_0.wav","vj_piv/dl_inf_big/infected_big_get_up_01_0.wav","vj_piv/dl_inf_big/infected_big_pain_02_0.wav","vj_piv/dl_inf_big/infected_big_pain_03_0.wav","vj_piv/dl_inf_big/infected_big_pain_04_0.wav","vj_piv/dl_inf_big/infected_big_pain_05_0.wav","vj_piv/dl_inf_big/infected_big_pain_05_0.wav","vj_piv/dl_inf_big/infected_big_pain_critical_01_0.wav"}
ENT.SoundTbl_Death = {"vj_piv/dl_inf_big/infected_big_attack_04_0.wav","vj_piv/dl_inf_big/infected_big_death_01_0.wav"}
ENT.SoundTbl_Breath = {"physics/concrete/concrete_block_scrape_rough_loop1.wav"}

ENT.NextSoundTime_Idle = VJ_Set(10, 13)

ENT.HasBreathSound = false
ENT.BreathSoundLevel = 65

ENT.IdleSoundLevel = 65
ENT.CombatIdleSoundLevel = 70
ENT.AlertSoundLevel = 75
ENT.BeforeMeleeAttackSoundLevel = 70
ENT.PainSoundLevel = 75
ENT.DeathSoundLevel = 75

ENT.CanFlinch = 0
ENT.MeleeAttackAnimationFaceEnemy = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self.PIV_LegHP = self.PIV_LegHP *2
	self:SetModelScale(1.3)
	if self.PIV_Blazing == true then
		self:SetBodygroup(1,1)
		self:SetBodygroup(2,math.random(0,1))
		self:SetBodygroup(3,math.random(0,1))
		if math.random(1,3) == 1 then
			self:SetBodygroup(2,0)
			self:SetBodygroup(3,1)
			self:SetBodygroup(4,1)
			self.NextSoundTime_Idle = VJ_Set(16, 23)
			self.SoundTbl_CombatIdle = {"vj_piv/mil_zomb/gasmask/combatidle_1.wav","vj_piv/mil_zomb/gasmask/combatidle_2.wav","vj_piv/mil_zomb/gasmask/combatidle_3.wav","vj_piv/mil_zomb/gasmask/combatidle_4.wav"}
			self.SoundTbl_Idle = {"vj_piv/mil_zomb/gasmask/idle_1.wav","vj_piv/mil_zomb/gasmask/idle_2.wav","vj_piv/mil_zomb/gasmask/idle_3.wav"}
			self.SoundTbl_Alert = {"vj_piv/mil_zomb/gasmask/alert_1.wav","vj_piv/mil_zomb/gasmask/alert_2.wav","vj_piv/mil_zomb/gasmask/alert_3.wav","vj_piv/mil_zomb/gasmask/alert_4.wav"}
			self.SoundTbl_Pain = {"vj_piv/mil_zomb/gasmask/pain_1.wav","vj_piv/mil_zomb/gasmask/pain_2.wav","vj_piv/mil_zomb/gasmask/pain_3.wav","vj_piv/mil_zomb/gasmask/pain_4.wav","vj_piv/mil_zomb/gasmask/pain_5.wav","vj_piv/mil_zomb/gasmask/pain_6.wav"}
			self.SoundTbl_Death = {"vj_piv/mil_zomb/gasmask/infected_death_1.wav","vj_piv/mil_zomb/gasmask/infected_death_2.wav","vj_piv/mil_zomb/gasmask/infected_death_3.wav"}
			self.SoundTbl_BeforeMeleeAttack = {"vj_piv/mil_zomb/gasmask/attack_1.wav","vj_piv/mil_zomb/gasmask/attack_2.wav","vj_piv/mil_zomb/gasmask/attack_3.wav","vj_piv/mil_zomb/gasmask/attack_4.wav"}
			self.GeneralSoundPitch1 = 80
			self.GeneralSoundPitch2 = 70
		end
		ParticleEffectAttach("fire_medium_03",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))

		self.Light1 = ents.Create("light_dynamic")
		self.Light1:SetKeyValue("brightness", "0.04")
		self.Light1:SetKeyValue("distance", "350")
		self.Light1:SetLocalPos(self:GetPos())
		self.Light1:SetLocalAngles(self:GetAngles())
		self.Light1:Fire("Color", "255 100 0 0")
		self.Light1:SetParent(self)
		self.Light1:Spawn()
		self.Light1:Activate() 
		self.Light1:Fire("SetParentAttachment","chest")
		self.Light1:Fire("TurnOn", "", 0)
		self:DeleteOnRemove(self.Light1)

	elseif self.PIV_Toxic == true then
		self:SetBodygroup(1,1)
		if GetConVar("vj_piv_militaryskin"):GetInt() == 0 then
		self:SetSkin(0)
		elseif GetConVar("vj_piv_militaryskin"):GetInt() == 1 then
		self:SetSkin(1)
		elseif GetConVar("vj_piv_militaryskin"):GetInt() == 2 then
		self:SetSkin(2)
		elseif GetConVar("vj_piv_militaryskin"):GetInt() == 3 then
		self:SetSkin(3)
		elseif GetConVar("vj_piv_militaryskin"):GetInt() == 4 then
		self:SetSkin(math.random(0,3))
		end
	else
		self:SetBodygroup(2,1)
		self:SetSkin(math.random(0,2))
		self:SetBodygroup(3,math.random(0,3))
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnPreInitialize()
	if GetConVar("vj_piv_advanced_mutations"):GetInt() == 1 then
		if math.random(1,GetConVar("vj_piv_toxic_chance"):GetInt()) == 1 then
			self.PIV_Toxic = true
			self.Immune_AcidPoisonRadiation = true
			self.Model = {"models/vj_piv/specials/slammer/slammer_toxic.mdl"}

			self.SoundTbl_Idle = {"vj_piv/mil_zomb/gasmask/runner/idle1.wav","vj_piv/mil_zomb/gasmask/runner/idle2.wav","vj_piv/mil_zomb/gasmask/runner/idle3.wav","vj_piv/mil_zomb/gasmask/runner/idle4.wav","vj_piv/mil_zomb/gasmask/runner/idle5.wav","vj_piv/mil_zomb/gasmask/runner/idle6.wav","vj_piv/mil_zomb/gasmask/runner/idle7.wav","vj_piv/mil_zomb/gasmask/runner/idle8.wav","vj_piv/mil_zomb/gasmask/runner/idle9.wav"}
			self.SoundTbl_Alert = {"vj_piv/mil_zomb/gasmask/runner/alert1.wav"}
			self.SoundTbl_CombatIdle = {"vj_piv/mil_zomb/gasmask/runner/combatidle1.wav","vj_piv/mil_zomb/gasmask/runner/combatidle2.wav","vj_piv/mil_zomb/gasmask/runner/combatidle3.wav","vj_piv/mil_zomb/gasmask/runner/combatidle4.wav","vj_piv/mil_zomb/gasmask/runner/combatidle5.wav","vj_piv/mil_zomb/gasmask/runner/combatidle6.wav","vj_piv/mil_zomb/gasmask/runner/combatidle7.wav","vj_piv/mil_zomb/gasmask/runner/combatidle8.wav","vj_piv/mil_zomb/gasmask/runner/combatidle9.wav"}
			self.SoundTbl_Pain = {"vj_piv/mil_zomb/gasmask/runner/pain1.wav","vj_piv/mil_zomb/gasmask/runner/pain2.wav","vj_piv/mil_zomb/gasmask/runner/pain3.wav","vj_piv/mil_zomb/gasmask/runner/pain4.wav","vj_piv/mil_zomb/gasmask/runner/pain5.wav","vj_piv/mil_zomb/gasmask/runner/pain6.wav","vj_piv/mil_zomb/gasmask/runner/pain7.wav","vj_piv/mil_zomb/gasmask/runner/pain8.wav"}
			self.SoundTbl_Death = {"vj_piv/mil_zomb/gasmask/runner/pain1.wav","vj_piv/mil_zomb/gasmask/runner/pain2.wav","vj_piv/mil_zomb/gasmask/runner/pain3.wav","vj_piv/mil_zomb/gasmask/runner/pain4.wav","vj_piv/mil_zomb/gasmask/runner/pain5.wav","vj_piv/mil_zomb/gasmask/runner/pain6.wav","vj_piv/mil_zomb/gasmask/runner/pain7.wav","vj_piv/mil_zomb/gasmask/runner/pain8.wav"}
			self.SoundTbl_BeforeMeleeAttack = {"vj_piv/mil_zomb/gasmask/runner/idle1.wav","vj_piv/mil_zomb/gasmask/runner/idle2.wav","vj_piv/mil_zomb/gasmask/runner/idle3.wav","vj_piv/mil_zomb/gasmask/runner/idle4.wav","vj_piv/mil_zomb/gasmask/runner/idle5.wav","vj_piv/mil_zomb/gasmask/runner/idle6.wav","vj_piv/mil_zomb/gasmask/runner/idle7.wav","vj_piv/mil_zomb/gasmask/runner/idle8.wav","vj_piv/mil_zomb/gasmask/runner/idle9.wav"}
			self.GeneralSoundPitch1 = 90
			self.GeneralSoundPitch2 = 80
		elseif math.random(1,GetConVar("vj_piv_blazing_chance"):GetInt()) == 1 then
			self.PIV_Blazing = true
			self.Immune_Fire = true
			self.Model = {"models/vj_piv/specials/slammer/slammer_blazing.mdl"}
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD then return end
	if (dmginfo:IsBulletDamage()) then
		dmginfo:ScaleDamage(0.65)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
	if self:IsMoving() && self:IsOnGround() then
		self.HasBreathSound = true
	else
		self.HasBreathSound = false
		self.NextBreathSoundT = 0
		if self.CurrentBreathSound then self.CurrentBreathSound:Stop() end	
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink()
	if self.PIV_Toxic == true then
		ParticleEffectAttach("antlion_spit_03",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)
	self.MeleeAttackAnimationAllowOtherTasks = false
	
	self.MeleeAttackDamage = math.random(55,65)
	self.MeleeAttackDamageType = DMG_CRUSH
	self.HasMeleeAttackKnockBack = true
	self.SoundTbl_MeleeAttack = {"vj_piv/BodyHit-3.wav","vj_piv/BodyHit-4.wav","vj_piv/BodyHit-5.wav","vj_piv/BodyHit-6.wav"}
	self.SoundTbl_MeleeAttackMiss = {""}
	self.AnimTbl_MeleeAttack = {
		"vjseq_attack1"
	}
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo, hitgroup)
	if self.PIV_Blazing == true then
	self:SetBodygroup(0,0)
	elseif self.PIV_Toxic == true then
	self:SetBodygroup(1,0)
	else
	self:SetBodygroup(2,0)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/