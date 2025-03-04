include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.Model = {"models/vj_piv/specials/slammer/slammer.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
	self.PIV_IsHugeZombie = true
	self.StartHealth = 500
	self.MeleeAttackDamageAngleRadius = 200 -- had to increase this so he can actually hit shit; old value was 50

	self.PIV_IsSpecial = true

	self.PIV_HasSubclasses = false
	self.PIV_CanBeCrippled = false
	self.PIV_AllowedToClimb = false
	self.PIV_HasWeapons = false
	self.PIV_CanBeThrower = false
	self.PIV_AllowedToRest = false

	self.MeleeAttackDistance = 70
	self.MeleeAttackDamageDistance = 120
	self.MeleeAttackAnimationAllowOtherTasks = false
	
	self.MeleeAttackDamage = math.random(55,65)
	self.MeleeAttackDamageType = DMG_CRUSH
	self.HasMeleeAttackKnockBack = true
	self.SoundTbl_MeleeAttack = {
		"vj_piv/BodyHit-3.wav",
		"vj_piv/BodyHit-4.wav",
		"vj_piv/BodyHit-5.wav",
		"vj_piv/BodyHit-6.wav"
	}
	self.SoundTbl_MeleeAttackMiss = {""}
	self.AnimTbl_MeleeAttack = {"vjseq_attack1"}
	self.CanFlinch = 0
	self.MeleeAttackAnimationFaceEnemy = false
end
--------------------
function ENT:Zombie_GiveVoice()
	self.SoundTbl_Idle = {"vj_piv/dl_inf_big/infected_big_idle_calm_00_0.wav"}
	self.SoundTbl_CombatIdle = {
		"vj_piv/dl_inf_big/infected_big_idle_alarmed_00_0.wav",
		"vj_piv/dl_inf_big/infected_big_idle_alarmed_01_0.wav"
	}
	self.SoundTbl_Alert = {
		"vj_piv/dl_inf_big/infected_big_get_up_00_0.wav",
		"vj_piv/dl_inf_big/infected_big_get_up_01_0.wav",
		"vj_piv/dl_inf_big/infected_big_taunt_00_0.wav",
		"vj_piv/dl_inf_big/infected_big_taunt_01_0.wav",
		"vj_piv/dl_inf_big/infected_big_taunt_02_0.wav",
		"vj_piv/dl_inf_big/infected_big_taunt_03_0.wav"
	}
	self.SoundTbl_BeforeMeleeAttack = {
		"vj_piv/dl_inf_big/infected_big_attack_00_0.wav",
		"vj_piv/dl_inf_big/infected_big_attack_01_0.wav",
		"vj_piv/dl_inf_big/infected_big_attack_02_0.wav",
		"vj_piv/dl_inf_big/infected_big_attack_03_0.wav",
		"vj_piv/dl_inf_big/infected_big_attack_04_0.wav"
	}
	self.SoundTbl_Pain = {
		"vj_piv/dl_inf_big/infected_big_get_up_01_0.wav",
		"vj_piv/dl_inf_big/infected_big_get_up_01_0.wav",
		"vj_piv/dl_inf_big/infected_big_pain_02_0.wav",
		"vj_piv/dl_inf_big/infected_big_pain_03_0.wav",
		"vj_piv/dl_inf_big/infected_big_pain_04_0.wav",
		"vj_piv/dl_inf_big/infected_big_pain_05_0.wav",
		"vj_piv/dl_inf_big/infected_big_pain_05_0.wav",
		"vj_piv/dl_inf_big/infected_big_pain_critical_01_0.wav"
	}
	self.SoundTbl_Death = {
		"vj_piv/dl_inf_big/infected_big_attack_04_0.wav",
		"vj_piv/dl_inf_big/infected_big_death_01_0.wav"
	}
	self.SoundTbl_Breath = {"physics/concrete/concrete_block_scrape_rough_loop1.wav"}

	self.NextSoundTime_Idle = VJ.SET(10, 13)

	self.HasBreathSound = false
	self.BreathSoundLevel = 65

	self.IdleSoundLevel = 65
	self.CombatIdleSoundLevel = 70
	self.AlertSoundLevel = 75
	self.BeforeMeleeAttackSoundLevel = 70
	self.PainSoundLevel = 75
	self.DeathSoundLevel = 75
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetModelScale(1.3)
	self:SetBodygroup(2,1)
	self:SetSkin(math.random(0,2))
	self:SetBodygroup(3,math.random(0,3))
end
--------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD then return end
	if (dmginfo:IsBulletDamage()) then
		dmginfo:ScaleDamage(0.65)
	end
end
--------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
	if self:IsMoving() && self:IsOnGround() then
		self.HasBreathSound = true
	else
		self.HasBreathSound = false
		self.NextBreathSoundT = 0
		if self.CurrentBreathSound then self.CurrentBreathSound:Stop() end	
	end
end
--------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)
end
--------------------
function ENT:Zombie_CustomOnDeath_Initial(dmginfo, hitgroup)
	self:SetBodygroup(2,0)
end
--------------------