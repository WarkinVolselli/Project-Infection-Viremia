include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.Model = {"models/vj_piv/specials/hulk/hulk.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
	self.StartHealth = 1500
	self.PIV_IsRunner = true
	self.PIV_Infection_IsWalker = false
	self.PIV_IsHugeZombie = true
	self.PIV_Tank = true
	self.PIV_CanMutate = false
	self.PIV_IsBoss = true

	self.PIV_IsSpecial = true

	self.PIV_CanBeCrippled = false
	self.PIV_HasSubclasses = false
	self.PIV_CanBeThrower = false
	self.PIV_HasWeapons = false
	self.PIV_CanBreakDoors = false
	self.PIV_AllowedToClimb = false
	self.PIV_AllowedToRest = false

	self.MeleeAttackDamage = math.random(35,40)
	self.HasMeleeAttackKnockBack = true
	self.AnimTbl_Death = {"vjseq_death","vjseq_death_11ab"}	
	self.SoundTbl_MeleeAttack = {"vj_piv/tank/hit/hulk_punch_1.wav"}
	self.SoundTbl_MeleeAttackMiss = {"vj_piv/Miss1.wav","vj_piv/Miss2.wav","vj_piv/Miss3.wav","vj_piv/Miss4.wav","vj_piv/Miss4.wav"}

	self.HasRangeAttack = true
	self.RangeAttackEntityToSpawn = "obj_vj_piv_tankrock"
	self.AnimTbl_RangeAttack = {"Throw_02","Throw_03","Throw_04"}
	self.RangeDistance = 2000
	self.RangeToMeleeDistance = 500
	self.TimeUntilRangeAttackProjectileRelease = false
	self.RangeUseAttachmentForPos = true
	self.RangeUseAttachmentForPosID = "debris"
	self.NextRangeAttackTime = math.random(8,12)

	self.GeneralSoundPitch1 = 100
	self.GeneralSoundpitch2 = 90

	self.BeforeRangeAttackPitch = VJ.SET(100, 100)
	self.AlertSoundLevel = 85
	self.CombatIdleSoundLevel = 85
	self.PainSoundLevel = 85
	self.DeathSoundLevel = 85
	self.BeforeMeleeAttackSoundLevel = 85
	self.BeforeRangeAttackSoundLevel = 85
	self.RangeAttackSoundLevel = 85

	self.NextChargeT = 0
	self.StopChargingT = 0

	self.Charging = false
	self.ChargePercentage = 0
	self.ChargeDistance = 1500
	self.MinChargeDistance = 250
end
--------------------
function ENT:Zombie_GiveVoice()
	self.SoundTbl_Idle = {
		"vj_piv/tank/idle/tank_breathe_01.wav",
		"vj_piv/tank/idle/tank_breathe_02.wav",
		"vj_piv/tank/idle/tank_breathe_03.wav",
		"vj_piv/tank/idle/tank_breathe_04.wav",
		"vj_piv/tank/idle/tank_breathe_05.wav",
		"vj_piv/tank/idle/tank_breathe_06.wav",
		"vj_piv/tank/idle/tank_breathe_07.wav",
		"vj_piv/tank/idle/tank_breathe_08.wav",
		"vj_piv/tank/idle/tank_growl_01.wav",
		"vj_piv/tank/idle/tank_growl_02.wav",
		"vj_piv/tank/idle/tank_growl_03.wav",
		"vj_piv/tank/idle/tank_growl_09.wav",
		"vj_piv/tank/idle/tank_growl_10.wav",
		"vj_piv/tank/idle/tank_growl_11.wav",
		"vj_piv/tank/idle/tank_growl_12.wav",
		"vj_piv/tank/idle/tank_voice_01.wav",
		"vj_piv/tank/idle/tank_voice_02.wav",
		"vj_piv/tank/idle/tank_voice_03.wav",
		"vj_piv/tank/idle/tank_voice_04.wav",
		"vj_piv/tank/idle/tank_voice_05.wav",
		"vj_piv/tank/idle/tank_voice_06.wav",
		"vj_piv/tank/idle/tank_voice_07.wav",
		"vj_piv/tank/idle/tank_voice_08.wav",
		"vj_piv/tank/idle/tank_voice_09.wav"
	}
	self.SoundTbl_CombatIdle = {
		"vj_piv/tank/yell/tank_yell_01.wav",
		"vj_piv/tank/yell/tank_yell_02.wav",
		"vj_piv/tank/yell/tank_yell_03.wav",
		"vj_piv/tank/yell/tank_yell_04.wav",
		"vj_piv/tank/yell/tank_yell_05.wav",
		"vj_piv/tank/yell/tank_yell_06.wav",
		"vj_piv/tank/yell/tank_yell_07.wav",
		"vj_piv/tank/yell/tank_yell_08.wav",
		"vj_piv/tank/yell/tank_yell_09.wav",
		"vj_piv/tank/yell/tank_yell_10.wav",
		"vj_piv/tank/yell/tank_yell_12.wav",
		"vj_piv/tank/yell/tank_yell_16.wav",
		"vj_piv/tank/growl/tank_climb_01.wav",
		"vj_piv/tank/growl/tank_climb_02.wav",
		"vj_piv/tank/growl/tank_climb_03.wav",
		"vj_piv/tank/growl/tank_climb_04.wav",
		"vj_piv/tank/growl/tank_climb_05.wav",
		"vj_piv/tank/growl/tank_fail_01.wav",
		"vj_piv/tank/growl/tank_fail_02.wav",
		"vj_piv/tank/growl/tank_fail_03.wav",
		"vj_piv/tank/growl/tank_fail_04.wav",
		"vj_piv/tank/growl/tank_fail_05.wav"
	}
	self.SoundTbl_Alert = {
		"vj_piv/tank/yell/tank_yell_01.wav",
		"vj_piv/tank/yell/tank_yell_02.wav",
		"vj_piv/tank/yell/tank_yell_03.wav",
		"vj_piv/tank/yell/tank_yell_04.wav",
		"vj_piv/tank/yell/tank_yell_05.wav",
		"vj_piv/tank/yell/tank_yell_06.wav",
		"vj_piv/tank/yell/tank_yell_07.wav",
		"vj_piv/tank/yell/tank_yell_08.wav",
		"vj_piv/tank/yell/tank_yell_09.wav",
		"vj_piv/tank/yell/tank_yell_10.wav",
		"vj_piv/tank/yell/tank_yell_12.wav",
		"vj_piv/tank/yell/tank_yell_16.wav"
	}
	self.SoundTbl_BeforeMeleeAttack = {
		"vj_piv/tank/attack/tank_attack_01.wav",
		"vj_piv/tank/attack/tank_attack_02.wav",
		"vj_piv/tank/attack/tank_attack_03.wav",
		"vj_piv/tank/attack/tank_attack_04.wav",
		"vj_piv/tank/attack/tank_attack_05.wav",
		"vj_piv/tank/attack/tank_attack_06.wav",
		"vj_piv/tank/attack/tank_attack_07.wav",
		"vj_piv/tank/attack/tank_attack_08.wav",
		"vj_piv/tank/attack/tank_attack_09.wav",
		"vj_piv/tank/attack/tank_attack_10.wav"
	}
	self.SoundTbl_BeforeRangeAttack = {"vj_piv/tank/attack/rip_up_rock_1.wav"}
	self.SoundTbl_RangeAttack = {
		"vj_piv/tank/yell/tank_throw_01.wav",
		"vj_piv/tank/yell/tank_throw_02.wav",
		"vj_piv/tank/yell/tank_throw_03.wav",
		"vj_piv/tank/yell/tank_throw_04.wav",
		"vj_piv/tank/yell/tank_throw_05.wav",
		"vj_piv/tank/yell/tank_throw_06.wav",
		"vj_piv/tank/yell/tank_throw_09.wav",
		"vj_piv/tank/yell/tank_throw_10.wav",
		"vj_piv/tank/yell/tank_throw_11.wav"
	}
	self.SoundTbl_Pain = {
		"vj_piv/tank/pain/tank_fire_01.wav",
		"vj_piv/tank/pain/tank_fire_02.wav",
		"vj_piv/tank/pain/tank_fire_03.wav",
		"vj_piv/tank/pain/tank_fire_04.wav",
		"vj_piv/tank/pain/tank_fire_05.wav",
		"vj_piv/tank/pain/tank_fire_06.wav",
		"vj_piv/tank/pain/tank_fire_07.wav",
		"vj_piv/tank/pain/tank_fire_08.wav",
		"vj_piv/tank/pain/tank_pain_01.wav",
		"vj_piv/tank/pain/tank_pain_02.wav",
		"vj_piv/tank/pain/tank_pain_03.wav",
		"vj_piv/tank/pain/tank_pain_04.wav",
		"vj_piv/tank/pain/tank_pain_05.wav",
		"vj_piv/tank/pain/tank_pain_06.wav",
		"vj_piv/tank/pain/tank_pain_07.wav",
		"vj_piv/tank/pain/tank_pain_08.wav",
		"vj_piv/tank/pain/tank_pain_09.wav",
		"vj_piv/tank/pain/tank_pain_10.wav"
	}
	self.SoundTbl_Death = {
		"vj_piv/tank/die/tank_death_01.wav",
		"vj_piv/tank/die/tank_death_02.wav",
		"vj_piv/tank/die/tank_death_03.wav",
		"vj_piv/tank/die/tank_death_04.wav",
		"vj_piv/tank/die/tank_death_05.wav",
		"vj_piv/tank/die/tank_death_06.wav",
		"vj_piv/tank/die/tank_death_07.wav"
	}
	self.SoundTbl_StartCharge = {
		"vj_piv/tank/yell/tank_throw_01.wav",
		"vj_piv/tank/yell/tank_throw_02.wav",
		"vj_piv/tank/yell/tank_throw_03.wav",
		"vj_piv/tank/yell/tank_throw_04.wav",
		"vj_piv/tank/yell/tank_throw_05.wav",
		"vj_piv/tank/yell/tank_throw_06.wav",
		"vj_piv/tank/yell/tank_throw_09.wav",
		"vj_piv/tank/yell/tank_throw_10.wav",
		"vj_piv/tank/yell/tank_throw_11.wav"
	}
	self.SoundTbl_ChargeHit = {
		"vj_piv/tank/hit/pound_victim_1.wav",
		"vj_piv/tank/hit/pound_victim_2.wav"
	}
	self.SoundTbl_Crash = {
		"vj_piv/bruiser/loud_chargerimpact_01.wav",
		"vj_piv/bruiser/loud_chargerimpact_02.wav",
		"vj_piv/bruiser/loud_chargerimpact_03.wav",
		"vj_piv/bruiser/loud_chargerimpact_04.wav"
	}
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,2))
	if math.random(1,5) == 1 then
		self:SetSkin(3)
	end
	self.StopChargingT = CurTime()
	self.Charging = false
end
--------------------
function ENT:Zombie_CustomOnThink()
	-- if self.Charging then
		-- local tPos = hasEnemy && ent:GetPos() or self:GetPos() +self:GetForward() *500
		-- local setangs = self:GetFaceAngle((tPos -self:GetPos()):Angle())
		-- self:SetAngles(Angle(setangs.p,self:GetAngles().y,setangs.r))
		-- self:AutoMovement(self:GetAnimTimeInterval() *self.ChargePercentage) -- For some reason, letting it go at 100% forces the walkframe speed to be doubled, essentially ignoring the walkframes in the animation. Basically, think how NextBots just slide everywhere faster than their animation is supposed to
		-- self:SetGroundEntity(NULL)
		-- self:FaceCertainEntity(self:GetEnemy(),true)
		-- local tr = util.TraceHull({
			-- start = self:GetPos() + self:OBBCenter(),
			-- endpos = self:GetPos() + self:OBBCenter() + self:GetForward()*30,
			-- mins = Vector(self:OBBMins()),
			-- maxs = Vector(15, 15, 50),
			-- filter = {self}
		-- })	
		-- local hitEnt = NULL
		-- if IsValid(tr.Entity) && (tr.Entity != self.VJ_TheController && tr.Entity != self.VJ_TheControllerBullseye) then
			-- if self:Disposition(tr.Entity) != D_LI then			
				-- hitEnt = tr.Entity
				-- VJ.EmitSound(self,self.SoundTbl_ChargeHit,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
				-- local dmginfo = DamageInfo()
				-- dmginfo:SetDamage(math.random(40,45))
				-- dmginfo:SetDamageType(DMG_CLUB)
				-- dmginfo:SetDamagePosition(tr.Entity:GetPos() +tr.Entity:OBBCenter())
				-- dmginfo:SetAttacker(self)
				-- dmginfo:SetInflictor(self)
				-- tr.Entity:TakeDamageInfo(dmginfo,self,self)
				-- tr.Entity:SetGroundEntity(NULL)
				-- tr.Entity:SetVelocity(self:GetForward() *math.random(100, 200) *2 + self:GetUp()*math.random(50, 100) *2 + self:GetRight()*math.random(-10, 10) *2)
				-- if tr.Entity:GetClass() == "prop_physics" then
					-- local HitProp = tr.Entity:GetPhysicsObject()
					-- if IsValid(ent) && IsValid(HitProp) then
						-- HitProp:EnableMotion(true)
						-- HitProp:SetVelocity(((ent:GetPos() + ent:OBBCenter()) - (self:GetPos() + self:OBBCenter())):GetNormal()*400 + self:GetForward()*300 + self:GetUp()*300)
					-- elseif !IsValid(ent) && IsValid(HitProp) then
						-- HitProp:SetVelocity(((self:GetPos() + self:OBBCenter()) - (self:GetPos() + self:OBBCenter())):GetNormal()*400 + self:GetForward()*300 + self:GetUp()*300)			
					-- end
					-- if IsValid(HitProp) && tr.Entity:GetClass() == "prop_physics" && tr.Entity:Health() >= 0 then
						-- tr.Entity:TakeDamage(tr.Entity:GetMaxHealth())
					-- end
				-- end
                -- if IsValid(tr.Entity) && tr.Entity:GetClass() != "prop_physics" then
					-- local chargeattack = self:VJ_ACT_PLAYACTIVITY("vjseq_raw_hulk_runattack1",true,false,false)					
				-- end
			-- end
		-- end
		-- if CurTime() > self.StopChargingT or tr.HitWorld or (IsValid(tr.Entity) && tr.Entity:GetClass() != "prop_physics" && self:Disposition(tr.Entity) != D_LI) then
			-- self:StopCharging(tr && tr.HitWorld)
		-- end
	-- end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
	-- if IsValid(self:GetEnemy()) && !self.Flinching then
		-- local ent = self:GetEnemy()
		-- local dist = self:VJ_GetNearestPointToEntityDistance(ent)
		-- local controlled = IsValid(self.VJ_TheController)
		
		-- if ((controlled && self.VJ_TheController:KeyDown(IN_ATTACK2)) or !controlled) && dist <= self.ChargeDistance && dist > self.MinChargeDistance && (self:GetForward():Dot((ent:GetPos() -self:GetPos()):GetNormalized()) > math.cos(math.rad(10))) && !self:BusyWithActivity() && CurTime() > self.NextChargeT && !self.Charging && ent:Visible(self)then
			-- VJ.EmitSound(self,self.SoundTbl_StartCharge,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
			-- self.HasMeleeAttack = false
			-- self.HasRangeAttack = false
			-- self.StopChargingT = CurTime() +math.random(4,6)
			-- self.Charging = true
			-- self:SetState(VJ_STATE_ONLY_ANIMATION)
		-- end
	-- end
end
--------------------
function ENT:Zombie_CustomOnAlert(ent)
	--self.NextChargeT = CurTime() +math.random(6,12)
end
--------------------
function ENT:StopCharging(crash)
	self:SetState()
	self.HasMeleeAttack = true
	self.HasRangeAttack = true
	self.Charging = false
	self.StopChargingT = CurTime()
	self.NextChargeT = CurTime() +math.Rand(10,20)
	if crash then
		util.ScreenShake(self:GetPos(),16,100,1,150)
	    VJ.EmitSound(self,self.SoundTbl_Crash,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
		VJ.EmitSound(self,self.SoundTbl_Pain,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
	    self:VJ_ACT_PLAYACTIVITY(crash && "vjseq_hulk_stumblea",true,false,false)
	else
		VJ.EmitSound(self,self.SoundTbl_Pain,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
	    self:VJ_ACT_PLAYACTIVITY(crash && "vjseq_shoved_forward",true,false,false)
	end	
end
--------------------