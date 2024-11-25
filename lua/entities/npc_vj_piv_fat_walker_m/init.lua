include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
ENT.Model = {"models/vj_piv/specials/fat/fat_male.mdl"}
ENT.StartHealth = 175
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	if self:GetClass() == "npc_vj_piv_fat_runner_m" then
		self.StartHealth = 150
		self.PIV_IsRunner = true
		self.PIV_Infection_IsWalker = false
	else
		self.GeneralSoundPitch1 = 80
		self.GeneralSoundPitch2 = 90
		self.MeleeAttackSoundPitch = VJ.SET(90, 100)
	end
	self.PIV_UseActIdleStimulated = true
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,11))
end
--------------------
function ENT:Zombie_GiveVoice()
	self.SoundTbl_Idle = {
		"vj_piv/fat/idle_1.mp3",
		"vj_piv/fat/idle_2.mp3",
		"vj_piv/fat/idle_3.mp3",
		"vj_piv/fat/idle_4.mp3",
		"vj_piv/fat/idle_5.mp3",
		"vj_piv/fat/idle_6.mp3",
		"vj_piv/fat/idle_7.mp3",
		"vj_piv/fat/idle_8.mp3"
	}
	self.SoundTbl_CombatIdle = {
		"vj_piv/fat/cidle_1.mp3",
		"vj_piv/fat/cidle_2.mp3",
		"vj_piv/fat/cidle_3.mp3",
		"vj_piv/fat/cidle_4.mp3",
		"vj_piv/fat/cidle_5.mp3",
		"vj_piv/fat/cidle_6.mp3",
		"vj_piv/fat/cidle_7.mp3"
	}
	self.SoundTbl_Alert = {
		"vj_piv/fat/alert_1.mp3",
		"vj_piv/fat/alert_2.mp3",
		"vj_piv/fat/alert_3.mp3",
		"vj_piv/fat/alert_4.mp3",
		"vj_piv/fat/alert_4.mp3",
		"vj_piv/fat/alert_6.mp3",
		"vj_piv/fat/alert_7.mp3",
		"vj_piv/fat/alert_8.mp3",
		"vj_piv/fat/alert_9.mp3",
		"vj_piv/fat/alert_10.mp3"
	}
	self.SoundTbl_BeforeMeleeAttack = {
		"vj_piv/fat/alert_1.mp3",
		"vj_piv/fat/alert_2.mp3",
		"vj_piv/fat/alert_3.mp3",
		"vj_piv/fat/alert_4.mp3",
		"vj_piv/fat/alert_4.mp3",
		"vj_piv/fat/alert_6.mp3",
		"vj_piv/fat/alert_7.mp3",
		"vj_piv/fat/alert_8.mp3",
		"vj_piv/fat/alert_9.mp3",
		"vj_piv/fat/alert_10.mp3"
	}
	self.SoundTbl_Pain = {
		"vj_piv/fat/pain_1.mp3",
		"vj_piv/fat/pain_2.mp3",
		"vj_piv/fat/pain_3.mp3",
		"vj_piv/fat/pain_4.mp3",
		"vj_piv/fat/pain_5.mp3",
		"vj_piv/fat/pain_6.mp3",
		"vj_piv/fat/pain_7.mp3",
		"vj_piv/fat/pain_8.mp3"
	}
	self.SoundTbl_Death = {
		"vj_piv/fat/death_1.mp3",
		"vj_piv/fat/death_2.mp3",
		"vj_piv/fat/death_3.mp3",
		"vj_piv/fat/death_4.mp3"
	}
end
--------------------
function ENT:Zombie_CustomOnTakeDamage(dmginfo,hitgroup,status)
	-- fat bastard
	if hitgroup == HITGROUP_STOMACH then
		dmginfo:ScaleDamage(0.80)
	end
end