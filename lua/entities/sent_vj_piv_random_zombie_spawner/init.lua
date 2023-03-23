AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/hunter/plates/plate.mdl"} -- The models it should spawn with | Picks a random one from the table
local ent_tbl = {
	"npc_vj_piv_runner_civ_f",
	"npc_vj_piv_runner_civ_m",
	"npc_vj_piv_runner_reb_f",
	"npc_vj_piv_runner_reb_m",
	"npc_vj_piv_runner_civ_f",
	"npc_vj_piv_runner_civ_m",
	"npc_vj_piv_runner_reb_f",
	"npc_vj_piv_runner_reb_m",
	"npc_vj_piv_runner_corpse",
	"npc_vj_piv_runner_charple",
	"npc_vj_piv_runner_combine_s",
	"npc_vj_piv_runner_combine_p",
	"npc_vj_piv_runner_combine_e",
	"npc_vj_piv_runner_metropolice",
	"npc_vj_piv_walker_civ_f",
	"npc_vj_piv_walker_civ_m",
	"npc_vj_piv_walker_reb_f",
	"npc_vj_piv_walker_reb_m",
	"npc_vj_piv_walker_civ_f",
	"npc_vj_piv_walker_civ_m",
	"npc_vj_piv_walker_reb_f",
	"npc_vj_piv_walker_reb_m",
	"npc_vj_piv_walker_corpse",
	"npc_vj_piv_walker_charple",
	"npc_vj_piv_walker_combine_s",
	"npc_vj_piv_walker_combine_p",
	"npc_vj_piv_walker_combine_e",
	"npc_vj_piv_walker_metropolice",
}
ENT.EntitiesToSpawn = {
	{EntityName = "NPC1",SpawnPosition = {vForward=0,vRight=0,vUp=0},Entities = ent_tbl},
}


function ENT:CustomOnInitialize() 
self:SetMaterial("nodraw")
end


/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/