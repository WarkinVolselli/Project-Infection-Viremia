AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/props_debris/concrete_chunk01a.mdl","models/props_debris/concrete_chunk01b.mdl","models/props_debris/concrete_chunk01c.mdl","models/props_debris/concrete_chunk06d.mdl","models/props_debris/concrete_chunk06c.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.DoesDirectDamage = true
ENT.DirectDamage = math.random(45,50)
ENT.DirectDamageType = DMG_CRUSH

ENT.ShakeWorldOnDeath = true
ENT.ShakeWorldOnDeathRadius = 1000

ENT.OnCollideSoundLevel = 85
ENT.SoundTbl_Idle = {"vj_piv/tank/attack/thrown_missile_loop_1.wav"}
ENT.SoundTbl_OnCollide = {"vj_piv/rock_blast_impact_projectile_01.wav","vj_piv/rock_blast_impact_projectile_02.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:Wake()
	phys:SetMass(1)
	phys:SetBuoyancyRatio(0)
	phys:EnableDrag(false)
	phys:AddAngleVelocity(Vector(math.random(-150,150),math.random(-150,150),math.random(-150,150)))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DeathEffects(data,phys)
	ParticleEffect("strider_wall_smash",data.HitPos,Angle(0,0,0))
	ParticleEffect("strider_cannon_impact",data.HitPos,Angle(0,0,0))

	local tbl = {
		"models/props_debris/concrete_chunk02a.mdl",
		"models/props_debris/concrete_chunk03a.mdl",
		"models/props_debris/concrete_chunk04a.mdl",
		"models/props_debris/concrete_chunk05g.mdl",
		"models/props_debris/concrete_chunk07a.mdl", 
		"models/props_debris/concrete_chunk08a.mdl",
		"models/props_debris/concrete_chunk09a.mdl"
	}
	local rand = VectorRand() *15
	rand.z = 5
	for _,v in pairs(tbl) do
		local p = ents.Create("obj_vj_gib")
		p:SetModel(v)
		p:SetPos(data.HitPos +rand)
		p:SetAngles(self:GetAngles())
		p.BloodType = false
		p.CollideSound = {
			"physics/concrete/rock_impact_hard1.wav",
			"physics/concrete/rock_impact_hard2.wav",
			"physics/concrete/rock_impact_hard3.wav",
			"physics/concrete/rock_impact_hard4.wav",
			"physics/concrete/rock_impact_hard5.wav",
			"physics/concrete/rock_impact_hard6.wav"
		}
		p.Collide_Decal = ""
		p:Spawn()
		p:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		p:GetPhysicsObject():SetVelocity(self:GetPhysicsObject():GetVelocity() /1.5)
		timer.Simple(GetConVarNumber("vj_npc_fadegibstime"),function() SafeRemoveEntity(p) end)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/