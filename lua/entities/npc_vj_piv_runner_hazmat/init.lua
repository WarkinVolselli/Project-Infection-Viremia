AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/military/hazmat.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want

ENT.NextSoundTime_Idle = VJ_Set(16, 23)

ENT.SoundTble_Idle = {"vj_piv/mil_zomb/gasmask/idle_1.wav","vj_piv/mil_zomb/gasmask/idle_2.wav","vj_piv/mil_zomb/gasmask/idle_3.wav"}
ENT.SoundTbl_CombatIdle = {"vj_piv/mil_zomb/gasmask/combatidle_1.wav","vj_piv/mil_zomb/gasmask/combatidle_2.wav","vj_piv/mil_zomb/gasmask/combatidle_3.wav","vj_piv/mil_zomb/gasmask/combatidle_4.wav"}
ENT.SoundTbl_Alert = {"vj_piv/mil_zomb/gasmask/alert_1.wav","vj_piv/mil_zomb/gasmask/alert_2.wav","vj_piv/mil_zomb/gasmask/alert_3.wav","vj_piv/mil_zomb/gasmask/alert_4.wav"}
ENT.SoundTbl_Pain = {"vj_piv/mil_zomb/gasmask/pain_1.wav","vj_piv/mil_zomb/gasmask/pain_2.wav","vj_piv/mil_zomb/gasmask/pain_3.wav","vj_piv/mil_zomb/gasmask/pain_4.wav","vj_piv/mil_zomb/gasmask/pain_5.wav","vj_piv/mil_zomb/gasmask/pain_6.wav"}
ENT.SoundTbl_Death = {"vj_piv/mil_zomb/gasmask/infected_death_1.wav","vj_piv/mil_zomb/gasmask/infected_death_2.wav","vj_piv/mil_zomb/gasmask/infected_death_3.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/mil_zomb/gasmask/attack_1.wav","vj_piv/mil_zomb/gasmask/attack_2.wav","vj_piv/mil_zomb/gasmask/attack_3.wav","vj_piv/mil_zomb/gasmask/attack_4.wav","vj_piv/mil_zomb/gasmask/attack_5.wav","vj_piv/mil_zomb/gasmask/attack_6.wav","vj_piv/mil_zomb/gasmask/attack_7.wav","vj_piv/mil_zomb/gasmask/attack_8.wav"}

ENT.Immune_AcidPoisonRadiation = true -- Immune to Acid, Poison and Radiation
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	if GetConVar("vj_piv_militaryskin"):GetInt() == 0 then
	self:SetSkin(0)
	elseif GetConVar("vj_piv_militaryskin"):GetInt() == 1 then
	self:SetSkin(1)
	elseif GetConVar("vj_piv_militaryskin"):GetInt() == 2 then
	self:SetSkin(2)
	elseif GetConVar("vj_piv_militaryskin"):GetInt() == 3 then
	self:SetSkin(3)
	elseif GetConVar("vj_piv_militaryskin"):GetInt() == 4 then
	self:SetSkin(math.random(0,3))
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/