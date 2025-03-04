include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.Model = {"models/vj_piv/specials/bruiser/bruiser.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
	self.StartHealth = 600

	self.PIV_IsSpecial = true

	self.PIV_HasSubclasses = false
	self.PIV_CanBeCrippled = false
	self.PIV_CanBreakDoors = false
	self.PIV_AllowedToClimb = false
	self.PIV_HasWeapons = false
	self.PIV_CanBeThrower = false
	self.PIV_AllowedToRest = false

	self.PIV_IsHugeZombie = true
	self.NextRunT = 0
	self.RunT = 0
	self.Running = false
	self.Angry = false
	self.Angry_Amount = 0
	self.Angry_AmountNeeded = 100 -- ammount of damage it needs to take before going angy mode
	self.Angry_Time = 0

	self.HitGroupFlinching_Values = {
		{HitGroup = {HITGROUP_HEAD}, Animation = {"vjges_flinch_head"}}, 
		{HitGroup = {HITGROUP_STOMACH}, Animation = {"vjges_flinch_back","vjges_flinch_stomach"}}, 
		{HitGroup = {HITGROUP_CHEST}, Animation = {"vjges_flinch_chest","vjges_flinch_chest_2","vjges_flinch_chest_3"}}, 
		{HitGroup = {HITGROUP_LEFTARM}, Animation = {"vjges_flinch_left"}}, 
		{HitGroup = {HITGROUP_RIGHTARM}, Animation = {"vjges_flinch_right"}}, 
		{HitGroup = {HITGROUP_LEFTLEG}, Animation = {"vjsges_flinch_leftleg"}}, 
		{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {"vjges_flinch_rightleg"}}
	}
end
--------------------
function ENT:Zombie_GiveVoice()
	self.SoundTbl_Idle = {
		"vj_piv/bruiser/zombie_mutant_get_up_00_0.wav",
		"vj_piv/bruiser/zombie_mutant_get_up_01_0.wav",
		"vj_piv/bruiser/zombie_mutant_get_up_02_0.wav",
		"vj_piv/bruiser/zombie_mutant_idle_calm_00_0.wav",
		"vj_piv/bruiser/zombie_mutant_idle_calm_01_0.wav",
		"vj_piv/bruiser/zombie_mutant_idle_calm_02_0.wav"
	}
	self.SoundTbl_CombatIdle = {
		"vj_piv/bruiser/zombie_mutant_get_up_00_0.wav",
		"vj_piv/bruiser/zombie_mutant_get_up_01_0.wav",
		"vj_piv/bruiser/zombie_mutant_get_up_02_0.wav",
		"vj_piv/bruiser/zombie_mutant_idle_calm_00_0.wav",
		"vj_piv/bruiser/zombie_mutant_idle_calm_01_0.wav",
		"vj_piv/bruiser/zombie_mutant_idle_calm_02_0.wav"
	}
	self.SoundTbl_Alert = {
		"vj_piv/bruiser/zombie_mutant_enemy_spotted_00_0.wav",
		"vj_piv/bruiser/zombie_mutant_enemy_spotted_01_0.wav",
		"vj_piv/bruiser/zombie_mutant_enemy_spotted_02_0.wav"
	}
	self.SoundTbl_BeforeMeleeAttack = {
		"vj_piv/bruiser/zombie_mutant_attack_00_0.wav",
		"vj_piv/bruiser/zombie_mutant_attack_01_0.wav",
		"vj_piv/bruiser/zombie_mutant_attack_02_0.wav",
		"vj_piv/bruiser/zombie_mutant_attack_03_0.wav",
		"vj_piv/bruiser/zombie_mutant_attack_04_0.wav"
	}
	self.SoundTbl_Pain = {
		"vj_piv/bruiser/zombie_mutant_pain_00_0.wav",
		"vj_piv/bruiser/zombie_mutant_pain_01_0.wav",
		"vj_piv/bruiser/zombie_mutant_pain_02_0.wav"
	}
	self.SoundTbl_Death = {
		"vj_piv/bruiser/zombie_mutant_death_00_0.wav",
		"vj_piv/bruiser/zombie_mutant_death_01_0.wav",
		"vj_piv/bruiser/zombie_mutant_death_02_0.wav"
	}
	self.SoundTbl_AngyBitch = {
		"vj_piv/bruiser/zombie_mutant_pain_critical_00_0.wav",
		"vj_piv/bruiser/zombie_mutant_pain_critical_01_0.wav",
		"vj_piv/bruiser/zombie_mutant_pain_critical_02_0.wav"
	}
	self.SoundTbl_StartCharge = {
		"vj_piv/bruiser/zombie_mutant_pain_critical_00_0.wav",
		"vj_piv/bruiser/zombie_mutant_pain_critical_01_0.wav",
		"vj_piv/bruiser/zombie_mutant_pain_critical_02_0.wav"
	}
	self.SoundTbl_ChargeHit = {
		"vj_piv/bruiser/charger_smash_01.wav",
		"vj_piv/bruiser/charger_smash_02.wav",
		"vj_piv/bruiser/charger_smash_03.wav"
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
	self:SetSkin(math.random(0,15))
	self.NextRunT = CurTime() + math.random(6,12)
	self.NextAngryT = CurTime()
	self:SetModelScale(1.1)

	self.ChargePercentage = 0.65
	self.Bruiser_AnimationCache = {}
	self.ChargeAnim = VJ.SequenceToActivity(self, "charger_charge")

	self.NextChargeT = CurTime() +5
	self.StopChargingT = CurTime()
	self.Charging = false

	if !self.Bruiser_AnimationCache["charger_charge"] then
		self.Bruiser_AnimationCache["charger_charge"] = self:GetSequenceActivity(self:LookupSequence("charger_charge"))
	end

end
--------------------
function ENT:Zombie_CustomOnThink()
end
--------------------
function ENT:Zombie_CustomOnThink_AIEnabled()

	if self.Angry_Amount >= self.Angry_AmountNeeded && !self.Angry then -- if we have enough angy points and we're not angy then
		-- get angy
	
		self.Angry = true
		self.Running = true
		self.Angry_Amount = 0
		self.Angry_Time = CurTime() + math.random(10,20) -- how long we're angy for

		-- play beforemelee sound to audibly let them know we're angy
		VJ.EmitSound(self,self.SoundTbl_AngyBitch,self.AlertSoundLevel,math.random(95,100))
		self.SoundTbl_CombatIdle = {
			"vj_piv/bruiser/zombie_mutant_taunt_00_0.wav",
			"vj_piv/bruiser/zombie_mutant_taunt_01_0.wav",
			"vj_piv/bruiser/zombie_mutant_taunt_02_0.wav"
		}

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

end
--------------------
function ENT:Zombie_CustomOnAlert()
	if self:IsBusy("Activities") or self.Charging then return end
	self.NextChargeT = CurTime() +5
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
			self:CapabilitiesAdd(CAP_MOVE_JUMP)
			self:PlayAnim("shoved_forward",true,false,false)
			return
		end

		self.DisableChasingEnemy = true
		self.HasMeleeAttack = false
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
			self.DisableChasingEnemy = false
			self:CapabilitiesAdd(CAP_MOVE_JUMP)
			self:SetState()
			if tr.HitWorld then
				self:PlayAnim({"shoved_backward"},true,false,false)
				util.ScreenShake(self:GetPos(),1000,100,1,500)
				VJ.CreateSound(self,"npc/antlion_guard/shove1.wav",75)
			else
				self:PlayAnim("charger_melee_run_raw",true,false,false)
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
	if (controlled && ply:KeyDown(IN_ATTACK2) or !controlled && eneData.Visible && dist > 500 && dist <= 2500 && !self:IsBusy() && math.random(1,50) == 1 && math.abs(self:GetPos().z -enemy:GetPos().z) <= 128) && !self.IsCharging && self.Angry then
		self.IsCharging = true
		self.ChargeT = CurTime() +6
		-- placeholder sound
		VJ.CreateSound(self,{"npc/antlion_guard/angry1.wav","npc/antlion_guard/angry2.wav","npc/antlion_guard/angry3.wav"},100)
		self:CapabilitiesRemove(CAP_MOVE_JUMP)
		return
	end

end
--------------------
function ENT:Zombie_CustomOnTakeDamage_PreDamage(dmginfo,hitgroup)
	if hitgroup == HITGROUP_RIGHTARM or hitgroup == HITGROUP_LEFTARM then
		dmginfo:ScaleDamage(0.5)
	end
end
--------------------
function ENT:Zombie_CustomOnTakeDamage_PostDamage(dmginfo,hitgroup)
	if !self.Angry then -- if we're not angy then run this
		self.Angry_Amount = self.Angry_Amount +dmginfo:GetDamage() -- update angy ammount and add how much damage we took
	end
end
--------------------