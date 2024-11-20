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
	self.PIV_IsRunner = true
	self.PIV_Infection_IsWalker = false
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