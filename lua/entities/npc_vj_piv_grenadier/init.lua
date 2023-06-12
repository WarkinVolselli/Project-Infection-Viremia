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

ENT.PIV_HasArmor = true

ENT.TimeUntilRangeAttackProjectileRelease = 0.5 -- How much time until the projectile code is ran?
ENT.NextRangeAttackTime = 7 -- How much time until it can use a range attack?

ENT.RangeDistance = 1250 -- This is how far away it can shoot
ENT.RangeToMeleeDistance = 300 -- How close does it have to be until it uses melee?
ENT.RangeAttackAngleRadius = 100 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC

ENT.RangeUseAttachmentForPos = true -- Should the projectile spawn on a attachment?
ENT.RangeUseAttachmentForPosID = "anim_attachment_RH" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true

ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
--ENT.TimeUntilMeleeAttackDamage = 1
ENT.AnimTbl_RangeAttack = {"vjges_melee_moving01a","vjges_melee_moving03a","vjges_melee_moving06a"} -- Range Attack Animations
ENT.RangeAttackEntityToSpawn = "obj_vj_grenade" -- The entity that is spawned when range attacking
ENT.RangeAttackAnimationStopMovement = false -- Should it stop moving when performing a range attack?

ENT.HasBreathSound = true

ENT.GeneralSoundPitch1 = 90
ENT.GeneralSoundpitch2 = 80

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
	self.NextSoundTime_Breath = VJ_Set(7,20)
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
	if (dmginfo:IsBulletDamage()) then
		dmginfo:ScaleDamage(0.50)
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
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/