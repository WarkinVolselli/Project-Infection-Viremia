include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
ENT.Model = {
	"models/vj_piv/hl2/citizens/rebel/male_01.mdl",
	"models/vj_piv/hl2/citizens/rebel/male_02.mdl",
	"models/vj_piv/hl2/citizens/rebel/male_03.mdl",
	"models/vj_piv/hl2/citizens/rebel/male_04.mdl",
	"models/vj_piv/hl2/citizens/rebel/male_05.mdl",
	"models/vj_piv/hl2/citizens/rebel/male_06.mdl",
	"models/vj_piv/hl2/citizens/rebel/male_07.mdl",
	"models/vj_piv/hl2/citizens/rebel/male_08.mdl",
	"models/vj_piv/hl2/citizens/rebel/male_09.mdl",
	"models/vj_piv/hl2/citizens/rebel/male_10.mdl",
	"models/vj_piv/hl2/citizens/rebel/male_11.mdl",
	"models/vj_piv/hl2/citizens/rebel/male_11.mdl",
	"models/vj_piv/hl2/citizens/rebel/male_12.mdl",
	"models/vj_piv/hl2/citizens/rebel/male_13.mdl"
}
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.PIV_IsRunner = true
	self.PIV_Infection_IsWalker = false
	if GetConVar("vj_piv_extramodels"):GetInt() == 0 then
		self.Model = {
			"models/vj_piv/hl2/citizens/rebel/male_01.mdl",
			"models/vj_piv/hl2/citizens/rebel/male_02.mdl",
			"models/vj_piv/hl2/citizens/rebel/male_03.mdl",
			"models/vj_piv/hl2/citizens/rebel/male_04.mdl",
			"models/vj_piv/hl2/citizens/rebel/male_05.mdl",
			"models/vj_piv/hl2/citizens/rebel/male_06.mdl",
			"models/vj_piv/hl2/citizens/rebel/male_07.mdl",
			"models/vj_piv/hl2/citizens/rebel/male_08.mdl",
			"models/vj_piv/hl2/citizens/rebel/male_09.mdl",
			"models/vj_piv/hl2/citizens/rebel/male_10.mdl",
			"models/vj_piv/hl2/citizens/rebel/male_11.mdl"
		}
	end
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetBodygroup(1,math.random(2,5))
	self:SetBodygroup(2,math.random(1,3))
	self:SetBodygroup(3,math.random(0,2))
	self:SetBodygroup(4,math.random(0,3))
	if math.random(1,5) == 5 then
		self:SetBodygroup(5,1)
	end
	--self:Flexes()
end
--------------------
--[[
function ENT:Flexes()
	local eyes = math.random(1,3)
	if eyes == 1 then
		self:SetFlexWeight(13,math.Rand(0,2))
		self:SetFlexWeight(14,math.Rand(0,2))
		self:SetFlexWeight(15,math.Rand(0,1))
		self:SetFlexWeight(16,math.Rand(0,1))
	elseif eyes == 2 then
		self:SetFlexWeight(2,math.Rand(0,1))
		self:SetFlexWeight(3,math.Rand(0,1))
		self:SetFlexWeight(4,math.Rand(0,0.5))
		self:SetFlexWeight(5,math.Rand(0,0.5))	
	elseif eyes == 3 then
		self:SetFlexWeight(0,math.Rand(0,2))
		self:SetFlexWeight(1,math.Rand(0,2))
		self:SetFlexWeight(9,math.Rand(0,1))
		self:SetFlexWeight(10,math.Rand(0,1))
		self:SetFlexWeight(11,math.Rand(0,2))
		self:SetFlexWeight(12,math.Rand(0,2))	
	end

	local mouth = math.random(1,2)
	if mouth == 1 then
		self:SetFlexWeight(23,math.Rand(0,1))
		self:SetFlexWeight(24,math.Rand(0,1))
		self:SetFlexWeight(25,math.Rand(0,1))
		self:SetFlexWeight(26,math.Rand(0,1))
		self:SetFlexWeight(27,math.Rand(0,1))
		self:SetFlexWeight(37,math.Rand(0,1))
		self:SetFlexWeight(42,math.Rand(0,1))
	elseif mouth == 2 then
		self:SetFlexWeight(26,math.Rand(0,1))
		self:SetFlexWeight(27,math.Rand(0,1))
		self:SetFlexWeight(38,math.Rand(0,1))
		self:SetFlexWeight(42,math.Rand(0,1))
	end
	self:SetFlexWeight(17,math.Rand(0,1))
	self:SetFlexWeight(18,math.Rand(0,1))
end
--]]
--------------------