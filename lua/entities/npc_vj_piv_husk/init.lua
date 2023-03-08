AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/husk/zombie1.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 200

ENT.NextRunT = 0
ENT.Running = false
ENT.RunT = 0
ENT.PIV_MovementAnims = 0

ENT.PIV_LegHP = 100


ENT.SoundTbl_Idle = {"vj_piv/husk/zed_clot_alpha_vox_chuff_01.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_02.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_03.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_04.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_05.ogg","vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_01.ogg","vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_02.ogg","vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_03.ogg","vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_04.ogg","vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_05.ogg","vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_06.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_03.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_04.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_05.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_06.ogg"}
ENT.SoundTbl_Alert = {"vj_piv/husk/zed_clot_alpha_vox_taunt_chest_01.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_02.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_03.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_long_01.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_long_02.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_long_03.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_med_01.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_med_02.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_med_03.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_short_03.ogg"}
ENT.SoundTbl_CombatIdle = {"vj_piv/husk/zed_clot_alpha_vox_yell_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_yell_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_yell_short_03.ogg","vj_piv/husk/zed_clot_alpha_vox_growl_short_alt_01.ogg","vj_piv/husk/zed_clot_alpha_vox_growl_short_alt_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_01.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_03.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_04.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_05.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_03.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_04.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_05.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_06.ogg"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/husk/zed_calpha_vox_aggro_01.ogg","vj_piv/husk/zed_clot_alpha_vox_bite_fast_02.ogg","vj_piv/husk/zed_clot_alpha_vox_bite_fast_03.ogg","vj_piv/husk/zed_clot_alpha_vox_bite_long_01.ogg","vj_piv/husk/zed_clot_alpha_vox_bite_long_02.ogg","vj_piv/husk/zed_clot_alpha_vox_bite_long_03.ogg","vj_piv/husk/zed_clot_alpha_vox_grab_01.ogg","vj_piv/husk/zed_clot_alpha_vox_grab_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grab_03.ogg","vj_piv/husk/zed_clot_alpha_vox_melee_01.ogg","vj_piv/husk/zed_clot_alpha_vox_melee_02.ogg","vj_piv/husk/zed_clot_alpha_vox_melee_03.ogg","vj_piv/husk/zed_clot_alpha_vox_melee_04.ogg"}
ENT.SoundTbl_Pain = {"vj_piv/husk/zed_clot_alpha_vox_pain_hvy_01.ogg","vj_piv/husk/zed_clot_alpha_vox_pain_hvy_02.ogg","vj_piv/husk/zed_clot_alpha_vox_pain_hvy_03.ogg","vj_piv/husk/zed_clot_alpha_vox_pain_lite_01.ogg","vj_piv/husk/zed_clot_alpha_vox_pain_lite_02.ogg","vj_piv/husk/zed_clot_alpha_vox_pain_lite_03.ogg"}
ENT.SoundTbl_Death = {"vj_piv/husk/zed_clotalpha_vox_roar_med_01.ogg","vj_piv/husk/zed_clotalpha_vox_roar_med_02.ogg","vj_piv/husk/zed_clotalpha_vox_roar_med_03.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_med_01.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_med_02.ogg"}
ENT.SoundTbl_Charge = {"vj_piv/husk/zed_clot_alpha_vox_taunt_chest_01.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_02.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_03.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_long_01.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_long_02.ogg"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,6))
	
    self.NextRunT = CurTime() + math.random(2,6)
		
	local type = math.random(1,4)
	
	if type == 1 then
	self.AnimTbl_Idle = {ACT_IDLE}
	self.AnimTbl_Walk = {ACT_WALK}
	self.AnimTbl_Run = {ACT_WALK}
	self.PIV_MovementAnims = 1
	elseif type == 2 then
	self.AnimTbl_Idle = {ACT_IDLE_STIMULATED}
	self.AnimTbl_Walk = {ACT_WALK_STIMULATED}
	self.AnimTbl_Run = {ACT_WALK_STIMULATED}
	self.PIV_MovementAnims = 2
	elseif type == 3 then
	self.AnimTbl_Idle = {ACT_IDLE_AGITATED}
	self.AnimTbl_Walk = {ACT_WALK_AGITATED}
	self.AnimTbl_Run = {ACT_WALK_AGITATED}
	self.PIV_MovementAnims = 3
	elseif type == 4 then
	self.AnimTbl_Idle = {ACT_IDLE_RELAXED}
	self.AnimTbl_Walk = {ACT_WALK_RELAXED}
	self.AnimTbl_Run = {ACT_WALK_RELAXED}
	self.PIV_MovementAnims = 4
	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()

    if
		GetConVar("vj_piv_husk_run"):GetInt() == 1 &&
        self.NextRunT < CurTime() &&
        !self.Running &&
        self:GetEnemy() != nil &&
        !self.LNR_Crippled &&
        !self.Dead &&
        !self:IsBusy() &&
		self.PIV_Mutated == false
    then

        VJ_EmitSound(self,self.SoundTbl_Charge,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))

        self.Running = true
        self.RunT = CurTime() + math.random(5,10)

        self.AnimTbl_Run = {ACT_RUN}
		
		self.SoundTbl_CombatIdle = {"vj_piv/husk/zed_clot_alpha_vox_scream_crazy_01.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_crazy_02.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_crazy_03.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_med_01.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_med_02.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_short_03.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_01.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_02.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_03.ogg"}

    end

    if
        self.Running &&
        self.RunT < CurTime() &&
        !self.Dead &&
        !self.PIV_Crippled && 
		self.PIV_Mutated == false
    then

        VJ_EmitSound(self,self.SoundTbl_Pain,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
		
        self.Running = false
        self.NextRunT = CurTime() + math.random(6,12)
		
		if self.PIV_MovementAnims == 1 then
			self.AnimTbl_Run = {ACT_WALK}
		elseif self.PIV_MovementAnims == 2 then
			self.AnimTbl_Run = {ACT_WALK_STIMULATED}
		elseif self.PIV_MovementAnims == 3 then
			self.AnimTbl_Run = {ACT_WALK_AGITATED}
		elseif self.PIV_MovementAnims == 4 then
			self.AnimTbl_Run = {ACT_WALK_RELAXED}
		end
	
	    self.SoundTbl_CombatIdle = {"vj_piv/husk/zed_clot_alpha_vox_yell_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_yell_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_yell_short_03.ogg","vj_piv/husk/zed_clot_alpha_vox_growl_short_alt_01.ogg","vj_piv/husk/zed_clot_alpha_vox_growl_short_alt_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_01.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_03.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_04.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_05.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_03.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_04.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_05.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_06.ogg"}

        if self:IsMoving() then

			local stop = VJ_PICK({"vjseq_running_to_standing","vjseq_running_to_standing_02","vjseq_shove_forward_01"})
		    self:VJ_ACT_PLAYACTIVITY(stop,true,VJ_GetSequenceDuration(self,tbl),false)

        end

    end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	if self:IsMoving()	then
	
		self.MeleeAttackAnimationAllowOtherTasks = true
	
		self.MeleeAttackDamage = math.random(15,20)
		self.HasMeleeAttackKnockBack = false
		self.MeleeAttackDistance = 40
		self.MeleeAttackDamageDistance = 60
		self.SoundTbl_MeleeAttack = {"vj_piv/z_hit-01.wav","vj_piv/z_hit-02.wav","vj_piv/z_hit-03.wav","vj_piv/z_hit-04.wav","vj_piv/z_hit-05.wav","vj_piv/z_hit-06.wav"}
		self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	
			
		self.AnimTbl_MeleeAttack = {
			"vjges_attacka",
			"vjges_attackb",
			"vjges_attackc",
			"vjges_attackd",
			"vjges_attacke",
			"vjges_attackf",
			"vjges_fastattack",
			"vjges_swatleftlow",
			"vjges_swatleftmid",
			"vjges_swatrightlow",
			"vjges_swatrightmid"
		}

	else
	
		self.MeleeAttackAnimationAllowOtherTasks = false
	
		self.MeleeAttackDamage = math.random(15,20)
		self.HasMeleeAttackKnockBack = false
		self.MeleeAttackDistance = 40
		self.MeleeAttackDamageDistance = 60
		self.SoundTbl_MeleeAttack = {"vj_piv/z_hit-01.wav","vj_piv/z_hit-02.wav","vj_piv/z_hit-03.wav","vj_piv/z_hit-04.wav","vj_piv/z_hit-05.wav","vj_piv/z_hit-06.wav"}
		self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	
			
		self.AnimTbl_MeleeAttack = {
			"vjseq_attacka_standing",
			"vjseq_attackb_standing",
			"vjseq_attackc_standing",
			"vjseq_attackd_standing",
			"vjseq_attacke_standing",
			"vjseq_attackf_standing",
			"vjseq_fastattack_standing",
			"vjseq_swatleftlow_standing",
			"vjseq_swatleftmid_standing",
			"vjseq_swatrightlow_standing",
			"vjseq_swatrightmid_standing"
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

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD then
	dmginfo:ScaleDamage(1.25)
	else
	dmginfo:ScaleDamage(0.9)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PIV_CustomMutate()
self.AnimTbl_Walk = {ACT_WALK}
self.AnimTbl_Run = {ACT_RUN}

self.StartHealth = self.StartHealth *2
self:SetHealth(self.StartHealth)
		
local mymaxhealth = self:Health()
self:SetMaxHealth(mymaxhealth)

self.PIV_LegHP = self.PIV_LegHP *2

self.SoundTbl_CombatIdle = {"vj_piv/husk/zed_clot_alpha_vox_scream_crazy_01.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_crazy_02.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_crazy_03.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_med_01.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_med_02.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_short_03.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_01.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_02.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_03.ogg"}

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