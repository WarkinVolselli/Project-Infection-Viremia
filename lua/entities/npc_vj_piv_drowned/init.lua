AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/drowned/drowned.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 100

ENT.PIV_IsSpecial = true
ENT.PIV_IsAquatic = true

ENT.PIV_CanBeThrower = false
ENT.PIV_HasWeapons = false
ENT.PIV_CanBeCrawler = false

ENT.Aquatic_SwimmingSpeed_Calm = 100
ENT.Aquatic_SwimmingSpeed_Alerted = 300
ENT.Aquatic_AnimTbl_Calm = {"swimming_all_calm"}
ENT.Aquatic_AnimTbl_Alerted = {"swimming_all"}
		
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
	if self.PIV_Crippled == true or self.PIV_FuckingCrawlingLittleCunt == true then return end
	if self:WaterLevel() > 2 && self:WaterLevel() < 12 then
		self:DoChangeMovementType(VJ_MOVETYPE_AQUATIC)
		self.PIV_CanRest = false
		else
		self:DoChangeMovementType(VJ_MOVETYPE_GROUND)
		if GetConVar("vj_piv_resting"):GetInt() == 1 then
			self.PIV_CanRest = true
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PIV_CustomMutate()
self.AnimTbl_Walk = {ACT_WALK}
self.AnimTbl_Run = {ACT_RUN_RELAXED}

self.StartHealth = self.StartHealth *2
self:SetHealth(self.StartHealth)
		
local mymaxhealth = self:Health()
self:SetMaxHealth(mymaxhealth)

self.PIV_LegHP = self.PIV_LegHP *2

if GetConVar("vj_piv_lights"):GetInt() == 1 then 

self.Light2 = ents.Create("light_dynamic")
self.Light2:SetKeyValue("brightness", "1")
self.Light2:SetKeyValue("distance", "50")
self.Light2:SetLocalPos(self:GetPos())
self.Light2:SetLocalAngles(self:GetAngles())
self.Light2:Fire("Color", "0 161 255 255")
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