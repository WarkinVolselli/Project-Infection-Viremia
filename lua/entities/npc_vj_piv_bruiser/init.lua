AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/bruiser/bruiser.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 600

ENT.PIV_IsSpecial = true

ENT.PIV_HasSubclasses = false
ENT.PIV_CanBeCrippled = false
ENT.PIV_CanBreakDoors = false
ENT.PIV_AllowedToClimb = false
ENT.PIV_HasWeapons = false
ENT.PIV_CanBeThrower = false
ENT.PIV_AllowedToRest = false

ENT.PIV_IsHugeZombie = true

ENT.SoundTbl_Idle = {"vj_piv/bruiser/zombie_mutant_get_up_00_0.wav","vj_piv/bruiser/zombie_mutant_get_up_01_0.wav","vj_piv/bruiser/zombie_mutant_get_up_02_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_00_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_01_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_02_0.wav"}
ENT.SoundTbl_CombatIdle = {"vj_piv/bruiser/zombie_mutant_get_up_00_0.wav","vj_piv/bruiser/zombie_mutant_get_up_01_0.wav","vj_piv/bruiser/zombie_mutant_get_up_02_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_00_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_01_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_02_0.wav"}
ENT.SoundTbl_Alert = {"vj_piv/bruiser/zombie_mutant_enemy_spotted_00_0.wav","vj_piv/bruiser/zombie_mutant_enemy_spotted_01_0.wav","vj_piv/bruiser/zombie_mutant_enemy_spotted_02_0.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/bruiser/zombie_mutant_attack_00_0.wav","vj_piv/bruiser/zombie_mutant_attack_01_0.wav","vj_piv/bruiser/zombie_mutant_attack_02_0.wav","vj_piv/bruiser/zombie_mutant_attack_03_0.wav","vj_piv/bruiser/zombie_mutant_attack_04_0.wav"}
ENT.SoundTbl_Pain = {"vj_piv/bruiser/zombie_mutant_pain_00_0.wav","vj_piv/bruiser/zombie_mutant_pain_01_0.wav","vj_piv/bruiser/zombie_mutant_pain_02_0.wav"}
ENT.SoundTbl_Death = {"vj_piv/bruiser/zombie_mutant_death_00_0.wav","vj_piv/bruiser/zombie_mutant_death_01_0.wav","vj_piv/bruiser/zombie_mutant_death_02_0.wav"}
ENT.SoundTbl_AngyBitch = {"vj_piv/bruiser/zombie_mutant_pain_critical_00_0.wav","vj_piv/bruiser/zombie_mutant_pain_critical_01_0.wav","vj_piv/bruiser/zombie_mutant_pain_critical_02_0.wav"}
ENT.SoundTbl_StartCharge = {"vj_piv/bruiser/zombie_mutant_pain_critical_00_0.wav","vj_piv/bruiser/zombie_mutant_pain_critical_01_0.wav","vj_piv/bruiser/zombie_mutant_pain_critical_02_0.wav"}
ENT.SoundTbl_ChargeHit = {"vj_piv/bruiser/charger_smash_01.wav","vj_piv/bruiser/charger_smash_02.wav","vj_piv/bruiser/charger_smash_03.wav"}
ENT.SoundTbl_Crash = {"vj_piv/bruiser/loud_chargerimpact_01.wav","vj_piv/bruiser/loud_chargerimpact_02.wav","vj_piv/bruiser/loud_chargerimpact_03.wav","vj_piv/bruiser/loud_chargerimpact_04.wav"}

ENT.NextRunT = 0
ENT.RunT = 0
ENT.Running = false
ENT.Angry = false
ENT.Angry_Amount = 0
ENT.Angry_AmountNeeded = 100 -- ammount of damage it needs to take before going angy mode
ENT.Angry_Time = 0

ENT.NextChargeT = 0
ENT.StopChargingT = 0

ENT.Charging = false
ENT.ChargePercentage = 0.25
ENT.ChargeDistance = 2000
ENT.MinChargeDistance = 500	

ENT.HitGroupFlinching_Values = {
{HitGroup = {HITGROUP_HEAD}, Animation = {"vjges_flinch_head"}}, 
{HitGroup = {HITGROUP_STOMACH}, Animation = {"vjges_flinch_back","vjges_flinch_stomach"}}, 
{HitGroup = {HITGROUP_CHEST}, Animation = {"vjges_flinch_chest","vjges_flinch_chest_2","vjges_flinch_chest_3"}}, 
{HitGroup = {HITGROUP_LEFTARM}, Animation = {"vjges_flinch_left"}}, 
{HitGroup = {HITGROUP_RIGHTARM}, Animation = {"vjges_flinch_right"}}, 
{HitGroup = {HITGROUP_LEFTLEG}, Animation = {"vjsges_flinch_leftleg"}}, 
{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {"vjges_flinch_rightleg"}}
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,15))
	self.NextRunT = CurTime() + math.random(6,12)
	self.NextAngryT = CurTime()
	self:SetModelScale(1.1)
	self.StopChargingT = CurTime()
	self.Charging = false	
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
					VJ.EmitSound(self,self.SoundTbl_ChargeHit,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
					local dmginfo = DamageInfo()
					dmginfo:SetDamage(math.random(30,35))
					dmginfo:SetDamageType(DMG_CLUB)
					dmginfo:SetDamagePosition(tr.Entity:GetPos() +tr.Entity:OBBCenter())
					dmginfo:SetAttacker(self)
					dmginfo:SetInflictor(self)
					tr.Entity:TakeDamageInfo(dmginfo,self,self)
					tr.Entity:SetGroundEntity(NULL)
					tr.Entity:SetVelocity(self:GetForward() *math.random(100, 200) *2 + self:GetUp()*math.random(50, 100) *2 + self:GetRight()*math.random(-10, 10) *2)
					self.Angry_Time = CurTime() - math.random(5,10) -- remove some time since hitting stuff calms us a little

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
					local chargeattack = self:VJ_ACT_PLAYACTIVITY("vjseq_charger_melee_run_raw",true,false,false)					
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

	if self.Angry_Amount >= self.Angry_AmountNeeded && !self.Angry then -- if we have enough angy points and we're not angy then
		-- get angy
	
		self.Angry = true
		self.Running = true
		self.Angry_Amount = 0
		self.Angry_Time = CurTime() + math.random(10,20) -- how long we're angy for

		-- play beforemelee sound to audibly let them know we're angy
		VJ.EmitSound(self,self.SoundTbl_AngyBitch,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
		self.SoundTbl_CombatIdle = {"vj_piv/bruiser/zombie_mutant_taunt_00_0.wav","vj_piv/bruiser/zombie_mutant_taunt_01_0.wav","vj_piv/bruiser/zombie_mutant_taunt_02_0.wav"}

	end

	if self.Angry then
		if self:GetEnemy() == nil then
			-- calm down cause we lost them
			self.NextRunT = CurTime() + math.random(5,10)
			self.Angry = false
			self.Running = false
			self.SoundTbl_CombatIdle = {"vj_piv/bruiser/zombie_mutant_get_up_00_0.wav","vj_piv/bruiser/zombie_mutant_get_up_01_0.wav","vj_piv/bruiser/zombie_mutant_get_up_02_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_00_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_01_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_02_0.wav"}
		end
		if self.Angry_Time < CurTime() then -- if the angy timer has run out
			self.NextRunT = CurTime() + math.random(5,10)
			self.Angry = false
			self.Running = false
			self.SoundTbl_CombatIdle = {"vj_piv/bruiser/zombie_mutant_get_up_00_0.wav","vj_piv/bruiser/zombie_mutant_get_up_01_0.wav","vj_piv/bruiser/zombie_mutant_get_up_02_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_00_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_01_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_02_0.wav"}
		end
	end
	
	if IsValid(self:GetEnemy()) && self.Angry && !self.Flinching then
		local ent = self:GetEnemy()
		local dist = self:VJ_GetNearestPointToEntityDistance(ent)
		local controlled = IsValid(self.VJ_TheController)
		
		if ((controlled && self.VJ_TheController:KeyDown(IN_ATTACK2)) or !controlled) && dist <= self.ChargeDistance && dist > self.MinChargeDistance && (self:GetForward():Dot((ent:GetPos() -self:GetPos()):GetNormalized()) > math.cos(math.rad(10))) && !self:BusyWithActivity() && CurTime() > self.NextChargeT && !self.Charging && ent:Visible(self)then
			VJ.EmitSound(self,self.SoundTbl_StartCharge,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
			self.HasMeleeAttack = false
			self.HasMeleeAttackKnockBack = true
			self.StopChargingT = CurTime() +math.random(6,8)
			self.Charging = true
			self:SetState(VJ_STATE_ONLY_ANIMATION)
		end
	end
end
----------------------------------------------------------------------------
function ENT:Zombie_CustomOnAlert(ent)
	--self.NextChargeT = CurTime() +math.random(6,10)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:StopCharging(crash)
	self:SetState()
	self.HasMeleeAttack = true
	self.HasMeleeAttackKnockBack = false 
	self.Charging = false
	self.StopChargingT = CurTime()
	self.NextChargeT = CurTime() +math.Rand(10,15)
	if crash then
		util.ScreenShake(self:GetPos(),16,100,1,150)
	    VJ.EmitSound(self,self.SoundTbl_Crash,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
		VJ.EmitSound(self,self.SoundTbl_Pain,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
	    self:VJ_ACT_PLAYACTIVITY(crash && "vjseq_shoved_backward",true,false,false)		
end	
	self.AnimTbl_IdleStand = {ACT_IDLE}
	if !self.Angry then
		self.AnimTbl_Walk = {ACT_WALK}
		self.AnimTbl_Run = {ACT_WALK}
	else
		self.AnimTbl_Walk = {ACT_WALK}
		self.AnimTbl_Run = {ACT_RUN}
	end
end
----------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt, isProp)
	if self.Angry then
		self.Angry_Time = CurTime() - math.random(5,10) -- remove some time since hitting stuff calms us a little
	end
end
----------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
	if !self.Angry then -- if we're not angy then run this
		self.Angry_Amount = self.Angry_Amount +dmginfo:GetDamage() -- update angy ammount and add how much damage we took
	end
	
	if self.CanDoTheFunny == false then return end
	
	local stumble = VJ.PICK({"vjseq_shoved_backward","vjseq_shoved_rightward","vjseq_shoved_leftward","vjseq_shoved_forward",})
	
	if dmginfo:IsBulletDamage() or dmginfo:IsDamageType(DMG_BUCKSHOT) or dmginfo:IsDamageType(DMG_SNIPER) then
		if hitgroup == HITGROUP_HEAD or hitgroup == HITGROUP_CHEST or hitgroup == HITGROUP_STOMACH then
			if self.PIVNextStumbleT < CurTime() then
				if dmginfo:GetDamage() > 40 or dmginfo:GetDamageForce():Length() > 10000 then
					if math.random (1,2) == 1 then
						self:VJ_ACT_PLAYACTIVITY("vjseq_shoved_backward",true,false,false)
						self.PIVNextStumbleT = CurTime() + 5
						self:StopCharging()
					end
				end
			end
		end
	end

	if dmginfo:IsDamageType(DMG_CLUB) or dmginfo:IsDamageType(DMG_SLASH) or dmginfo:IsDamageType(DMG_GENERIC) then
		if dmginfo:GetDamage() > 20 or dmginfo:GetDamageForce():Length() > 10000 then
			if self.PIV_NextShoveT < CurTime() then
				self:VJ_ACT_PLAYACTIVITY("vjseq_shoved_backward",true,false,false)
				self.PIV_NextShoveT = CurTime() + math.random(5,8)
				self:StopCharging()
			end
		end
    return !self.PIVCrippled && !self.PIVFuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH)
	end

	if dmginfo:IsExplosionDamage() then
		if self.NextSplodeStumbleT < CurTime() then
			self:VJ_ACT_PLAYACTIVITY(stumble,true,VJ.AnimDuration(self,tbl),false)
			self.NextSplodeStumbleT = CurTime() + 5
			self:StopCharging()
		end
	return !self.PIVCrippled && !self.PIVFuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH)
	end
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD && GetConVar("vj_piv_headshot_damage"):GetInt() == 1 then
		dmginfo:ScaleDamage(GetConVarNumber("vj_piv_headshot_damage_mult"))
    end
		if hitgroup == HITGROUP_RIGHTARM or hitgroup == HITGROUP_LEFTARM then
		dmginfo:ScaleDamage(0.5)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	if math.random(1,3) == 1 then
		
		self.MeleeAttackAnimationAllowOtherTasks = false
		self.MeleeAttackAnimationFaceEnemy = false
		self.MeleeAttackDamage = math.random(30,35)
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackDistance = 50
		self.MeleeAttackDamageDistance = 70
		self.TimeUntilMeleeAttackDamage = 0.7
		self.SoundTbl_MeleeAttack = {"vj_piv/BodyHit-3.wav","vj_piv/BodyHit-4.wav","vj_piv/BodyHit-5.wav","vj_piv/BodyHit-6.wav"}
		self.SoundTbl_MeleeAttackMiss = {""}
		self.AnimTbl_MeleeAttack = {
			"vjseq_charger_pummel"
		}
		
		timer.Simple(0.7,function() if IsValid(self) then
			VJ.EmitSound(self,self.SoundTbl_Crash,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
			util.ScreenShake(self:GetPos(), 300, 500, 1.6, 1200) end end)
			local pos = self:LocalToWorld(Vector(50,0,0))
			timer.Simple(0.7,function() if IsValid(self) then
			ParticleEffect("strider_impale_ground",pos,Angle(0,0,0),nil)
			
			local effectdata = EffectData()
			effectdata:SetOrigin(pos,Angle(0,0,0))
			effectdata:SetScale( 50 )
			
			util.Effect( "ThumperDust", effectdata )
			VJ.ApplyRadiusDamage(self, self, pos, 100, math.random(5,10), DMG_GENERIC, true, true, {DisableVisibilityCheck=true, Force=80})
			util.ScreenShake(pos, 300, 500, 1.6, 1200)
		end end)
		
	else

		self.MeleeAttackAnimationAllowOtherTasks = true
		self.MeleeAttackAnimationFaceEnemy = true
		self.MeleeAttackDamage = math.random(20,25)
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackDistance = 50
		self.MeleeAttackDamageDistance = 70
		self.TimeUntilMeleeAttackDamage = false
		self.SoundTbl_MeleeAttack = {"vj_piv/BodyHit-3.wav","vj_piv/BodyHit-4.wav","vj_piv/BodyHit-5.wav","vj_piv/BodyHit-6.wav"}
		self.SoundTbl_MeleeAttackMiss = {"vj_piv/Miss1.wav","vj_piv/Miss2.wav","vj_piv/Miss3.wav","vj_piv/Miss4.wav","vj_piv/Miss4.wav"}
		self.AnimTbl_MeleeAttack = {
			"vjges_melee_01",
			"vjges_melee_03"
		}
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/