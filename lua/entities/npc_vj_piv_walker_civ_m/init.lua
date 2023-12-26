AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/hl2/citizens/male_01.mdl","models/vj_piv/hl2/citizens/male_02.mdl","models/vj_piv/hl2/citizens/male_03.mdl","models/vj_piv/hl2/citizens/male_04.mdl","models/vj_piv/hl2/citizens/male_05.mdl","models/vj_piv/hl2/citizens/male_06.mdl","models/vj_piv/hl2/citizens/male_07.mdl","models/vj_piv/hl2/citizens/male_08.mdl","models/vj_piv/hl2/citizens/male_09.mdl","models/vj_piv/hl2/citizens/male_10.mdl","models/vj_piv/hl2/citizens/male_11.mdl","models/vj_piv/hl2/citizens/male_12.mdl","models/vj_piv/hl2/citizens/male_13.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnPreInitialize()
	if GetConVar("vj_piv_extramodels"):GetInt() == 1 then -- if Extra Models is enabled, this will allow non-HL2 citizen models
		if GetConVar("vj_piv_hl2skins"):GetInt() == 1 then -- if HL2 Skins Only is enabled, this will make the zombies only use HL2 skins
			self.Model = {"models/vj_piv/hl2/citizens/male_01.mdl","models/vj_piv/hl2/citizens/male_02.mdl","models/vj_piv/hl2/citizens/male_03.mdl","models/vj_piv/hl2/citizens/male_04.mdl","models/vj_piv/hl2/citizens/male_05.mdl","models/vj_piv/hl2/citizens/male_06.mdl","models/vj_piv/hl2/citizens/male_07.mdl","models/vj_piv/hl2/citizens/male_08.mdl","models/vj_piv/hl2/citizens/male_09.mdl","models/vj_piv/hl2/citizens/male_10.mdl","models/vj_piv/hl2/citizens/male_11.mdl","models/vj_piv/hl2/citizens/male_12.mdl","models/vj_piv/hl2/citizens/male_13.mdl"}
			self:SetSkin(math.random(0,3))
		else
			if math.random(1,2) == 1 then -- if HL2 Skins Only is disabled, this allows extra skins
				self.Model = {"models/vj_piv/hl2/citizens/male_01.mdl","models/vj_piv/hl2/citizens/male_02.mdl","models/vj_piv/hl2/citizens/male_03.mdl","models/vj_piv/hl2/citizens/male_04.mdl","models/vj_piv/hl2/citizens/male_05.mdl",	"models/vj_piv/hl2/citizens/male_06.mdl","models/vj_piv/hl2/citizens/male_07.mdl","models/vj_piv/hl2/citizens/male_08.mdl","models/vj_piv/hl2/citizens/male_09.mdl","models/vj_piv/hl2/citizens/male_10.mdl","models/vj_piv/hl2/citizens/male_11.mdl","models/vj_piv/hl2/citizens/male_12.mdl","models/vj_piv/hl2/citizens/male_13.mdl"}	
				self:SetSkin(math.random(0,19))
			else
				self.Model = {"models/vj_piv/hl2/citizens/male_01_b.mdl","models/vj_piv/hl2/citizens/male_02_b.mdl","models/vj_piv/hl2/citizens/male_03_b.mdl","models/vj_piv/hl2/citizens/male_04_b.mdl","models/vj_piv/hl2/citizens/male_05_b.mdl","models/vj_piv/hl2/citizens/male_06_b.mdl","models/vj_piv/hl2/citizens/male_07_b.mdl","models/vj_piv/hl2/citizens/male_08_b.mdl","models/vj_piv/hl2/citizens/male_09_b.mdl","models/vj_piv/hl2/citizens/male_10_b.mdl","models/vj_piv/hl2/citizens/male_11_b.mdl","models/vj_piv/hl2/citizens/male_12_b.mdl","models/vj_piv/hl2/citizens/male_13_b.mdl"}	
				self:SetSkin(math.random(0,23))
			end
		end
	else -- if Extra Models is disabled, this will allow only HL2 citizen models
		if GetConVar("vj_piv_hl2skins"):GetInt() == 1 then -- if HL2 Skins Only is enabled, this will make the zombies only use HL2 skins
			self.Model = {"models/vj_piv/hl2/citizens/male_01.mdl","models/vj_piv/hl2/citizens/male_02.mdl","models/vj_piv/hl2/citizens/male_03.mdl","models/vj_piv/hl2/citizens/male_04.mdl","models/vj_piv/hl2/citizens/male_05.mdl","models/vj_piv/hl2/citizens/male_06.mdl","models/vj_piv/hl2/citizens/male_07.mdl","models/vj_piv/hl2/citizens/male_08.mdl","models/vj_piv/hl2/citizens/male_09.mdl","models/vj_piv/hl2/citizens/male_10.mdl","models/vj_piv/hl2/citizens/male_11.mdl"}
			self:SetSkin(math.random(0,3))
		else
			if math.random(1,2) == 1 then -- if HL2 Skins Only is disabled, this allows extra skins
				self.Model = {"models/vj_piv/hl2/citizens/male_01.mdl","models/vj_piv/hl2/citizens/male_02.mdl","models/vj_piv/hl2/citizens/male_03.mdl","models/vj_piv/hl2/citizens/male_04.mdl","models/vj_piv/hl2/citizens/male_05.mdl",	"models/vj_piv/hl2/citizens/male_06.mdl","models/vj_piv/hl2/citizens/male_07.mdl","models/vj_piv/hl2/citizens/male_08.mdl","models/vj_piv/hl2/citizens/male_09.mdl","models/vj_piv/hl2/citizens/male_10.mdl","models/vj_piv/hl2/citizens/male_11.mdl"}	
				self:SetSkin(math.random(0,19))
			else
				self.Model = {"models/vj_piv/hl2/citizens/male_01_b.mdl","models/vj_piv/hl2/citizens/male_02_b.mdl","models/vj_piv/hl2/citizens/male_03_b.mdl","models/vj_piv/hl2/citizens/male_04_b.mdl","models/vj_piv/hl2/citizens/male_05_b.mdl","models/vj_piv/hl2/citizens/male_06_b.mdl","models/vj_piv/hl2/citizens/male_07_b.mdl","models/vj_piv/hl2/citizens/male_08_b.mdl","models/vj_piv/hl2/citizens/male_09_b.mdl","models/vj_piv/hl2/citizens/male_10_b.mdl","models/vj_piv/hl2/citizens/male_11_b.mdl"}	
				self:SetSkin(math.random(0,23))
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()

	if math.random(1,5) == 5 then
	self:SetBodygroup(5,1)
	end
	
	self:SetBodygroup(1,math.random(0,1))

end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/