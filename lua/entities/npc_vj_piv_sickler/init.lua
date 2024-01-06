AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/sickler/stalkerbeta.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 300
ENT.HullType = HULL_HUMAN
ENT.AnimTbl_Run = {ACT_RUN}

ENT.PIV_IsSpecial = true
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.Behavior = VJ_BEHAVIOR_NEUTRAL -- The behavior of the SNPC
	-- VJ_BEHAVIOR_AGGRESSIVE = Default behavior, attacks enemies || VJ_BEHAVIOR_NEUTRAL = Neutral to everything, unless provoked

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Idle = {"vj_piv/sickler/breathing3.wav","vj_piv/sickler/idle1.wav","vj_piv/sickler/idle2.wav","vj_piv/sickler/idle3.wav","vj_piv/sickler/idle4.wav","vj_piv/sickler/idle5.wav","vj_piv/sickler/idle6.wav","vj_piv/sickler/idle7.wav","vj_piv/sickler/idle8.wav","vj_piv/sickler/idle9.wav"}
ENT.SoundTbl_Alert = {"vj_piv/sickler/go_alert1.wav","vj_piv/sickler/go_alert2.wav",}
ENT.SoundTbl_CombatIdle = {"vj_piv/sickler/go_alert3.wav","vj_piv/sickler/scramble1.wav","vj_piv/sickler/scramble2.wav","vj_piv/sickler/scramble3.wav","vj_piv/sickler/scramble4.wav","vj_piv/sickler/scramble5.wav","vj_piv/sickler/scramble6.wav","vj_piv/sickler/scramble7.wav","vj_piv/sickler/scramble8.wav","vj_piv/sickler/scramble9.wav","vj_piv/sickler/scramble10.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/sickler/announce1.wav","vj_piv/sickler/announce2.wav","vj_piv/sickler/announce3.wav"}
ENT.SoundTbl_Pain = {"vj_piv/sickler/pain1.wav","vj_piv/sickler/pain2.wav","vj_piv/sickler/pain3.wav","vj_piv/sickler/pain4.wav"}
ENT.SoundTbl_Death = {"vj_piv/sickler/die1.wav","vj_piv/sickler/die2.wav","vj_piv/sickler/die3.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	self.MeleeAttackDamage = math.random(20,25)
	self.HasMeleeAttackKnockBack = true
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
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/