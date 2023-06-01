AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/spitball_medium.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.DoesRadiusDamage = true -- Should it do a blast damage when it hits something?
ENT.RadiusDamageRadius = 100 -- How far the damage go? The farther away it's from its enemy, the less damage it will do | Counted in world units
ENT.RadiusDamage = 20 -- How much damage should it deal? Remember this is a radius damage, therefore it will do less damage the farther away the entity is from its enemy
ENT.RadiusDamageUseRealisticRadius = true -- Should the damage decrease the farther away the enemy is from the position that the projectile hit?
ENT.RadiusDamageType = DMG_SHOCK -- Damage type
ENT.DecalTbl_DeathDecals = {"Scorch"}
ENT.SoundTbl_Startup = {"ambient/levels/labs/electric_explosion1.wav"}
ENT.SoundTbl_OnCollide = {"ambient/energy/weld1.wav","ambient/energy/weld2.wav"}

ENT.PrintName		= "Shock"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:Wake()	
	phys:SetMass(1)
	phys:EnableDrag(false)
    phys:EnableGravity(false)
	phys:SetBuoyancyRatio(0)
end
------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
               self:SetNoDraw(true)
               ParticleEffectAttach("striderbuster_break_lightning", PATTACH_ABSORIGIN_FOLLOW, self, 0)
ParticleEffectAttach("striderbuster_break_lightning", PATTACH_ABSORIGIN_FOLLOW, self, 0)
ParticleEffectAttach("striderbuster_break_lightning", PATTACH_ABSORIGIN_FOLLOW, self, 0)
ParticleEffectAttach("striderbuster_break_lightning", PATTACH_ABSORIGIN_FOLLOW, self, 0)
              ParticleEffectAttach("striderbuster_break_lightning", PATTACH_ABSORIGIN_FOLLOW, self, 0)
		util.SpriteTrail(self,10,Color(0,255,255),true,100,0.6,0.6,12/(20+20)*30,"VJ_Base/sprites/vj_trial1.vmt")
		util.SpriteTrail(self,10,Color(0,255,255	),true,100,0.6,0.6,12/(20+20)*30,"VJ_Base/sprites/vj_trial1.vmt")
	end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DeathEffects(data,phys)
        ParticleEffect("hunter_shield_impact2",self:LocalToWorld(Vector(math.random(1,1),math.random(1,1))),Angle(0,0,0),nil)
ParticleEffect("hunter_shield_impact2",self:LocalToWorld(Vector(math.random(1,1),math.random(1,1))),Angle(0,0,0),nil)
ParticleEffect("hunter_shield_impact2",self:LocalToWorld(Vector(math.random(1,1),math.random(1,1))),Angle(0,0,0),nil)
      
end
--------------------------------------------------------------------------------------
function ENT:CustomOnThink()
ParticleEffectAttach("striderbuster_break_lightning", PATTACH_ABSORIGIN_FOLLOW, self, 0)
ParticleEffectAttach("striderbuster_break_lightning", PATTACH_ABSORIGIN_FOLLOW, self, 0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDoDamage(data,phys,hitEnt)
	for _,v in pairs(hitEnt) do
		v:EmitSound("ambient/energy/weld"..math.random(1,2)..".wav",60,100)
		if IsValid(v) then
			local zapEnt = v
			timer.Create("zap"..self:EntIndex()..tostring(zapEnt),0.2,15,function()
				if IsValid(zapEnt) then
					local effect = EffectData()
					effect:SetOrigin(zapEnt:GetPos())
					effect:SetStart(zapEnt:GetPos())
					effect:SetMagnitude(5)
					effect:SetEntity(zapEnt)
					util.Effect("teslaHitBoxes",effect)
					zapEnt:EmitSound("Weapon_StunStick.Activate")
				end
			end)
			if v:IsPlayer() && IsValid(v:GetActiveWeapon()) then
				local wep = v:GetActiveWeapon()
				v:DropWeapon(wep)
				local zapplrwep = wep
				timer.Create("zap_plrwep"..self:EntIndex()..tostring(zaplrwep),0.2,15,function()
					if IsValid(zapplrwep) then
						local effect = EffectData()
						effect:SetOrigin(zapplrwep:GetPos())
						effect:SetStart(zapplrwep:GetPos())
						effect:SetMagnitude(5)
						effect:SetEntity(zapplrwep)
						util.Effect("teslaHitBoxes",effect)
						zapplrwep:EmitSound("Weapon_StunStick.Activate")
					end
				end)
			elseif v:IsNPC() && v.IsVJBaseSNPC && IsValid(v:GetActiveWeapon()) && math.random(1,3) == 1 then
				local class = v:GetActiveWeapon():GetClass()
				local ent = ents.Create(class)
				ent:SetPos(v:GetActiveWeapon():GetPos())
				ent:SetAngles(v:GetActiveWeapon():GetAngles())
				ent:Spawn()
				if IsValid(ent:GetPhysicsObject()) then
					ent:GetPhysicsObject():SetVelocity(ent:GetPos() +VectorRand() *20)
				end
				v:GetActiveWeapon():Remove()
				local zapnpcwep = ent
				timer.Create("zap_npcwep"..self:EntIndex()..tostring(zapnpcwep),0.2,15,function()
					if IsValid(zapnpcwep) then
						local effect = EffectData()
						effect:SetOrigin(zapnpcwep:GetPos())
						effect:SetStart(zapnpcwep:GetPos())
						effect:SetMagnitude(5)
						effect:SetEntity(zapnpcwep)
						util.Effect("teslaHitBoxes",effect)
						zapnpcwep:EmitSound("Weapon_StunStick.Activate")
					end
				end)
			end
		end
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/