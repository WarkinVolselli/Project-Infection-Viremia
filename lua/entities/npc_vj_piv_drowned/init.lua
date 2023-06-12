AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/drowned/drowned.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 125

ENT.PIV_Infection_IsDrowned = true

ENT.HasEntitiesToNoCollide = true
ENT.EntitiesToNoCollide = {"obj_vj_piv_boil"}

ENT.SoundTbl_Idle = {"vj_piv/drowned/zmb_vox_spr_spawn_01.wav","vj_piv/drowned/zmb_vox_spr_spawn_02.wav","vj_piv/drowned/zmb_vox_spr_spawn_03.wav","vj_piv/drowned/zmb_vox_spr_spawn_04.wav","vj_piv/drowned/zmb_vox_spr_spawn_05.wav","vj_piv/drowned/zmb_vox_spr_spawn_06.wav","vj_piv/drowned/zmb_vox_spr_spawn_07.wav","vj_piv/drowned/zmb_vox_spr_spawn_08.wav","vj_piv/drowned/zmb_vox_spr_spawn_09.wav"}
ENT.SoundTbl_Alert = {"vj_piv/drowned/zmb_vox_spr_charge_01.wav","vj_piv/drowned/zmb_vox_spr_charge_02.wav","vj_piv/drowned/zmb_vox_spr_charge_03.wav","vj_piv/drowned/zmb_vox_spr_charge_04.wav","vj_piv/drowned/zmb_vox_spr_charge_05.wav","vj_piv/drowned/zmb_vox_spr_charge_06.wav"}
ENT.SoundTbl_CombatIdle = {"vj_piv/drowned/zmb_vox_spr_charge_01.wav","vj_piv/drowned/zmb_vox_spr_charge_02.wav","vj_piv/drowned/zmb_vox_spr_charge_03.wav","vj_piv/drowned/zmb_vox_spr_charge_04.wav","vj_piv/drowned/zmb_vox_spr_charge_05.wav","vj_piv/drowned/zmb_vox_spr_charge_06.wav"}
ENT.SoundTbl_Pain = {"vj_piv/drowned/zmb_vox_spr_anm_hit_react_left_01.wav","vj_piv/drowned/zmb_vox_spr_anm_hit_react_left_02.wav","vj_piv/drowned/zmb_vox_spr_anm_hit_react_left_03.wav","vj_piv/drowned/zmb_vox_spr_anm_hit_react_left_04.wav","vj_piv/drowned/zmb_vox_spr_anm_hit_react_left_05.wav","vj_piv/drowned/zmb_vox_spr_anm_hit_react_right_01.wav","vj_piv/drowned/zmb_vox_spr_anm_hit_react_right_02.wav","vj_piv/drowned/zmb_vox_spr_anm_hit_react_right_03.wav","vj_piv/drowned/zmb_vox_spr_anm_hit_react_right_04.wav","vj_piv/drowned/zmb_vox_spr_anm_hit_react_right_05.wav"}
ENT.SoundTbl_Death = {"vj_piv/drowned/zmb_vox_spr_anm_death_01.wav","vj_piv/drowned/zmb_vox_spr_anm_death_02.wav","vj_piv/drowned/zmb_vox_spr_anm_death_03.wav","vj_piv/drowned/zmb_vox_spr_anm_death_04.wav","vj_piv/drowned/zmb_vox_spr_anm_death_05.wav","vj_piv/drowned/zmb_vox_spr_anm_death_06.wav","vj_piv/drowned/zmb_vox_spr_anm_death_07.wav","vj_piv/drowned/zmb_vox_spr_anm_death_08.wav","vj_piv/drowned/zmb_vox_spr_anm_death_09.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/drowned/zmb_vox_spr_anm_sprint_attack_1_01.wav","vj_piv/drowned/zmb_vox_spr_anm_sprint_attack_1_02.wav","vj_piv/drowned/zmb_vox_spr_anm_sprint_attack_1_03.wav","vj_piv/drowned/zmb_vox_spr_anm_sprint_attack_1_04.wav","vj_piv/drowned/zmb_vox_spr_anm_sprint_attack_2_01.wav","vj_piv/drowned/zmb_vox_spr_anm_sprint_attack_2_02.wav","vj_piv/drowned/zmb_vox_spr_anm_sprint_attack_2_03.wav","vj_piv/drowned/zmb_vox_spr_anm_sprint_attack_2_04.wav","vj_piv/drowned/zmb_vox_spr_anm_sprint_attack_3_01.wav","vj_piv/drowned/zmb_vox_spr_anm_sprint_attack_3_02.wav","vj_piv/drowned/zmb_vox_spr_anm_sprint_attack_3_03.wav","vj_piv/drowned/zmb_vox_spr_anm_sprint_attack_3_04.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,3))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
	if self:WaterLevel() > 2 && self:WaterLevel() < 12 then
		self.MovementType = VJ_MOVETYPE_AQUATIC
		self.Aquatic_SwimmingSpeed_Calm = 100
		self.Aquatic_SwimmingSpeed_Alerted = 300
		self.AnimTbl_IdleStand = {ACT_HL2MP_SWIM_IDLE}
		self.Aquatic_AnimTbl_Calm = {"swimming_all_calm"}
		self.Aquatic_AnimTbl_Alerted = {"swimming_all"}
		else
		self.MovementType = VJ_MOVETYPE_GROUND
		self.AnimTbl_IdleStand = {ACT_IDLE}
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/