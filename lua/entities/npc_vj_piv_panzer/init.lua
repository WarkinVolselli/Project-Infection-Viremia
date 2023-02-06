AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/military/juggernaut.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 1000
ENT.PIV_HasArmor = true

ENT.HullType = HULL_MEDIUM_TALL

ENT.GeneralSoundPitch1 = 70
ENT.GeneralSoundpitch2 = 70

ENT.DeathAnimationChance = 1

ENT.PIV_LegHP = 500

ENT.SoundTbl_Idle = {
	"vj_piv/mil_zomb/radio/idle_1.wav",
	"vj_piv/mil_zomb/radio/idle_2.wav",
	"vj_piv/mil_zomb/radio/idle_3.wav",
	"vj_piv/mil_zomb/radio/idle_4.wav"
}
ENT.SoundTbl_Alert = {
	"vj_piv/mil_zomb/radio/alert_1.wav",
	"vj_piv/mil_zomb/radio/alert_2.wav",
	"vj_piv/mil_zomb/radio/alert_3.wav",
	"vj_piv/mil_zomb/radio/alert_4.wav",
	"vj_piv/mil_zomb/radio/alert_5.wav",
	"vj_piv/mil_zomb/radio/alert_6.wav",
	"vj_piv/mil_zomb/radio/alert_7.wav"
}
ENT.SoundTbl_CombatIdle = {
	"vj_piv/mil_zomb/radio/idle_1.wav",
	"vj_piv/mil_zomb/radio/idle_2.wav",
	"vj_piv/mil_zomb/radio/idle_3.wav",
	"vj_piv/mil_zomb/radio/idle_4.wav",
	"vj_piv/mil_zomb/radio/idle_1.wav",
	"vj_piv/mil_zomb/radio/idle_2.wav",
	"vj_piv/mil_zomb/radio/idle_3.wav",
	"vj_piv/mil_zomb/radio/idle_4.wav",
	"vj_piv/mil_zomb/radio/alert_1.wav",
	"vj_piv/mil_zomb/radio/alert_2.wav",
	"vj_piv/mil_zomb/radio/alert_3.wav",
	"vj_piv/mil_zomb/radio/alert_4.wav",
	"vj_piv/mil_zomb/radio/alert_5.wav",
	"vj_piv/mil_zomb/radio/alert_6.wav",
	"vj_piv/mil_zomb/radio/alert_7.wav"
}
ENT.SoundTbl_BeforeMeleeAttack = {
	"vj_piv/mil_zomb/radio/alert_1.wav",
	"vj_piv/mil_zomb/radio/alert_2.wav",
	"vj_piv/mil_zomb/radio/alert_3.wav",
	"vj_piv/mil_zomb/radio/alert_4.wav",
	"vj_piv/mil_zomb/radio/alert_5.wav",
	"vj_piv/mil_zomb/radio/alert_6.wav",
	"vj_piv/mil_zomb/radio/alert_7.wav"
}
ENT.SoundTbl_Pain = {
	"vj_piv/mil_zomb/radio/pain_1.wav",
	"vj_piv/mil_zomb/radio/pain_2.wav",
	"vj_piv/mil_zomb/radio/pain_3.wav",
	"vj_piv/mil_zomb/radio/pain_4.wav"
}
ENT.SoundTbl_Death = {
	"vj_piv/mil_zomb/radio/pain_1.wav",
	"vj_piv/mil_zomb/radio/pain_2.wav",
	"vj_piv/mil_zomb/radio/pain_3.wav",
	"vj_piv/mil_zomb/radio/pain_4.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,1))
	self:SetModelScale(1.2)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	-- When Crawling or Crippled --
    if self.PIV_Crippled or self.PIV_FuckingCrawlingLittleCunt then
		self.MeleeAttackAnimationAllowOtherTasks = false
		
		self.MeleeAttackDamage = math.random(15,20)
		self.HasMeleeAttackKnockBack = false
		self.MeleeAttackDistance = 40
        self.MeleeAttackDamageDistance = 60
		self.SoundTbl_MeleeAttack = {"vj_piv/z_hit-01.wav","vj_piv/z_hit-02.wav","vj_piv/z_hit-03.wav","vj_piv/z_hit-04.wav","vj_piv/z_hit-05.wav","vj_piv/z_hit-06.wav"}
		self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	
		
		self.AnimTbl_MeleeAttack = {
			"vjseq_crawl_attack",
			"vjseq_crawl_attack2"
		}

	return end

	-- When Standing --
	if !self:IsMoving()	then

		self.MeleeAttackAnimationAllowOtherTasks = false
			self.MeleeAttackDamage = math.random(15,20)
			self.HasMeleeAttackKnockBack = false
			self.MeleeAttackDistance = 40
			self.MeleeAttackDamageDistance = 60
			self.SoundTbl_MeleeAttack = {"vj_piv/z_hit-01.wav","vj_piv/z_hit-02.wav","vj_piv/z_hit-03.wav","vj_piv/z_hit-04.wav","vj_piv/z_hit-05.wav","vj_piv/z_hit-06.wav"}
			self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	
			
			self.AnimTbl_MeleeAttack = {
				"vjseq_nz_attack_stand_ad_1",
				"vjseq_nz_attack_stand_ad_2-2",
				"vjseq_nz_attack_stand_ad_2-3",
				"vjseq_nz_attack_stand_ad_2-4",
			}
	        
			if math.random(1,4) == 1 then 
				
				self.MeleeAttackDamage = math.random(20,25)
				self.HasMeleeAttackKnockBack = true
				self.MeleeAttackDistance = 50
				self.MeleeAttackDamageDistance = 70
				self.SoundTbl_MeleeAttack = {"vj_piv/BodyHit-3.wav","vj_piv/BodyHit-4.wav","vj_piv/BodyHit-5.wav","vj_piv/BodyHit-6.wav"}
				self.SoundTbl_MeleeAttackMiss = {"vj_piv/Miss1.wav","vj_piv/Miss2.wav","vj_piv/Miss3.wav","vj_piv/Miss4.wav","vj_piv/Miss5.wav"}	
			
				self.AnimTbl_MeleeAttack = {
					"vjseq_atk_kick"
				}
			
			end
	end


	-- When Moving --
	if self:IsMoving() then

		self.MeleeAttackAnimationAllowOtherTasks = true
			self.MeleeAttackDamage = math.random(15,20)
			self.HasMeleeAttackKnockBack = false
			self.MeleeAttackDistance = 40
			self.MeleeAttackDamageDistance = 60
			self.SoundTbl_MeleeAttack = {"vj_piv/z_hit-01.wav","vj_piv/z_hit-02.wav","vj_piv/z_hit-03.wav","vj_piv/z_hit-04.wav","vj_piv/z_hit-05.wav","vj_piv/z_hit-06.wav"}
			self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	
		
		 if self.PIV_Mutated == true then
		 
			self.AnimTbl_MeleeAttack = {
				"vjges_melee_moving01",
				"vjges_melee_moving02",
				"vjges_melee_moving03",
				"vjges_melee_moving04",
				"vjges_melee_moving05",
				"vjges_melee_moving06",
			}
			
		else
			
			self.AnimTbl_MeleeAttack = {
				"vjges_nz_attack_walk_ad_1",
				"vjges_nz_attack_walk_ad_2",
				"vjges_nz_attack_walk_ad_3",
				"vjges_nz_attack_walk_ad_4",
				"vjges_nz_attack_walk_au_1",
				"vjges_nz_attack_walk_au_2",
				"vjges_nz_attack_walk_au_3",
				"vjges_nz_attack_walk_au_4"
			}
			
			end
		end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	dmginfo:ScaleDamage(0.5)

	if hitgroup == HITGROUP_HEAD then return end
		if (dmginfo:IsBulletDamage()) then
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

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PIV_CustomMutate()
self.AnimTbl_Walk = {ACT_WALK}
self.AnimTbl_Run = {ACT_SPRINT}

self.StartHealth = self.StartHealth *1.5
self:SetHealth(self.StartHealth)
		
local mymaxhealth = self:Health()
self:SetMaxHealth(mymaxhealth)

self.PIV_LegHP = self.PIV_LegHP *2

if GetConVar("vj_piv_lights"):GetInt() == 1 then 

self.Light2 = ents.Create("light_dynamic")
self.Light2:SetKeyValue("brightness", "7")
self.Light2:SetKeyValue("distance", "50")
self.Light2:SetLocalPos(self:GetPos())
self.Light2:SetLocalAngles(self:GetAngles())
self.Light2:Fire("Color", "216 255 0 255")
self.Light2:SetParent(self)
self.Light2:Spawn()
self.Light2:Activate()
self.Light2:Fire("SetParentAttachment","eyes")
self.Light2:Fire("TurnOn", "", 0)
self:DeleteOnRemove(self.Light2)

end

end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/