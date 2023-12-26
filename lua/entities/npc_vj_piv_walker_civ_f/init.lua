AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/hl2/citizens/female_01.mdl","models/vj_piv/hl2/citizens/female_02.mdl","models/vj_piv/hl2/citizens/female_03.mdl","models/vj_piv/hl2/citizens/female_04.mdl","models/vj_piv/hl2/citizens/female_06.mdl","models/vj_piv/hl2/citizens/female_07.mdl","models/vj_piv/hl2/citizens/female_08.mdl","models/vj_piv/hl2/citizens/female_09.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnPreInitialize()
	if GetConVar("vj_piv_extramodels"):GetInt() == 1 then -- if Extra Models is enabled, this will allow non-HL2 citizen models
		if GetConVar("vj_piv_hl2skins"):GetInt() == 1 then -- if HL2 Skins Only is enabled, this will make the zombies only use HL2 skins
			self.Model = {"models/vj_piv/hl2/citizens/female_01.mdl","models/vj_piv/hl2/citizens/female_02.mdl","models/vj_piv/hl2/citizens/female_03.mdl","models/vj_piv/hl2/citizens/female_04.mdl","models/vj_piv/hl2/citizens/female_06.mdl","models/vj_piv/hl2/citizens/female_07.mdl","models/vj_piv/hl2/citizens/female_08.mdl","models/vj_piv/hl2/citizens/female_09.mdl"}
			self:SetSkin(math.random(0,3))
		else
			if math.random(1,2) == 1 then -- if HL2 Skins Only is disabled, this allows extra skins
				self.Model = {"models/vj_piv/hl2/citizens/female_01.mdl","models/vj_piv/hl2/citizens/female_02.mdl","models/vj_piv/hl2/citizens/female_03.mdl","models/vj_piv/hl2/citizens/female_04.mdl","models/vj_piv/hl2/citizens/female_06.mdl","models/vj_piv/hl2/citizens/female_07.mdl","models/vj_piv/hl2/citizens/female_08.mdl","models/vj_piv/hl2/citizens/female_09.mdl"}	
				self:SetSkin(math.random(0,19))
			else
				self.Model = {"models/vj_piv/hl2/citizens/female_01_b.mdl","models/vj_piv/hl2/citizens/female_02_b.mdl","models/vj_piv/hl2/citizens/female_03_b.mdl","models/vj_piv/hl2/citizens/female_04_b.mdl","models/vj_piv/hl2/citizens/female_06_b.mdl","models/vj_piv/hl2/citizens/female_07_b.mdl","models/vj_piv/hl2/citizens/female_08_b.mdl","models/vj_piv/hl2/citizens/female_09_b.mdl"}	
				self:SetSkin(math.random(0,23))
			end
		end
	else -- if Extra Models is disabled, this will allow only HL2 citizen models
		if GetConVar("vj_piv_hl2skins"):GetInt() == 1 then -- if HL2 Skins Only is enabled, this will make the zombies only use HL2 skins
				self.Model = {"models/vj_piv/hl2/citizens/female_01.mdl","models/vj_piv/hl2/citizens/female_02.mdl","models/vj_piv/hl2/citizens/female_03.mdl","models/vj_piv/hl2/citizens/female_04.mdl","models/vj_piv/hl2/citizens/female_06.mdl","models/vj_piv/hl2/citizens/female_07.mdl"}	
			self:SetSkin(math.random(0,3))
		else
			if math.random(1,2) == 1 then -- if HL2 Skins Only is disabled, this allows extra skins
				self.Model = {"models/vj_piv/hl2/citizens/female_01.mdl","models/vj_piv/hl2/citizens/female_02.mdl","models/vj_piv/hl2/citizens/female_03.mdl","models/vj_piv/hl2/citizens/female_04.mdl","models/vj_piv/hl2/citizens/female_06.mdl","models/vj_piv/hl2/citizens/female_07.mdl"}	
				self:SetSkin(math.random(0,19))
			else
				self.Model = {"models/vj_piv/hl2/citizens/female_01_b.mdl","models/vj_piv/hl2/citizens/female_02_b.mdl","models/vj_piv/hl2/citizens/female_03_b.mdl","models/vj_piv/hl2/citizens/female_04_b.mdl","models/vj_piv/hl2/citizens/female_06_b.mdl","models/vj_piv/hl2/citizens/female_07_b.mdl"}	
				self:SetSkin(math.random(0,23))
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()

	if math.random(1,5) == 5 then
	self:SetBodygroup(4,1)
	end
	
	self:SetBodygroup(1,math.random(0,1))

end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/