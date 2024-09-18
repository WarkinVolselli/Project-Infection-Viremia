AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, coPIVed, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
function ENT:CustomInitialize()
timer.Simple(0.1,function()
local death = VJ.PICK({"Infectiondeath","Infectiondeath2","Death_04"})
self:VJ_ACT_PLAYACTIVITY(death,true,4,false)
self.Behavior = VJ_BEHAVIOR_PASSIVE_NATURE  
self.GodMode = true
self.VJ_NoTarget = true
self.DisableMakingSelfEnemyToNPCs = true
self.DisableChasingEnemy = true
self.DisableFindEnemy = true
self.DisableWandering = true
self.MovementType = VJ_MOVETYPE_STATIONARY
self.CanTurnWhileStationary = false
self.HasSounds = false
self.GodMode = true
self.CanFlinch = 0
end)

timer.Simple(4,function()
if IsValid(self) then
local rise = VJ.PICK({"Infectionrise","Infectionrise2"})
self:VJ_ACT_PLAYACTIVITY(rise,true,4,false)
self.GodMode = false
self.VJ_NoTarget = false
self.DisableMakingSelfEnemyToNPCs = false
self.DisableChasingEnemy = false
self.DisableFindEnemy = false
self.DisableWandering = false
self.HasSounds = true
self.GodMode = false

    if GetConVar("vj_piv_rebirth"):GetInt() == 1 && GetConVar("vj_piv_rebirthall"):GetInt() == 1 && self:GetClass() != "npc_vj_piv_brawler_boss" then
		self.PIV_CanMutate = false
		self.PIV_Mutated = true
		self:PIV_CustomMutate()
	end
		
timer.Simple(4,function()
if IsValid(self) then
self.Behavior = VJ_BEHAVIOR_AGGRESSIVE 
self.MovementType = VJ_MOVETYPE_GROUND
self.CanFlinch = 1
end
end)
end
end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,GetCorpse)
GetCorpse:VJ_PIV_CreateBoneMerge(GetCorpse,self.Bonemerge:GetModel(),self.Bonemerge:GetSkin(),self.Bonemerge:GetColor(),self.Bonemerge:GetMaterial(),self.Bonemerge:GetPlayerColor())
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:BonemergeCorpse(dmginfo,hitgroup,GetCorpse)    
   if IsValid(self.Bonemerge) then    
        GetCorpse:VJ_LNRCreateBoneMerge(GetCorpse,self.Bonemerge:GetModel(),self.Bonemerge:GetSkin(),self.Bonemerge:GetColor(),self.Bonemerge:GetMaterial(),self.Bonemerge:GetPlayerColor())    
        GetCorpse:SetMaterial("hud/killicons/default")
    end    
end  
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()	

end  
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, coPIVed, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/