AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/hl2/citizens/female_01.mdl","models/vj_piv/hl2/citizens/female_02.mdl","models/vj_piv/hl2/citizens/female_03.mdl","models/vj_piv/hl2/citizens/female_04.mdl","models/vj_piv/hl2/citizens/female_06.mdl","models/vj_piv/hl2/citizens/female_07.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,7))
	self:SetBodygroup(1,math.random(0,1))
	if math.random(1,5) == 5 then
	self:SetBodygroup(4,1)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/