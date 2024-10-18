/*--------------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()
if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end

ENT.Type 			= "anim"
ENT.Base 			= "obj_vj_projectile_base"
ENT.PrintName		= "Acid"
ENT.Author 			= "Warkin"

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = {"models/spitball_large.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.DecalTbl_DeathDecals = {"VJ_AcidSlime1"}
ENT.SoundTbl_Idle = {"vj_base/ambience/acid_idle.wav"}
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
	ParticleEffectAttach("antlion_spit_trail", PATTACH_ABSORIGIN_FOLLOW, self, 0)
    self.Owner = self:GetOwner() 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	ParticleEffectAttach("antlion_spit", PATTACH_ABSORIGIN_FOLLOW, self, 0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DeathEffects(data,phys)
	local effectdata = EffectData()
	effectdata:SetOrigin(data.HitPos)
	effectdata:SetScale( 1 )
	util.Effect("StriderBlood",effectdata)
	util.Effect("StriderBlood",effectdata)
	util.Effect("StriderBlood",effectdata)
	ParticleEffect("antlion_gib_02_floaters", data.HitPos, Angle(0,0,0), nil)
	ParticleEffect("antlion_gib_01_juice", data.HitPos, Angle(0,0,0), nil)

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	local carproj = ents.Create("obj_vj_piv_puke_puddle")
	carproj:SetPos(self:LocalToWorld(Vector(0,0,0)))
	carproj:SetAngles(Angle(math.random(0,360),math.random(0,360),math.random(0,360)))
	carproj:SetOwner(self)
	carproj:Spawn()
	carproj:Activate()
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/