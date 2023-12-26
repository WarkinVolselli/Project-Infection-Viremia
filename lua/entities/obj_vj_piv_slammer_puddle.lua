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

/*--------------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
ENT.Model = {"models/spitball_small.mdl"}

ENT.SoundTbl_Idle = {"ambient/levels/canals/toxic_slime_sizzle3.wav","ambient/levels/canals/toxic_slime_sizzle4.wav"}
ENT.SoundTbl_OnRemove = {"vj_piv/spewer/spitter_acid_fadeout.wav","vj_piv/spewer/spitter_acid_fadeout2.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:Wake()
	phys:EnableGravity(false)
	phys:EnableDrag(false)
	phys:SetBuoyancyRatio(0)
	phys:EnableMotion(false)
	self:SetCollisionGroup(20)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()

	self:SetNoDraw(true)
	
	self.Light1 = ents.Create("light_dynamic")
	self.Light1:SetKeyValue("brightness", "5")
	self.Light1:SetKeyValue("distance", "150")
	self.Light1:SetLocalPos(self:GetPos() + self:GetUp()*0 + self:GetForward()*0)
	self.Light1:SetLocalAngles(self:GetAngles())
	self.Light1:Fire("Color", "127 255 0 255")
	self.Light1:SetParent(self)
	self.Light1:Spawn()
	self.Light1:Activate()
	self.Light1:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(self.Light1)
		
	local bombglow = ents.Create("env_sprite")
	bombglow:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
	bombglow:SetKeyValue("scale", "1")
	bombglow:SetKeyValue("rendermode","5")
	bombglow:SetKeyValue("rendercolor","127 255 0")
	bombglow:SetKeyValue("spawnflags","1") -- If animated
	bombglow:SetLocalPos(self:GetPos() + self:GetUp()*0 + self:GetForward()*0)
	bombglow:SetLocalAngles(self:GetAngles())
	bombglow:SetParent(self)
	bombglow:Spawn()
	bombglow:Activate()
	self:DeleteOnRemove(bombglow)

	timer.Simple(math.random(3,6),function() if IsValid(self) then
			self:Remove()
	end end)

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	util.VJ_SphereDamage(self, self, self:GetPos(), 50, 1, DMG_ACID, true, true)	
	ParticleEffectAttach("antlion_gib_02_floaters", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	ParticleEffectAttach("antlion_gib_02_juice", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	ParticleEffectAttach("slime_splash_01_surface", PATTACH_ABSORIGIN_FOLLOW, self, 0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
VJ_STOPSOUND(self.CurrentIdleSound)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/