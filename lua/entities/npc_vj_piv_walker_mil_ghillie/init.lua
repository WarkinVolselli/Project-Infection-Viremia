AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/military/national_guard_ghillie.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 150
ENT.PIV_IsMilitary = true

ENT.PIV_GoblinMode = false
ENT.PIV_LittleBastard = false
ENT.NextCrawlT = 0

ENT.SoundTbl_Breath = {"ambient/levels/prison/radio_random1.wav","ambient/levels/prison/radio_random2.wav","ambient/levels/prison/radio_random3.wav","ambient/levels/prison/radio_random4.wav","ambient/levels/prison/radio_random5.wav","ambient/levels/prison/radio_random6.wav","ambient/levels/prison/radio_random7.wav","ambient/levels/prison/radio_random8.wav","ambient/levels/prison/radio_random9.wav","ambient/levels/prison/radio_random10.wav","ambient/levels/prison/radio_random11.wav","ambient/levels/prison/radio_random12.wav","ambient/levels/prison/radio_random13.wav","ambient/levels/prison/radio_random14.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnPreInitialize()
	if GetConVar("vj_piv_militaryskin"):GetInt() == 0 then
	self.Model = {"models/vj_piv/military/national_guard_ghillie.mdl"}
	elseif GetConVar("vj_piv_militaryskin"):GetInt() == 1 then
	self.Model = {"models/vj_piv/military/us_soldier_ghillie.mdl"}
	elseif GetConVar("vj_piv_militaryskin"):GetInt() == 2 then
	self.Model = {"models/vj_piv/military/us_desert_ghillie.mdl"}
	elseif GetConVar("vj_piv_militaryskin"):GetInt() == 3 then
	self.Model = {"models/vj_piv/military/us_snow_ghillie.mdl"}
	elseif GetConVar("vj_piv_militaryskin"):GetInt() == 4 then
	self.Model = {"models/vj_piv/military/national_guard_ghillie.mdl","models/vj_piv/military/us_soldier_ghillie.mdl","models/vj_piv/military/us_desert_ghillie.mdl","models/vj_piv/military/us_snow_ghillie.mdl"}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self.NextSoundTime_Breath = VJ.SET(7,20)
	self:SetBodygroup(2,math.random(0,2))
	self:SetBodygroup(3,math.random(0,2))
	self:SetBodygroup(4,math.random(0,3))	

	if math.random(1,5) == 1 then
		self:SetSkin(math.random(3,4))
	else
		self:SetSkin(math.random(0,2))
	end
	
	if GetConVar("vj_piv_mil_gasmask"):GetInt() == 1 then
		if math.random(1,GetConVar("vj_piv_mil_gasmask_chance"):GetInt()) == 1 then
			self:SetBodygroup(4,4)
			self.ImmuneDamagesTable = {DMG_PARALYZE,DMG_POISON,DMG_PARALYZE,DMG_POISON,DMG_RADIATION,DMG_NERVEGAS}
			self.NextSoundTime_Idle = VJ.SET(16, 23)
			self.SoundTbl_CombatIdle = {"vj_piv/mil_zomb/gasmask/walker_combatidle_1.wav","vj_piv/mil_zomb/gasmask/walker_combatidle_2.wav","vj_piv/mil_zomb/gasmask/walker_combatidle_3.wav","vj_piv/mil_zomb/gasmask/walker_combatidle_4.wav"}
			self.SoundTbl_Idle = {"vj_piv/mil_zomb/gasmask/idle_1.wav","vj_piv/mil_zomb/gasmask/idle_2.wav","vj_piv/mil_zomb/gasmask/idle_3.wav"}
			self.SoundTbl_Alert = {"vj_piv/mil_zomb/gasmask/alert_1.wav","vj_piv/mil_zomb/gasmask/alert_2.wav","vj_piv/mil_zomb/gasmask/alert_3.wav","vj_piv/mil_zomb/gasmask/alert_4.wav"}
			self.SoundTbl_Pain = {"vj_piv/mil_zomb/gasmask/pain_1.wav","vj_piv/mil_zomb/gasmask/pain_2.wav","vj_piv/mil_zomb/gasmask/pain_3.wav","vj_piv/mil_zomb/gasmask/pain_4.wav","vj_piv/mil_zomb/gasmask/pain_5.wav","vj_piv/mil_zomb/gasmask/pain_6.wav"}
			self.SoundTbl_Death = {"vj_piv/mil_zomb/gasmask/death_1.wav","vj_piv/mil_zomb/gasmask/death_2.wav","vj_piv/mil_zomb/gasmask/death_3.wav"}
			self.SoundTbl_BeforeMeleeAttack = {"vj_piv/mil_zomb/gasmask/attack_1.wav","vj_piv/mil_zomb/gasmask/attack_2.wav","vj_piv/mil_zomb/gasmask/attack_3.wav","vj_piv/mil_zomb/gasmask/attack_4.wav"}
			self.PIV_AllowedToVomit = false
			self.PIV_CanBeBiter = false
		end
	end

	if GetConVar("vj_piv_mil_ghillie_stealth"):GetInt() == 1 && math.random(1,GetConVar("vj_piv_mil_ghillie_stealth_chance"):GetInt()) == 1 && self.PIV_WeHaveAWeapon == false && self.PIV_Thrower == false && self.PIV_Crippled == false && self.PIV_FuckingCrawlingLittleCunt == false then
		self.PIV_LittleBastard = true
		self:SitTheFuckDown()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
	if self.PIV_Crippled == false && self.PIV_LittleBastard == true && self.NextCrawlT < CurTime() then
		if IsValid(self:GetEnemy()) && self:GetPos():Distance(self:GetEnemy():GetPos()) < 150 then
			self:StandTheFuckUp()
		else
			self:SitTheFuckDown()
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:StandTheFuckUp()
	if self.PIV_GoblinMode == true then
		self.HasIdleSounds = true
		self.HasAlertSounds = true
		
		self.NextCrawlT = CurTime() + math.random(5,10)
		
		local stop = VJ.PICK({"vjseq_crouch_to_stand"})
		self:VJ_ACT_PLAYACTIVITY(stop,true,VJ.AnimDuration(self,tbl),false)
		self.PIV_GoblinMode = false
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SitTheFuckDown()
	if self.PIV_GoblinMode == false then
		
		self.HasIdleSounds = false
		self.HasAlertSounds = false
		
		local start = VJ.PICK({"vjseq_stand_to_crouch"})
		self:VJ_ACT_PLAYACTIVITY(start,true,VJ.AnimDuration(self,tbl),false)
		self.PIV_GoblinMode = true
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/