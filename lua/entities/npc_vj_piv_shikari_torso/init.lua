include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.Model = {"models/vj_piv/specials/shikari/Fast_torso.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
	self.StartHealth = 50

	self.PIV_IsSpecial = true

	self.PIV_HasSubclasses = false
	self.PIV_AllowedToClimb = false
	self.PIV_HasWeapons = false
	self.PIV_AllowedToRest = false
	self.PIV_CanBeThrower = false
	self.PIV_CanBreakDoors = false
	self.PIV_CanBeCrippled = false


	self.MeleeAttackAnimationAllowOtherTasks = false
	self.MeleeAttackDamage = math.random(5,10)
	self.HasMeleeAttackKnockBack = false
	self.MeleeAttackDistance = 40
	self.MeleeAttackDamageDistance = 60
	self.SoundTbl_MeleeAttack = {"vj_piv/husk/zombie_slice_1.wav","vj_piv/husk/zombie_slice_2.wav","vj_piv/husk/zombie_slice_3.wav","vj_piv/husk/zombie_slice_4.wav","vj_piv/husk/zombie_slice_5.wav","vj_piv/husk/zombie_slice_6.wav"}
	self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	

	self.AnimTbl_MeleeAttack = {"vjseq_attack01"}
	self.TimeUntilMeleeAttackDamage = 0.5
end
--------------------
function ENT:Zombie_GiveVoice()
	self.SoundTbl_Alert = {
		"vj_piv/shikari/pain1.wav",
		"vj_piv/shikari/pain2.wav",
		"vj_piv/shikari/pain3.wav",
		"vj_piv/shikari/pain4.wav"
	}
	self.SoundTbl_BeforeMeleeAttack = {"npc/fast_zombie/leap1.wav"}
	self.SoundTbl_Pain = {
		"vj_piv/shikari/pain1.wav",
		"vj_piv/shikari/pain2.wav",
		"vj_piv/shikari/pain3.wav",
		"vj_piv/shikari/pain4.wav"
	}
	self.SoundTbl_Death = {
		"vj_piv/shikari/die1.wav",
		"vj_piv/shikari/die2.wav",
		"vj_piv/shikari/die3.wav",
		"vj_piv/shikari/die4.wav"
	}
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,4))
end
--------------------