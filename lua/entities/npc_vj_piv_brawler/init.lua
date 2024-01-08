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

ENT.Combo = 0
ENT.PIV_IsSpecial = true

ENT.MeleeAttackDistance = 50
ENT.MeleeAttackDamageDistance = 60

ENT.PIV_NextStrafeT = 0
ENT.PIV_NextRunT = 0

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	if self.Combo == 1 then
		self.MeleeAttackDamage = math.random(18,23)
		self.HasMeleeAttackKnockBack = false
		self.MeleeAttackDistance = 40
		self.MeleeAttackDamageDistance = 60
			
		self.SoundTbl_MeleeAttack = {"vj_piv/z_hit-01.wav","vj_piv/z_hit-02.wav","vj_piv/z_hit-03.wav","vj_piv/z_hit-04.wav","vj_piv/z_hit-05.wav","vj_piv/z_hit-06.wav"}
		self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	

		self.AnimTbl_MeleeAttack = {
			"vjseq_cmb02",
		}
	elseif self.Combo == 2 then
		self.MeleeAttackDamage = math.random(25,30)
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackDistance = 150
		self.MeleeAttackDamageDistance = 70
			
		self.SoundTbl_MeleeAttack = {"vj_piv/BodyHit-3.wav","vj_piv/BodyHit-4.wav","vj_piv/BodyHit-5.wav","vj_piv/BodyHit-6.wav"}
		self.SoundTbl_MeleeAttackMiss = {"vj_piv/Miss1.wav","vj_piv/Miss2.wav","vj_piv/Miss3.wav","vj_piv/Miss4.wav","vj_piv/Miss5.wav"}

		self.AnimTbl_MeleeAttack = {
			"vjseq_cmb03",
		}
	else
		self.MeleeAttackAnimationAllowOtherTasks = false
		
		self.MeleeAttackDamage = math.random(15,20)
		self.HasMeleeAttackKnockBack = false
		self.MeleeAttackDistance = 40
		self.MeleeAttackDamageDistance = 60
			
		self.SoundTbl_MeleeAttack = {"vj_piv/z_hit-01.wav","vj_piv/z_hit-02.wav","vj_piv/z_hit-03.wav","vj_piv/z_hit-04.wav","vj_piv/z_hit-05.wav","vj_piv/z_hit-06.wav"}
		self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	

		self.AnimTbl_MeleeAttack = {
			"vjseq_cmb01",
		}
		
		if math.random(1,3) == 1 then
		
			self.MeleeAttackDamage = math.random(20,25)
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
	        
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt, isProp) 
    if self.MeleeAttacking && self:GetSequence() == self:LookupSequence("cmb01") then
		self.Combo = 1
    elseif self.MeleeAttacking && self:GetSequence() == self:LookupSequence("cmb02") then
		self.Combo = 2
    elseif self.MeleeAttacking && self:GetSequence() == self:LookupSequence("cmb03") then
		self.Combo = 0
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_Miss()
    if self.MeleeAttacking &&
	    (
        self:GetSequence() == self:LookupSequence("cmb01") or
        self:GetSequence() == self:LookupSequence("cmb02") or
        self:GetSequence() == self:LookupSequence("cmb03")
		)
	then
        self.Combo = 0
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
    if IsValid(self:GetEnemy()) == true && self.MeleeAttacking == false && self.VJ_IsBeingControlled == false && CurTime() > self.PIV_NextStrafeT && self:GetPos():Distance(self:GetEnemy():GetPos()) < 200 && self:GetPos():Distance(self:GetEnemy():GetPos()) > 50 then
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
			if self.PIV_NextShoveT < CurTime() then
				self:VJ_ACT_PLAYACTIVITY("vjseq_flinch_heavy_f",true,false,false)
				self.PIV_NextShoveT = CurTime() + math.random(5,8)
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