include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.Model = {"models/vj_piv/military/hazmat.mdl"}
	self.NextSoundTime_Idle = VJ.SET(16, 23)
	self.NextSoundTime_Breath = VJ.SET(7,20)
	self.Immune_AcidPoisonRadiation = true
	self.ImmuneDamagesTable = {DMG_PARALYZE,DMG_NERVEGAS}
	self.PIV_AllowedToVomit = false
	self.PIV_CanBeBiter = false
	if self:GetClass() == "npc_vj_piv_runner_hazmat" then
		self.PIV_IsRunner = true
		self.PIV_Infection_IsWalker = false
	end
end
--------------------
function ENT:Zombie_GiveVoice()
	self.SoundTbl_Breath = {
		"ambient/levels/prison/radio_random1.wav",
		"ambient/levels/prison/radio_random2.wav",
		"ambient/levels/prison/radio_random3.wav",
		"ambient/levels/prison/radio_random4.wav",
		"ambient/levels/prison/radio_random5.wav",
		"ambient/levels/prison/radio_random6.wav",
		"ambient/levels/prison/radio_random7.wav",
		"ambient/levels/prison/radio_random8.wav",
		"ambient/levels/prison/radio_random9.wav",
		"ambient/levels/prison/radio_random10.wav",
		"ambient/levels/prison/radio_random11.wav",
		"ambient/levels/prison/radio_random12.wav",
		"ambient/levels/prison/radio_random13.wav",
		"ambient/levels/prison/radio_random14.wav"
	}
	self.SoundTble_Idle = {
		"vj_piv/mil_zomb/gasmask/idle_1.wav",
		"vj_piv/mil_zomb/gasmask/idle_2.wav",
		"vj_piv/mil_zomb/gasmask/idle_3.wav"
	}
	self.SoundTbl_CombatIdle = {
		"vj_piv/mil_zomb/gasmask/walker_combatidle_1.wav",
		"vj_piv/mil_zomb/gasmask/walker_combatidle_2.wav",
		"vj_piv/mil_zomb/gasmask/walker_combatidle_3.wav",
		"vj_piv/mil_zomb/gasmask/walker_combatidle_4.wav"
	}
	self.SoundTbl_Alert = {
		"vj_piv/mil_zomb/gasmask/alert_1.wav",
		"vj_piv/mil_zomb/gasmask/alert_2.wav",
		"vj_piv/mil_zomb/gasmask/alert_3.wav",
		"vj_piv/mil_zomb/gasmask/alert_4.wav"
	}
	self.SoundTbl_Pain = {
		"vj_piv/mil_zomb/gasmask/pain_1.wav",
		"vj_piv/mil_zomb/gasmask/pain_2.wav",
		"vj_piv/mil_zomb/gasmask/pain_3.wav",
		"vj_piv/mil_zomb/gasmask/pain_4.wav",
		"vj_piv/mil_zomb/gasmask/pain_5.wav",
		"vj_piv/mil_zomb/gasmask/pain_6.wav"
	}
	self.SoundTbl_Death = {
		"vj_piv/mil_zomb/gasmask/death_1.wav",
		"vj_piv/mil_zomb/gasmask/death_2.wav"
	}
	self.SoundTbl_BeforeMeleeAttack = {
		"vj_piv/mil_zomb/gasmask/attack_1.wav",
		"vj_piv/mil_zomb/gasmask/attack_2.wav",
		"vj_piv/mil_zomb/gasmask/attack_3.wav",
		"vj_piv/mil_zomb/gasmask/attack_4.wav",
		"vj_piv/mil_zomb/gasmask/attack_5.wav",
		"vj_piv/mil_zomb/gasmask/attack_6.wav",
		"vj_piv/mil_zomb/gasmask/attack_7.wav",
		"vj_piv/mil_zomb/gasmask/attack_8.wav"
	}
end
--------------------
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
--------------------