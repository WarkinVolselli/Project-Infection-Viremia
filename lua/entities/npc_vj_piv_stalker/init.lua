AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/hl2/combine/Combine_Soldier.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.PIV_IsZombine = true

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self:SetMaterial("Models/effects/vol_light001")
self:DrawShadow(false)
self:SetRenderFX(kRenderFxDistort)
self.VJ_NoTarget = true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
self.VJ_NoTarget = false
self:SetMaterial("models/alyx/emptool_glow")
VJ_EmitSound(self,{"ambient/energy/spark1.wav","ambient/energy/spark2.wav","ambient/energy/spark3.wav","ambient/energy/spark4.wav","ambient/energy/spark5.wav","ambient/energy/spark6.wav"},100,math.random(100,95))
   timer.Simple(0.2,function() if IsValid(self) then
         self:SetMaterial("Models/effects/vol_light001")
    end
	end)
   timer.Simple(0.4,function() if IsValid(self) then
         self:SetMaterial("models/alyx/emptool_glow")
		 VJ_EmitSound(self,{"ambient/energy/spark1.wav","ambient/energy/spark2.wav","ambient/energy/spark3.wav","ambient/energy/spark4.wav","ambient/energy/spark5.wav","ambient/energy/spark6.wav"},100,math.random(100,95))
    end
	end)
   timer.Simple(0.6,function() if IsValid(self) then
         self:SetMaterial("Models/effects/vol_light001")
    end
	end)
   timer.Simple(0.8,function() if IsValid(self) then
         self:SetMaterial("models/alyx/emptool_glow")
		 VJ_EmitSound(self,{"ambient/energy/zap1.wav","ambient/energy/zap2.wav","ambient/energy/zap3.wav","ambient/energy/zap5.wav","ambient/energy/zap6.wav","ambient/energy/zap7.wav","ambient/energy/zap8.wav","ambient/energy/zap9.wav"},100,math.random(100,95))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
    end
	end)
	timer.Simple(1,function() if IsValid(self) then
         self:SetMaterial("")
	self:DrawShadow(true)
	self:SetRenderFX(kRenderFxNone)
    end
end)
	
if self.DeathAnimationCodeRan == false then
	ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
	ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
	self:SetMaterial("")
	self:DrawShadow(true)
	self:SetRenderFX(kRenderFxNone)
end

end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	self.AnimTbl_Death = {"vjseq_nz_death_elec_1","vjseq_nz_death_elec_2","vjseq_nz_death_elec_3","vjseq_nz_death_elec_4","vjseq_nz_death_elec_5"} 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterStartTimer()
self:SetMaterial("models/alyx/emptool_glow")
self.VJ_NoTarget = false
VJ_EmitSound(self,{"ambient/energy/spark1.wav","ambient/energy/spark2.wav","ambient/energy/spark3.wav","ambient/energy/spark4.wav","ambient/energy/spark5.wav","ambient/energy/spark6.wav"},100,math.random(100,95))
   timer.Simple(0.2,function() if IsValid(self) then
         self:SetMaterial("Models/effects/vol_light001")
    end
	end)
   timer.Simple(0.4,function() if IsValid(self) then
         self:SetMaterial("models/alyx/emptool_glow")
		 VJ_EmitSound(self,{"ambient/energy/spark1.wav","ambient/energy/spark2.wav","ambient/energy/spark3.wav","ambient/energy/spark4.wav","ambient/energy/spark5.wav","ambient/energy/spark6.wav"},100,math.random(100,95))
    end
	end)
   timer.Simple(0.6,function() if IsValid(self) then
         self:SetMaterial("Models/effects/vol_light001")
    end
	end)
   timer.Simple(0.8,function() if IsValid(self) then
         self:SetMaterial("models/alyx/emptool_glow")
		 VJ_EmitSound(self,{"ambient/energy/spark1.wav","ambient/energy/spark2.wav","ambient/energy/spark3.wav","ambient/energy/spark4.wav","ambient/energy/spark5.wav","ambient/energy/spark6.wav"},100,math.random(100,95))
    end
	end)
	timer.Simple(1,function() if IsValid(self) then
         self:SetMaterial("Models/effects/vol_light001")
	     self.VJ_NoTarget = true
    end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnLeapAttack_AfterStartTimer()
self:SetMaterial("models/alyx/emptool_glow")
self.VJ_NoTarget = false
VJ_EmitSound(self,{"ambient/energy/spark1.wav","ambient/energy/spark2.wav","ambient/energy/spark3.wav","ambient/energy/spark4.wav","ambient/energy/spark5.wav","ambient/energy/spark6.wav"},100,math.random(100,95))
   timer.Simple(0.2,function() if IsValid(self) then
         self:SetMaterial("Models/effects/vol_light001")
    end
	end)
   timer.Simple(0.4,function() if IsValid(self) then
         self:SetMaterial("models/alyx/emptool_glow")
		 VJ_EmitSound(self,{"ambient/energy/spark1.wav","ambient/energy/spark2.wav","ambient/energy/spark3.wav","ambient/energy/spark4.wav","ambient/energy/spark5.wav","ambient/energy/spark6.wav"},100,math.random(100,95))
    end
	end)
   timer.Simple(0.6,function() if IsValid(self) then
         self:SetMaterial("Models/effects/vol_light001")
    end
	end)
   timer.Simple(0.8,function() if IsValid(self) then
         self:SetMaterial("models/alyx/emptool_glow")
		 VJ_EmitSound(self,{"ambient/energy/spark1.wav","ambient/energy/spark2.wav","ambient/energy/spark3.wav","ambient/energy/spark4.wav","ambient/energy/spark5.wav","ambient/energy/spark6.wav"},100,math.random(100,95))
    end
	end)
	timer.Simple(1,function() if IsValid(self) then
         self:SetMaterial("Models/effects/vol_light001")
	     self.VJ_NoTarget = true
    end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_Miss()
self:SetMaterial("Models/effects/vol_light001")
self:DrawShadow(false)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)

    self:SetMaterial("models/alyx/emptool_glow")
    VJ_EmitSound(self,{"ambient/energy/spark1.wav","ambient/energy/spark2.wav","ambient/energy/spark3.wav","ambient/energy/spark4.wav","ambient/energy/spark5.wav","ambient/energy/spark6.wav"},100,math.random(100,95))
	
	timer.Simple(0.2,function() if IsValid(self) then
		self:SetMaterial("Models/effects/vol_light001")
		end
	end)

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
	
if self.PIV_Crippled == true then
self.VJ_NoTarget = false
self:SetMaterial("models/alyx/emptool_glow")
VJ_EmitSound(self,{"ambient/energy/spark1.wav","ambient/energy/spark2.wav","ambient/energy/spark3.wav","ambient/energy/spark4.wav","ambient/energy/spark5.wav","ambient/energy/spark6.wav"},100,math.random(100,95))
self:SetMaterial("")
ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
end

end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/