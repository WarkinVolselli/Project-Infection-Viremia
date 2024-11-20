include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
ENT.Model = {
	"models/vj_piv/hl2/citizens/rebel/female_01.mdl",
	"models/vj_piv/hl2/citizens/rebel/female_01_b.mdl",
	"models/vj_piv/hl2/citizens/rebel/female_02.mdl",
	"models/vj_piv/hl2/citizens/rebel/female_02_b.mdl",
	"models/vj_piv/hl2/citizens/rebel/female_03.mdl",
	"models/vj_piv/hl2/citizens/rebel/female_03_b.mdl",
	"models/vj_piv/hl2/citizens/rebel/female_04.mdl",
	"models/vj_piv/hl2/citizens/rebel/female_04_b.mdl",
	"models/vj_piv/hl2/citizens/rebel/female_06.mdl",
	"models/vj_piv/hl2/citizens/rebel/female_06_b.mdl",
	"models/vj_piv/hl2/citizens/rebel/female_07.mdl",
	"models/vj_piv/hl2/citizens/rebel/female_07_b.mdl",
	"models/vj_piv/hl2/citizens/rebel/female_08.mdl",
	"models/vj_piv/hl2/citizens/rebel/female_08_b.mdl",
	"models/vj_piv/hl2/citizens/rebel/female_09.mdl",
	"models/vj_piv/hl2/citizens/rebel/female_09_b.mdl"
}
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.PIV_IsRunner = true
	self.PIV_Infection_IsWalker = false
	self.PIV_Gender = 2
	if GetConVar("vj_piv_extramodels"):GetInt() == 0 then
		self.Model = {
			"models/vj_piv/hl2/citizens/rebel/female_01.mdl",
			"models/vj_piv/hl2/citizens/rebel/female_01_b.mdl",
			"models/vj_piv/hl2/citizens/rebel/female_02.mdl",
			"models/vj_piv/hl2/citizens/rebel/female_02_b.mdl",
			"models/vj_piv/hl2/citizens/rebel/female_03.mdl",
			"models/vj_piv/hl2/citizens/rebel/female_03_b.mdl",
			"models/vj_piv/hl2/citizens/rebel/female_04.mdl",
			"models/vj_piv/hl2/citizens/rebel/female_04_b.mdl",
			"models/vj_piv/hl2/citizens/rebel/female_06.mdl",
			"models/vj_piv/hl2/citizens/rebel/female_06_b.mdl",
			"models/vj_piv/hl2/citizens/rebel/female_07.mdl",
			"models/vj_piv/hl2/citizens/rebel/female_07_b.mdl"
		}
	end
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetBodygroup(1,math.random(2,5))
	self:SetBodygroup(2,math.random(1,3))
	self:SetBodygroup(3,math.random(0,2))
	if math.random(1,5) == 5 then
		self:SetBodygroup(4,1)
	end
	if math.random(1,5) == 5 then
		self:SetBodygroup(5,1)
	end
end
--------------------