include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
ENT.Model = {"models/vj_piv/hl2/corpse1.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
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