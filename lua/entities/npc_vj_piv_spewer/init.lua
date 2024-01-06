AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/spewer/spewer.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 250

ENT.AnimTbl_IdleStand = {ACT_IDLE_AIM_STIMULATED}

ENT.PIV_Infection = true
ENT.PIV_Infection_IsWalker = true
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Red" -- The blood type, this will determine what it should use (decal, particle, etc.)
 
ENT.PI_LegHP = 10000

ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeUseAttachmentForPos = true -- Should the projectile spawn on a attachment?
ENT.RangeUseAttachmentForPosID = "Mouth" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true
ENT.AnimTbl_RangeAttack = {"vjseq_stand_threaten_0","vjseq_stand_threaten_0","vjseq_stand_threaten_0"} -- Range Attack Animations
ENT.RangeAttackEntityToSpawn = "obj_vj_piv_puke" -- The entity that is spawned when range attacking
ENT.RangeDistance = 500 -- This is how far away it can shoot
ENT.RangeToMeleeDistance = 100 -- How close does it have to be until it uses melee?
ENT.TimeUntilRangeAttackProjectileRelease = 0.65 -- How much time until the projectile code is ran?
ENT.RangeAttackExtraTimers = {0.65, 0.65} -- Extra range attack timers | it will run the projectile code after the given amount of seconds
ENT.NextRangeAttackTime = 5
ENT.NextRangeAttackTime_DoRand = 10
ENT.Immune_AcidPoisonRadiation = true -- Makes the SNPC not get damage from Acid, posion, radiation


	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_BeforeRangeAttack = {"vj_piv/spewer/zombie_spitter_attack_grenade_00_0.wav","vj_piv/spewer/zombie_spitter_attack_grenade_01_0.wav","vj_piv/spewer/zombie_spitter_attack_spit_00_0.wav","vj_piv/spewer/zombie_spitter_attack_spit_01_0.wav","vj_piv/spewer/zombie_spitter_attack_spit_02_0.wav","vj_piv/spewer/zombie_spitter_attack_spit_03_0.wav","vj_piv/spewer/zombie_spitter_attack_spit_04_0.wav"}
ENT.SoundTbl_FootStep = {"vj_piv/foot1.wav","vj_piv/foot2.wav","vj_piv/foot3.wav"}
ENT.SoundTbl_Idle = {"vj_piv/spewer/zombie_spitter_recharge_00_0.wav","vj_piv/spewer/zombie_spitter_recharge_01_0.wav","vj_piv/spewer/zombie_spitter_recharge_02_0.wav"}
ENT.SoundTbl_Alert = {"vj_piv/spewer/zombie_spitter_scream_00_0.wav","vj_piv/spewer/zombie_spitter_scream_01_0.wav","vj_piv/spewer/zombie_spitter_scream_02_0.wav"}
ENT.SoundTbl_CombatIdle = {"vj_piv/spewer/zombie_spitter_upset_00_0.wav","vj_piv/spewer/zombie_spitter_upset_01_0.wav","vj_piv/spewer/zombie_spitter_run_00_0.wav","vj_piv/spewer/zombie_spitter_run_01_0.wav","vj_piv/spewer/zombie_spitter_run_02_0.wav","vj_piv/spewer/zombie_spitter_run_03_0.wav"}
ENT.SoundTbl_Pain = {"vj_piv/spewer/zombie_spitter_pain_00_0.wav","vj_piv/spewer/zombie_spitter_pain_01_0.wav"}
ENT.SoundTbl_Death = {"vj_piv/spewer/zombie_spitter_death_00_0.wav","vj_piv/spewer/zombie_spitter_death_01_0.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/spewer/zombie_spitter_push_00_0.wav","vj_piv/spewer/zombie_spitter_push_01_0.wav"}
ENT.SoundTbl_RangeAttack = {"vj_piv/spewer/zombie_vomit_00_0.wav","vj_piv/spewer/zombie_vomit_01_0.wav","vj_piv/spewer/zombie_vomit_02_0.wav","vj_piv/spewer/zombie_vomit_03_0.wav"}
ENT.GeneralSoundPitch1 = 90
ENT.GeneralSoundPitch2 = 80

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()	
	self:SetModelScale(1.1)
	self:SetSkin(math.random(0,3))
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 500) + self:GetUp()*math.Rand(-100,100) + self:GetRight()*math.Rand(-100,100)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Cripple()
	self.PIV_CanMutate = false
	self:DropTheFuckignWeaponGoddamn()
	self.AnimTbl_IdleStand = {ACT_IDLE_STIMULATED}
	self.AnimTbl_Walk = {ACT_WALK_STIMULATED}
	self.AnimTbl_Run = {ACT_WALK_STIMULATED}
	
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
	self.AnimTbl_RangeAttack = {""}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PIV_CustomMutate()
self.AnimTbl_Walk = {ACT_WALK}
self.AnimTbl_Run = {ACT_SPRINT}

self.StartHealth = self.StartHealth *2
self:SetHealth(self.StartHealth)
		
local mymaxhealth = self:Health()
self:SetMaxHealth(mymaxhealth)

self.PIV_LegHP = self.PIV_LegHP *2

if GetConVar("vj_piv_lights"):GetInt() == 1 then 

self.Light2 = ents.Create("light_dynamic")
self.Light2:SetKeyValue("brightness", "1")
self.Light2:SetKeyValue("distance", "50")
self.Light2:SetLocalPos(self:GetPos())
self.Light2:SetLocalAngles(self:GetAngles())
self.Light2:Fire("Color", "127 255 0 255")
self.Light2:SetParent(self)
self.Light2:Spawn()
self.Light2:Activate()
self.Light2:Fire("SetParentAttachment","eyes")
self.Light2:Fire("TurnOn", "", 0)
self:DeleteOnRemove(self.Light2)

end

end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/