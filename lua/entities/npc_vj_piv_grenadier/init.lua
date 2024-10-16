AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/military/grenadier.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 200
ENT.HullType = HULL_HUMAN

ENT.PIV_IsSpecial = true
ENT.PIV_IsMilitary = true

ENT.PIV_CanBeCrawler = false
ENT.PIV_HasWeapons = false
ENT.PIV_CanBeThrower = false

ENT.PIV_HasArmor = true

ENT.HasRangeAttack = true
ENT.RangeDistance = 1250
ENT.RangeToMeleeDistance = 300
ENT.NextRangeAttackTime = 6
ENT.NextRangeAttackTime_DoRand = 16 

ENT.RangeAttackEntityToSpawn = "obj_vj_grenade"

ENT.HasBreathSound = true

ENT.GeneralSoundPitch1 = 90
ENT.GeneralSoundpitch2 = 80

ENT.PIV_AllowedToVomit = false
ENT.PIV_CanBeBiter = false

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Breath = {"ambient/levels/prison/radio_random1.wav","ambient/levels/prison/radio_random2.wav","ambient/levels/prison/radio_random3.wav","ambient/levels/prison/radio_random4.wav","ambient/levels/prison/radio_random5.wav","ambient/levels/prison/radio_random6.wav","ambient/levels/prison/radio_random7.wav","ambient/levels/prison/radio_random8.wav","ambient/levels/prison/radio_random9.wav","ambient/levels/prison/radio_random10.wav","ambient/levels/prison/radio_random11.wav","ambient/levels/prison/radio_random12.wav","ambient/levels/prison/radio_random13.wav","ambient/levels/prison/radio_random14.wav"}
ENT.SoundTbl_Idle = {
	"vj_piv/mil_zomb/radio/idle_1.wav",
	"vj_piv/mil_zomb/radio/idle_2.wav",
	"vj_piv/mil_zomb/radio/idle_3.wav",
	"vj_piv/mil_zomb/radio/idle_4.wav"
}
ENT.SoundTbl_Alert = {
	"vj_piv/mil_zomb/radio/alert_1.wav",
	"vj_piv/mil_zomb/radio/alert_2.wav",
	"vj_piv/mil_zomb/radio/alert_3.wav",
	"vj_piv/mil_zomb/radio/alert_4.wav",
	"vj_piv/mil_zomb/radio/alert_5.wav",
	"vj_piv/mil_zomb/radio/alert_6.wav",
	"vj_piv/mil_zomb/radio/alert_7.wav"
}
ENT.SoundTbl_CombatIdle = {
	"vj_piv/mil_zomb/radio/idle_1.wav",
	"vj_piv/mil_zomb/radio/idle_2.wav",
	"vj_piv/mil_zomb/radio/idle_3.wav",
	"vj_piv/mil_zomb/radio/idle_4.wav",
	"vj_piv/mil_zomb/radio/idle_1.wav",
	"vj_piv/mil_zomb/radio/idle_2.wav",
	"vj_piv/mil_zomb/radio/idle_3.wav",
	"vj_piv/mil_zomb/radio/idle_4.wav",
	"vj_piv/mil_zomb/radio/alert_1.wav",
	"vj_piv/mil_zomb/radio/alert_2.wav",
	"vj_piv/mil_zomb/radio/alert_3.wav",
	"vj_piv/mil_zomb/radio/alert_4.wav",
	"vj_piv/mil_zomb/radio/alert_5.wav",
	"vj_piv/mil_zomb/radio/alert_6.wav",
	"vj_piv/mil_zomb/radio/alert_7.wav"
}
ENT.SoundTbl_BeforeMeleeAttack = {
	"vj_piv/mil_zomb/radio/alert_1.wav",
	"vj_piv/mil_zomb/radio/alert_2.wav",
	"vj_piv/mil_zomb/radio/alert_3.wav",
	"vj_piv/mil_zomb/radio/alert_4.wav",
	"vj_piv/mil_zomb/radio/alert_5.wav",
	"vj_piv/mil_zomb/radio/alert_6.wav",
	"vj_piv/mil_zomb/radio/alert_7.wav"
}
ENT.SoundTbl_Pain = {
	"vj_piv/mil_zomb/radio/pain_1.wav",
	"vj_piv/mil_zomb/radio/pain_2.wav",
	"vj_piv/mil_zomb/radio/pain_3.wav",
	"vj_piv/mil_zomb/radio/pain_4.wav"
}
ENT.SoundTbl_Death = {
	"vj_piv/mil_zomb/radio/death_1.wav",
	"vj_piv/mil_zomb/radio/death_2.wav"
}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self.NextSoundTime_Breath = VJ.SET(7,20)
	self:SetBodygroup(1,math.random(0,1))
	self:SetBodygroup(3,math.random(0,1))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Cripple()
	self.AnimTbl_IdleStand = {ACT_IDLE_AGITATED}
	self.AnimTbl_Walk = {ACT_WALK_AGITATED}
	self.AnimTbl_Run = {ACT_WALK_AGITATED}
	self.AnimTbl_RangeAttack = {"vjseq_Crawl_Attack2"}
	self.RangeAttackAnimationStopMovement = true -- Should it stop moving when performing a range attack?
    self:SetCollisionBounds(Vector(13,13,20),Vector(-13,-13,0))
	self.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(30, 25, -20), 
	FirstP_Bone = "ValveBiped.Bip01_Head1", 
	FirstP_Offset = Vector(5, 0, -1), 
    }
    self.FireRun = false
    self:CapabilitiesRemove(bit.bor(CAP_MOVE_JUMP))
	self:CapabilitiesRemove(bit.bor(CAP_MOVE_CLIMB))
	self.HasDeathAnimation = false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:IsBulletDamage() or dmginfo:IsExplosionDamage()) then
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
	if self.HasSounds == true && self.HasImpactSounds == true then VJ.EmitSound(self,"vj_impact_metal/bullet_metal/metalsolid"..math.random(1,10)..".wav",70)
		dmginfo:ScaleDamage(0.50)
    end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/