AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/fat/fat_male.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 200
ENT.PIV_Infection_IsWalker = false

ENT.AnimTbl_Run = {ACT_RUN}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
    if IsValid(self:GetEnemy()) == true && self.PIV_Mutated == false && !self.Dead && self:GetEnemy() != nil && !self.PIV_Crippled && !self.Running && self.NextRunT < CurTime() && self:GetPos():Distance(self:GetEnemy():GetPos()) < 300 then
        VJ_EmitSound(self,self.SoundTbl_Alert,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
        self.Running = true
		self.AnimTbl_Run = {ACT_SPRINT}
		self.RunT = CurTime() + math.random(5,10)
	end
	
    if self.Running && self.RunT < CurTime() && !self.Dead && !self.PIV_Crippled && self.PIV_Mutated == false then
        self.Running = false
        self.NextRunT = CurTime() + math.random(6,12)
		self.AnimTbl_Run = {ACT_RUN}

        if self:IsMoving() then

			local stop = VJ_PICK({"vjseq_running_to_standing","vjseq_running_to_standing_02","vjseq_shove_forward_01"})
		    self:VJ_ACT_PLAYACTIVITY(stop,true,VJ_GetSequenceDuration(self,tbl),false)
			VJ_EmitSound(self,self.SoundTbl_Pain,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))

        end
    end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/