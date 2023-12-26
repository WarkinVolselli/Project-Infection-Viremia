/*--------------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()
if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end

ENT.Type 			= "anim"
ENT.Base 			= "obj_vj_projectile_base"
ENT.PrintName		= "Blood Bomb"
ENT.Author 			= "Warkin"

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = {"models/weapons/w_bugbait.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.DecalTbl_DeathDecals = {"blood"}
ENT.SoundTbl_Idle = {"vj_acid/acid_idle1.wav"}
ENT.SoundTbl_OnCollide = {"vj_piv/spewer/projectileimpact.wav","vj_piv/spewer/projectileexplosion.wav"}
ENT.OnCollideSoundPitch = VJ_Set(90,120) 
ENT.DoesRadiusDamage = true -- Should it do a blast damage when it hits something?
ENT.RadiusDamageRadius = 100
ENT.RadiusDamage = math.random(10,15) -- How much damage should it deal? Remember this is a radius damage, therefore it will do less damage the farther away the entity is from its enemy
ENT.RadiusDamageUseRealisticRadius = true -- Should the damage decrease the farther away the enemy is from the position that the projectile hit?
ENT.RadiusDamageType = DMG_ACID -- Damage type
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:Wake()
	phys:SetMass(1)
	phys:SetBuoyancyRatio(0)
	phys:EnableDrag(false)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	ParticleEffectAttach("blood_advisor_pierce_spray", PATTACH_ABSORIGIN_FOLLOW, self, 0)
    self.Owner = self:GetOwner() 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	ParticleEffectAttach("blood_impact_red_01", PATTACH_ABSORIGIN_FOLLOW, self, 0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DeathEffects(data,phys)
	local effectdata = EffectData()
	effectdata:SetOrigin(data.HitPos)
	effectdata:SetScale( 1 )
	ParticleEffect("blood_zombie_split", data.HitPos, Angle(0,0,0), nil)

end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/