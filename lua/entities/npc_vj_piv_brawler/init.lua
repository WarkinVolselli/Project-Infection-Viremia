AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/brawler/male_01.mdl","models/vj_piv/specials/brawler/male_02.mdl","models/vj_piv/specials/brawler/male_03.mdl","models/vj_piv/specials/brawler/male_04.mdl","models/vj_piv/specials/brawler/male_05.mdl","models/vj_piv/specials/brawler/male_07.mdl","models/vj_piv/specials/brawler/male_09.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 200
ENT.AnimTbl_IdleStand = {ACT_IDLE}
ENT.AnimTbl_Walk = {ACT_WALK}
ENT.AnimTbl_Run = {ACT_RUN}

ENT.MeleeAttackDistance = 50
ENT.MeleeAttackDamageDistance = 60

ENT.PIV_NextStrafeT = 0
ENT.PIV_NextRunT = 0

ENT.SoundTbl_Idle = {
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-01.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-02.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-03.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-04.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-05.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-06.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-07.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-08.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-09.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-10.wav"
}
ENT.SoundTbl_Alert = {
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-01.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-02.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-03.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-04.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-05.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-06.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-07.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-08.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-09.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-10.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-11.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-12.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-13.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-14.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-15.wav"
}
ENT.SoundTbl_CombatIdle = {
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-01.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-02.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-03.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-04.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-05.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-06.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-07.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-08.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-09.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-10.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-11.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-12.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-13.wav"	
}
ENT.SoundTbl_BeforeMeleeAttack = {
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack01.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack02.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack03.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack04.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack05.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack06.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack07.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack08.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack09.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack10.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack11.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack12.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack13.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack14.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack15.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack16.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack17.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack18.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack19.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack20.wav"	
}
ENT.SoundTbl_Pain = {
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain01.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain02.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain03.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain04.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain05.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain06.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain07.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain08.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain09.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain10.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain11.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain12.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain13.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain14.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain15.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain16.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain17.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain18.wav"
}
ENT.SoundTbl_Death = {
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-01.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-02.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-03.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-04.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-05.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-06.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-07.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-08.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-09.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-10.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-11.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-12.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-13.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-14.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-15.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-16.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-17.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-18.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-19.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-20.wav"
}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	self.MeleeAttackAnimationAllowOtherTasks = false
	
	self.MeleeAttackDamage = math.random(17,22)
	self.HasMeleeAttackKnockBack = false
	self.MeleeAttackDistance = 40
	self.MeleeAttackDamageDistance = 60
		
	self.SoundTbl_MeleeAttack = {"vj_piv/z_hit-01.wav","vj_piv/z_hit-02.wav","vj_piv/z_hit-03.wav","vj_piv/z_hit-04.wav","vj_piv/z_hit-05.wav","vj_piv/z_hit-06.wav"}
	self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	

	self.AnimTbl_MeleeAttack = {
		"vjseq_cmb01",
	}
	
	if math.random(1,2) == 1 then
	
		self.MeleeAttackDamage = math.random(22,37)
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackDistance = 150
        self.MeleeAttackDamageDistance = 70
		
		self.SoundTbl_MeleeAttack = {"vj_piv/BodyHit-3.wav","vj_piv/BodyHit-4.wav","vj_piv/BodyHit-5.wav","vj_piv/BodyHit-6.wav"}
		self.SoundTbl_MeleeAttackMiss = {"vj_piv/Miss1.wav","vj_piv/Miss2.wav","vj_piv/Miss3.wav","vj_piv/Miss4.wav","vj_piv/Miss5.wav"}

		self.AnimTbl_MeleeAttack = {
			"vjseq_atk_jumpkick",
			"vjseq_atk_jumpknee",
		}
	
	end
	        
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
	if !IsValid(self:GetEnemy()) then
		self.AnimTbl_Walk = {ACT_WALK}
		self.AnimTbl_Run = {ACT_RUN}
	else
		if self:GetPos():Distance(self:GetEnemy():GetPos()) < 200  && self.PIV_Mutated == false then
			self.AnimTbl_Walk = {ACT_WALK_AIM}
			self.AnimTbl_Run = {ACT_WALK_AIM}
		else
			self.AnimTbl_Walk = {ACT_WALK}
			self.AnimTbl_Run = {ACT_RUN}
		end
	end
	-- Dodge System
    if self.VJ_IsBeingControlled == true or self.PIV_Crawler or self.PIV_Crippled or self.Flinching or self:GetSequence() == self:LookupSequence(ACT_BIG_FLINCH) or self.DeathAnimationCodeRan then return end
    if IsValid(self:GetEnemy()) == true && self.MeleeAttacking == false && self.VJ_IsBeingControlled == false && CurTime() > self.PIV_NextStrafeT && self:GetPos():Distance(self:GetEnemy():GetPos()) < 200 then
        self:StopMoving()
        self:VJ_ACT_PLAYACTIVITY({"vjseq_sway_b","vjseq_sway_f","vjseq_sway_l","vjseq_sway_r"}, true, false, false)
		VJ_EmitSound(self,"vj_piv/Miss"..math.random(1,5)..".wav",70,100)
        self.PIV_NextRunT = CurTime() + 2
        if self.PIV_Mutated == false then
			self.PIV_NextStrafeT = CurTime() + math.random(3,6)
		else
			self.PIV_NextStrafeT = CurTime() + math.random(2,4)
		end
	end
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
	if self.CanDoTheFunny == false then return end

	if dmginfo:IsBulletDamage() or dmginfo:IsDamageType(DMG_BUCKSHOT) or dmginfo:IsDamageType(DMG_SNIPER) then
		if hitgroup == HITGROUP_HEAD or hitgroup == HITGROUP_CHEST or hitgroup == HITGROUP_STOMACH then
			if self.PIVNextStumbleT < CurTime() then
				if dmginfo:GetDamage() > 40 or dmginfo:GetDamageForce():Length() > 10000 then
					if math.random (1,2) == 1 then
						self:VJ_ACT_PLAYACTIVITY("vjseq_flinch_heavy_f",true,false,false)
						self.PIVNextStumbleT = CurTime() + 5
					end
				end
			end
		end
	end

	if dmginfo:IsDamageType(DMG_CLUB) or dmginfo:IsDamageType(DMG_SLASH) or dmginfo:IsDamageType(DMG_GENERIC) then
		if dmginfo:GetDamage() > 20 or dmginfo:GetDamageForce():Length() > 10000 then
			if self.PIVNextShoveT < CurTime() then
				self:VJ_ACT_PLAYACTIVITY("vjseq_flinch_heavy_f",true,false,false)
				self.PIVNextShoveT = CurTime() + math.random(5,8)
			end
		end
    return !self.PIVCrippled && !self.PIVFuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH)
	end

	if dmginfo:IsExplosionDamage() then
		if self.NextSplodeStumbleT < CurTime() then
			self:VJ_ACT_PLAYACTIVITY("vjseq_flinch_heavy_f",true,false,false)
			self.NextSplodeStumbleT = CurTime() + 5
		end
	return !self.PIVCrippled && !self.PIVFuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH)
	end

end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/