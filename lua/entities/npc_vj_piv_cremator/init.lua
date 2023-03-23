AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/hl2/charple.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want

ENT.StartHealth = 400

ENT.MeleeAttackDamage = 0

ENT.MeleeAttackDamageType = DMG_BURN
ENT.MeleeAttackDistance = 150 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 200 -- How far does the damage go?
ENT.MeleeAttackDamageAngleRadius = 180 -- What is the damage angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC

ENT.AnimTbl_Walk = {ACT_WALK_AIM}
ENT.AnimTbl_Run = {ACT_WALK_AIM}

ENT.SoundTbl_Breath = {"ambient/fire/firebig.wav"}
ENT.BreathSoundLevel = 70
ENT.SoundTbl_Alert = {"vj_projectinfection/npc/crimhead/crimhead_alert1.wav","vj_projectinfection/npc/crimhead/crimhead_alert2.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_projectinfection/npc/crimhead/crimhead_attack1.wav","vj_projectinfection/npc/crimhead/crimhead_attack2.wav"}
ENT.SoundTbl_Death = {"vj_projectinfection/npc/crimhead/crimhead_die.wav"}
ENT.SoundTbl_BeforeRangeAttack = {"vj_projectinfection/npc/crimhead/crimhead_frenzy.wav"}
ENT.SoundTbl_Pain = {"vj_projectinfection/npc/crimhead/crimhead_pain.wav"}
ENT.GeneralSoundPitch1 = 90
ENT.GeneralSoundPitch2 = 80

ENT.Immune_Fire = true 
ENT.MeleeAttackSetEnemyOnFire = true 
ENT.MeleeAttackSetEnemyOnFireTime = math.random(3,6)
ENT.SetCorpseOnFire = true

ENT.PIV_LegHP = 10000

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self:SetSkin(math.random(0,5))

if self:IsDirt(self:GetPos()) then -- digout breaks particles, this respawns them with a slight delay if over dirt
   timer.Simple(0.2,function() if IsValid(self) then
    ParticleEffectAttach("env_fire_tiny_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
    ParticleEffectAttach("env_fire_small",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
    end
end)
end

    self.PIV_LegHP = self.StartHealth * 2
	
ParticleEffectAttach("env_fire_tiny_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
ParticleEffectAttach("env_fire_small",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))

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
	
	VJ_EmitSound(self,"ambient/fire/ignite.wav",100,math.random(80,100))
	
	util.VJ_SphereDamage(self, self, self:GetPos(), 200, 10, self.MeleeAttackDamageType, true, true, {DisableVisibilityCheck=true, Force=80})
	util.ScreenShake(self:GetPos(),50,600,2,1000)
    util.ScreenShake(self:GetPos(),50,600,2,1000)
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttac_AfterChecks(hitEnt, isProp)
    hitEnt:Ignite(math.random(3,6)) 
    return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnKilled(dmginfo, hitgroup)
    ParticleEffectAttach("striderbuster_break_explode",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
    ParticleEffectAttach("striderbuster_break_explode",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
	effects.BeamRingPoint(self:GetPos(), 0.3, 2, 400, 16, 0, Color(255, 255, 255), {material="sprites/flame01", framerate=20})
	effects.BeamRingPoint(self:GetPos(), 0.3, 2, 200, 16, 0, Color(255, 255, 255), {material="sprites/flame01", framerate=20})
	
	VJ_EmitSound(self,"ambient/fire/ignite.wav",100,math.random(80,100))
	
	util.VJ_SphereDamage(self, self, self:GetPos(), 200, 10, self.MeleeAttackDamageType, true, true, {DisableVisibilityCheck=true, Force=80})
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
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/