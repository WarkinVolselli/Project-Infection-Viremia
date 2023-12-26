AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/deadbodies/bodies_oval_192.mdl"} -- The models it should spawn with | Picks a random one from the table
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
	{EntityName = "NPC2",SpawnPosition = {vForward=-50,vRight=50,vUp=0},Entities = ent_tbl},
	{EntityName = "NPC3",SpawnPosition = {vForward=50,vRight=50,vUp=0},Entities = ent_tbl},
	{EntityName = "NPC4",SpawnPosition = {vForward=50,vRight=-50,vUp=0},Entities = ent_tbl},
	{EntityName = "NPC5",SpawnPosition = {vForward=-50,vRight=-50,vUp=0},Entities = ent_tbl},
}

ENT.TimedSpawn_Time = 10

function ENT:CustomOnInitialize() 
	self:SetPos(self:GetPos()+self:GetUp()*-32)	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function  ENT:CustomOnEntitySpawn ( ent ,  spawnKey ,  spawnTbl ,  initSpawn )  

	local rise = VJ_PICK({"vjseq_slumprise_a","vjseq_slumprise_a2","vjseq_slumprise_b","vjseq_infectionrise","vjseq_lying_to_standing_alert","vjseq_lying_to_standing_alert03c","vjseq_lying_to_standing_alert03d"})
	ent:VJ_ACT_PLAYACTIVITY(rise,true,VJ_GetSequenceDuration(self,rise),false)

	if ent:GetClass() == "npc_vj_piv_virulent" then
		ent:VJ_ACT_PLAYACTIVITY("vjseq_slumprise_a",true,VJ_GetSequenceDuration(self,false),false)
	end
	
	if ent:GetClass() == "npc_vj_piv_shikari" then
		local rise2 = VJ_PICK({"vjseq_slumprise_a","vjseq_slumprise_b","vjseq_slumprise_c"})
		ent:VJ_ACT_PLAYACTIVITY(rise2,true,VJ_GetSequenceDuration(self,rise2),false)
	end
	
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/