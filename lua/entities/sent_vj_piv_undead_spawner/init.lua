AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/hunter/plates/plate.mdl"} -- The models it should spawn with | Picks a random one from the table
local ent_tbl = {
	"npc_vj_piv_shambler",
	"npc_vj_piv_shambler_f",
	"npc_vj_piv_shambler",
	"npc_vj_piv_shambler_f",
	"npc_vj_piv_revenant",
	"npc_vj_piv_revenant_f",
	"npc_vj_piv_husk",
	"npc_vj_piv_husk_f",
	"npc_vj_piv_virulent",
	"npc_vj_piv_shikari",
	"npc_vj_piv_blood_bomber",
}
ENT.EntitiesToSpawn = {
	{EntityName = "NPC1",SpawnPosition = {vForward=0,vRight=0,vUp=0},Entities = ent_tbl},
}


function ENT:CustomOnInitialize() 
self:SetNoDraw(true)
end


/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/