AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/deadbodies/bodies_oval_192.mdl"} -- The models it should spawn with | Picks a random one from the table
local ent_tbl = {
	"npc_vj_piv_runner_corpse",
	"npc_vj_piv_runner_corpse",
	"npc_vj_piv_runner_charple",
	"npc_vj_piv_walker_corpse",
	"npc_vj_piv_walker_corpse",
	"npc_vj_piv_walker_charple",
	"npc_vj_piv_shambler",
	"npc_vj_piv_shambler",
	"npc_vj_piv_husk",
	"npc_vj_piv_husk_f",
	"npc_vj_piv_stoker",
	"npc_vj_piv_virulent",
}
ENT.EntitiesToSpawn = {
	{EntityName = "NPC1",SpawnPosition = {vForward=0,vRight=0,vUp=0},Entities = ent_tbl},
	{EntityName = "NPC2",SpawnPosition = {vForward=-50,vRight=50,vUp=0},Entities = ent_tbl},
	{EntityName = "NPC3",SpawnPosition = {vForward=50,vRight=50,vUp=0},Entities = ent_tbl},
	{EntityName = "NPC4",SpawnPosition = {vForward=50,vRight=-50,vUp=0},Entities = ent_tbl},
	{EntityName = "NPC5",SpawnPosition = {vForward=-50,vRight=-50,vUp=0},Entities = ent_tbl},
}

function ENT:CustomOnInitialize() 
	self:SetPos(self:GetPos()+self:GetUp()*-32)	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function  ENT:CustomOnEntitySpawn ( ent ,  spawnKey ,  spawnTbl ,  initSpawn )  

	local rise = VJ_PICK({"vjseq_slumprise_a","vjseq_slumprise_a2","vjseq_slumprise_a_attack","vjseq_slumprise_b","vjseq_infectionrise","vjseq_lying_to_standing_alert","vjseq_lying_to_standing_alert03c","vjseq_lying_to_standing_alert03d"})
	ent:VJ_ACT_PLAYACTIVITY(rise,true,VJ_GetSequenceDuration(self,tbl),false)

	if ent:GetClass() == "npc_vj_piv_virulent" then
		ent:VJ_ACT_PLAYACTIVITY("vjseq_slumprise_a",true,VJ_GetSequenceDuration(self,rise),false)
	end
	
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/