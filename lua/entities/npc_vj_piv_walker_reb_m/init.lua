AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/hl2/citizens/rebel/male_01.mdl","models/vj_piv/hl2/citizens/rebel/male_02.mdl","models/vj_piv/hl2/citizens/rebel/male_03.mdl","models/vj_piv/hl2/citizens/rebel/male_04.mdl","models/vj_piv/hl2/citizens/rebel/male_05.mdl","models/vj_piv/hl2/citizens/rebel/male_06.mdl","models/vj_piv/hl2/citizens/rebel/male_07.mdl","models/vj_piv/hl2/citizens/rebel/male_08.mdl","models/vj_piv/hl2/citizens/rebel/male_09.mdl","models/vj_piv/hl2/citizens/rebel/male_10.mdl","models/vj_piv/hl2/citizens/rebel/male_11.mdl","models/vj_piv/hl2/citizens/rebel/male_11.mdl","models/vj_piv/hl2/citizens/rebel/male_12.mdl","models/vj_piv/hl2/citizens/rebel/male_13.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnPreInitialize()
	if GetConVar("vj_piv_extramodels"):GetInt() == 1 then
		self.Model = {"models/vj_piv/hl2/citizens/rebel/male_01.mdl","models/vj_piv/hl2/citizens/rebel/male_02.mdl","models/vj_piv/hl2/citizens/rebel/male_03.mdl","models/vj_piv/hl2/citizens/rebel/male_04.mdl","models/vj_piv/hl2/citizens/rebel/male_05.mdl","models/vj_piv/hl2/citizens/rebel/male_06.mdl","models/vj_piv/hl2/citizens/rebel/male_07.mdl","models/vj_piv/hl2/citizens/rebel/male_08.mdl","models/vj_piv/hl2/citizens/rebel/male_09.mdl","models/vj_piv/hl2/citizens/rebel/male_10.mdl","models/vj_piv/hl2/citizens/rebel/male_11.mdl","models/vj_piv/hl2/citizens/rebel/male_12.mdl","models/vj_piv/hl2/citizens/rebel/male_13.mdl"}
	else
		self.Model = {"models/vj_piv/hl2/citizens/rebel/male_01.mdl","models/vj_piv/hl2/citizens/rebel/male_02.mdl","models/vj_piv/hl2/citizens/rebel/male_03.mdl","models/vj_piv/hl2/citizens/rebel/male_04.mdl","models/vj_piv/hl2/citizens/rebel/male_05.mdl","models/vj_piv/hl2/citizens/rebel/male_06.mdl","models/vj_piv/hl2/citizens/rebel/male_07.mdl","models/vj_piv/hl2/citizens/rebel/male_08.mdl","models/vj_piv/hl2/citizens/rebel/male_09.mdl","models/vj_piv/hl2/citizens/rebel/male_10.mdl","models/vj_piv/hl2/citizens/rebel/male_11.mdl"}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetBodygroup(1,math.random(2,5))
	self:SetBodygroup(2,math.random(1,3))
	self:SetBodygroup(3,math.random(0,2))
	self:SetBodygroup(4,math.random(0,3))
	if math.random(1,5) == 5 then
	self:SetBodygroup(5,1)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/