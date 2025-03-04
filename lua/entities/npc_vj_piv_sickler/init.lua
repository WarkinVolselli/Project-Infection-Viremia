include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.Model = {"models/vj_piv/specials/sickler/stalkerbeta.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
	self.StartHealth = 300

	self.PIV_IsSpecial = true

	self.PIV_HasSubclasses = false
	self.PIV_AllowedToClimb = false
	self.PIV_HasWeapons = false
	self.PIV_AllowedToRest = false
	self.PIV_CanBeThrower = false
	self.PIV_CanBeCrippled = false
	self.Behavior = VJ_BEHAVIOR_NEUTRAL -- The behavior of the SNPC
	self.PIV_IsRunner = true
	self.PIV_Infection_IsWalker = false

	self.MeleeAttackDamage = math.random(20,25)
	self.MeleeAttackDistance = 60
	self.MeleeAttackDamageDistance = 80
	self.SoundTbl_MeleeAttack = {"vj_piv/SwordHit-1.wav","vj_piv/SwordHit-2.wav","vj_piv/SwordHit-3.wav","vj_piv/SwordHit-4.wav","vj_piv/SwordHit-5.wav","vj_piv/SwordHit-6.wav","vj_piv/SwordHit-7.wav","vj_piv/SwordHit-8.wav","vj_piv/SwordHit-9.wav"}
	self.SoundTbl_MeleeAttackMiss = {"vj_piv/swing_light_sharp_01.wav","vj_piv/swing_light_sharp_02.wav","vj_piv/swing_light_sharp_03.wav"}
	
	self.MeleeAttackAnimationAllowOtherTasks = true
	
	self.AnimTbl_MeleeAttack = {
		"vjges_attack1",
		"vjges_attack2",
		"vjges_attack3"
	}

end
--------------------
function ENT:Zombie_GiveVoice()
	self.SoundTbl_Idle = {
		"vj_piv/sickler/breathing3.wav",
		"vj_piv/sickler/idle1.wav",
		"vj_piv/sickler/idle2.wav",
		"vj_piv/sickler/idle3.wav",
		"vj_piv/sickler/idle4.wav",
		"vj_piv/sickler/idle5.wav",
		"vj_piv/sickler/idle6.wav",
		"vj_piv/sickler/idle7.wav",
		"vj_piv/sickler/idle8.wav",
		"vj_piv/sickler/idle9.wav"
	}
	self.SoundTbl_Alert = {
		"vj_piv/sickler/go_alert1.wav",
		"vj_piv/sickler/go_alert2.wav"
	}
	self.SoundTbl_CombatIdle = {
		"vj_piv/sickler/go_alert3.wav",
		"vj_piv/sickler/scramble1.wav",
		"vj_piv/sickler/scramble2.wav",
		"vj_piv/sickler/scramble3.wav",
		"vj_piv/sickler/scramble4.wav",
		"vj_piv/sickler/scramble5.wav",
		"vj_piv/sickler/scramble6.wav",
		"vj_piv/sickler/scramble7.wav",
		"vj_piv/sickler/scramble8.wav",
		"vj_piv/sickler/scramble9.wav",
		"vj_piv/sickler/scramble10.wav"
	}
	self.SoundTbl_BeforeMeleeAttack = {
		"vj_piv/sickler/announce1.wav",
		"vj_piv/sickler/announce2.wav",
		"vj_piv/sickler/announce3.wav"
	}
	self.SoundTbl_Pain = {
		"vj_piv/sickler/pain1.wav",
		"vj_piv/sickler/pain2.wav",
		"vj_piv/sickler/pain3.wav",
		"vj_piv/sickler/pain4.wav"
	}
	self.SoundTbl_Death = {
		"vj_piv/sickler/die1.wav",
		"vj_piv/sickler/die2.wav",
		"vj_piv/sickler/die3.wav"
	}
end
--------------------