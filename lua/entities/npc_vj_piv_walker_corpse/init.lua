include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
ENT.Model = {"models/vj_piv/hl2/corpse1.mdl"}
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.GeneralSoundPitch1 = 60
	self.GeneralSoundPitch2 = 70
	self.MeleeAttackSoundPitch = VJ.SET(90, 100)
	if self:GetClass() == "npc_vj_piv_runner_corpse" then
		self.PIV_IsRunner = true
		self.PIV_Infection_IsWalker = false
	else
		-- Increase our odds of being a Shambler or Diseased
		if !self.PIV_Shambler then
			if math.random(1,GetConVar("vj_piv_shambler_chance"):GetInt()) == 1 && self.PIV_CanBeShambler then
				self.PIV_Shambler = true
				self.PIV_CanBeCrawler = false
				self.StartHealth = self.StartHealth * 1.25
			end
		end
		if !self.PIV_Diseased then
			if math.random(1,GetConVar("vj_piv_diseased_chance"):GetInt()) == 1 && self.PIV_CanBeDiseased then
				self.PIV_Diseased = true
				self.MeleeAttackBleedEnemyChance = 1
				self.MeleeAttackBleedEnemyDamage = 1
				self.MeleeAttackBleedEnemyTime = 1
				self.MeleeAttackBleedEnemyReps = math.random(5,20)
				self.MeleeAttackBleedEnemy = true
				ParticleEffectAttach("embers_medium_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
			end
		end
	end
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	if GetConVar("vj_piv_hl2skins"):GetInt() == 1 then -- if HL2 Skins Only is enabled, this will make the zombies only use HL2 skins
		if math.random(1,2) == 1 then
			self:SetSkin(math.random(5,6))
		else
			self:SetSkin(0)
		end
	else
		self:SetSkin(math.random(0,7))
	end
end