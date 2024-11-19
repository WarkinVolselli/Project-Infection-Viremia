include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
ENT.Model = {
	"models/vj_piv/hl2/citizens/male_01.mdl",
	"models/vj_piv/hl2/citizens/male_02.mdl",
	"models/vj_piv/hl2/citizens/male_03.mdl",
	"models/vj_piv/hl2/citizens/male_04.mdl",
	"models/vj_piv/hl2/citizens/male_05.mdl",
	"models/vj_piv/hl2/citizens/male_06.mdl",
	"models/vj_piv/hl2/citizens/male_07.mdl",
	"models/vj_piv/hl2/citizens/male_08.mdl",
	"models/vj_piv/hl2/citizens/male_09.mdl",
	"models/vj_piv/hl2/citizens/male_10.mdl",
	"models/vj_piv/hl2/citizens/male_11.mdl",
	"models/vj_piv/hl2/citizens/male_12.mdl",
	"models/vj_piv/hl2/citizens/male_13.mdl"
}
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	if GetConVar("vj_piv_extramodels"):GetInt() == 1 then -- if Extra Models is enabled, this will allow non-HL2 citizen models
		if GetConVar("vj_piv_hl2skins"):GetInt() == 1 then -- if HL2 Skins Only is enabled, this will make the zombies only use HL2 skins
			self:SetSkin(math.random(0,3))
		else
			if math.random(1,2) == 1 then -- if HL2 Skins Only is disabled, this allows extra skins	
				self:SetSkin(math.random(0,19))
			else
				self.Model = {
					"models/vj_piv/hl2/citizens/male_01_b.mdl",
					"models/vj_piv/hl2/citizens/male_02_b.mdl",
					"models/vj_piv/hl2/citizens/male_03_b.mdl",
					"models/vj_piv/hl2/citizens/male_04_b.mdl",
					"models/vj_piv/hl2/citizens/male_05_b.mdl",
					"models/vj_piv/hl2/citizens/male_06_b.mdl",
					"models/vj_piv/hl2/citizens/male_07_b.mdl",
					"models/vj_piv/hl2/citizens/male_08_b.mdl",
					"models/vj_piv/hl2/citizens/male_09_b.mdl",
					"models/vj_piv/hl2/citizens/male_10_b.mdl",
					"models/vj_piv/hl2/citizens/male_11_b.mdl",
					"models/vj_piv/hl2/citizens/male_12_b.mdl",
					"models/vj_piv/hl2/citizens/male_13_b.mdl"
				}	
				self:SetSkin(math.random(0,23))
			end
		end
	else -- if Extra Models is disabled, this will allow only HL2 citizen models
		self.Model = {
			"models/vj_piv/hl2/citizens/male_01.mdl",
			"models/vj_piv/hl2/citizens/male_02.mdl",
			"models/vj_piv/hl2/citizens/male_03.mdl",
			"models/vj_piv/hl2/citizens/male_04.mdl",
			"models/vj_piv/hl2/citizens/male_05.mdl",
			"models/vj_piv/hl2/citizens/male_06.mdl",
			"models/vj_piv/hl2/citizens/male_07.mdl",
			"models/vj_piv/hl2/citizens/male_08.mdl",
			"models/vj_piv/hl2/citizens/male_09.mdl",
			"models/vj_piv/hl2/citizens/male_10.mdl",
			"models/vj_piv/hl2/citizens/male_11.mdl"
		}
		if GetConVar("vj_piv_hl2skins"):GetInt() == 1 then -- if HL2 Skins Only is enabled, this will make the zombies only use HL2 skins
			self:SetSkin(math.random(0,3))
		else
			if math.random(1,2) == 1 then -- if HL2 Skins Only is disabled, this allows extra skins
				self:SetSkin(math.random(0,19))
			else
				self.Model = {
					"models/vj_piv/hl2/citizens/male_01_b.mdl",
					"models/vj_piv/hl2/citizens/male_02_b.mdl",
					"models/vj_piv/hl2/citizens/male_03_b.mdl",
					"models/vj_piv/hl2/citizens/male_04_b.mdl",
					"models/vj_piv/hl2/citizens/male_05_b.mdl",
					"models/vj_piv/hl2/citizens/male_06_b.mdl",
					"models/vj_piv/hl2/citizens/male_07_b.mdl",
					"models/vj_piv/hl2/citizens/male_08_b.mdl",
					"models/vj_piv/hl2/citizens/male_09_b.mdl",
					"models/vj_piv/hl2/citizens/male_10_b.mdl",
					"models/vj_piv/hl2/citizens/male_11_b.mdl"
				}	
				self:SetSkin(math.random(0,23))
			end
		end
	end
end
--------------------
function ENT:Zombie_CustomOnInitialize()

	if math.random(1,5) == 5 then
		self:SetBodygroup(5,1)
	end
	
	self:SetBodygroup(1,math.random(0,1))
	
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
-]]
--------------------