include("entities/npc_vj_piv_walker_inf/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.PIV_IsRunner = true
	self.PIV_IsInfectee = true
end
--------------------