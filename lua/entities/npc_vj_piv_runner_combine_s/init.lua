AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/hl2/combine/Combine_Soldier.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.PIV_IsZombine = true

ENT.SoundTbl_Breath = {"ambient/levels/prison/radio_random1.wav","ambient/levels/prison/radio_random2.wav","ambient/levels/prison/radio_random3.wav","ambient/levels/prison/radio_random4.wav","ambient/levels/prison/radio_random5.wav","ambient/levels/prison/radio_random6.wav","ambient/levels/prison/radio_random7.wav","ambient/levels/prison/radio_random8.wav","ambient/levels/prison/radio_random9.wav","ambient/levels/prison/radio_random10.wav","ambient/levels/prison/radio_random11.wav","ambient/levels/prison/radio_random12.wav","ambient/levels/prison/radio_random13.wav","ambient/levels/prison/radio_random14.wav"}
ENT.SoundTbl_Idle = {"vj_piv/combinezombie/zombine_idle1.wav","vj_piv/combinezombie/zombine_idle2.wav","vj_piv/combinezombie/zombine_idle3.wav","vj_piv/combinezombie/zombine_idle4.wav","vj_piv/combinezombie/zombine_idle5.wav","vj_piv/combinezombie/zombine_idle6.wav"}
ENT.SoundTbl_CombatIdle = {"vj_piv/combinezombie/zombine_alert1.wav","vj_piv/combinezombie/zombine_alert2.wav","vj_piv/combinezombie/zombine_alert3.wav","vj_piv/combinezombie/zombine_alert4.wav","vj_piv/combinezombie/zombine_alert5.wav","vj_piv/combinezombie/zombine_alert6.wav","vj_piv/combinezombie/zombine_alert7.wav"}
ENT.SoundTbl_Alert = {"vj_piv/combinezombie/zombine_alert1.wav","vj_piv/combinezombie/zombine_alert2.wav","vj_piv/combinezombie/zombine_alert3.wav","vj_piv/combinezombie/zombine_alert4.wav","vj_piv/combinezombie/zombine_alert5.wav","vj_piv/combinezombie/zombine_alert6.wav","vj_piv/combinezombie/zombine_alert7.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/combinezombie/zombine_readygrenade1.wav","vj_piv/combinezombie/zombine_readygrenade2.wav","vj_piv/combinezombie/zombine_readygrenade3.wav","vj_piv/combinezombie/zombine_charge1.wav","vj_piv/combinezombie/zombine_charge2.wav"}
ENT.SoundTbl_Pain = {"vj_piv/combinezombie/zombine_pain1.wav","vj_piv/combinezombie/zombine_pain2.wav","vj_piv/combinezombie/zombine_pain3.wav","vj_piv/combinezombie/zombine_pain4.wav","vj_piv/combinezombie/zombine_pain5.wav","vj_piv/combinezombie/zombine_pain6.wav","vj_piv/combinezombie/zombine_pain7.wav"}
ENT.SoundTbl_Death = {"vj_piv/combinezombie/zombine_die1.wav","vj_piv/combinezombie/zombine_die2.wav","vj_piv/combinezombie/zombine_die3.wav","vj_piv/combinezombie/zombine_die4.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,1))
	self.NextSoundTime_Breath = VJ_Set(15,60)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)


	if hitgroup == HITGROUP_HEAD then return end
		if (dmginfo:IsBulletDamage()) then
			dmginfo:ScaleDamage(0.75)
			local attacker = dmginfo:GetAttacker()
			self.DamageSpark1 = ents.Create("env_spark")
			self.DamageSpark1:SetKeyValue("Magnitude","1")
			self.DamageSpark1:SetKeyValue("Spark Trail Length","1")
			self.DamageSpark1:SetPos(dmginfo:GetDamagePosition())
			self.DamageSpark1:SetAngles(self:GetAngles())
			self.DamageSpark1:SetParent(self)
			self.DamageSpark1:Spawn()
			self.DamageSpark1:Activate()
			self.DamageSpark1:Fire("StartSpark", "", 0)
			self.DamageSpark1:Fire("StopSpark", "", 0.001)
			self:DeleteOnRemove(self.DamageSpark1)
		end
		if self.HasSounds == true && self.HasImpactSounds == true then VJ_EmitSound(self,"vj_impact_metal/bullet_metal/metalsolid"..math.random(1,10)..".wav",70) 
	end	
	
	if hitgroup == HITGROUP_HEAD && GetConVar("vj_piv_headshot_damage"):GetInt() == 1 then
		dmginfo:ScaleDamage(GetConVarNumber("vj_piv_headshot_damage_mult"))
    end

end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/