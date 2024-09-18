AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/husk/zombie_torso.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 100

ENT.PIV_IsSpecial = true

ENT.PIV_HasSubclasses = false
ENT.PIV_CanBeCrippled = false
ENT.PIV_CanBreakDoors = false
ENT.PIV_HasWeapons = false
ENT.PIV_CanBeThrower = false
ENT.PIV_AllowedToRest = false

ENT.PIV_LegHP = false
ENT.PIV_Husk_Headless = false

ENT.SoundTbl_Idle = {"vj_piv/husk/zed_clot_alpha_vox_chuff_01.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_02.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_03.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_04.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_05.ogg","vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_01.ogg","vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_02.ogg","vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_03.ogg","vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_04.ogg","vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_05.ogg","vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_06.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_03.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_04.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_05.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_06.ogg"}
ENT.SoundTbl_Alert = {"vj_piv/husk/zed_clot_alpha_vox_taunt_chest_01.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_02.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_03.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_long_01.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_long_02.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_long_03.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_med_01.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_med_02.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_med_03.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_short_03.ogg"}
ENT.SoundTbl_CombatIdle = {"vj_piv/husk/zed_clot_alpha_vox_yell_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_yell_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_yell_short_03.ogg","vj_piv/husk/zed_clot_alpha_vox_growl_short_alt_01.ogg","vj_piv/husk/zed_clot_alpha_vox_growl_short_alt_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_01.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_03.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_04.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_05.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_03.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_04.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_05.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_06.ogg"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/husk/zed_calpha_vox_aggro_01.ogg","vj_piv/husk/zed_clot_alpha_vox_bite_fast_02.ogg","vj_piv/husk/zed_clot_alpha_vox_bite_fast_03.ogg","vj_piv/husk/zed_clot_alpha_vox_bite_long_01.ogg","vj_piv/husk/zed_clot_alpha_vox_bite_long_02.ogg","vj_piv/husk/zed_clot_alpha_vox_bite_long_03.ogg","vj_piv/husk/zed_clot_alpha_vox_grab_01.ogg","vj_piv/husk/zed_clot_alpha_vox_grab_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grab_03.ogg","vj_piv/husk/zed_clot_alpha_vox_melee_01.ogg","vj_piv/husk/zed_clot_alpha_vox_melee_02.ogg","vj_piv/husk/zed_clot_alpha_vox_melee_03.ogg","vj_piv/husk/zed_clot_alpha_vox_melee_04.ogg"}
ENT.SoundTbl_Pain = {"vj_piv/husk/zed_clot_alpha_vox_pain_hvy_01.ogg","vj_piv/husk/zed_clot_alpha_vox_pain_hvy_02.ogg","vj_piv/husk/zed_clot_alpha_vox_pain_hvy_03.ogg","vj_piv/husk/zed_clot_alpha_vox_pain_lite_01.ogg","vj_piv/husk/zed_clot_alpha_vox_pain_lite_02.ogg","vj_piv/husk/zed_clot_alpha_vox_pain_lite_03.ogg"}
ENT.SoundTbl_Death = {"vj_piv/husk/zed_clotalpha_vox_roar_med_01.ogg","vj_piv/husk/zed_clotalpha_vox_roar_med_02.ogg","vj_piv/husk/zed_clotalpha_vox_roar_med_03.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_med_01.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_med_02.ogg"}
ENT.SoundTbl_Charge = {"vj_piv/husk/zed_clot_alpha_vox_taunt_chest_01.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_02.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_03.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_long_01.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_long_02.ogg"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	if GetConVar("vj_piv_hl2skins"):GetInt() == 1 then -- if HL2 Skins Only is enabled, this will make the zombies only use HL2 skins
		self:SetSkin(math.random(0,1))
	else
		self:SetSkin(math.random(0,7))
	end

	if self.PIV_Mutated == true then
		self.AnimTbl_Run = {ACT_RUN}
	end
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnPreInitialize()
--[[
	if GetConVar("vj_piv_husk_headless"):GetInt() == 1 && math.random(1,GetConVar("vj_piv_husk_headless_chance"):GetInt()) == 1 then
		if self:GetClass() == "npc_vj_piv_husk_f" then
			self.Model = {"models/vj_piv/specials/husk/zombie_female_beta.mdl"}
		else
			self.Model = {"models/vj_piv/specials/husk/zombie_beta.mdl"}
		end
		self.PIV_Husk_Headless = true
	end
--]]	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	self.MeleeAttackAnimationAllowOtherTasks = false
	self.MeleeAttackDamage = math.random(15,20)
	self.HasMeleeAttackKnockBack = false
	self.MeleeAttackDistance = 40
	self.MeleeAttackDamageDistance = 60
	self.SoundTbl_MeleeAttack = {"vj_piv/husk/zombie_slice_1.wav","vj_piv/husk/zombie_slice_2.wav","vj_piv/husk/zombie_slice_3.wav","vj_piv/husk/zombie_slice_4.wav","vj_piv/husk/zombie_slice_5.wav","vj_piv/husk/zombie_slice_6.wav"}
	self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	
		
	self.AnimTbl_MeleeAttack = {
		"vjseq_attack"
	}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD && GetConVar("vj_piv_headshot_damage"):GetInt() == 1 && self.PIV_Husk_Headless == false then
		dmginfo:ScaleDamage(GetConVarNumber("vj_piv_headshot_damage_mult"))
	elseif hitgroup == HITGROUP_HEAD && self.PIV_Husk_Headless == true then
		dmginfo:ScaleDamage(0.1)
	elseif self.PIV_Husk_Headless == true then
		dmginfo:ScaleDamage(0.8)
	else
		dmginfo:ScaleDamage(0.9)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PIV_CustomMutate()
self.AnimTbl_Walk = {ACT_WALK}
self.AnimTbl_Run = {ACT_RUN}
		
local mymaxhealth = self:Health()
self:SetMaxHealth(mymaxhealth)

self.SoundTbl_CombatIdle = {"vj_piv/husk/zed_clot_alpha_vox_scream_crazy_01.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_crazy_02.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_crazy_03.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_med_01.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_med_02.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_short_03.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_01.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_02.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_03.ogg"}

if GetConVar("vj_piv_lights"):GetInt() == 1 then 

self.Light2 = ents.Create("light_dynamic")
self.Light2:SetKeyValue("brightness", "2")
self.Light2:SetKeyValue("distance", "50")
self.Light2:SetLocalPos(self:GetPos())
self.Light2:SetLocalAngles(self:GetAngles())
self.Light2:Fire("Color", "255 93 0 255")
self.Light2:SetParent(self)
self.Light2:Spawn()
self.Light2:Activate()
if self:GetClass() == "npc_vj_piv_husk_f" then
self.Light2:Fire("SetParentAttachment","head")
else
self.Light2:Fire("SetParentAttachment","headcrab")
end
self.Light2:Fire("TurnOn", "", 0)
self:DeleteOnRemove(self.Light2)

end

end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/