AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/hl2/charple.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want

ENT.PIV_IsSpecial = true

ENT.PIV_HasSubclasses = false
ENT.PIV_CanBeCrippled = false
ENT.PIV_HasWeapons = false
ENT.PIV_CanBeThrower = false

ENT.StartHealth = 400

ENT.DeathCorpseSkin = 7

ENT.MeleeAttackDamage = 0

ENT.MeleeAttackDamageType = DMG_BURN
ENT.MeleeAttackDistance = 150 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 200 -- How far does the damage go?

ENT.SoundTbl_Breath = {"ambient/fire/firebig.wav"}
ENT.SoundTbl_Idle = {"vj_piv/cremator/volatile_attack_fake_00_0.wav","vj_piv/cremator/volatile_attack_fake_01_0.wav","vj_piv/cremator/volatile_attack_fake_02_0.wav","vj_piv/cremator/volatile_attack_fake_03_0.wav","vj_piv/cremator/volatile00_idle_calm_00_0.wav","vj_piv/cremator/volatile00_idle_calm_01_0.wav"}
ENT.SoundTbl_CombatIdle = {"vj_piv/cremator/volatile00_move_upset_00_0.wav","vj_piv/cremator/volatile00_move_upset_01_0.wav","vj_piv/cremator/volatile00_move_upset_02_0.wav","vj_piv/cremator/volatile00_move_upset_03_0.wav","vj_piv/cremator/volatile_buggy_grab_taunt_00_0.wav","vj_piv/cremator/volatile_buggy_grab_taunt_01_0.wav","vj_piv/cremator/volatile_buggy_grab_taunt_02_0.wav","vj_piv/cremator/volatile00_idle_upset_00_0.wav","vj_piv/cremator/volatile00_idle_upset_01_0.wav"}
ENT.BreathSoundLevel = 60
ENT.SoundTbl_Alert = {"vj_piv/cremator/volatile_taunt_00_0.wav","vj_piv/cremator/volatile_taunt_01_0.wav","vj_piv/cremator/volatile_taunt_02_0.wav","vj_piv/cremator/volatile_taunt_03_0.wav","vj_piv/cremator/volatile_alarming_00_0.wav","vj_piv/cremator/volatile_alarming_01_0.wav","vj_piv/cremator/volatile_alarming_02_0.wav","vj_piv/cremator/volatile00_enemy_spotted_00_0.wav","vj_piv/cremator/volatile00_enemy_spotted_01_0.wav","vj_piv/cremator/volatile00_enemy_spotted_02_0.wav","vj_piv/cremator/volatile00_enemy_spotted_03_0.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/cremator/volatile00_jump_attack_00_0.wav","vj_piv/cremator/volatile00_jump_attack_01_0.wav","vj_piv/cremator/volatile00_jump_attack_02_0.wav","vj_piv/cremator/volatile00_jump_attack_03_0.wav","vj_piv/cremator/volatile00_jump_attack_04_0.wav","vj_piv/cremator/volatile00_attack_00_0.wav","vj_piv/cremator/volatile00_attack_01_0.wav","vj_piv/cremator/volatile00_attack_02_0.wav","vj_piv/cremator/volatile00_attack_03_0.wav","vj_piv/cremator/volatile00_attack_04_0.wav","vj_piv/cremator/volatile00_attack_05_0.wav"}
ENT.SoundTbl_Death = {"vj_piv/cremator/volatile00_death_00_0.wav","vj_piv/cremator/volatile00_death_01_0.wav","vj_piv/cremator/volatile00_death_02_0.wav","vj_piv/cremator/volatile00_death_03_0.wav"}
ENT.SoundTbl_Pain = {"vj_piv/cremator/volatile_buggy_grab_attack_00_0.wav","vj_piv/cremator/volatile_buggy_grab_attack_01_0.wav","vj_piv/cremator/volatile_buggy_grab_attack_02_0.wav","vj_piv/cremator/volatile00_pain_00_0.wav","vj_piv/cremator/volatile00_pain_01_0.wav","vj_piv/cremator/volatile00_pain_02_0.wav","vj_piv/cremator/volatile00_pain_03_0.wav","vj_piv/cremator/volatile00_pain_03_0.wav","vj_piv/cremator/volatile00_pain_light_01_0.wav","vj_piv/cremator/volatile00_pain_light_02_0.wav","vj_piv/cremator/volatile00_pain_light_03_0.wav"}
ENT.GeneralSoundPitch1 = 90
ENT.GeneralSoundPitch2 = 80

ENT.Immune_Fire = true 
ENT.MeleeAttackSetEnemyOnFire = true 
ENT.MeleeAttackSetEnemyOnFireTime = math.random(3,6)

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self:SetSkin(8)
	self:SetModelScale(1.1)
self.HasBreathSound = true
if self:IsDirt(self:GetPos()) then -- digout breaks particles, this respawns them with a slight delay if over dirt
   timer.Simple(0.2,function() if IsValid(self) then
    ParticleEffectAttach("fire_medium_03",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
    end
end)
end

    self.PIV_LegHP = self.StartHealth * 2
	
ParticleEffectAttach("fire_medium_03",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))

self.Light1 = ents.Create("light_dynamic")
	self.Light1:SetKeyValue("brightness", "0.04")
	self.Light1:SetKeyValue("distance", "250")
	self.Light1:SetLocalPos(self:GetPos())
	self.Light1:SetLocalAngles(self:GetAngles())
	self.Light1:Fire("Color", "255 100 0 0")
	self.Light1:SetParent(self)
	self.Light1:Spawn()
	self.Light1:Activate() 
	self.Light1:Fire("SetParentAttachment","chest")
	self.Light1:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(self.Light1)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeChecks()
    ParticleEffectAttach("striderbuster_break_explode",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
    ParticleEffectAttach("striderbuster_break_explode",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
	effects.BeamRingPoint(self:GetPos(), 0.3, 2, 400, 16, 0, Color(255, 255, 255), {material="sprites/flame01", framerate=20})
	effects.BeamRingPoint(self:GetPos(), 0.3, 2, 200, 16, 0, Color(255, 255, 255), {material="sprites/flame01", framerate=20})
	
	VJ.EmitSound(self,"ambient/fire/ignite.wav",100,math.random(80,100))
	
	VJ.ApplyRadiusDamage(self, self, self:GetPos(), 200, 10, self.MeleeAttackDamageType, true, true, {DisableVisibilityCheck=true, Force=80})
	util.ScreenShake(self:GetPos(),50,600,2,1000)
    util.ScreenShake(self:GetPos(),50,600,2,1000)
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt, isProp)
    hitEnt:Ignite(math.random(3,6)) 
    return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnKilled(dmginfo, hitgroup)
    ParticleEffectAttach("striderbuster_break_explode",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
    ParticleEffectAttach("striderbuster_break_explode",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
	effects.BeamRingPoint(self:GetPos(), 0.3, 2, 400, 16, 0, Color(255, 255, 255), {material="sprites/flame01", framerate=20})
	effects.BeamRingPoint(self:GetPos(), 0.3, 2, 200, 16, 0, Color(255, 255, 255), {material="sprites/flame01", framerate=20})
	
	VJ.EmitSound(self,"ambient/fire/ignite.wav",100,math.random(80,100))
	
	VJ.ApplyRadiusDamage(self, self, self:GetPos(), 200, 10, self.MeleeAttackDamageType, true, true, {DisableVisibilityCheck=true, Force=80})
	util.ScreenShake(self:GetPos(),50,600,2,1000)
    util.ScreenShake(self:GetPos(),50,600,2,1000)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	if !self:IsMoving()	then
		self.AnimTbl_MeleeAttack = {"nz_sonic_attack_1"}
		self.TimeUntilMeleeAttackDamage = 0.7
		self.MeleeAttackDamageType = DMG_BURN
		self.MeleeAttackDistance = 150 -- How close does it have to be until it attacks?
		self.MeleeAttackDamageDistance = 200 -- How far does the damage go?
        self.MeleeAttackDamageAngleRadius = 180 -- What is the damage angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
	else
		self.AnimTbl_MeleeAttack = {"nz_sonic_attack_2"}
		self.TimeUntilMeleeAttackDamage = 1.1
		self.MeleeAttackDamageType = DMG_BURN
		self.MeleeAttackDistance = 150 -- How close does it have to be until it attacks?
		self.MeleeAttackDamageDistance = 200 -- How far does the damage go?
        self.MeleeAttackDamageAngleRadius = 180 -- What is the damage angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
	end

end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/