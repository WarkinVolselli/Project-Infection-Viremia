AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/shikari/Fast_torso.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 50

ENT.AnimTbl_IdleStand = {ACT_IDLE}
ENT.AnimTbl_Walk = {ACT_WALK}
ENT.AnimTbl_Run = {ACT_RUN}

ENT.PIV_IsSpecial = true

ENT.PIV_HasSubclasses = false
ENT.PIV_AllowedToClimb = false
ENT.PIV_HasWeapons = false
ENT.PIV_AllowedToRest = false
ENT.PIV_CanBeThrower = false
ENT.PIV_CanBreakDoors = false
ENT.PIV_CanBeCrippled = false

ENT.SoundTbl_Alert = {"vj_piv/shikari/pain1.wav","vj_piv/shikari/pain2.wav","vj_piv/shikari/pain3.wav","vj_piv/shikari/pain4.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"npc/fast_zombie/leap1.wav"}
ENT.SoundTbl_Pain = {"vj_piv/shikari/pain1.wav","vj_piv/shikari/pain2.wav","vj_piv/shikari/pain3.wav","vj_piv/shikari/pain4.wav"}
ENT.SoundTbl_Death = {"vj_piv/shikari/die1.wav","vj_piv/shikari/die2.wav","vj_piv/shikari/die3.wav","vj_piv/shikari/die4.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,4))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	self.MeleeAttackAnimationAllowOtherTasks = false
	self.MeleeAttackDamage = math.random(5,10)
	self.HasMeleeAttackKnockBack = false
	self.MeleeAttackDistance = 40
	self.MeleeAttackDamageDistance = 60
	self.SoundTbl_MeleeAttack = {"vj_piv/husk/zombie_slice_1.wav","vj_piv/husk/zombie_slice_2.wav","vj_piv/husk/zombie_slice_3.wav","vj_piv/husk/zombie_slice_4.wav","vj_piv/husk/zombie_slice_5.wav","vj_piv/husk/zombie_slice_6.wav"}
	self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	
		
	self.AnimTbl_MeleeAttack = {
		"vjseq_attack01"
	}
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/