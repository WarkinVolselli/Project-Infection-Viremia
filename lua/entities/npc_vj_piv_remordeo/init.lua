AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/remordeo/remordeo.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 350

---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeUseAttachmentForPos = true -- Should the projectile spawn on a attachment?
ENT.RangeUseAttachmentForPosID = "mouth" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true
ENT.AnimTbl_RangeAttack = {"vjseq_nz_taunt_3"} -- Range Attack Animations
ENT.RangeAttackEntityToSpawn = "obj_vj_piv_smoke" -- The entity that is spawned when range attacking
ENT.RangeDistance = 3000 -- This is how far away it can shoot
ENT.RangeToMeleeDistance = 500 -- How close does it have to be until it uses melee?
ENT.TimeUntilRangeAttackProjectileRelease = 0.6 -- How much time until the projectile code is ran?
ENT.RangeAttackExtraTimers = {0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2,2.1,2.2,2.3,2.4}
ENT.NextRangeAttackTime = 8 -- How much time until it can use a range attack?
ENT.Immune_AcidPoisonRadiation = true -- Makes the SNPC not get damage from Acid, posion, radiation

ENT.AlertSoundLevel = 80
ENT.CombatIdleSoundLevel = 80
ENT.BeforeMeleeAttackSoundLevel = 80
ENT.BeforeRangeAttackSoundLevel = 80
ENT.PainSoundLevel = 80
ENT.DeathSoundLevel = 80

ENT.PIV_LegHP = 10000
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play

ENT.SoundTbl_BeforeRangeAttack = {"vj_piv/remordeo/gas_can_explode.wav"}
ENT.SoundTbl_Idle = {"vj_piv/mil_zomb/gasmask/runner/idle1.wav","vj_piv/mil_zomb/gasmask/runner/idle2.wav","vj_piv/mil_zomb/gasmask/runner/idle3.wav","vj_piv/mil_zomb/gasmask/runner/idle4.wav","vj_piv/mil_zomb/gasmask/runner/idle5.wav","vj_piv/mil_zomb/gasmask/runner/idle6.wav","vj_piv/mil_zomb/gasmask/runner/idle7.wav","vj_piv/mil_zomb/gasmask/runner/idle8.wav","vj_piv/mil_zomb/gasmask/runner/idle9.wav"}
ENT.SoundTbl_Alert = {"vj_piv/mil_zomb/gasmask/runner/alert1.wav"}
ENT.SoundTbl_CombatIdle = {"vj_piv/mil_zomb/gasmask/runner/combatidle1.wav","vj_piv/mil_zomb/gasmask/runner/combatidle2.wav","vj_piv/mil_zomb/gasmask/runner/combatidle3.wav","vj_piv/mil_zomb/gasmask/runner/combatidle4.wav","vj_piv/mil_zomb/gasmask/runner/combatidle5.wav","vj_piv/mil_zomb/gasmask/runner/combatidle6.wav","vj_piv/mil_zomb/gasmask/runner/combatidle7.wav","vj_piv/mil_zomb/gasmask/runner/combatidle8.wav","vj_piv/mil_zomb/gasmask/runner/combatidle9.wav"}
ENT.SoundTbl_Pain = {"vj_piv/mil_zomb/gasmask/runner/pain1.wav","vj_piv/mil_zomb/gasmask/runner/pain2.wav","vj_piv/mil_zomb/gasmask/runner/pain3.wav","vj_piv/mil_zomb/gasmask/runner/pain4.wav","vj_piv/mil_zomb/gasmask/runner/pain5.wav","vj_piv/mil_zomb/gasmask/runner/pain6.wav","vj_piv/mil_zomb/gasmask/runner/pain7.wav","vj_piv/mil_zomb/gasmask/runner/pain8.wav"}
ENT.SoundTbl_Death = {"vj_piv/mil_zomb/gasmask/runner/pain1.wav","vj_piv/mil_zomb/gasmask/runner/pain2.wav","vj_piv/mil_zomb/gasmask/runner/pain3.wav","vj_piv/mil_zomb/gasmask/runner/pain4.wav","vj_piv/mil_zomb/gasmask/runner/pain5.wav","vj_piv/mil_zomb/gasmask/runner/pain6.wav","vj_piv/mil_zomb/gasmask/runner/pain7.wav","vj_piv/mil_zomb/gasmask/runner/pain8.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/mil_zomb/gasmask/runner/idle1.wav","vj_piv/mil_zomb/gasmask/runner/idle2.wav","vj_piv/mil_zomb/gasmask/runner/idle3.wav","vj_piv/mil_zomb/gasmask/runner/idle4.wav","vj_piv/mil_zomb/gasmask/runner/idle5.wav","vj_piv/mil_zomb/gasmask/runner/idle6.wav","vj_piv/mil_zomb/gasmask/runner/idle7.wav","vj_piv/mil_zomb/gasmask/runner/idle8.wav","vj_piv/mil_zomb/gasmask/runner/idle9.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 90
ENT.BeforeRangeAttackPitch = VJ_Set(90, 100)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()	
self:SetModelScale(1.1)
    self.PIV_LegHP = self.StartHealth * 2
	if GetConVarNumber("vj_npc_noidleparticle") == 0 then
 	    ParticleEffectAttach("smoke_exhaust_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
		if GetConVarNumber("vj_piv_reducedparticles") == 0 then
			ParticleEffectAttach("smoke_exhaust_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("rfoot"))
			ParticleEffectAttach("smoke_exhaust_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("lfoot"))
		end
	end
	
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 1500) + self:GetUp()*math.Rand(0,100) + self:GetRight()*math.Rand(-200,200)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled() 
    util.VJ_SphereDamage(self,self,self:GetPos(),100,1,DMG_RADIATION,true,true)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/