AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/bloodbomber/bloodbomber.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 200
ENT.HullType = HULL_HUMAN

ENT.AnimTbl_IdleStand = {ACT_IDLE_AIM_RELAXED}
ENT.AnimTbl_Walk = {ACT_WALK_RELAXED}
ENT.AnimTbl_Run = {ACT_WALK_ANGRY} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves

ENT.TimeUntilRangeAttackProjectileRelease = false -- How much time until the projectile code is ran?
ENT.NextRangeAttackTime = 6 -- How much time until it can use a range attack?
ENT.NextRangeAttackTime_DoRand = 12

ENT.RangeDistance = 1200 -- This is how far away it can shoot
ENT.RangeToMeleeDistance = 300 -- How close does it have to be until it uses melee?
ENT.RangeAttackAngleRadius = 100 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC

ENT.RangeUseAttachmentForPos = true -- Should the projectile spawn on a attachment?
ENT.RangeUseAttachmentForPosID = "anim_attachment_RH" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true

ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.AnimTbl_RangeAttack = {"vjseq_1gtecombined","vjseq_1gtecombined","vjseq_1gtecombined"} -- Range Attack Animations
ENT.RangeAttackEntityToSpawn = "obj_vj_piv_blood_bomb" -- The entity that is spawned when range attacking

ENT.NoChaseAfterCertainRange = true -- Should the SNPC not be able to chase when it's between number x and y?
ENT.NoChaseAfterCertainRange_FarDistance = 600 -- How far until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_CloseDistance = 300 -- How near until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_Type = "OnlyRange" -- "Regular" = Default behavior | "OnlyRange" = Only does it if it's able to range attack

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play

ENT.SoundTbl_Idle = {"vj_piv/bloodbomber/zombie_locomote_merge_00.wav","vj_piv/bloodbomber/zombie_locomote_merge_01.wav","vj_piv/bloodbomber/zombie_locomote_merge_02.wav","vj_piv/bloodbomber/zombie_locomote_merge_03.wav","vj_piv/bloodbomber/zombie_locomote_merge_04.wav","vj_piv/bloodbomber/zombie_locomote_merge_05.wav","vj_piv/bloodbomber/zombie_locomote_merge_06.wav"}
ENT.SoundTbl_Alert = {"vj_piv/bloodbomber/sslr_vx_taunt_merge_00.wav","vj_piv/bloodbomber/sslr_vx_taunt_merge_01.wav","vj_piv/bloodbomber/sslr_vx_taunt_merge_02.wav"}
ENT.SoundTbl_CombatIdle = {"vj_piv/bloodbomber/super_slasher_taunt_00.wav","vj_piv/bloodbomber/super_slasher_taunt_01.wav","vj_piv/bloodbomber/super_slasher_taunt_02.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/bloodbomber/super_slasher_snarl_attack_ready_merge_00.wav","vj_piv/bloodbomber/super_slasher_snarl_attack_ready_merge_01.wav","vj_piv/bloodbomber/super_slasher_snarl_attack_ready_merge_02.wav","vj_piv/bloodbomber/super_slasher_snarl_attack_ready_merge_03.wav"}
ENT.SoundTbl_Pain = {"vj_piv/bloodbomber/super_slasher_hit_react_merge_00.wav","vj_piv/bloodbomber/super_slasher_hit_react_merge_01.wav","vj_piv/bloodbomber/super_slasher_hit_react_merge_02.wav","vj_piv/bloodbomber/super_slasher_hit_react_merge_03.wav","vj_piv/bloodbomber/super_slasher_hit_react_merge_04.wav","vj_piv/bloodbomber/super_slasher_hit_react_merge_05.wav"}
ENT.SoundTbl_Death = {"vj_piv/bloodbomber/sslr_vx_death_01_00.wav","vj_piv/bloodbomber/sslr_vx_death_01_01.wav","vj_piv/bloodbomber/sslr_vx_death_01_02.wav"}
ENT.SoundTbl_BeforeRangeAttack = {"vj_piv/bloodbomber/super_slasher_attack_merge_00.wav","vj_piv/bloodbomber/super_slasher_attack_merge_01.wav","vj_piv/bloodbomber/super_slasher_attack_merge_02.wav","vj_piv/bloodbomber/super_slasher_attack_merge_03.wav","vj_piv/bloodbomber/super_slasher_attack_merge_04.wav","vj_piv/bloodbomber/super_slasher_attack_merge_06.wav","vj_piv/bloodbomber/super_slasher_attack_merge_07.wav","vj_piv/bloodbomber/super_slasher_attack_merge_08.wav","vj_piv/bloodbomber/super_slasher_attack_merge_09.wav","vj_piv/bloodbomber/super_slasher_attack_merge_10.wav"}
ENT.SoundTbl_RangeAttack = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,3))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	dmginfo:ScaleDamage(0.75)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 1250) + self:GetUp()*math.Rand(-10,10) + self:GetRight()*math.Rand(-10,10)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
	if !IsValid(self:GetEnemy()) then
		self.AnimTbl_Walk = {ACT_WALK_RELAXED}
		self.AnimTbl_Run = {ACT_WALK_ANGRY}
	else
		if self:GetPos():Distance(self:GetEnemy():GetPos()) < 600 then
			self.AnimTbl_Walk = {ACT_WALK_ANGRY}
			self.AnimTbl_Run = {ACT_WALK_ANGRY}
			self.NextRangeAttackTime = 0
			self.NextRangeAttackTime_DoRand = 0
		else
			self.AnimTbl_Walk = {ACT_WALK_RELAXED}
			self.AnimTbl_Run = {ACT_RUN}
			self.NextRangeAttackTime = 6
			self.NextRangeAttackTime_DoRand = 12
		end
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/