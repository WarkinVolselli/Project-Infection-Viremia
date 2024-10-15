AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.PIV_Type = 0
--[[
1 = Alyx
2 = Mossman
--]]
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnPreInitialize()
	local Type = math.random(1,2)

	if Type == 1 then
		self.Model = {"models/vj_piv/hl2/main/alyx.mdl"}
		self.PIV_Type = 1
	elseif Type == 2 then
		self.Model = {"models/vj_piv/hl2/main/mossman.mdl","models/vj_piv/hl2/main/mossman_ep1.mdl"}	
		self.PIV_Type = 2
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	if self.PIV_Type == 1 then -- Alyx
		self:SetSkin(math.random(0,1))
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/