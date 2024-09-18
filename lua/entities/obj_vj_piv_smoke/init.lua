AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/spitball_small.mdl"} -- The models it should spawn with | Picks a random one from the table

ENT.SoundTbl_Idle = {}
ENT.SoundTbl_OnCollide = {}
ENT.DoesRadiusDamage = true -- Should it do a blast damage when it hits something?
ENT.RadiusDamageRadius = 100 -- How far the damage go? The farther away it's from its enemy, the less damage it will do | Counted in world units
ENT.RadiusDamage = 1 -- How much damage should it deal? Remember this is a radius damage, therefore it will do less damage the farther away the entity is from its enemy
ENT.RadiusDamageUseRealisticRadius = true -- Should the damage decrease the farther away the enemy is from the position that the projectile hit?
ENT.RadiusDamageType = DMG_RADIATION -- Damage type
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:Wake()
	phys:SetMass(1)
	phys:SetBuoyancyRatio(0)
	phys:EnableDrag(false)
	--phys:EnableGravity(false)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetKeyValue("rendercolor","0 0 0 255")
	self:SetMaterial("Models/effects/vol_light001")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	ParticleEffectAttach("smoke_exhaust_01", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	VJ.ApplyRadiusDamage(self,self,self:GetPos(),100,1,DMG_RADIATION,true,true)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DoKilledEnemy(victim,attacker,inflictor)	
if victim.IsVJBaseSNPC == true then
                victim.HasDeathRagdoll = false
				
elseif victim:IsPlayer() then
				if IsValid(victim:GetRagdollEntity()) then
					victim:GetRagdollEntity():Remove()
				end				
            end

   victim:Remove() 
end	
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/