include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.Model = {"models/vj_piv/specials/bloodbomber/bloodbomber.mdl"}
	self.StartHealth = 200

	self.PIV_IsSpecial = true
	self.PIV_Shambler = true
	self.PIV_Jogger = true

	self.PIV_HasSubclasses = false
	self.PIV_HasWeapons = false
	self.PIV_CanBeThrower = false

	self.PIV_UseActIdleAimRelaxed = true

	self.TimeUntilRangeAttackProjectileRelease = false -- How much time until the projectile code is ran?
	self.NextRangeAttackTime = 6 -- How much time until it can use a range attack?
	self.NextRangeAttackTime_DoRand = 12

	self.RangeDistance = 1200 -- This is how far away it can shoot
	self.RangeToMeleeDistance = 300 -- How close does it have to be until it uses melee?
	self.RangeAttackAngleRadius = 100 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC

	self.RangeUseAttachmentForPos = true -- Should the projectile spawn on a attachment?
	self.RangeUseAttachmentForPosID = "anim_attachment_RH" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true

	self.HasRangeAttack = true -- Should the SNPC have a range attack?
	self.AnimTbl_RangeAttack = {"vjseq_1gtecombined"} -- Range Attack Animations
	self.RangeAttackEntityToSpawn = "obj_vj_piv_blood_bomb" -- The entity that is spawned when range attacking

	self.NoChaseAfterCertainRange = true -- Should the SNPC not be able to chase when it's between number x and y?
	self.NoChaseAfterCertainRange_FarDistance = 600 -- How far until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
	self.NoChaseAfterCertainRange_CloseDistance = 300 -- How near until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
	self.NoChaseAfterCertainRange_Type = "OnlyRange" -- "Regular" = Default behavior | "OnlyRange" = Only does it if it's able to range attack
end
--------------------
function ENT:Zombie_GiveVoice()
	self.SoundTbl_Idle = {
		"vj_piv/bloodbomber/zombie_locomote_merge_00.wav",
		"vj_piv/bloodbomber/zombie_locomote_merge_01.wav",
		"vj_piv/bloodbomber/zombie_locomote_merge_02.wav",
		"vj_piv/bloodbomber/zombie_locomote_merge_03.wav",
		"vj_piv/bloodbomber/zombie_locomote_merge_04.wav",
		"vj_piv/bloodbomber/zombie_locomote_merge_05.wav",
		"vj_piv/bloodbomber/zombie_locomote_merge_06.wav"
	}
	self.SoundTbl_Alert = {
		"vj_piv/bloodbomber/sslr_vx_taunt_merge_00.wav",
		"vj_piv/bloodbomber/sslr_vx_taunt_merge_01.wav",
		"vj_piv/bloodbomber/sslr_vx_taunt_merge_02.wav"
	}
	self.SoundTbl_CombatIdle = {
		"vj_piv/bloodbomber/super_slasher_taunt_00.wav",
		"vj_piv/bloodbomber/super_slasher_taunt_01.wav",
		"vj_piv/bloodbomber/super_slasher_taunt_02.wav"
	}
	self.SoundTbl_BeforeMeleeAttack = {
		"vj_piv/bloodbomber/super_slasher_snarl_attack_ready_merge_00.wav",
		"vj_piv/bloodbomber/super_slasher_snarl_attack_ready_merge_01.wav",
		"vj_piv/bloodbomber/super_slasher_snarl_attack_ready_merge_02.wav",
		"vj_piv/bloodbomber/super_slasher_snarl_attack_ready_merge_03.wav"
	}
	self.SoundTbl_Pain = {
		"vj_piv/bloodbomber/super_slasher_hit_react_merge_00.wav",
		"vj_piv/bloodbomber/super_slasher_hit_react_merge_01.wav",
		"vj_piv/bloodbomber/super_slasher_hit_react_merge_02.wav",
		"vj_piv/bloodbomber/super_slasher_hit_react_merge_03.wav",
		"vj_piv/bloodbomber/super_slasher_hit_react_merge_04.wav",
		"vj_piv/bloodbomber/super_slasher_hit_react_merge_05.wav"
	}
	self.SoundTbl_Death = {
		"vj_piv/bloodbomber/sslr_vx_death_01_00.wav",
		"vj_piv/bloodbomber/sslr_vx_death_01_01.wav",
		"vj_piv/bloodbomber/sslr_vx_death_01_02.wav"
	}
	self.SoundTbl_BeforeRangeAttack = {
		"vj_piv/bloodbomber/super_slasher_attack_merge_00.wav",
		"vj_piv/bloodbomber/super_slasher_attack_merge_01.wav",
		"vj_piv/bloodbomber/super_slasher_attack_merge_02.wav",
		"vj_piv/bloodbomber/super_slasher_attack_merge_03.wav",
		"vj_piv/bloodbomber/super_slasher_attack_merge_04.wav",
		"vj_piv/bloodbomber/super_slasher_attack_merge_06.wav",
		"vj_piv/bloodbomber/super_slasher_attack_merge_07.wav",
		"vj_piv/bloodbomber/super_slasher_attack_merge_08.wav",
		"vj_piv/bloodbomber/super_slasher_attack_merge_09.wav",
		"vj_piv/bloodbomber/super_slasher_attack_merge_10.wav"
	}
	self.SoundTbl_RangeAttack = {
		"vj_piv/z-swipe-1.wav",
		"vj_piv/z-swipe-2.wav",
		"vj_piv/z-swipe-3.wav",
		"vj_piv/z-swipe-4.wav",
		"vj_piv/z-swipe-5.wav",
		"vj_piv/z-swipe-6.wav"
	}
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,3))
end
--------------------
function ENT:OnDamaged(dmginfo,hitgroup,status)
	if status == "PreDamage" then
		dmginfo:ScaleDamage(0.75)
	end
end
--------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
	if self:GetEnemy() != nil && IsValid(self:GetEnemy()) then
		if self:GetPos():Distance(self:GetEnemy():GetPos()) < 600 then
			self.NextRangeAttackTime = 0
			self.NextRangeAttackTime_DoRand = 0
		else
			self.NextRangeAttackTime = 6
			self.NextRangeAttackTime_DoRand = 12
		end
	else
		self.NextRangeAttackTime = 6
		self.NextRangeAttackTime_DoRand = 12
	end
end
--------------------