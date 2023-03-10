AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/virulent/Poison.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 400

ENT.PIV_Infection = true
ENT.PIV_Infection_IsWalker = true

ENT.BloodColor = "Yellow" -- The blood type, this will determine what it should use (decal, particle, etc.)

ENT.AnimTbl_MeleeAttack = {"vjges_melee_01"} -- Melee Attack Animations
ENT.MeleeAttackDistance = 32 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 60 -- How far does the damage go?
ENT.MeleeAttackDamage = math.random(20,25)

ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeUseAttachmentForPos = true -- Should the projectile spawn on a attachment?
ENT.RangeUseAttachmentForPosID = "Blood_Right" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true
ENT.AnimTbl_RangeAttack = {"vjges_throw"} -- Range Attack Animations
ENT.RangeAttackAnimationStopMovement = false -- Should it stop moving when performing a range attack?
ENT.RangeAttackEntityToSpawn = "obj_vj_piv_flesh" -- The entity that is spawned when range attacking
ENT.RangeDistance = 600 -- This is how far away it can shoot
ENT.RangeToMeleeDistance = 200 -- How close does it have to be until it uses melee?
ENT.TimeUntilRangeAttackProjectileRelease = 1 -- How much time until the projectile code is ran?
ENT.NextRangeAttackTime = 5 -- How much time until it can use a range attack?
ENT.RangeAttackExtraTimers = {1.05, 1.1, 1.15, 1.2} -- Extra range attack timers | it will run the projectile code after the given amount of seconds
ENT.Immune_AcidPoisonRadiation = true -- Makes the SNPC not get damage from Acid, posion, radiation
	-- ====== Flinching Code ====== --
ENT.CanFlinch = 1 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.FlinchChance = 4
ENT.HitGroupFlinching_Values = {
	{HitGroup={HITGROUP_CHEST}, Animation={"vjges_flinchc"}},
	{HitGroup={HITGROUP_RIGHTARM}, Animation={"vjges_flinchl"}},
	{HitGroup={HITGROUP_RIGHTLEG}, Animation={"vjseq_flinchr"}}
}

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Idle = {"vj_piv/virulent/bloat_idle1.ogg","vj_piv/virulent/bloat_idle2.ogg","vj_piv/virulent/bloat_idle8.ogg","vj_piv/virulent/bloat_idle10.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_01.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_02.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_03.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_04.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_05.ogg"}
ENT.SoundTbl_Alert = {"vj_piv/virulent/bloat_alert_01.wav","vj_piv/virulent/bloat_alert_02.wav","vj_piv/virulent/bloat_alert_03.wav","vj_piv/virulent/bloat_alert_04.wav","vj_piv/virulent/bloat_alert_05.wav"}
ENT.SoundTbl_CombatIdle = {"vj_piv/virulent/bloat_alert_01.wav","vj_piv/virulent/bloat_alert_02.wav","vj_piv/virulent/bloat_alert_03.wav","vj_piv/virulent/bloat_alert_04.wav","vj_piv/virulent/bloat_alert_05.wav","vj_piv/husk/zed_clot_alpha_vox_chuff_01.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_02.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_03.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_04.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_05.ogg"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/virulent/zed_bloater_vox_aggro_01_rev1.ogg","vj_piv/husk/zed_clot_alpha_vox_grab_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grab_03.ogg"}
ENT.SoundTbl_Pain = {"vj_piv/virulent/bloat_vox_pain_01_rev1.ogg","vj_piv/virulent/bloat_vox_pain_02_rev1.ogg","vj_piv/virulent/bloat_vox_pain_04_rev1.ogg","vj_piv/virulent/bloat_vox_pain_06_rev1.ogg","vj_piv/virulent/bloat_vox_pain_08_rev1.ogg","vj_piv/virulent/bloat_vox_pain_09_rev1.ogg"}
ENT.SoundTbl_Death = {"vj_piv/husk/zed_clotalpha_vox_roar_med_01.ogg","vj_piv/husk/zed_clotalpha_vox_roar_med_02.ogg","vj_piv/husk/zed_clotalpha_vox_roar_med_03.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_med_01.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_med_02.ogg"}
ENT.SoundTbl_BeforeRangeAttack = {"vj_piv/virulent/bloat_vox_puke_long_01.ogg","vj_piv/virulent/bloat_vox_puke_med_01.ogg","vj_piv/virulent/bloat_puke_01.wav"}
ENT.SoundTbl_RangeAttack = {"physics/body/body_medium_break2.wav","physics/body/body_medium_break3.wav","physics/body/body_medium_break4.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return self:CalculateProjectile("Curve",self:GetPos() +self:GetUp() *self.RangeAttackPos_Up +self:GetForward() *self.RangeAttackPos_Forward, self:GetEnemy():GetPos() +self:GetEnemy():OBBCenter() +self:GetEnemy():GetRight() *math.Rand(0,60) +self:GetEnemy():GetForward() *math.Rand(-50,50) +self:GetEnemy():GetUp() *math.Rand(-50,50), 600)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()

	self:SetSkin(math.random(0,3))
	
	self:SetCollisionBounds(Vector(22,22,60), Vector(-22,-22,0))
	
    self.NextRunT = CurTime() + math.random(2,6)
	
	local type = math.random(1,2)
	
	if type == 1 then
	self.AnimTbl_Idle = {ACT_IDLE}
	self.AnimTbl_Walk = {ACT_WALK}
	self.AnimTbl_Run = {ACT_WALK}
	self.PIV_MovementAnims = 1
	elseif type == 2 then
	self.AnimTbl_Run = {ACT_WALK_STIMULATED}
	self.PIV_MovementAnims = 2
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	if self:IsMoving()	then
	
		self.MeleeAttackAnimationAllowOtherTasks = true
		
		self.AnimTbl_MeleeAttack = {"vjges_melee_01","vjges_melee_02","vjges_melee_03"}
		self.MeleeAttackDistance = 32 
		self.MeleeAttackDamageDistance = 60 
		self.MeleeAttackDamage = math.random(20,25)
		
	else
	
		self.MeleeAttackAnimationAllowOtherTasks = false
		
		self.AnimTbl_MeleeAttack = {"vjseq_melee_01_standing","vjseq_melee_02_standing","vjseq_melee_03_standing"}
		self.MeleeAttackDistance = 32 
		self.MeleeAttackDamageDistance = 60 
		self.MeleeAttackDamage = math.random(20,25)
		
	end
		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()

    if
		GetConVar("vj_piv_virulent_run"):GetInt() == 1 &&
        self.NextRunT < CurTime() &&
        !self.Running &&
        self:GetEnemy() != nil &&
        !self.LNR_Crippled &&
        !self.Dead &&
        !self:IsBusy() &&
		self.PIV_Mutated == false
		
    then

        VJ_EmitSound(self,self.SoundTbl_Charge,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))

        self.Running = true
        self.RunT = CurTime() + math.random(5,10)

        self.AnimTbl_Run = {ACT_RUN}

    end

    if
        self.Running &&
        self.RunT < CurTime() &&
        !self.Dead &&
        !self.PIV_Crippled && 
		self.PIV_Mutated == false
    then

        VJ_EmitSound(self,self.SoundTbl_Pain,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
		
        self.Running = false
        self.NextRunT = CurTime() + math.random(6,12)
		
		if self.PIV_MovementAnims == 1 then
			self.AnimTbl_Run = {ACT_WALK}
		elseif self.PIV_MovementAnims == 2 then
			self.AnimTbl_Run = {ACT_WALK_STIMULATED}
		end

    end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
	if dmginfo:GetDamage() > 49 or dmginfo:GetDamageForce():Length() > 10000 then
		if self.PIV_NextShoveT < CurTime() then
			self:VJ_ACT_PLAYACTIVITY("vjges_throwwarning",true,false,false)
			self.PIV_NextShoveT = CurTime() + math.random(5,8)
		end
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/