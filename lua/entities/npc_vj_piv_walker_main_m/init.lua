AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.PIV_Type = 0
--[[
1 = Barney
2 = Breen
3 = Eli
4 = G-Man
5 = Kleiner
6 = Magnusson
7 = Grigori
8 = Odessa
--]]
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnPreInitialize()
	local Type = math.random(1,8)

	if Type == 1 then
		self.Model = {"models/vj_piv/hl2/main/barney.mdl"}
		self.PIV_Type = 1
	elseif Type == 2 then
		self.Model = {"models/vj_piv/hl2/main/breen.mdl"}	
		self.PIV_Type = 2
	elseif Type == 3 then
		self.Model = {"models/vj_piv/hl2/main/eli.mdl"}
		self.PIV_Type = 3
	elseif Type == 4 then
		self.Model = {"models/vj_piv/hl2/main/gman.mdl"}
		self.PIV_Type = 4
	elseif Type == 5 then
		self.Model = {"models/vj_piv/hl2/main/kleiner.mdl"}
		self.PIV_Type = 5
	elseif Type == 6 then
		self.Model = {"models/vj_piv/hl2/main/magnusson.mdl"}
		self.PIV_Type = 6
	elseif Type == 7 then
		self.Model = {"models/vj_piv/hl2/main/monk.mdl"}
		self.PIV_Type = 7
	elseif Type == 8 then
		self.Model = {"models/vj_piv/hl2/main/odessa.mdl"}
		self.PIV_Type = 8
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	if self.PIV_Type == 1 then -- Barney
		self:SetSkin(math.random(0,1))
		self.PIV_IsMetropolice = true
	elseif self.PIV_Type == 3 then -- Eli
		self:SetSkin(math.random(0,1))
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by Warkin Iskander Volselli, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/