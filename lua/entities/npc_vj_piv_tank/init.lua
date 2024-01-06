AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/hulk/hulk.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 1500
ENT.VJ_IsHugeMonster = true
ENT.PIV_Tank = true
ENT.PIV_CanMutate = false

ENT.PIV_IsSpecial = true

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
ENT.NextRangeAttackTime = math.random(8,12)

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundpitch2 = 90

ENT.AnimTbl_IdleStand = {ACT_IDLE}
ENT.AnimTbl_Walk = {ACT_WALK}
ENT.AnimTbl_Run = {ACT_WALK}

ENT.BeforeRangeAttackPitch = VJ_Set(100, 100)
ENT.AlertSoundLevel = 85
ENT.CombatIdleSoundLevel = 85
ENT.PainSoundLevel = 85
ENT.DeathSoundLevel = 85
ENT.BeforeMeleeAttackSoundLevel = 85
ENT.BeforeRangeAttackSoundLevel = 85
ENT.RangeAttackSoundLevel = 85

ENT.NextChargeT = 0
ENT.StopChargingT = 0

ENT.Charging = false
ENT.ChargePercentage = 0
ENT.ChargeDistance = 1500
ENT.MinChargeDistance = 250

--[[
ENT.HasSoundTrack = true
ENT.SoundTrackVolume = 0.3
ENT.SoundTbl_SoundTrack = {"vj_piv/music/toni_karengin_walking_corpses.mp3"}
--]]
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
ENT.SoundTbl_StartCharge = {"vj_piv/tank/yell/tank_throw_01.wav","vj_piv/tank/yell/tank_throw_02.wav","vj_piv/tank/yell/tank_throw_03.wav","vj_piv/tank/yell/tank_throw_04.wav","vj_piv/tank/yell/tank_throw_05.wav","vj_piv/tank/yell/tank_throw_06.wav","vj_piv/tank/yell/tank_throw_09.wav","vj_piv/tank/yell/tank_throw_10.wav","vj_piv/tank/yell/tank_throw_11.wav"}
ENT.SoundTbl_ChargeHit = {"vj_piv/tank/hit/pound_victim_1.wav","vj_piv/tank/hit/pound_victim_2.wav"}
ENT.SoundTbl_Crash = {"vj_piv/bruiser/loud_chargerimpact_01.wav","vj_piv/bruiser/loud_chargerimpact_02.wav","vj_piv/bruiser/loud_chargerimpact_03.wav","vj_piv/bruiser/loud_chargerimpact_04.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,2))
	if math.random(1,5) == 1 then
		self:SetSkin(3)
	end
	
	self.ChargeAnim = (ACT_RUN_PROTECTED)
	self.StopChargingT = CurTime()
	self.Charging = false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	self.MeleeAttackDamage = math.random(20,25)
	self.HasMeleeAttackKnockBack = true
	self.MeleeAttackDistance = 60
	self.MeleeAttackDamageDistance = 80
	self.SoundTbl_MeleeAttack = {"vj_piv/tank/hit/hulk_punch_1.wav"}
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
----------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
	if self.CanDoTheFunny == false then return end
	
	local stumble = VJ_PICK({"vjseq_shoved_backward","vjseq_shoved_rightward","vjseq_shoved_leftward","vjseq_shoved_forward",})
	
	if dmginfo:IsBulletDamage() or dmginfo:IsDamageType(DMG_BUCKSHOT) or dmginfo:IsDamageType(DMG_SNIPER) then
		if hitgroup == HITGROUP_HEAD or hitgroup == HITGROUP_CHEST or hitgroup == HITGROUP_STOMACH then
			if self.PIVNextStumbleT < CurTime() then
				if dmginfo:GetDamage() > 40 or dmginfo:GetDamageForce():Length() > 10000 then
					if math.random (1,2) == 1 then
						self:VJ_ACT_PLAYACTIVITY("vjseq_shoved_backward",true,false,false)
						self.PIVNextStumbleT = CurTime() + math.random(6,8)
						self:StopCharging()
					end
				end
			end
		end
	end

	if dmginfo:IsDamageType(DMG_CLUB) or dmginfo:IsDamageType(DMG_SLASH) or dmginfo:IsDamageType(DMG_GENERIC) then
		if dmginfo:GetDamage() > 40 or dmginfo:GetDamageForce():Length() > 10000 then
			if self.PIV_NextShoveT < CurTime() then
				self:VJ_ACT_PLAYACTIVITY("vjseq_shoved_backward",true,false,false)
				self.PIV_NextShoveT = CurTime() + math.random(8,12)
				self:StopCharging()
			end
		end
    return !self.PIVCrippled && !self.PIVFuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH)
	end

	if dmginfo:IsExplosionDamage() then
		if self.NextSplodeStumbleT < CurTime() then
			self:VJ_ACT_PLAYACTIVITY(stumble,true,VJ_GetSequenceDuration(self,tbl),false)
			self.NextSplodeStumbleT = CurTime() + math.random(6,8)
			self:StopCharging()
		end
	return !self.PIVCrippled && !self.PIVFuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH)
	end
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink()
	if self.Charging then
		local tPos = hasEnemy && ent:GetPos() or self:GetPos() +self:GetForward() *500
		local setangs = self:GetFaceAngle((tPos -self:GetPos()):Angle())
		self:SetAngles(Angle(setangs.p,self:GetAngles().y,setangs.r))
		self:AutoMovement(self:GetAnimTimeInterval() *self.ChargePercentage) -- For some reason, letting it go at 100% forces the walkframe speed to be doubled, essentially ignoring the walkframes in the animation. Basically, think how NextBots just slide everywhere faster than their animation is supposed to
		self:SetGroundEntity(NULL)
		self:FaceCertainEntity(self:GetEnemy(),true)
		local tr = util.TraceHull({
			start = self:GetPos() + self:OBBCenter(),
			endpos = self:GetPos() + self:OBBCenter() + self:GetForward()*30,
			mins = Vector(self:OBBMins()),
			maxs = Vector(15, 15, 50),
			filter = {self}
		})	
		local hitEnt = NULL
			if IsValid(tr.Entity) && (tr.Entity != self.VJ_TheController && tr.Entity != self.VJ_TheControllerBullseye) then
		      if self:Disposition(tr.Entity) != D_LI then			
					hitEnt = tr.Entity
					VJ_EmitSound(self,self.SoundTbl_ChargeHit,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
					local dmginfo = DamageInfo()
					dmginfo:SetDamage(math.random(40,45))
					dmginfo:SetDamageType(DMG_CLUB)
					dmginfo:SetDamagePosition(tr.Entity:GetPos() +tr.Entity:OBBCenter())
					dmginfo:SetAttacker(self)
					dmginfo:SetInflictor(self)
					tr.Entity:TakeDamageInfo(dmginfo,self,self)
					tr.Entity:SetGroundEntity(NULL)
					tr.Entity:SetVelocity(self:GetForward() *math.random(100, 200) *2 + self:GetUp()*math.random(50, 100) *2 + self:GetRight()*math.random(-10, 10) *2)

				if tr.Entity:GetClass() == "prop_physics" then
				local HitProp = tr.Entity:GetPhysicsObject()
				if IsValid(ent) && IsValid(HitProp) then
				    HitProp:EnableMotion(true)
					HitProp:SetVelocity(((ent:GetPos() + ent:OBBCenter()) - (self:GetPos() + self:OBBCenter())):GetNormal()*400 + self:GetForward()*300 + self:GetUp()*300)
				elseif !IsValid(ent) && IsValid(HitProp) then
					HitProp:SetVelocity(((self:GetPos() + self:OBBCenter()) - (self:GetPos() + self:OBBCenter())):GetNormal()*400 + self:GetForward()*300 + self:GetUp()*300)			
end
				if IsValid(HitProp) && tr.Entity:GetClass() == "prop_physics" && tr.Entity:Health() >= 0 then
					tr.Entity:TakeDamage(tr.Entity:GetMaxHealth())
	end
end
                if IsValid(tr.Entity) && tr.Entity:GetClass() != "prop_physics" then
					local chargeattack = self:VJ_ACT_PLAYACTIVITY("vjseq_raw_hulk_runattack1",true,false,false)					
		end
	end
end
		if CurTime() > self.StopChargingT or tr.HitWorld or (IsValid(tr.Entity) && tr.Entity:GetClass() != "prop_physics" && self:Disposition(tr.Entity) != D_LI) then
			self:StopCharging(tr && tr.HitWorld)
	end
end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
	if IsValid(self:GetEnemy()) && !self.Flinching then
		local ent = self:GetEnemy()
		local dist = self:VJ_GetNearestPointToEntityDistance(ent)
		local controlled = IsValid(self.VJ_TheController)
		
		if ((controlled && self.VJ_TheController:KeyDown(IN_ATTACK2)) or !controlled) && dist <= self.ChargeDistance && dist > self.MinChargeDistance && (self:GetForward():Dot((ent:GetPos() -self:GetPos()):GetNormalized()) > math.cos(math.rad(10))) && !self:BusyWithActivity() && CurTime() > self.NextChargeT && !self.Charging && ent:Visible(self)then
			VJ_EmitSound(self,self.SoundTbl_StartCharge,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
			self.HasMeleeAttack = false
			self.HasRangeAttack = false
			self.StopChargingT = CurTime() +math.random(4,6)
			self.Charging = true
			self.AnimTbl_IdleStand = {self.ChargeAnim}
			self.AnimTbl_Walk = {self.ChargeAnim}
			self.AnimTbl_Run = {self.ChargeAnim}
			self:SetState(VJ_STATE_ONLY_ANIMATION)
		end
	end
end
----------------------------------------------------------------------------
function ENT:Zombie_CustomOnAlert(ent)
	self.NextChargeT = CurTime() +math.random(6,12)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:StopCharging(crash)
	self:SetState()
	self.HasMeleeAttack = true
	self.HasRangeAttack = true
	self.Charging = false
	self.StopChargingT = CurTime()
	self.NextChargeT = CurTime() +math.Rand(10,20)
	if crash then
		util.ScreenShake(self:GetPos(),16,100,1,150)
	    VJ_EmitSound(self,self.SoundTbl_Crash,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
		VJ_EmitSound(self,self.SoundTbl_Pain,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
	    self:VJ_ACT_PLAYACTIVITY(crash && "vjseq_hulk_stumblea",true,false,false)
	else
		VJ_EmitSound(self,self.SoundTbl_Pain,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
	    self:VJ_ACT_PLAYACTIVITY(crash && "vjseq_shoved_forward",true,false,false)
	end	
	self.AnimTbl_IdleStand = {ACT_IDLE}
	self.AnimTbl_Walk = {ACT_WALK}
	self.AnimTbl_Run = {ACT_WALK}
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/