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

	self.ChargePercentage = 0.65
	self.Bruiser_AnimationCache = {}
	self.ChargeAnim = VJ.SequenceToActivity(self, "vjseq_run_3")

	self.NextChargeT = CurTime() +5
	self.StopChargingT = CurTime()
	self.Charging = false

	if !self.Bruiser_AnimationCache["vjseq_run_3"] then
		self.Bruiser_AnimationCache["vjseq_run_3"] = self:GetSequenceActivity(self:LookupSequence("vjseq_run_3"))
	end
end
--------------------
function ENT:Zombie_CustomOnAlert(ent)
	self.NextChargeT = CurTime() + math.random(6,12)
end
--------------------
function ENT:OnThinkAttack(isAttacking, enemy)
	local eneData = self.EnemyData
	local dist = eneData.DistanceNearest
	if self.IsCharging then
		if CurTime() > self.ChargeT then
			self:SetMaxYawSpeed(self.TurningSpeed)
			self.IsCharging = false
			self.ChargeT = 0
			self.DisableChasingEnemy = false
			self.HasMeleeAttack = true
			self.HasRangeAttack = true
			self:CapabilitiesAdd(CAP_MOVE_JUMP)
			self:PlayAnim("shoved_forward",true,false,false)
			return
		end

		self.DisableChasingEnemy = true
		self.HasMeleeAttack = false
		self.HasRangeAttack = false
		self:SetMaxYawSpeed(2)
		self:SetTurnTarget(enemy, -1)
		local tr = util.TraceHull({
			start = self:GetPos() +self:OBBCenter(),
			endpos = self:GetPos() +self:OBBCenter() +self:GetForward() *100,
			filter = self,
			mins = self:OBBMins() *0.85,
			maxs = self:OBBMaxs() *0.85,
		})
		self:SetLastPosition(tr.HitPos +tr.HitNormal *200)
		self:SCHEDULE_GOTO_POSITION("TASK_RUN_PATH",function(x) x:EngTask("TASK_FACE_ENEMY", 0) x.TurnData = {Type = VJ.FACE_ENEMY} end)
		if self:OnGround() then
			self:SetVelocity(self:GetMoveVelocity() *1.01)
		end
		-- VJ.DEBUG_TempEnt(self:GetLastPosition(), self:GetAngles(), Color(255,0,0), 5)
		if tr.Hit then
			self:SetMaxYawSpeed(self.TurningSpeed)
			self.IsCharging = false
			self.ChargeT = 0
			self.HasMeleeAttack = true
			self.HasRangeAttack = true
			self.DisableChasingEnemy = false
			self:CapabilitiesAdd(CAP_MOVE_JUMP)
			self:SetState()
			if tr.HitWorld then
				self:PlayAnim({"shoved_backward"},true,false,false)
				util.ScreenShake(self:GetPos(),1000,100,1,500)
				VJ.CreateSound(self,"npc/antlion_guard/shove1.wav",75)
			else
				self:PlayAnim("rage_at_enemy_04",true,false,false)
				VJ.CreateSound(self,"npc/antlion_guard/shove1.wav",75)
				local ent = tr.Entity
				local isProp = IsValid(ent) && VJ.IsProp(ent) or false
				if IsValid(ent) && (isProp or self:CheckRelationship(ent) == D_HT) then
					if isProp then
						local phys = ent:GetPhysicsObject()
						if IsValid(phys) then
							phys:ApplyForceCenter(self:GetForward() *1000 +self:GetUp() *200)
						end
					else
						local vel = self:GetForward() *600 +self:GetUp() *200
						ent:SetGroundEntity(NULL)
						ent:SetVelocity(vel)
					end
					local dmginfo = DamageInfo()
					dmginfo:SetDamage(50) -- feel free to change this
					dmginfo:SetDamageType(bit.bor(DMG_SLASH,DMG_CRUSH))
					dmginfo:SetDamageForce(self:GetForward() *1000)
					dmginfo:SetAttacker(self)
					dmginfo:SetInflictor(self)
					dmginfo:SetDamagePosition(tr.HitPos)
					ent:TakeDamageInfo(dmginfo)
				end
			end
			-- PrintTable(tr)
			-- VJ.DEBUG_TempEnt(tr.HitPos, self:GetAngles(), Color(255,0,0), 5)
		end
		return
	end

	local controlled = self.VJ_IsBeingControlled
	local ply = self.VJ_TheController
	if (controlled && ply:KeyDown(IN_ATTACK2) or !controlled && eneData.Visible && dist > 500 && dist <= 2500 && !self:IsBusy() && math.random(1,50) == 1 && math.abs(self:GetPos().z -enemy:GetPos().z) <= 128) && !self.IsCharging then
		self.IsCharging = true
		self.ChargeT = CurTime() +6
		-- placeholder sound
		VJ.CreateSound(self,{"npc/antlion_guard/angry1.wav","npc/antlion_guard/angry2.wav","npc/antlion_guard/angry3.wav"},100)
		self:CapabilitiesRemove(CAP_MOVE_JUMP)
		return
	end

end
--------------------