AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/hulk/hulk.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 3000
ENT.VJ_IsHugeMonster = true
ENT.PIV_Tank = true
ENT.Berserk = false
ENT.PIV_CanMutate = false

ENT.AnimTbl_Death = {"vjseq_death","vjseq_death_11ab"}	

ENT.MeleeAttackDistance = 60
ENT.MeleeAttackDamageDistance = 80
		
ENT.HasRangeAttack = true
ENT.RangeAttackEntityToSpawn = "obj_vj_piv_tankrock"
ENT.AnimTbl_RangeAttack = {"Throw_02","Throw_03","Throw_04"}
ENT.RangeDistance = 2000
ENT.RangeToMeleeDistance = 500
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.RangeUseAttachmentForPos = true
ENT.RangeUseAttachmentForPosID = "debris"
ENT.NextRangeAttackTime = 10

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundpitch2 = 90

ENT.AnimTbl_Walk = {ACT_WALK}
ENT.AnimTbl_Run = {ACT_RUN}

ENT.BeforeRangeAttackPitch = VJ_Set(100, 100)
ENT.AlertSoundLevel = 85
ENT.CombatIdleSoundLevel = 85
ENT.PainSoundLevel = 85
ENT.DeathSoundLevel = 85
ENT.BeforeMeleeAttackSoundLevel = 85
ENT.BeforeRangeAttackSoundLevel = 85
ENT.RangeAttackSoundLevel = 85

ENT.HasSoundTrack = true
ENT.SoundTrackVolume = 0.3
ENT.SoundTbl_SoundTrack = {"vj_piv/music/toni_karengin_walking_corpses.mp3"}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Idle = {"vj_piv/tank/idle/tank_breathe_01.wav","vj_piv/tank/idle/tank_breathe_02.wav","vj_piv/tank/idle/tank_breathe_03.wav","vj_piv/tank/idle/tank_breathe_04.wav","vj_piv/tank/idle/tank_breathe_05.wav","vj_piv/tank/idle/tank_breathe_06.wav","vj_piv/tank/idle/tank_breathe_07.wav","vj_piv/tank/idle/tank_breathe_08.wav","vj_piv/tank/idle/tank_growl_01.wav","vj_piv/tank/idle/tank_growl_02.wav","vj_piv/tank/idle/tank_growl_03.wav","vj_piv/tank/idle/tank_growl_09.wav","vj_piv/tank/idle/tank_growl_10.wav","vj_piv/tank/idle/tank_growl_11.wav","vj_piv/tank/idle/tank_growl_12.wav","vj_piv/tank/idle/tank_voice_01.wav","vj_piv/tank/idle/tank_voice_02.wav","vj_piv/tank/idle/tank_voice_03.wav","vj_piv/tank/idle/tank_voice_04.wav","vj_piv/tank/idle/tank_voice_05.wav","vj_piv/tank/idle/tank_voice_06.wav","vj_piv/tank/idle/tank_voice_07.wav","vj_piv/tank/idle/tank_voice_08.wav","vj_piv/tank/idle/tank_voice_09.wav"}
ENT.SoundTbl_CombatIdle = {"vj_piv/tank/yell/tank_yell_01.wav","vj_piv/tank/yell/tank_yell_02.wav","vj_piv/tank/yell/tank_yell_03.wav","vj_piv/tank/yell/tank_yell_04.wav","vj_piv/tank/yell/tank_yell_05.wav","vj_piv/tank/yell/tank_yell_06.wav","vj_piv/tank/yell/tank_yell_07.wav","vj_piv/tank/yell/tank_yell_08.wav","vj_piv/tank/yell/tank_yell_09.wav","vj_piv/tank/yell/tank_yell_10.wav","vj_piv/tank/yell/tank_yell_12.wav","vj_piv/tank/yell/tank_yell_16.wav","vj_piv/tank/growl/tank_climb_01.wav","vj_piv/tank/growl/tank_climb_02.wav","vj_piv/tank/growl/tank_climb_03.wav","vj_piv/tank/growl/tank_climb_04.wav","vj_piv/tank/growl/tank_climb_05.wav","vj_piv/tank/growl/tank_fail_01.wav","vj_piv/tank/growl/tank_fail_02.wav","vj_piv/tank/growl/tank_fail_03.wav","vj_piv/tank/growl/tank_fail_04.wav","vj_piv/tank/growl/tank_fail_05.wav"}
ENT.SoundTbl_Alert = {"vj_piv/tank/yell/tank_yell_01.wav","vj_piv/tank/yell/tank_yell_02.wav","vj_piv/tank/yell/tank_yell_03.wav","vj_piv/tank/yell/tank_yell_04.wav","vj_piv/tank/yell/tank_yell_05.wav","vj_piv/tank/yell/tank_yell_06.wav","vj_piv/tank/yell/tank_yell_07.wav","vj_piv/tank/yell/tank_yell_08.wav","vj_piv/tank/yell/tank_yell_09.wav","vj_piv/tank/yell/tank_yell_10.wav","vj_piv/tank/yell/tank_yell_12.wav","vj_piv/tank/yell/tank_yell_16.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/tank/attack/tank_attack_01.wav","vj_piv/tank/attack/tank_attack_02.wav","vj_piv/tank/attack/tank_attack_03.wav","vj_piv/tank/attack/tank_attack_04.wav","vj_piv/tank/attack/tank_attack_05.wav","vj_piv/tank/attack/tank_attack_06.wav","vj_piv/tank/attack/tank_attack_07.wav","vj_piv/tank/attack/tank_attack_08.wav","vj_piv/tank/attack/tank_attack_09.wav","vj_piv/tank/attack/tank_attack_10.wav"}
ENT.SoundTbl_BeforeRangeAttack = {"vj_piv/tank/attack/rip_up_rock_1.wav"}
ENT.SoundTbl_RangeAttack = {"vj_piv/tank/yell/tank_throw_01.wav","vj_piv/tank/yell/tank_throw_02.wav","vj_piv/tank/yell/tank_throw_03.wav","vj_piv/tank/yell/tank_throw_04.wav","vj_piv/tank/yell/tank_throw_05.wav","vj_piv/tank/yell/tank_throw_06.wav","vj_piv/tank/yell/tank_throw_09.wav","vj_piv/tank/yell/tank_throw_10.wav","vj_piv/tank/yell/tank_throw_11.wav"}
ENT.SoundTbl_Pain = {"vj_piv/tank/pain/tank_fire_01.wav","vj_piv/tank/pain/tank_fire_02.wav","vj_piv/tank/pain/tank_fire_03.wav","vj_piv/tank/pain/tank_fire_04.wav","vj_piv/tank/pain/tank_fire_05.wav","vj_piv/tank/pain/tank_fire_06.wav","vj_piv/tank/pain/tank_fire_07.wav","vj_piv/tank/pain/tank_fire_08.wav","vj_piv/tank/pain/tank_pain_01.wav","vj_piv/tank/pain/tank_pain_02.wav","vj_piv/tank/pain/tank_pain_03.wav","vj_piv/tank/pain/tank_pain_04.wav","vj_piv/tank/pain/tank_pain_05.wav","vj_piv/tank/pain/tank_pain_06.wav","vj_piv/tank/pain/tank_pain_07.wav","vj_piv/tank/pain/tank_pain_08.wav","vj_piv/tank/pain/tank_pain_09.wav","vj_piv/tank/pain/tank_pain_10.wav"}
ENT.SoundTbl_Death = {"vj_piv/tank/die/tank_death_01.wav","vj_piv/tank/die/tank_death_02.wav","vj_piv/tank/die/tank_death_03.wav","vj_piv/tank/die/tank_death_04.wav","vj_piv/tank/die/tank_death_05.wav","vj_piv/tank/die/tank_death_06.wav","vj_piv/tank/die/tank_death_07.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,2))
	if math.random(1,5) == 1 then
	self:SetSkin(3)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	self.MeleeAttackDamage = math.random(20,25)
	self.HasMeleeAttackKnockBack = true
	self.MeleeAttackDistance = 60
	self.MeleeAttackDamageDistance = 80
	self.SoundTbl_MeleeAttack = {"vj_piv/tank/hit/pound_victim_1.wav","vj_piv/tank/hit/pound_victim_2.wav"}
	self.SoundTbl_MeleeAttackMiss = {"vj_piv/Miss1.wav","vj_piv/Miss2.wav","vj_piv/Miss3.wav","vj_piv/Miss4.wav","vj_piv/Miss4.wav"}	
	
    if self:IsMoving()then
	
		self.MeleeAttackAnimationAllowOtherTasks = true
	
		self.AnimTbl_MeleeAttack = {
			"vjges_attack_moving"
		}

	else
	
		self.MeleeAttackAnimationAllowOtherTasks = false
		
		self.MeleeAttackDamage = math.random(20,25)
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackDistance = 50
		self.MeleeAttackDamageDistance = 70
		
		self.AnimTbl_MeleeAttack = {
			"vjseq_attack"
		}

	end
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackKnockbackVelocity(hitEnt)
	return self:GetForward()*math.random(200, 300) + self:GetUp()*math.random(200, 300)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 2500) + self:GetUp()*math.Rand(-10,10) + self:GetRight()*math.Rand(-10,10)
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)

	if !self:IsMoving() then
	
		self.AnimTbl_Death = {
			"vjseq_death",
			"vjseq_death_11ab"
		}	

    end

	if self:IsMoving() then
	
		self.AnimTbl_Death = {
			"vjseq_death_running_07"
		}

	end

end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/