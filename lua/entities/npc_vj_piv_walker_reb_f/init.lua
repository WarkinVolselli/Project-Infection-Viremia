AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/hl2/citizens/female_01.mdl","models/vj_piv/hl2/citizens/female_01_b.mdl","models/vj_piv/hl2/citizens/female_02.mdl","models/vj_piv/hl2/citizens/female_02_b.mdl","models/vj_piv/hl2/citizens/female_03.mdl","models/vj_piv/hl2/citizens/female_03_b.mdl","models/vj_piv/hl2/citizens/female_04.mdl","models/vj_piv/hl2/citizens/female_04_b.mdl","models/vj_piv/hl2/citizens/female_06.mdl","models/vj_piv/hl2/citizens/female_06_b.mdl","models/vj_piv/hl2/citizens/female_07.mdl","models/vj_piv/hl2/citizens/female_07_b.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetBodygroup(1,math.random(2,5))
	self:SetBodygroup(2,math.random(1,3))
	if math.random(1,5) == 5 then
	self:SetBodygroup(4,1)
	end
	if math.random(1,5) == 5 then
	self:SetBodygroup(5,1)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/