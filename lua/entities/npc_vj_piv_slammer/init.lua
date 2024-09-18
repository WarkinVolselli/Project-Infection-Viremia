AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/slammer/slammer.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.PIV_IsHugeZombie = true
ENT.StartHealth = 500
ENT.MeleeAttackDamageAngleRadius = 50

ENT.PIV_IsSpecial = true

ENT.PIV_HasSubclasses = false
ENT.PIV_CanBeCrippled = false
ENT.PIV_AllowedToClimb = false
ENT.PIV_HasWeapons = false
ENT.PIV_CanBeThrower = false
ENT.PIV_AllowedToRest = false

ENT.MeleeAttackDistance = 70
ENT.MeleeAttackDamageDistance = 120

ENT.SoundTbl_Idle = {"vj_piv/dl_inf_big/infected_big_idle_calm_00_0.wav"}
ENT.SoundTbl_CombatIdle = {"vj_piv/dl_inf_big/infected_big_idle_alarmed_00_0.wav","vj_piv/dl_inf_big/infected_big_idle_alarmed_01_0.wav"}
ENT.SoundTbl_Alert = {"vj_piv/dl_inf_big/infected_big_get_up_00_0.wav","vj_piv/dl_inf_big/infected_big_get_up_01_0.wav","vj_piv/dl_inf_big/infected_big_taunt_00_0.wav","vj_piv/dl_inf_big/infected_big_taunt_01_0.wav","vj_piv/dl_inf_big/infected_big_taunt_02_0.wav","vj_piv/dl_inf_big/infected_big_taunt_03_0.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/dl_inf_big/infected_big_attack_00_0.wav","vj_piv/dl_inf_big/infected_big_attack_01_0.wav","vj_piv/dl_inf_big/infected_big_attack_02_0.wav","vj_piv/dl_inf_big/infected_big_attack_03_0.wav","vj_piv/dl_inf_big/infected_big_attack_04_0.wav"}
ENT.SoundTbl_Pain = {"vj_piv/dl_inf_big/infected_big_get_up_01_0.wav","vj_piv/dl_inf_big/infected_big_get_up_01_0.wav","vj_piv/dl_inf_big/infected_big_pain_02_0.wav","vj_piv/dl_inf_big/infected_big_pain_03_0.wav","vj_piv/dl_inf_big/infected_big_pain_04_0.wav","vj_piv/dl_inf_big/infected_big_pain_05_0.wav","vj_piv/dl_inf_big/infected_big_pain_05_0.wav","vj_piv/dl_inf_big/infected_big_pain_critical_01_0.wav"}
ENT.SoundTbl_Death = {"vj_piv/dl_inf_big/infected_big_attack_04_0.wav","vj_piv/dl_inf_big/infected_big_death_01_0.wav"}
ENT.SoundTbl_Breath = {"physics/concrete/concrete_block_scrape_rough_loop1.wav"}

ENT.NextSoundTime_Idle = VJ.SET(10, 13)

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
	self:SetModelScale(1.3)
	self:SetBodygroup(2,1)
	self:SetSkin(math.random(0,2))
	self:SetBodygroup(3,math.random(0,3))
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
	self:SetBodygroup(2,0)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/