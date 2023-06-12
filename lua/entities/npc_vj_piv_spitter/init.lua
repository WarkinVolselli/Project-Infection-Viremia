AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/spitter/spitter.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 150 

ENT.PIV_Infection = true
ENT.PIV_Infection_IsWalker = true
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Red" -- The blood type, this will determine what it should use (decal, particle, etc.)

ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeUseAttachmentForPos = true -- Should the projectile spawn on a attachment?
ENT.RangeUseAttachmentForPosID = "Mouth" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true
ENT.AnimTbl_RangeAttack = {"vjseq_nz_taunt_7"} -- Range Attack Animations
ENT.RangeAttackEntityToSpawn = "obj_vj_piv_spit" -- The entity that is spawned when range attacking
ENT.RangeDistance = 2000 -- This is how far away it can shoot
ENT.RangeToMeleeDistance = 300 -- How close does it have to be until it uses melee?
ENT.TimeUntilRangeAttackProjectileRelease = 0.5 -- How much time until the projectile code is ran?
ENT.NextRangeAttackTime = 5 -- How much time until it can use a range attack?
ENT.RangeAttackExtraTimers = {0.65, 0.65, 0.7, 0.75, 0.8} -- Extra range attack timers | it will run the projectile code after the given amount of seconds
ENT.Immune_AcidPoisonRadiation = true -- Makes the SNPC not get damage from Acid, posion, radiation

ENT.HasBreathSound  =  true

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Breath = {"vj_piv/spitter/gurgle_loop1.wav"}
ENT.SoundTbl_BeforeRangeAttack = {"vj_piv/spitter/rangeattack1.mp3"}
ENT.SoundTbl_FootStep = {"vj_piv/foot1.wav","vj_piv/foot2.wav","vj_piv/foot3.wav"}
ENT.SoundTbl_Idle = {"vj_piv/spitter/idle1.mp3","vj_piv/spitter/idle2.mp3","vj_piv/spitter/idle3.mp3","vj_piv/spitter/idle4.mp3","vj_piv/spitter/idle5.mp3","vj_piv/spitter/idle6.mp3"}
ENT.SoundTbl_Alert = {"vj_piv/spitter/alert1.mp3","vj_piv/spitter/alert2.mp3","vj_piv/spitter/alert3.mp3","vj_piv/spitter/alert4.mp3"}
ENT.SoundTbl_CombatIdle = {"vj_piv/spitter/alert1.mp3","vj_piv/spitter/alert2.mp3","vj_piv/spitter/alert3.mp3","vj_piv/spitter/alert4.mp3"}
ENT.SoundTbl_Pain = {"vj_piv/spitter/pain1.mp3","vj_piv/spitter/pain2.mp3","vj_piv/spitter/pain3.mp3","vj_piv/spitter/pain4.mp3","vj_piv/spitter/pain5.mp3"}
ENT.SoundTbl_Death = {"vj_piv/spitter/death1.mp3","vj_piv/spitter/death2.mp3","vj_piv/spitter/death3.mp3","vj_piv/spitter/death4.mp3","vj_piv/spitter/death5.mp3"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/spitter/super_puker_70.wav","vj_piv/spitter/super_puker_71.wav","vj_piv/spitter/super_puker_72.wav","vj_piv/spitter/super_puker_73.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()	
	self:SetModelScale(1.1)
	self:SetSkin(math.random(0,3))
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 1500) + self:GetUp()*math.Rand(-30,30) + self:GetRight()*math.Rand(-40,40)
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
self.Light2:SetKeyValue("brightness", "7")
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