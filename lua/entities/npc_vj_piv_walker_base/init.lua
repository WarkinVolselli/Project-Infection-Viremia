AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/hl2/citizens/male_01.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 125
ENT.HullType = HULL_HUMAN

ENT.VJC_Data = {
	CameraMode = 1,
	ThirdP_Offset = Vector(40, 20, -50),
	FirstP_Bone = "ValveBiped.Bip01_Spine2",
	FirstP_Offset = Vector(0, 0, 5),
}

ENT.MeleeAttackDamageType = DMG_CLUB -- Type of Damage

ENT.HasRangeAttack = false
ENT.AnimTbl_RangeAttack = {"vjges_melee_moving01a","vjges_melee_moving03a","vjges_melee_moving06a"}
ENT.RangeAttackEntityToSpawn = "obj_vj_piv_trash"
ENT.RangeAttackAnimationStopMovement = false
ENT.TimeUntilRangeAttackProjectileRelease = 0.7
ENT.NextRangeAttackTime = 5
ENT.NextRangeAttackTime_DoRand = 20
ENT.RangeDistance = 600
ENT.RangeToMeleeDistance = 200
ENT.RangeUseAttachmentForPos = true
ENT.RangeUseAttachmentForPosID = "anim_attachment_RH"

ENT.PIV_Infection = true
ENT.PIV_Infection_IsWalker = true
ENT.PIV_FuckingCrawlingLittleCunt = false
ENT.PIV_Diseased = false
ENT.PIV_HasArmor = false
ENT.PIV_Tank = false
ENT.PIV_IsSpecial = false
ENT.PIV_IsBoss = false
ENT.PIV_CanBeCrippled = true
ENT.PIV_IsHugeZombie = false

ENT.PIV_Jogger = false
ENT.PIV_Shambler = false
ENT.PIV_Brute = false
ENT.PIV_GoblinMode = false

ENT.PIV_HasSubclasses = true
ENT.PIV_CanBeJogger = true
ENT.PIV_CanBeShambler = true
ENT.PIV_CanBeCrawler = true
ENT.PIV_CanBeBrute = true
ENT.PIV_CanBeBiter = true
ENT.PIV_CanBeDiseased = true

ENT.PIV_IsZombine = false
ENT.PIV_IsMetropolice = false
ENT.PIV_IsMilitary = false
ENT.PIV_IsHEV = false

ENT.PIV_CanMutate = false
ENT.PIV_Mutated = false

ENT.PIV_DoorToBreak = NULL 

ENT.PIV_CanBreakDoors = true

ENT.PIV_CurAnims = -1 -- 0 = Normal | 1 = On fire

ENT.PIV_CanClimb = false
ENT.PIV_IsClimbing = false
ENT.PIV_NextClimbT = 0

ENT.PIV_AllowedToClimb = false

ENT.PIV_WeHaveAWeapon = false
ENT.PIV_WeaponType = 0
ENT.PIV_HasShield = false

ENT.PIV_Thrower = false
ENT.PIV_ThrowCount = 0

ENT.PIV_HasWeapons = true
ENT.PIV_CanBeThrower = true

ENT.PIV_CanRest = false
ENT.PIV_NextRestT = 0
ENT.PIV_Resting = 0
	-- 0 = Not Resting
	-- 1 = Sitting
	-- 2 = Lying
	
ENT.PIV_AllowedToRest = false

ENT.PIV_Gender = 0
	-- 1 = Male
	-- 2 = Female

ENT.PIV_AllowedToVomit = true
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"} -- NPCs with the same class with be allied to each other
ENT.BloodColor = "Red" -- The blood type, this will determine what it should use (decal, particle, etc.)
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true 
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 60
ENT.TimeUntilMeleeAttackDamage = false
ENT.HasMeleeAttackSlowPlayerSound = false
ENT.MeleeAttackDamage = math.random(15,20)

ENT.AttackProps = true -- Should it attack props when trying to move?
ENT.PushProps = true -- Should it push props when trying to move?
ENT.PropAP_MaxSize = 0.6 -- This is a scale number for the max size it can attack/push | x < 1  = Smaller props & x > 1  = Larger props | Default base value: 1

ENT.HasBreathSound = true

ENT.JumpVars = {
	MaxRise = 64, -- How high it can jump up ((S -> A) AND (S -> E))
	MaxDrop = 512, -- How low it can jump down (E -> S)
	MaxDistance = 256, -- Maximum distance between Start and End
}

ENT.DisableFootStepSoundTimer = true
ENT.HasExtraMeleeAttackSounds = false -- Set to true to use the extra melee attack sounds
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundpitch2 = 90

ENT.FireRun = false
ENT.PIV_CanBeFireRunner = true
ENT.CanDoTheFunny = true
ENT.CanDoBigFlinchy = true
ENT.PIVNextStumbleT = 0
ENT.NextSplodeStumbleT = 0
ENT.PIV_Crippled = false
ENT.PIV_AllowedToStumble = true
ENT.PIV_NextShoveT = 0
ENT.PIV_LegHP = 50

ENT.AnimTbl_Death = {"vjseq_witch_death","vjseq_nz_death_1","vjseq_nz_death_2","vjseq_nz_death_3","vjseq_death02","vjseq_death_01","vjseq_death_02a","vjseq_death_02c","vjseq_death_03","vjseq_death_05","vjseq_death_06","vjseq_death_07","vjseq_death_08","vjseq_death_08b","vjseq_death_09","vjseq_death_10ab","vjseq_death_10b","vjseq_death_10c","vjseq_death_11_01a","vjseq_death_11_01b","vjseq_death_11_02a","vjseq_death_11_02b","vjseq_death_11_02c","vjseq_death_11_02d","vjseq_death_11_03a","vjseq_death_11_03b","vjseq_death_11_03c"} 
	-- ====== Flinching Code ====== --
ENT.CanFlinch = 1
ENT.FlinchChance = 8
ENT.NextFlinchTime = 3
-- ENT.AnimTbl_Flinch = {ACT_BIG_FLINCH}
ENT.HasHitGroupFlinching = true 
ENT.HitGroupFlinching_DefaultWhenNotHit = true 
ENT.HitGroupFlinching_Values = {
{HitGroup = {HITGROUP_HEAD}, Animation = {"vjges_flinch_head_1","vjges_flinch_head_2","vjges_flinch_head_3"}}, 
{HitGroup = {HITGROUP_STOMACH}, Animation = {"vjges_flinch_stomach_01","vjges_flinch_stomach_02","vjges_ep_flinch_chest"}}, 
{HitGroup = {HITGROUP_CHEST}, Animation = {"vjges_flinch_chest_1","vjges_flinch_chest_2","vjges_flinch_chest_3"}}, 
{HitGroup = {HITGROUP_LEFTARM}, Animation = {"vjges_flinch_leftarm_1","vjges_flinch_leftarm_2","vjges_flinch_leftarm_3"}}, 
{HitGroup = {HITGROUP_RIGHTARM}, Animation = {"vjges_flinch_rightarm_1","vjges_flinch_rightarm_2","vjges_flinch_rightarm_3"}}, 
{HitGroup = {HITGROUP_LEFTLEG}, Animation = {"vjseq_ep_flinch_leftLeg"}}, 
{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {"vjseq_ep_flinch_rightLeg"}}
}
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_MeleeAttack = {"vj_piv/z_hit-01.wav","vj_piv/z_hit-02.wav","vj_piv/z_hit-03.wav","vj_piv/z_hit-04.wav","vj_piv/z_hit-05.wav","vj_piv/z_hit-06.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}
ENT.SoundTbl_MeleeAttack = {""}
ENT.FootSteps = {
	[MAT_ANTLION] = {
		"physics/flesh/flesh_impact_hard1.wav",
		"physics/flesh/flesh_impact_hard2.wav",
		"physics/flesh/flesh_impact_hard3.wav",
		"physics/flesh/flesh_impact_hard4.wav",
		"physics/flesh/flesh_impact_hard5.wav",
		"physics/flesh/flesh_impact_hard6.wav",
	},
	[MAT_BLOODYFLESH] = {
		"physics/flesh/flesh_impact_hard1.wav",
		"physics/flesh/flesh_impact_hard2.wav",
		"physics/flesh/flesh_impact_hard3.wav",
		"physics/flesh/flesh_impact_hard4.wav",
		"physics/flesh/flesh_impact_hard5.wav",
		"physics/flesh/flesh_impact_hard6.wav",
	},
	[MAT_CONCRETE] = {
		"player/footsteps/concrete1.wav",
		"player/footsteps/concrete2.wav",
		"player/footsteps/concrete3.wav",
		"player/footsteps/concrete4.wav",
	},
	[MAT_DIRT] = {
		"player/footsteps/dirt1.wav",
		"player/footsteps/dirt2.wav",
		"player/footsteps/dirt3.wav",
		"player/footsteps/dirt4.wav",
	},
	[MAT_FLESH] = {
		"physics/flesh/flesh_impact_hard1.wav",
		"physics/flesh/flesh_impact_hard2.wav",
		"physics/flesh/flesh_impact_hard3.wav",
		"physics/flesh/flesh_impact_hard4.wav",
		"physics/flesh/flesh_impact_hard5.wav",
		"physics/flesh/flesh_impact_hard6.wav",
	},
	[MAT_GRATE] = {
		"player/footsteps/metalgrate1.wav",
		"player/footsteps/metalgrate2.wav",
		"player/footsteps/metalgrate3.wav",
		"player/footsteps/metalgrate4.wav",
	},
	[MAT_ALIENFLESH] = {
		"physics/flesh/flesh_impact_hard1.wav",
		"physics/flesh/flesh_impact_hard2.wav",
		"physics/flesh/flesh_impact_hard3.wav",
		"physics/flesh/flesh_impact_hard4.wav",
		"physics/flesh/flesh_impact_hard5.wav",
		"physics/flesh/flesh_impact_hard6.wav",
	},
	[74] = { -- Snow
		"player/footsteps/sand1.wav",
		"player/footsteps/sand2.wav",
		"player/footsteps/sand3.wav",
		"player/footsteps/sand4.wav",
	},
	[MAT_PLASTIC] = {
		"physics/plaster/drywall_footstep1.wav",
		"physics/plaster/drywall_footstep2.wav",
		"physics/plaster/drywall_footstep3.wav",
		"physics/plaster/drywall_footstep4.wav",
	},
	[MAT_METAL] = {
		"player/footsteps/metal1.wav",
		"player/footsteps/metal2.wav",
		"player/footsteps/metal3.wav",
		"player/footsteps/metal4.wav",
	},
	[MAT_SAND] = {
		"player/footsteps/sand1.wav",
		"player/footsteps/sand2.wav",
		"player/footsteps/sand3.wav",
		"player/footsteps/sand4.wav",
	},
	[MAT_FOLIAGE] = {
		"player/footsteps/grass1.wav",
		"player/footsteps/grass2.wav",
		"player/footsteps/grass3.wav",
		"player/footsteps/grass4.wav",
	},
	[MAT_COMPUTER] = {
		"physics/plaster/drywall_footstep1.wav",
		"physics/plaster/drywall_footstep2.wav",
		"physics/plaster/drywall_footstep3.wav",
		"physics/plaster/drywall_footstep4.wav",
	},
	[MAT_SLOSH] = {
		"player/footsteps/slosh1.wav",
		"player/footsteps/slosh2.wav",
		"player/footsteps/slosh3.wav",
		"player/footsteps/slosh4.wav",
	},
	[MAT_TILE] = {
		"player/footsteps/tile1.wav",
		"player/footsteps/tile2.wav",
		"player/footsteps/tile3.wav",
		"player/footsteps/tile4.wav",
	},
	[85] = { -- Grass
		"player/footsteps/grass1.wav",
		"player/footsteps/grass2.wav",
		"player/footsteps/grass3.wav",
		"player/footsteps/grass4.wav",
	},
	[MAT_VENT] = {
		"player/footsteps/duct1.wav",
		"player/footsteps/duct2.wav",
		"player/footsteps/duct3.wav",
		"player/footsteps/duct4.wav",
	},
	[MAT_WOOD] = {
		"player/footsteps/wood1.wav",
		"player/footsteps/wood2.wav",
		"player/footsteps/wood3.wav",
		"player/footsteps/wood4.wav",
		"player/footsteps/woodpanel1.wav",
		"player/footsteps/woodpanel2.wav",
		"player/footsteps/woodpanel3.wav",
		"player/footsteps/woodpanel4.wav",
	},
	[MAT_GLASS] = {
		"physics/glass/glass_sheet_step1.wav",
		"physics/glass/glass_sheet_step2.wav",
		"physics/glass/glass_sheet_step3.wav",
		"physics/glass/glass_sheet_step4.wav",
	}
}
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 90
ENT.FootStepPitch = VJ.SET(100, 100)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFootStepSound()
	if !self:IsOnGround() then return end
	local tr = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() +Vector(0,0,-150),
		filter = {self}
	})
	if tr.Hit && self.FootSteps[tr.MatType] then
		VJ.EmitSound(self,VJ.PICK(self.FootSteps[tr.MatType]),self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch.a,self.FootStepPitch.b))
	end
	if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
		VJ.EmitSound(self,"player/footsteps/wade" .. math.random(1,8) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FootStepSoundCode(CustomTbl)

	if self.HasSounds == false or self.HasFootStepSound == false or self.MovementType == VJ_MOVETYPE_STATIONARY then return end

	if self:IsOnGround() && self:GetGroundEntity() != NULL then

		if self.DisableFootStepSoundTimer == true then

			self:CustomOnFootStepSound()
			return

		elseif self:IsMoving() && CurTime() > self.FootStepT then

			self:CustomOnFootStepSound()
			local CurSched = self.CurrentSchedule

			if
				self.DisableFootStepOnRun == false &&
				((VJ.HasValue(self.AnimTbl_Run,self:GetMovementActivity())) or
				(CurSched != nil  && CurSched.IsMovingTask_Run == true))
			then

				self:CustomOnFootStepSound_Run()
				self.FootStepT = CurTime() + self.FootStepTimeRun
				return

			elseif 
				self.DisableFootStepOnWalk == false &&
				(VJ.HasValue(self.AnimTbl_Walk,self:GetMovementActivity()) or
				(CurSched != nil  && CurSched.IsMovingTask_Walk == true))
			then
				self:CustomOnFootStepSound_Walk()
				self.FootStepT = CurTime() + self.FootStepTimeWalk
				return
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()

	self:Zombie_CustomOnInitialize()

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
	
    if GetConVar("vj_piv_rebirth"):GetInt() == 1 && GetConVar("vj_piv_rebirthall"):GetInt() == 1 && !self.PIV_IsBoss then
		self.PIV_CanMutate = false
		self.PIV_Mutated = true
		self:PIV_CustomMutate()
	end

    if GetConVar("vj_piv_rebirth"):GetInt() == 1 && !self.PIV_IsBoss then 
		self.PIV_CanMutate = true
	end

    if GetConVar("vj_piv_door_breaking"):GetInt() == 1 && self.PIV_CanBreakDoors then
		self.CanOpenDoors = false -- Can it open doors?
	end
	
    if GetConVar("vj_piv_jumping"):GetInt() == 2 then
	    self.AllowMovementJumping = true
	else
		self.AllowMovementJumping = false
	end

    if GetConVar("vj_piv_climbing"):GetInt() == 2 && self.PIV_AllowedToClimb then
		self.PIV_CanClimb = true
	end

    if GetConVar("vj_piv_deathanim"):GetInt() == 1 then 
		self.HasDeathAnimation = true
		self.DeathAnimationChance = GetConVarNumber("vj_piv_deathanim_chance")
    end

    self.PIV_LegHP = self.StartHealth / 2

	if GetConVar("vj_piv_subclasses"):GetInt() == 1 && self.PIV_HasSubclasses && !self.PIV_IsBoss then

		-- joggers
		if math.random(1,GetConVar("vj_piv_jogger_chance"):GetInt()) == 1 && self.PIV_CanBeJogger then
			self.PIV_Jogger = true
			self.PIV_CanBeCrawler = false
			self.PIV_HasWeapons = false
			self.PIV_CanBeFireRunner = false
		end

		--shamblers
		if math.random(1,GetConVar("vj_piv_shambler_chance"):GetInt()) == 1 && self.PIV_CanBeShambler then
			self.PIV_Shambler = true
			self.PIV_CanBeCrawler = false
			self.StartHealth = self.StartHealth * 1.25
		end
		
		if math.random(1,GetConVar("vj_piv_brute_chance"):GetInt()) == 1 && self.PIV_CanBeBrute then
			self.PIV_Brute = true
			self.PIV_CanBeCrawler = false
			self.PIV_CanBeCrippled = false
			self.StartHealth = self.StartHealth * 1.5
			self.GeneralSoundPitch1 = self.GeneralSoundPitch1 - 10
			self.GeneralSoundPitch2 = self.GeneralSoundPitch2 - 10
			self:SetModelScale(1.1)
			if self:GetClass() == "npc_vj_piv_spewer" or self:GetClass() == "npc_vj_piv_spitter" then
				self:SetModelScale(1.2)
			end
		end
		
		if math.random(1,GetConVar("vj_piv_biter_chance"):GetInt()) == 1 && self.PIV_CanBeBiter  then
			self.PIV_Biter = true
			self.PIV_CanBeCrawler = false
		end

		if math.random(1,GetConVar("vj_piv_crawler_chance"):GetInt()) == 1 && self.PIV_CanBeCrawler then 
			self.PIV_FuckingCrawlingLittleCunt = true
			self:Cripple()    
			self.PIV_HasWeapons = false
			self.PIV_CanBeThrower = false
		end
		
		if math.random(1,GetConVar("vj_piv_diseased_chance"):GetInt()) == 1 && self.PIV_CanBeDiseased then
			self.PIV_Diseased = true
			self.MeleeAttackBleedEnemyChance = 1
			self.MeleeAttackBleedEnemyDamage = 1
			self.MeleeAttackBleedEnemyTime = 1
			self.MeleeAttackBleedEnemyReps = math.random(5,20)
			self.MeleeAttackBleedEnemy = true
			ParticleEffectAttach("embers_medium_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
		end
	end

	if math.random(1,GetConVar("vj_piv_firerunners_chance"):GetInt()) == 1 && GetConVar("vj_piv_firerunners"):GetInt() == 1 && self.PIV_CanBeFireRunner && !self.Immune_Fire then
		self.FireRun = true
	end

	self.IsDigging = false
	self:Dig()
	
		if GetConVar("vj_piv_weapons"):GetInt() == 1 && math.random(1,GetConVar("vj_piv_weapons_chance"):GetInt()) == 1 && self.PIV_HasWeapons then
				
			self.PIV_WeHaveAWeapon = true
			self.PIV_CanBeThrower = false
			self.ExtraGunModel1 = ents.Create("prop_physics")
			
			if self.PIV_IsMilitary == true then
				local weapon = math.random(1,3)

				if weapon == 1 then	
					self.PIV_WeaponType = 1
					self.ExtraGunModel1:SetModel("models/vj_piv/weapons/w_baton.mdl")
					self.SoundTbl_MeleeAttack = {"vj_piv/wrenchhit1.wav","vj_piv/wrenchhit2.wav","vj_piv/wrenchhit3.wav","vj_piv/wrenchhit4.wav"}
					self.SoundTbl_MeleeAttackMiss = {"vj_piv/swing_light_blunt_01.wav","vj_piv/swing_light_blunt_02.wav","vj_piv/swing_light_blunt_03.wav"}
				end
				if weapon == 2 then
					self.PIV_WeaponType = 1
					self.ExtraGunModel1:SetModel("models/vj_piv/weapons/w_knife_t.mdl")
					self.SoundTbl_MeleeAttack = {"vj_piv/knife_hit_01.wav","vj_piv/knife_hit_02.wav","vj_piv/knife_hit_03.wav","vj_piv/knife_hit_04.wav","vj_piv/knife_hit_05.wav","vj_piv/knife_hit_06.wav"}
					self.SoundTbl_MeleeAttackMiss = {"vj_piv/swing_light_sharp_01.wav","vj_piv/swing_light_sharp_02.wav","vj_piv/swing_light_sharp_03.wav"}
				end
				if weapon == 3 then	
					self.PIV_WeaponType = 2
					self.ExtraGunModel1:SetModel("models/vj_piv/weapons/w_me_fubar.mdl")
					self.SoundTbl_MeleeAttack = {"vj_piv/HammerSkullPenetrate.wav"}
					self.SoundTbl_MeleeAttackMiss = {"vj_piv/swing_heavy_blunt_01.wav","vj_piv/swing_heavy_blunt_02.wav","vj_piv/swing_heavy_blunt_03.wav"}
				end
			elseif self.PIV_IsZombine == true or self.PIV_IsMetropolice == true then
				local weapon = math.random(1,2)

				if weapon == 1 then
					self.PIV_WeaponType = 1
					self.ExtraGunModel1:SetModel("models/vj_piv/weapons/w_knife_t.mdl")
					self.SoundTbl_MeleeAttack = {"vj_piv/knife_hit_01.wav","vj_piv/knife_hit_02.wav","vj_piv/knife_hit_03.wav","vj_piv/knife_hit_04.wav","vj_piv/knife_hit_05.wav","vj_piv/knife_hit_06.wav"}
					self.SoundTbl_MeleeAttackMiss = {"vj_piv/swing_light_sharp_01.wav","vj_piv/swing_light_sharp_02.wav","vj_piv/swing_light_sharp_03.wav"}
				end
				if weapon == 2 then	
					self.PIV_WeaponType = 2
					self.ExtraGunModel1:SetModel("models/weapons/w_stunbaton.mdl")
					self.SoundTbl_MeleeAttack = {"weapons/stunstick/stunstick_fleshhit1.wav","weapons/stunstick/stunstick_fleshhit2.wav","weapons/stunstick/stunstick_impact1.wav"}
					self.SoundTbl_MeleeAttackMiss = {"weapons/stunstick/stunstick_swing1.wav","weapons/stunstick/stunstick_swing2.wav"}
				end
			else
				local weapon = math.random(1,12)

				if weapon == 1 then	
					self.PIV_WeaponType = 2
					self.ExtraGunModel1:SetModel("models/vj_piv/weapons/mattpipe.mdl")
					self.SoundTbl_MeleeAttack = {"vj_piv/wrenchhit1.wav","vj_piv/wrenchhit2.wav","vj_piv/wrenchhit3.wav","vj_piv/wrenchhit4.wav"}
					self.SoundTbl_MeleeAttackMiss = {"vj_piv/swing_heavy_blunt_01.wav","vj_piv/swing_heavy_blunt_02.wav","vj_piv/swing_heavy_blunt_03.wav"}
				end
				if weapon == 2 then
					self.PIV_WeaponType = 1
					self.ExtraGunModel1:SetModel("models/vj_piv/weapons/w_knife_t.mdl")
					self.SoundTbl_MeleeAttack = {"vj_piv/knife_hit_01.wav","vj_piv/knife_hit_02.wav","vj_piv/knife_hit_03.wav","vj_piv/knife_hit_04.wav","vj_piv/knife_hit_05.wav","vj_piv/knife_hit_06.wav"}
					self.SoundTbl_MeleeAttackMiss = {"vj_piv/swing_light_sharp_01.wav","vj_piv/swing_light_sharp_02.wav","vj_piv/swing_light_sharp_03.wav"}
				end

				if weapon == 3 then
					self.PIV_WeaponType = 2
					self.ExtraGunModel1:SetModel("models/vj_piv/weapons/w_crowbar.mdl")			
					self.SoundTbl_MeleeAttack = {"vj_piv/HammerWhack-1.wav","vj_piv/HammerWhack-2.wav","vj_piv/HammerWhack-3.wav"}
					self.SoundTbl_MeleeAttackMiss = {"vj_piv/swing_heavy_blunt_01.wav","vj_piv/swing_heavy_blunt_02.wav","vj_piv/swing_heavy_blunt_03.wav"}
				end
				if weapon == 4 then
					self.PIV_WeaponType = 2
					self.ExtraGunModel1:SetModel("models/vj_piv/weapons/w_axe.mdl")			
					self.SoundTbl_MeleeAttack = {"vj_piv/HatchetIn-1.wav","vj_piv/HatchetIn-2.wav","vj_piv/HatchetIn-3.wav"}
					self.SoundTbl_MeleeAttackMiss = {"vj_piv/swing_heavy_sharp_01.wav","vj_piv/swing_heavy_sharp_02.wav","vj_piv/swing_heavy_sharp_03.wav"}
				end

				if weapon == 5 then	
					self.PIV_WeaponType = 2
					self.ExtraGunModel1:SetModel("models/vj_piv/weapons/w_shovel.mdl")
					self.SoundTbl_MeleeAttack = {"vj_piv/ShovelSmack-1.wav","vj_piv/ShovelSmack-2.wav","vj_piv/ShovelSmack-3.wav"}
					self.SoundTbl_MeleeAttackMiss = {"vj_piv/swing_heavy_blunt_01.wav","vj_piv/swing_heavy_blunt_02.wav","vj_piv/swing_heavy_blunt_03.wav"}
				end
				if weapon == 6 then	
					self.PIV_WeaponType = 1
					self.ExtraGunModel1:SetModel("models/vj_piv/weapons/w_pan.mdl")		
					self.SoundTbl_MeleeAttack = {"vj_piv/fryingpan1.wav","vj_piv/fryingpan2.wav","vj_piv/fryingpan3.wav","vj_piv/fryingpan4.wav"}
					self.SoundTbl_MeleeAttackMiss = {"vj_piv/swing_light_blunt_01.wav","vj_piv/swing_light_blunt_02.wav","vj_piv/swing_light_blunt_03.wav"}
				end
				
				if weapon == 7 then	

					self.PIV_WeaponType = 2
					self.ExtraGunModel1:SetModel("models/vj_piv/weapons/w_me_bat_metal.mdl")
					self.SoundTbl_MeleeAttack = {"vj_piv/MetalBat1.wav","vj_piv/MetalBat2.wav","vj_piv/MetalBat3.wav","vj_piv/MetalBat4.wav"}
					self.SoundTbl_MeleeAttackMiss = {"vj_piv/swing_heavy_blunt_01.wav","vj_piv/swing_heavy_blunt_02.wav","vj_piv/swing_heavy_blunt_03.wav"}
				end
				
				if weapon == 8 then	
					self.PIV_WeaponType = 2
					self.ExtraGunModel1:SetModel("models/vj_piv/weapons/w_me_machete.mdl")
					self.SoundTbl_MeleeAttack = {"vj_piv/SwordHit-1.wav","vj_piv/SwordHit-2.wav","vj_piv/SwordHit-3.wav","vj_piv/SwordHit-4.wav","vj_piv/SwordHit-5.wav","vj_piv/SwordHit-6.wav","vj_piv/SwordHit-7.wav","vj_piv/SwordHit-8.wav","vj_piv/SwordHit-9.wav"}
					self.SoundTbl_MeleeAttackMiss = {"vj_piv/swing_heavy_sharp_01.wav","vj_piv/swing_heavy_sharp_02.wav","vj_piv/swing_heavy_sharp_03.wav"}
				end
				if weapon == 9 then	
					self.PIV_WeaponType = 1
					self.ExtraGunModel1:SetModel("models/vj_piv/weapons/w_me_wrench.mdl")
					self.SoundTbl_MeleeAttack = {"vj_piv/wrenchhit1.wav","vj_piv/wrenchhit2.wav","vj_piv/wrenchhit3.wav","vj_piv/wrenchhit4.wav"}
					self.SoundTbl_MeleeAttackMiss = {"vj_piv/swing_light_blunt_01.wav","vj_piv/swing_light_blunt_02.wav","vj_piv/swing_light_blunt_03.wav"}
				end
				if weapon == 10 then	
					self.PIV_WeaponType = 2
					self.ExtraGunModel1:SetModel("models/vj_piv/weapons/w_me_fubar.mdl")
					self.SoundTbl_MeleeAttack = {"vj_piv/HammerSkullPenetrate.wav"}
					self.SoundTbl_MeleeAttackMiss = {"vj_piv/swing_heavy_blunt_01.wav","vj_piv/swing_heavy_blunt_02.wav","vj_piv/swing_heavy_blunt_03.wav"}
				end
				if weapon == 11 then
					self.PIV_WeaponType = 2
					self.ExtraGunModel1:SetModel("models/vj_piv/weapons/w_me_sledge.mdl")
					self.SoundTbl_MeleeAttack = {"vj_piv/HammerSkullPenetrate.wav"}
					self.SoundTbl_MeleeAttackMiss = {"vj_piv/swing_heavy_blunt_01.wav","vj_piv/swing_heavy_blunt_02.wav","vj_piv/swing_heavy_blunt_03.wav"}
				end
				if weapon == 12 then	
					self.PIV_WeaponType = 1
					self.ExtraGunModel1:SetModel("models/vj_piv/weapons/w_hammer.mdl")
					self.SoundTbl_MeleeAttack = {"vj_piv/HammerWhack-1.wav","vj_piv/HammerWhack-2.wav","vj_piv/HammerWhack-3.wav"}
					self.SoundTbl_MeleeAttackMiss = {"vj_piv/swing_light_blunt_01.wav","vj_piv/swing_light_blunt_02.wav","vj_piv/swing_light_blunt_03.wav"}
				end
			end

			self.ExtraGunModel1:SetOwner(self)
			self.ExtraGunModel1:SetParent(self)
			self.ExtraGunModel1:SetLocalAngles(Angle(-120,45,90))
			self.ExtraGunModel1:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
			self.ExtraGunModel1:Fire("SetParentAttachment","anim_attachment_RH")
			self.ExtraGunModel1:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			self.ExtraGunModel1:Spawn()
			self.ExtraGunModel1:Activate()
			self.ExtraGunModel1:SetSolid(SOLID_NONE)
			self.ExtraGunModel1:AddEffects(EF_BONEMERGE)
			self.ExtraGunModel1:SetLocalPos(self:GetPos())

		end

	if GetConVar("vj_piv_throwing"):GetInt() == 1 && math.random(1,GetConVar("vj_piv_thrower_chance"):GetInt()) == 1 && self.PIV_CanBeThrower then
		self.PIV_Thrower = true
		self.PIV_ThrowCount = math.random(GetConVar("vj_piv_throwing_min"):GetInt(),GetConVar("vj_piv_throwing_max"):GetInt())
		self.HasRangeAttack = true
	end
			
	if GetConVar("vj_piv_resting"):GetInt() == 1 && self.PIV_AllowedToRest then
		self.PIV_CanRest = true
		self.PIV_NextRestT = CurTime() + math.Rand(10, 120)
	end

	self:Zombie_CustomOnPreInitialize()

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnPreInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)

	if key == "step" then
		self:FootStepSoundCode()
		
	    if self.PIV_IsHugeZombie == true && self.PIV_Tank == false then
			util.ScreenShake(self:GetPos(), 1, 5, 1, 1000)
			VJ.EmitSound(self, "vj_piv/charger_run_left_0"..math.random(1,4)..".wav", 70, 100)
		elseif self.PIV_IsHugeZombie == true && self.PIV_Tank == true then
			util.ScreenShake(self:GetPos(), 2, 5, 1, 1000)
			VJ.EmitSound(self, "vj_piv/tank/step_"..math.random(1,5)..".wav", 75, 100)
		end
		
	    if self.PIV_HasArmor == true && self.PIV_IsHugeZombie == false then
			VJ.EmitSound(self, "vj_piv/mil_zomb/step_"..math.random(1,4)..".mp3", 75, 100)
		elseif self.PIV_HasArmor == true && self.PIV_IsHugeZombie == true then
			VJ.EmitSound(self, "vj_piv/demolisher/step/step_"..math.random(1,4)..".mp3", 75, 100)
		end
		
	    if self.PIV_IsZombine == true && self.PIV_IsHugeZombie == false then
			VJ.EmitSound(self, "npc/combine_soldier/gear"..math.random(1,6)..".wav", 70, 100)
		end
		
	    if self.PIV_IsMetropolice == true && self.PIV_IsHugeZombie == false then
			VJ.EmitSound(self, "npc/metropolice/gear"..math.random(1,6)..".wav", 70, 100)
		end
		
	    if self.PIV_IsMilitary == true && self.PIV_IsHugeZombie == false then
			VJ.EmitSound(self, "vj_piv/mil_zomb/gear"..math.random(1,6)..".wav", 70, 100)
		end
		
	    if self.PIV_IsHEV == true then
			VJ.EmitSound(self, "physics/metal/metal_box_footstep"..math.random(1,4)..".wav", 70, 100)
		end
	
		if self:GetClass() == "npc_vj_piv_phorid" then
			VJ.EmitSound(self, "vj_piv/phorid/brut_fs_walk_heel_01_"..math.random(0,20)..".wav", 70, 100)
		end
	end

	if key == "slide" then
		VJ.EmitSound(self,"vj_piv/foot_slide"..math.random(1,3)..".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch.a,self.FootStepPitch.b))
	end

	if key == "crawl" then
		VJ.EmitSound(self,"vj_piv/foot_slide"..math.random(1,3)..".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch.a,self.FootStepPitch.b))
	end

	if key == "attack" then
		self:MeleeAttackCode()
		
		if self:GetClass() == "npc_vj_piv_slammer" then
			VJ.EmitSound(self, "vj_piv/concrete_break"..math.random(2,3)..".wav",80,100)
			VJ.EmitSound(self, "vj_piv/slammer/slam"..math.random(1,2)..".wav", 80, math.random(100,110))
			util.ScreenShake(self:GetPos(), 300, 500, 1.6, 1200)
			local pos = self:LocalToWorld(Vector(80,0,0))
			ParticleEffect("strider_impale_ground",pos,Angle(0,0,0),nil)
			ParticleEffect("strider_cannon_impact",pos,Angle(0,0,0),nil)
			
			local effectdata = EffectData()
			effectdata:SetOrigin(pos,Angle(0,0,0))
			effectdata:SetScale( 100 )
			
			util.Effect( "ThumperDust", effectdata )
			VJ.ApplyRadiusDamage(self, self, pos, 150, math.random(5,10), DMG_GENERIC, true, true, {DisableVisibilityCheck=true, Force=80})
			util.ScreenShake(pos, 300, 500, 1.6, 1200)
			
		local tbl = {
			"models/props_debris/concrete_chunk04a.mdl",
			"models/props_debris/concrete_chunk05g.mdl",
			"models/props_debris/concrete_chunk03a.mdl",
			"models/props_debris/concrete_chunk04a.mdl",
			"models/props_debris/concrete_chunk05g.mdl",
			"models/props_debris/concrete_chunk08a.mdl",
			"models/props_debris/concrete_chunk09a.mdl",
			"models/props_debris/concrete_chunk09a.mdl"
		}
		local rand = VectorRand() *15
		rand.z = 5
		for _,v in pairs(tbl) do
			local p = ents.Create("obj_vj_gib")
			p:SetModel(v)
			p:SetPos(pos +rand)
			p:SetAngles(self:GetAngles())
			p.BloodType = false
			p.CollideSound = {
				"physics/concrete/rock_impact_hard1.wav",
				"physics/concrete/rock_impact_hard2.wav",
				"physics/concrete/rock_impact_hard3.wav",
				"physics/concrete/rock_impact_hard4.wav",
				"physics/concrete/rock_impact_hard5.wav",
				"physics/concrete/rock_impact_hard6.wav"
			}
			p.Collide_Decal = ""
			p:Spawn()
			p:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
			p:GetPhysicsObject():SetVelocity(self:GetRight()*math.Rand(-50,50)+self:GetForward()*math.Rand(-50,50)+self:GetUp()*math.Rand(400,600))
			timer.Simple(GetConVarNumber("vj_npc_fadegibstime"),function() SafeRemoveEntity(p) end)
		end
		
		end
    end
	
	if key == "attack_kick" then
		self:MeleeAttackCode()		
    end
	
	if key == "jumpland" then
		self:MeleeAttackCode()
		if self.PIV_IsHugeZombie == true then
			util.ScreenShake(self:GetPos(), 100, 500, 1, 1000)
			VJ.EmitSound(self, "vj_piv/charger_run_left_0"..math.random(1,4)..".wav", 70, 100)
			VJ.EmitSound(self,"vj_piv/tank_death_bodyfall_01.wav",75,100)
			VJ.ApplyRadiusDamage(self,self,self:GetPos(),100,math.random(10,15),DMG_CRUSH,true,true)
			
			local effectdata = EffectData()
			effectdata:SetOrigin(self:GetPos())
			effectdata:SetScale( 100 )
			util.Effect( "ThumperDust", effectdata )
		end
    end
	
	if key == "jumpend" then
		self:VJ_ACT_PLAYACTIVITY("vjseq_crouch_to_stand",true,1.6)
    end

	if key == "death" then
	
		if self.PIV_IsHugeZombie == true then
			util.ScreenShake(self:GetPos(), 100, 500, 1, 1000)
			VJ.EmitSound(self,"vj_piv/tank_death_bodyfall_01.wav",75,100)
		end
		
		if self.PIV_HasArmor == true && self.PIV_IsHugeZombie == false then
			VJ.EmitSound(self, "vj_piv/mil_zomb/step_"..math.random(1,4)..".mp3", 70, 80)
		elseif self.PIV_HasArmor == true && self.PIV_IsHugeZombie == true then
			VJ.EmitSound(self, "vj_piv/demolisher/step/step_"..math.random(1,4)..".mp3", 70, 80)
		end
		
		if self.PIV_IsZombine == true && self.PIV_IsHugeZombie == false then
			VJ.EmitSound(self, "npc/combine_soldier/gear"..math.random(1,6)..".wav", 70, 80)
		end
		
	    if self.PIV_IsMetropolice == true && self.PIV_IsHugeZombie == false then
			VJ.EmitSound(self, "npc/metropolice/gear"..math.random(1,6)..".wav", 70, 80)
		end

		VJ.EmitSound(self, "physics/body/body_medium_impact_soft"..math.random(1,7)..".wav", 75, 100)

		if GetConVar("vj_piv_weapons_dropping_stumble"):GetInt() == 1 then
			if math.random(1,GetConVar("vj_piv_weapons_dropping_chance"):GetInt()) == 1 then
				self:DropTheFuckignWeaponGoddamn()
				self:DropTheShield() 
			end
		end

    end

	if key == "break_door" then
	
		if IsValid(self.PIV_DoorToBreak) then
		
			VJ.CreateSound(self,self.SoundTbl_BeforeMeleeAttack,self.BeforeMeleeAttackSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a, self.BeforeMeleeAttackSoundPitch.b))
			VJ.EmitSound(self,"vj_piv/BangDoor"..math.random(1,10)..".wav",75,100)
			
			if self.PIV_IsHugeZombie then
				util.ScreenShake(self:GetPos(), self.WorldShakeOnMoveAmplitude, self.WorldShakeOnMoveFrequency, self.WorldShakeOnMoveDuration, self.WorldShakeOnMoveRadius)
			end
			
			local doorDmg = self.MeleeAttackDamage
			local door = self.PIV_DoorToBreak
			
			if door.DoorHealth == nil then
				door.DoorHealth = 200 - doorDmg
			elseif door.DoorHealth <= 0 then
				VJ.EmitSound(self,self.SoundTbl_MeleeAttackMiss,self.MeleeAttackMissSoundLevel,self:VJ_DecideSoundPitch(self.MeleeAttackMissSoundPitch.a,self.MeleeAttackMissSoundPitch.b))
			return -- To prevent door props making a duplication when it shouldn't
			else
				door.DoorHealth = door.DoorHealth - doorDmg
			end
			
		if door:GetClass() == "prop_door_rotating" && door.DoorHealth <= 0 then
		
			door:EmitSound("physics/wood/wood_furniture_break"..math.random(1,2)..".wav",75,100)
			door:EmitSound("ambient/materials/door_hit1.wav",75,100)
			ParticleEffect("door_pound_core",door:GetPos(),door:GetAngles(),nil)
			ParticleEffect("door_explosion_chunks",door:GetPos(),door:GetAngles(),nil)
			door:Remove()
			
			if self.PIV_IsHugeZombie == true or self:GetClass() == "npc_vj_piv_exploder" then
				self:VJ_ACT_PLAYACTIVITY(ACT_BIG_FLINCH,true,1.6)
			else
				self:VJ_ACT_PLAYACTIVITY(ACT_STEP_BACK,true,1.6)
			end
			
            local doorgib = ents.Create("prop_physics")
            doorgib:SetPos(door:GetPos())
            doorgib:SetAngles(door:GetAngles())
            doorgib:SetModel(door:GetModel())
            doorgib:SetSkin(door:GetSkin())
			doorgib:SetBodygroup(1,door:GetBodygroup(1))
			doorgib:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
			doorgib:SetSolid(SOLID_NONE)
            doorgib:Spawn()
			doorgib:GetPhysicsObject():ApplyForceCenter(self:GetForward()*5000)
			SafeRemoveEntityDelayed(doorgib,30)
			
		elseif door:GetClass() == "func_door_rotating" && door.DoorHealth <= 0 then
		
			door:EmitSound("physics/wood/wood_furniture_break"..math.random(1,2)..".wav",75,100)
			ParticleEffect("door_pound_core",door:GetPos(),door:GetAngles(),nil)
			ParticleEffect("door_explosion_chunks",door:GetPos(),door:GetAngles(),nil)
			door:Remove()
			self:VJ_ACT_PLAYACTIVITY(ACT_STEP_BACK,true,1.6)
			
            local doorgibs = ents.Create("prop_dynamic")
            doorgibs:SetPos(door:GetPos())
            doorgibs:SetModel("models/props_c17/FurnitureDresser001a.mdl")
            doorgibs:Spawn()
            doorgibs:TakeDamage(9999)
            doorgibs:Fire("break")		
			
			end
		end
	end
	
	if key == "bloodbombequip" then
		VJ.EmitSound(self,"physics/body/body_medium_break"..math.random(2,4)..".wav",75,100)
		ParticleEffectAttach("blood_impact_red_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
		self.BloodBomb = ents.Create("prop_physics")
		self.BloodBomb:SetOwner(self)
		self.BloodBomb:SetParent(self)
		self.BloodBomb:SetLocalAngles(Angle(-120,45,90))
		self.BloodBomb:SetModel("models/weapons/w_bugbait.mdl")		
		self.BloodBomb:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
		self.BloodBomb:Fire("SetParentAttachment","anim_attachment_RH")
		self.BloodBomb:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self.BloodBomb:Spawn()
		self.BloodBomb:Activate()
		self.BloodBomb:SetSolid(SOLID_NONE)
		self.BloodBomb:AddEffects(EF_BONEMERGE)
		self.BloodBomb:SetLocalPos(self:GetPos())
    end

	if key == "bloodbombthrow" then
		if IsValid(self.BloodBomb) then
			self.BloodBomb:Remove()	
		end
		self:RangeAttackCode()
    end
	
	if key == "lift" then
		VJ.EmitSound(self,"vj_piv/slammer/raiseweapon"..math.random(1,4)..".wav",70,math.random(90,100))
    end
	
	if key == "lower" then
		VJ.EmitSound(self,"vj_piv/slammer/lowerweapon"..math.random(1,4)..".wav",70,math.random(90,100))
    end

	if key == "swing" then
		if self.PIV_Toxic == false then
			VJ.EmitSound(self,self.SoundTbl_Pain,self.AlertSoundLevel,math.random(110,120))
		end
		VJ.EmitSound(self,"vj_piv/slammer/swing"..math.random(1,4)..".wav",70,math.random(90,100))
		VJ.EmitSound(self,"vj_piv/slammer/woosh.wav",75,math.random(100,110))
    end
	
	if key == "vomit" && self.PIV_AllowedToVomit then
		ParticleEffectAttach("vomit_barnacle_b",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("mouth"))
		if self.PIV_Gender == 2 then
			VJ.EmitSound(self,"vj_piv/spitter/pain"..math.random(1,5)..".mp3",60,math.random(120,130))
		else
			VJ.EmitSound(self,"vj_piv/spitter/pain"..math.random(1,5)..".mp3",60,math.random(90,100))
		end
	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnIsJumpLegal(startPos, apex, endPos)
	if self.PIV_Crippled or self.PIV_FuckingCrawlingLittleCunt then
		return false
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()

	self:Zombie_CustomOnThink()

	-- don't run this if the door breaking convar is off, we're a crawler, we're crippled, flinching, stumbling, spawning, or rising
	if
		GetConVar("vj_piv_door_breaking"):GetInt() == 0 or
		self.PIV_FuckingCrawlingLittleCunt or
		self.PIV_Crippled or
		self.Dead or
		self.DeathAnimationCodeRan or
		self.Flinching or
		self:GetSequence() == self:LookupSequence("emerge1") or
		self:GetSequence() == self:LookupSequence("nz_spawn_jump") or
		self:GetSequence() == self:LookupSequence(ACT_SMALL_FLINCH) or
		self:GetSequence() == self:LookupSequence("shove_forward_01") or
		self:GetSequence() == self:LookupSequence(ACT_STEP_BACK) or
		self:GetSequence() == self:LookupSequence(ACT_STEP_FORE) or
		self:GetSequence() == self:LookupSequence("infectionrise") or 
		self:GetSequence() == self:LookupSequence("infectionrise2") or
		self:GetSequence() == self:LookupSequence("slumprise_a") or 
		self:GetSequence() == self:LookupSequence("slumprise_a2")
	then
		self.PIV_DoorToBreak = NULL
	return end
	
		-- do we have a door breaking animations?
		if VJ.AnimExists(self,ACT_OPEN_DOOR) then
		
			if !IsValid(self.PIV_DoorToBreak) then
				if ((!self.VJ_IsBeingControlled) or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_DUCK))) then
					for _,v in pairs(ents.FindInSphere(self:GetPos(),40)) do
						if v:GetClass() == "func_door_rotating" && v:Visible(self) then
							self.PIV_DoorToBreak = v
						end
						if v:GetClass() == "prop_door_rotating" && v:Visible(self) then
							local anim = string.lower(v:GetSequenceName(v:GetSequence()))
							if string.find(anim,"idle") or string.find(anim,"open") /*or string.find(anim,"locked")*/ then
								self.PIV_DoorToBreak = v
							break
							end
						end
					end
				end
			else
		    //local dist = self:VJ_GetNearestPointToEntityDistance(self.PIV_DoorToBreak)
		    if self.PlayingAttackAnimation or !self.PIV_DoorToBreak:Visible(self) /*or (self:GetActivity() == ACT_OPEN_DOOR && dist <= 100)*/ then self.PIV_DoorToBreak = NULL return end
			if self:GetActivity() != ACT_OPEN_DOOR then
				local ang = self:GetAngles()
				self:SetAngles(Angle(ang.x,(self.PIV_DoorToBreak:GetPos() -self:GetPos()):Angle().y,ang.z))
				self:VJ_ACT_PLAYACTIVITY(ACT_OPEN_DOOR,true,false,false)
				-- self:SetState(VJ_STATE_ONLY_ANIMATION)
			end
		end
	end
	--[[
	if !IsValid(self.PIV_DoorToBreak) then
		self:SetState()
	end
	--]]
	if self:IsOnFire() && !self.Immune_Fire then

	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()

	if self.VJ_IsBeingControlled && !self.PIV_Mutated && self.PIV_CanMutate == true then
		if self.VJ_TheController:KeyDown(IN_USE) && self.VJ_TheController:KeyDown(IN_RELOAD) then
			self:PIV_Mutate()
		end
	end
	
	if self:IsOnFire() && self.Immune_Fire == false && self.FireRun == true then 
	    self.Running = true
	end

	-- Climbing System
	if self.PIV_CanClimb && !self.Dead && !self.PIV_WeHaveAWeapon && !self.PIV_HasShield && !self.PIV_Crippled && !self.PIV_FuckingCrawlingLittleCunt && !self.PIV_IsClimbing && CurTime() > self.PIV_NextClimbT then

		local anim = false
		local finalpos = self:GetPos()
		local tr5 = util.TraceLine({start = self:GetPos() + self:GetUp()*144, endpos = self:GetPos() + self:GetUp()*144 + self:GetForward()*40, filter = function(ent) if (ent:GetClass() == "prop_physics") then return true end end}) -- 144
		local tr4 = util.TraceLine({start = self:GetPos() + self:GetUp()*120, endpos = self:GetPos() + self:GetUp()*120 + self:GetForward()*40, filter = function(ent) if (ent:GetClass() == "prop_physics") then return true end end}) -- 120
		local tr3 = util.TraceLine({start = self:GetPos() + self:GetUp()*96, endpos = self:GetPos() + self:GetUp()*96 + self:GetForward()*40, filter = function(ent) if (ent:GetClass() == "prop_physics") then return true end end}) -- 96
		local tr2 = util.TraceLine({start = self:GetPos() + self:GetUp()*72, endpos = self:GetPos() + self:GetUp()*72 + self:GetForward()*40, filter = function(ent) if (ent:GetClass() == "prop_physics") then return true end end}) -- 72
		local tr1 = util.TraceLine({start = self:GetPos() + self:GetUp()*48, endpos = self:GetPos() + self:GetUp()*48 + self:GetForward()*40, filter = function(ent) if (ent:GetClass() == "prop_physics") then return true end end}) -- 48
		local tr0 = util.TraceLine({start = self:GetPos() + self:GetUp()*36, endpos = self:GetPos() + self:GetUp()*36 + self:GetForward()*40, filter = function(ent) if (ent:GetClass() == "prop_physics") then return true end end}) -- 36
		local tru = util.TraceLine({start = self:GetPos(), endpos = self:GetPos() + self:GetUp()*200, filter = self})
		
		if !IsValid(tru.Entity) then
			if IsValid(tr5.Entity) then
				local tr5b = util.TraceLine({start = self:GetPos() + self:GetUp()*160, endpos = self:GetPos() + self:GetUp()*160 + self:GetForward()*40, filter = function(ent) if (ent:GetClass() == "prop_physics") then return true end end})
				if !IsValid(tr5b.Entity) then
					anim = VJ.PICK({"vjseq_climb144_00_inplace","vjseq_climb144_00a_inplace","vjseq_climb144_01_inplace","vjseq_climb144_03_inplace","vjseq_climb144_03a_inplace","vjseq_climb144_04_inplace"})
					finalpos = tr5.HitPos
				end
			elseif IsValid(tr4.Entity) then
				anim = VJ.PICK({"vjseq_climb120_00_inplace","vjseq_climb120_00a_inplace","vjseq_climb120_01_inplace","vjseq_climb120_03_inplace","vjseq_climb120_03a_inplace","vjseq_climb120_04_inplace"})
				finalpos = tr4.HitPos
			elseif IsValid(tr3.Entity) then
				anim = VJ.PICK({"vjseq_climb96_00_inplace","vjseq_climb96_00a_inplace","vjseq_climb96_03_inplace","vjseq_climb96_03a_inplace","vjseq_climb96_04a_inplace","vjseq_climb96_05_inplace"})
				finalpos = tr3.HitPos
			elseif IsValid(tr2.Entity) then
				anim = VJ.PICK({"vjseq_climb72_03_inplace","vjseq_climb72_04_inplace","vjseq_climb72_05_inplace","vjseq_climb72_06_inplace","vjseq_climb72_07_inplace"})
				finalpos = tr2.HitPos
			elseif IsValid(tr1.Entity) then
				anim = VJ.PICK({"vjseq_climb48_01_inplace","vjseq_climb48_02_inplace","vjseq_climb48_03_inplace","vjseq_climb48_04_inplace"})
				finalpos = tr1.HitPos
			elseif IsValid(tr0.Entity) then
				anim = VJ.PICK({"vjseq_climb36_01_inplace","vjseq_climb36_02_inplace","vjseq_climb36_03_inplace","vjseq_climb36_04_inplace","vjseq_climb36_hurdle_04_inplace"})
				finalpos = tr0.HitPos
			end
		
			if anim != false then
				self:SetGroundEntity(NULL)
				self.PIV_IsClimbing = true
				timer.Simple(0.4,function()
					if IsValid(self) then
						self:SetPos(finalpos)
					end
				end)
				self:VJ_ACT_PLAYACTIVITY(anim,true,false/*self:DecideAnimationLength(anim,false,0.4)*/,true,0,{},function(vsched)
					vsched.RunCode_OnFinish = function()
						self.PIV_IsClimbing = false
					end
				end)
			end
			self.PIV_NextClimbT = CurTime() + 0.1 //5
		end
	end
	
	if self.PIV_Crippled == false && self.PIV_FuckingCrawlingLittleCunt == false && self.PIV_WeHaveAWeapon == false && self.PIV_HasShield == false && !self.VJ_IsBeingControlled && self.PIV_CanRest == true then
		if
			!self.Alerted &&
			!IsValid(self:GetEnemy()) &&
			!self:IsMoving() &&
			CurTime() > self.PIV_NextRestT &&
			self.PIV_Resting != 1 &&
			self.PIV_Resting != 2 &&
			!self:IsBusy()
		then
			local sleept = math.Rand(15, 120) -- How long it should sleep
			if math.random(1,2) == 1 then
				self.PIV_Resting = 1
				self:VJ_ACT_PLAYACTIVITY(ACT_BUSY_SIT_GROUND_ENTRY, true, false, false)
			else
				self.PIV_Resting = 2
				self:VJ_ACT_PLAYACTIVITY(ACT_BUSY_LEAN_BACK_ENTRY, true, false, false)
			end
			self.MovementType = VJ_MOVETYPE_STATIONARY
			self.DisableWandering = true
			self.CanTurnWhileStationary = false
			-- self:SetState(VJ_STATE_ONLY_ANIMATION, sleept)

			timer.Simple(sleept, function() -- Reset after sleept seconds

				if IsValid(self) && (self.PIV_Resting == 1 or self.PIV_Resting == 2)then
					if math.random(1,2) == 1 then
						if self.PIV_Resting == 1 then
							self:VJ_ACT_PLAYACTIVITY(ACT_BUSY_LEAN_LEFT_EXIT, true, false, false)
							self.PIV_Resting = 2
						elseif self.PIV_Resting == 2 then
							self:VJ_ACT_PLAYACTIVITY(ACT_BUSY_LEAN_LEFT_ENTRY, true, false, false)
							self.PIV_Resting = 1
						end
						local sleept2 = math.random(15,30)
						timer.Simple(sleept2, function()
							if IsValid(self) then
								if self.PIV_Resting == 1 then
									self:VJ_ACT_PLAYACTIVITY(ACT_BUSY_SIT_GROUND_EXIT, true, false, false)
								elseif self.PIV_Resting == 2 then
									self:VJ_ACT_PLAYACTIVITY(ACT_BUSY_LEAN_BACK_EXIT, true, false, false)
								end
								self.PIV_Resting = 0
								self.PIV_NextRestT = CurTime() + math.Rand(30, 180)
								self.MovementType = VJ_MOVETYPE_GROUND 
								if GetConVar("vj_npc_nowandering"):GetInt() != 1 then
									self.DisableWandering = false
								end
								self.CanTurnWhileStationary = true
							end
						end)
					else
						if self.PIV_Resting == 1 then
							self:VJ_ACT_PLAYACTIVITY(ACT_BUSY_SIT_GROUND_EXIT, true, false, false)
						elseif self.PIV_Resting == 2 then
							self:VJ_ACT_PLAYACTIVITY(ACT_BUSY_LEAN_BACK_EXIT, true, false, false)
						end
						self.PIV_Resting = 0
						self.PIV_NextRestT = CurTime() + math.Rand(30, 180)
						self.MovementType = VJ_MOVETYPE_GROUND 
						if GetConVar("vj_npc_nowandering"):GetInt() != 1 then
							self.DisableWandering = false
						end
						self.CanTurnWhileStationary = true
					end
				end
			end)
		end
	end
	
	self:Zombie_CustomOnThink_AIEnabled()
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert(ent)
	if self.PIV_Resting != 0 then
		if self.PIV_Resting == 1 then
			self:VJ_ACT_PLAYACTIVITY(ACT_BUSY_QUEUE, true, false, false)
		elseif self.PIV_Resting == 2 then
			self:VJ_ACT_PLAYACTIVITY(ACT_BUSY_STAND, true, false, false)
		end
		self.PIV_Resting = 0
		self.PIV_NextRestT = CurTime() + math.Rand(30, 180)
		self.CanTurnWhileStationary = true
		self.MovementType = VJ_MOVETYPE_GROUND 
		if GetConVar("vj_npc_nowandering"):GetInt() != 1 then
			self.DisableWandering = false
		end
	end
	
	self:Zombie_CustomOnAlert()
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnAlert()
	if GetConVar("vj_piv_alert_anim"):GetInt() == 1 && self.PIV_Crippled == false && self.PIV_FuckingCrawlingLittleCunt == false && self.PIV_Resting == 0 && self:GetSequence() != self:LookupSequence(ACT_OPEN_DOOR) && !self.PIV_WeHaveAWeapon && self.PIV_HasShield == false && self.PIV_GoblinMode == true
	&& self:GetClass() != "npc_vj_piv_slammer"
	&& self:GetClass() != "npc_vj_piv_bruiser"
	&& self:GetClass() != "npc_vj_piv_exploder"
	then
		if math.random(1,GetConVar("vj_piv_alert_anim_chance"):GetInt()) == 1 then
			local tbl = VJ.PICK({"vjseq_nz_taunt_1","vjseq_nz_taunt_2","vjseq_nz_taunt_3","vjseq_nz_taunt_4","vjseq_nz_taunt_5","vjseq_nz_taunt_6","vjseq_nz_taunt_7","vjseq_nz_taunt_8","vjseq_nz_taunt_9","vjseq_stand_threaten_0"})
			self:VJ_ACT_PLAYACTIVITY(tbl,true,false,true)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	-- When Crawling or Crippled --
    if self.PIV_Crippled or self.PIV_FuckingCrawlingLittleCunt then
		self.MeleeAttackAnimationAllowOtherTasks = false
		
		self.MeleeAttackDamage = math.random(15,20)
		if self.PIV_Brute == true then
			self.MeleeAttackDamage = math.random(20,25)
		end
		self.HasMeleeAttackKnockBack = false
		self.SlowPlayerOnMeleeAttack = false
		self.MeleeAttackAnimationDecreaseLengthAmount = 0
		self.MeleeAttackDistance = 40
        self.MeleeAttackDamageDistance = 60
		self.SoundTbl_MeleeAttack = {"vj_piv/z_hit-01.wav","vj_piv/z_hit-02.wav","vj_piv/z_hit-03.wav","vj_piv/z_hit-04.wav","vj_piv/z_hit-05.wav","vj_piv/z_hit-06.wav"}
		self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	
		
		self.AnimTbl_MeleeAttack = {
			"vjseq_crawl_attack"
		}

	return end

	-- When Standing --
	if !self:IsMoving()	then

		self.MeleeAttackAnimationAllowOtherTasks = false

		if self.PIV_WeHaveAWeapon == true then
		
			if self.PIV_WeaponType == 1 then
			
				self.MeleeAttackDamage = math.random(20,25)
				if self.PIV_Brute == true then
					self.MeleeAttackDamage = math.random(25,30)
				end
				self.MeleeAttackDistance = 40
				self.MeleeAttackDamageDistance = 60
				self.HasMeleeAttackKnockBack = false
				self.SlowPlayerOnMeleeAttack = false
				self.MeleeAttackAnimationDecreaseLengthAmount = 0
			
				self.AnimTbl_MeleeAttack = {
					"vjges_melee_1h_left",
					"vjges_melee_1h_right",
					"vjges_melee_1h_overhead",
				}
				
			elseif self.PIV_WeaponType == 2 then
			
				self.MeleeAttackDamage = math.random(20,25)
				if self.PIV_Brute == true then
					self.MeleeAttackDamage = math.random(25,30)
				end
				self.MeleeAttackDistance = 40
				self.MeleeAttackDamageDistance = 60
				self.HasMeleeAttackKnockBack = false
				self.SlowPlayerOnMeleeAttack = false
				self.MeleeAttackAnimationDecreaseLengthAmount = 0
			
				self.AnimTbl_MeleeAttack = {
					"vjges_melee_2h_left",
					"vjges_melee_2h_right",
					"vjges_melee_2h_overhead",
				}
			end
			
		elseif self.PIV_HasShield == true then
			self.MeleeAttackDamage = math.random(15,20)
			if self.PIV_Brute == true then
				self.MeleeAttackDamage = math.random(20,25)
			end
			self.HasMeleeAttackKnockBack = false
			self.SlowPlayerOnMeleeAttack = false
			self.MeleeAttackAnimationDecreaseLengthAmount = 0
			self.MeleeAttackDistance = 40
			self.MeleeAttackDamageDistance = 60
			self.AnimTbl_MeleeAttack = {
				"vjges_melee_moving01a",
				"vjges_melee_moving03a",
				"vjges_melee_moving06a",
			}
			
		elseif self.PIV_Biter == true then
			self.AnimTbl_MeleeAttack = {"vjseq_Choke_Eating"}	
			self.MeleeAttackAnimationDecreaseLengthAmount = 1.45
			self.SlowPlayerOnMeleeAttack = true
			self.HasMeleeAttackKnockBack = false
			self.SoundTbl_MeleeAttack = {"vj_piv/zombie_bite1.wav","vj_piv/zombie_bite2.wav","vj_piv/zombie_bite3.wav"}
			self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	
		else
		
			self.MeleeAttackDamage = math.random(15,20)
			if self.PIV_Brute == true then
				self.MeleeAttackDamage = math.random(20,25)
			end
			self.HasMeleeAttackKnockBack = false
			self.SlowPlayerOnMeleeAttack = false
			self.MeleeAttackAnimationDecreaseLengthAmount = 0
			self.MeleeAttackDistance = 40
			self.MeleeAttackDamageDistance = 60
			self.SoundTbl_MeleeAttack = {"vj_piv/z_hit-01.wav","vj_piv/z_hit-02.wav","vj_piv/z_hit-03.wav","vj_piv/z_hit-04.wav","vj_piv/z_hit-05.wav","vj_piv/z_hit-06.wav"}
			self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	
			
			self.AnimTbl_MeleeAttack = {
				"vjseq_nz_attack_stand_ad_1",
				"vjseq_nz_attack_stand_ad_2-2",
				"vjseq_nz_attack_stand_ad_2-3",
				"vjseq_nz_attack_stand_ad_2-4",
				"vjseq_nz_attack_stand_au_1",
				"vjseq_nz_attack_stand_au_2-2",
				"vjseq_nz_attack_stand_au_2-3",
				"vjseq_nz_attack_stand_au_2-4",
			}
	        
			if math.random(1,4) == 1 then 
				
				self.MeleeAttackDamage = math.random(20,25)
				if self.PIV_Brute == true then
					self.MeleeAttackDamage = math.random(25,30)
				end
				self.HasMeleeAttackKnockBack = true
				self.SlowPlayerOnMeleeAttack = false
				self.MeleeAttackAnimationDecreaseLengthAmount = 0
				self.MeleeAttackDistance = 50
				self.MeleeAttackDamageDistance = 70

				self.SoundTbl_MeleeAttack = {"vj_piv/BodyHit-3.wav","vj_piv/BodyHit-4.wav","vj_piv/BodyHit-5.wav","vj_piv/BodyHit-6.wav"}
				self.SoundTbl_MeleeAttackMiss = {"vj_piv/Miss1.wav","vj_piv/Miss2.wav","vj_piv/Miss3.wav","vj_piv/Miss4.wav","vj_piv/Miss5.wav"}	
			
				self.AnimTbl_MeleeAttack = {
					"vjseq_atk_kick"
				}
			
			end
		
		end

	end


	-- When Moving --
	if self:IsMoving() then

		self.MeleeAttackAnimationAllowOtherTasks = true

		if self.PIV_WeHaveAWeapon == true then
		
			if self.PIV_WeaponType == 1 then
			
				self.MeleeAttackDamage = math.random(20,25)
				if self.PIV_Brute == true then
					self.MeleeAttackDamage = math.random(25,30)
				end
				self.MeleeAttackDistance = 40
				self.MeleeAttackDamageDistance = 60
				self.HasMeleeAttackKnockBack = false
				self.SlowPlayerOnMeleeAttack = false
				self.MeleeAttackAnimationDecreaseLengthAmount = 0
			
				self.AnimTbl_MeleeAttack = {
					"vjges_melee_1h_left",
					"vjges_melee_1h_right",
					"vjges_melee_1h_overhead",
				}
				
			elseif self.PIV_WeaponType == 2 then
			
				self.MeleeAttackDamage = math.random(25,30)
				if self.PIV_Brute == true then
					self.MeleeAttackDamage = math.random(25,30)
				end
				self.MeleeAttackDistance = 40
				self.MeleeAttackDamageDistance = 60
				self.HasMeleeAttackKnockBack = false
				self.SlowPlayerOnMeleeAttack = false
				self.MeleeAttackAnimationDecreaseLengthAmount = 0
			
				self.AnimTbl_MeleeAttack = {
					"vjges_melee_2h_left",
					"vjges_melee_2h_right",
					"vjges_melee_2h_overhead",
				}
			end
			
		elseif self.PIV_HasShield == true then
			self.MeleeAttackDamage = math.random(15,20)
			if self.PIV_Brute == true then
				self.MeleeAttackDamage = math.random(20,25)
			end
			self.HasMeleeAttackKnockBack = false
			self.SlowPlayerOnMeleeAttack = false
			self.MeleeAttackAnimationDecreaseLengthAmount = 0
			self.MeleeAttackDistance = 40
			self.MeleeAttackDamageDistance = 60
			self.AnimTbl_MeleeAttack = {
				"vjges_melee_moving01a",
				"vjges_melee_moving03a",
				"vjges_melee_moving06a",
			}

		else

			self.MeleeAttackDamage = math.random(15,20)
			if self.PIV_Brute == true then
				self.MeleeAttackDamage = math.random(20,25)
			end
			self.HasMeleeAttackKnockBack = false
			self.SlowPlayerOnMeleeAttack = false
			self.MeleeAttackAnimationDecreaseLengthAmount = 0
			self.MeleeAttackDistance = 40
			self.MeleeAttackDamageDistance = 60
			self.SoundTbl_MeleeAttack = {"vj_piv/z_hit-01.wav","vj_piv/z_hit-02.wav","vj_piv/z_hit-03.wav","vj_piv/z_hit-04.wav","vj_piv/z_hit-05.wav","vj_piv/z_hit-06.wav"}
			self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	
			
			self.AnimTbl_MeleeAttack = {
				"vjges_nz_attack_walk_ad_1",
				"vjges_nz_attack_walk_ad_2",
				"vjges_nz_attack_walk_ad_3",
				"vjges_nz_attack_walk_ad_4",
				"vjges_nz_attack_walk_ad_right_only_1",
				"vjges_nz_attack_walk_au_1",
				"vjges_nz_attack_walk_au_2",
				"vjges_nz_attack_walk_au_3",
				"vjges_nz_attack_walk_au_4",
				"vjges_nz_attack_walk_au_right_only_1"
			}

		end

	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt, isProp)
	if self:IsOnFire() && math.random(1,4) == 1 then 
		hitEnt:Ignite(math.random(1,4))
	end

    if self.PIV_Biter && !isProp && !self.PIV_Crippled && !self.PIV_FuckingCrawlingLittleCunt then	
		if hitEnt.IsVJBaseSNPC && VJ.PICK(hitEnt.CustomBlood_Particle) then
			ParticleEffectAttach(VJ.PICK(hitEnt.CustomBlood_Particle),PATTACH_POINT_FOLLOW,self,self:LookupAttachment("mouth"))
		elseif (hitEnt:IsPlayer() or hitEnt:IsNPC() or hitEnt:IsNextBot()) then
			ParticleEffectAttach("blood_impact_red_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("mouth"))
		end

		if (hitEnt.IsVJBaseSNPC && hitEnt.MovementType == VJ_MOVETYPE_GROUND && !hitEnt.PIV_IsHugeZombie && !hitEnt.IsVJBaseSNPC_Tank) then
			hitEnt:StopMoving()
			hitEnt:SetState(VJ_STATE_ONLY_ANIMATION)
			hitEnt:VJ_DoSetEnemy(self,true,true)
			local ang = self:GetAngles()
			hitEnt:SetAngles(Angle(ang.x,(self:GetPos() -hitEnt:GetPos()):Angle().y,ang.z))
			timer.Simple(self.SlowPlayerOnMeleeAttackTime,function()
				if IsValid(hitEnt) && !self.PlayingAttackAnimation then
					hitEnt:SetState()
				end
			end)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_Miss()
    if self.AttackType == VJ.ATTACK_TYPE_MELEE &&
	    (
        self:GetSequence() == self:LookupSequence("standing_melee_1") or
        self:GetSequence() == self:LookupSequence("standing_melee_2") or
        self:GetSequence() == self:LookupSequence("standing_melee_3") or
        self:GetSequence() == self:LookupSequence("standing_melee_4") or
		self.PIV_Biter && self:GetSequence() == self:LookupSequence("choke_eating")
		) 
	then
        self:VJ_ACT_PLAYACTIVITY("vjseq_choke_miss",true,false,true)
    end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	self:DropTheFuckignWeaponGoddamn()
	self:DropTheShield()
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	local Attacker = dmginfo:GetAttacker()

	if self:IsMoving() then -- When walking
	
		self.AnimTbl_Death = {
			"vjseq_witch_death",
			"vjseq_nz_death_f_1",
			"vjseq_nz_death_f_2",
			"vjseq_nz_death_f_3",
			"vjseq_nz_death_f_4",
			"vjseq_nz_death_f_5",
			"vjseq_nz_death_f_6",
			"vjseq_nz_death_f_7",
			"vjseq_nz_death_f_8",
			"vjseq_nz_death_f_9",
			"vjseq_nz_death_f_10",
			"vjseq_nz_death_f_11",
			"vjseq_nz_death_f_12",
			"vjseq_nz_death_f_13"
		}	

    end

	if
		self:IsMoving() &&
		(self:GetActivity() == ACT_SPRINT or self:GetActivity() == ACT_RUN_AIM or self:GetActivity() == ACT_RUN_RELAXED)
	then -- When running
	
		self.AnimTbl_Death = {
			"vjseq_witch_death",
			"vjseq_sonic_death_2",
			"vjseq_sonic_death_3",
			"vjseq_deathrunning_01",
			"vjseq_deathrunning_03",
			"vjseq_deathrunning_04",
			"vjseq_deathrunning_05",
			"vjseq_deathrunning_06",
			"vjseq_deathrunning_07",
			"vjseq_deathrunning_08",
			"vjseq_deathrunning_09",
			"vjseq_deathrunning_10",
			"vjseq_deathrunning_11",
			"vjseq_deathrunning_11a",
			"vjseq_deathrunning_11b",
			"vjseq_deathrunning_11c",
			"vjseq_deathrunning_11d",
			"vjseq_deathrunning_11e",
			"vjseq_death03",
			"vjseq_nz_sonic_death_1",
			"vjseq_nz_sonic_death_3",
			"vjseq_nz_sonic_death_2"
		}

	end

	if hitgroup == HITGROUP_HEAD then -- When killed by a headshot

		self.AnimTbl_Death = {
			"vjseq_deathheadshotback",
			"vjseq_deathheadshotfront",
			"vjseq_death_shotgun_backward_collapse",
			"vjseq_death01",
			"vjseq_death02",
			"vjseq_death04",
			"vjseq_death_02a",
			"vjseq_death_05"
		}

    end

    if self:IsOnFire() && self.Immune_Fire == false then -- When killed by fire damage

		self.AnimTbl_Death = {
			"vjseq_witch_death",
			"vjseq_nz_death_fire_1",
			"vjseq_nz_death_fire_2",
			"vjseq_death04",
			"vjseq_infectiondeath"
		} 

    end	

    if dmginfo:IsExplosionDamage() then -- When killed by explosion damage

		self.AnimTbl_Death = {
			"vjseq_nz_death_expl_f_1",
			"vjseq_nz_death_expl_f_2",
			"vjseq_nz_death_expl_f_3",
			"vjseq_nz_death_expl_b_1",
			"vjseq_nz_death_expl_l_1",
			"vjseq_nz_death_expl_r_1"
		}	

	end

    if dmginfo:IsDamageType(DMG_SHOCK) or Attacker:GetActiveWeapon():GetClass() == "arc9_go_zeus" or Attacker:GetActiveWeapon():GetClass() == "arc9_go_akimbo_taser" then -- When killed by shock damage or a taser

	   self.AnimTbl_Death = {
			"vjseq_nz_death_elec_1",
			"vjseq_nz_death_elec_2",
			"vjseq_nz_death_elec_3",
			"vjseq_nz_death_elec_4",
			"vjseq_nz_death_elec_5"
		}

    end

    if dmginfo:IsDamageType(DMG_BUCKSHOT) or dmginfo:GetDamage() > 100 && dmginfo:GetDamageForce():Length() > 10000 && !dmginfo:IsExplosionDamage() then -- When killed by a shotgun or attack with high force

		self.AnimTbl_Death = {
			"vjseq_death_shotgun_backward_03",
			"vjseq_death_shotgun_backward_04",
			"vjseq_death_shotgun_backward_05",
			"vjseq_death_shotgun_backward_06",
			"vjseq_death_shotgun_backward_07",
			"vjseq_death_shotgun_backward_08",
			"vjseq_death_shotgun_backward_09",
			"vjseq_death_shotgun_backward_collapse",
			"vjseq_death03"
		}

    end

    if dmginfo:IsDamageType(DMG_DISSOLVE) then -- When killed by dissolving

		self.AnimTbl_Death = {
			"vjseq_nz_death_deathray_1",
			"vjseq_nz_death_deathray_2",
			"vjseq_nz_death_deathray_3",
			"vjseq_nz_death_deathray_4"
		}

    end

    if dmginfo:IsDamageType(DMG_PARALYZE) then -- When killed by a paralyzing damage

		self.AnimTbl_Death = {
			"vjseq_nz_death_freeze_1",
			"vjseq_nz_death_freeze_2",
			"vjseq_nz_death_freeze_3",
			"vjseq_nz_death_freeze_4"
		}

    end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)

	if self.CanDoTheFunny == false or self.PIV_Crippled or self.PIV_FuckingCrawlingLittleCunt or self.Apeshit or self.PIV_GoblinMode or self:GetClass() == "npc_vj_piv_husk_torso" or self:GetClass() == "npc_vj_piv_husk_torso_f" then return end

	if dmginfo:IsBulletDamage() or dmginfo:IsDamageType(DMG_BUCKSHOT) or dmginfo:IsDamageType(DMG_SNIPER) then
		if hitgroup == HITGROUP_HEAD or hitgroup == HITGROUP_CHEST or hitgroup == HITGROUP_STOMACH then
			if self.PIVNextStumbleT < CurTime() then
				if dmginfo:GetDamage() > 49 or dmginfo:GetDamageForce():Length() > 10000 then
					if math.random (1,2) == 1 then
						self:VJ_ACT_PLAYACTIVITY(ACT_BIG_FLINCH,true,false,false)
						self.PIVNextStumbleT = CurTime() + 5
						self:RemoveAllGestures()
					end
				elseif dmginfo:GetDamage() > 24 or dmginfo:GetDamageForce():Length() > 5000 then
					if math.random (1,3) == 1 then
						self:VJ_ACT_PLAYACTIVITY(ACT_SMALL_FLINCH,true,false,false)
						self:RemoveAllGestures()
						self.PIVNextStumbleT = CurTime() + 5
					end
				else
					if math.random (1,5) == 1 then
						self:VJ_ACT_PLAYACTIVITY(ACT_STEP_BACK,true,1.6)
						self.PIVNextStumbleT = CurTime() + 3
						self:RemoveAllGestures()
					end
				end
			end
		elseif hitgroup == HITGROUP_LEFTLEG or hitgroup == HITGROUP_RIGHTLEG then		 
			if self.PIVNextStumbleT < CurTime() then
				if math.random (1,5) == 1 then
					local anim = {"run_stumble_01","run_stumble1","run_stumble2","run_stumble3","run_stumble4","run_stumble5","run_stumble6"} -- falling animations
					self:VJ_ACT_PLAYACTIVITY(anim,true,false,false) -- play a fall animation 
					self.PIVNextStumbleT = CurTime() + 10
					self:RemoveAllGestures()
				end
			end
		end
	end

	if dmginfo:IsDamageType(DMG_CLUB) or dmginfo:IsDamageType(DMG_SLASH) or dmginfo:IsDamageType(DMG_GENERIC) then
		if dmginfo:GetDamage() > 49 or dmginfo:GetDamageForce():Length() > 10000 then
			if self.PIV_NextShoveT < CurTime() then
				self:VJ_ACT_PLAYACTIVITY(ACT_BIG_FLINCH,true,false,false)
				self.PIV_NextShoveT = CurTime() + math.random(5,8)
				self:RemoveAllGestures()
			end
		elseif dmginfo:GetDamage() > 24 or dmginfo:GetDamageForce():Length() > 5000 then
			if self.PIV_NextShoveT < CurTime() then
				self:VJ_ACT_PLAYACTIVITY(ACT_SMALL_FLINCH,true,false,false)
				self.PIV_NextShoveT = CurTime() + math.random(5,8)
				self:RemoveAllGestures()
			end
		end
    return !self.PIV_Crippled && !self.PIV_FuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH)
	end

	if dmginfo:IsExplosionDamage() then
		if self.NextSplodeStumbleT < CurTime() then
			if math.random(1,2) == 1 then
				self:DropTheFuckignWeaponGoddamn()
			end
			if math.random(1,2) == 1 then
				self:VJ_ACT_PLAYACTIVITY("vjseq_shove_forward_01",true,false,false)
				self:RemoveAllGestures()
			else
				self:VJ_ACT_PLAYACTIVITY(ACT_BIG_FLINCH,true,false,false)
				self:RemoveAllGestures()
			end
			self.NextSplodeStumbleT = CurTime() + 5
		end
	return !self.PIV_Crippled && !self.PIV_FuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH)
	end

	if GetConVarNumber("vj_piv_cripple") == 1 && self.PIV_CanBeCrippled then  -- if the convars not on don't run this
		if hitgroup == HITGROUP_LEFTLEG or hitgroup == HITGROUP_RIGHTLEG then -- are we hitting the leg?
			self.PIV_LegHP = self.PIV_LegHP -dmginfo:GetDamage() -- take away leg hp
		end
	end

	if self.PIV_LegHP <= 0 then -- we're out of leg hp
		self.PIV_Crippled = true -- aw fuck we're crippled now
		local anim = {"vjseq_nz_death_1","vjseq_nz_death_f_7","vjseq_nz_death_f_8"} -- falling animations
		self:VJ_ACT_PLAYACTIVITY(anim,true,false,false) -- play a fall animation 
		self:RemoveAllGestures()
		self:Cripple() -- crippled
	end
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD && GetConVar("vj_piv_headshot_damage"):GetInt() == 1 && self.PIV_IsBoss == false then
	dmginfo:ScaleDamage(GetConVarNumber("vj_piv_headshot_damage_mult"))
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFlinch_BeforeFlinch(dmginfo,hitgroup)

	if self.PIV_Crippled or self.PIV_FuckingCrawlingLittleCunt then return end
	
	if dmginfo:GetDamage() > 24 or dmginfo:GetDamageForce():Length() > 5000 then
		if hitgroup == HITGROUP_HEAD then
			self:VJ_ACT_PLAYACTIVITY("vjges_ep_flinch_head",true,false)
		elseif hitgroup == HITGROUP_CHEST then
			self:VJ_ACT_PLAYACTIVITY("vjges_ep_flinch_chest",true,false)
		elseif hitgroup == HITGROUP_LEFTARM then
			self:VJ_ACT_PLAYACTIVITY("vjges_ep_flinch_leftArm",true,false)
		elseif hitgroup == HITGROUP_RIGHTARM then
			self:VJ_ACT_PLAYACTIVITY("vjges_ep_flinch_rightArm",true,false)
			if math.random(1,2) == 1 then
				self:DropTheFuckignWeaponGoddamn()
			end
		elseif hitgroup == HITGROUP_LEFTLEG then
			self:VJ_ACT_PLAYACTIVITY("vjseq_flinch_leftleg",true,false)
		elseif hitgroup == HITGROUP_RIGHTLEG then
			self:VJ_ACT_PLAYACTIVITY("vjseq_flinch_rightleg",true,false)
		end
    return !self.PIV_Crippled && !self.PIV_FuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH) -- If we are stumbling or rising out of the ground or other specific activities then DO NOT flinch!	
	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo, hitgroup)
	if GetConVarNumber("vj_piv_burntexture") == 1 then
		if self:IsOnFire() && !self.Immune_Fire then
			self.Corpse:SetMaterial("models/vj_piv/shared/burning")
			self.Corpse:SetKeyValue("rendercolor","255 255 255 255")
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 1000) + self:GetUp()*math.Rand(-30,30) + self:GetRight()*math.Rand(-40,40)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRangeAttack_AfterStartTimer(seed)
	if self.PIV_Thrower == true then
		self.PIV_ThrowCount = self.PIV_ThrowCount -1
		if self.PIV_ThrowCount <= 0 then
			self.HasRangeAttack = false
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DropTheFuckignWeaponGoddamn()

	if GetConVar("vj_piv_weapons_dropping"):GetInt() == 0 or self.PIV_WeHaveAWeapon == false then return end

	if IsValid(self.ExtraGunModel1) then
		self.PIV_WeHaveAWeapon = false
		self.MeleeAttackDamageType = DMG_CLUB
		self:CreateGibEntity("prop_physics",self.ExtraGunModel1:GetModel(),{Pos=self:GetAttachment(self:LookupAttachment("anim_attachment_RH")).Pos,Ang=self:GetAngles()}) self.ExtraGunModel1:SetMaterial("nodraw") self.ExtraGunModel1:DrawShadow(false) self.PIV_WeHaveAWeapon = false
		self.ExtraGunModel1:Remove()
	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DropTheShield()

	if GetConVar("vj_piv_weapons_dropping"):GetInt() == 0 or self.PIV_HasShield == false then return end

	if IsValid(self.ZombieShield) then
		self.PIV_HasShield = false
		self:CreateGibEntity("prop_physics",self.ZombieShield:GetModel(),{Pos=self:GetAttachment(self:LookupAttachment("shield")).Pos,Ang=self:GetAngles()}) self.ZombieShield:SetMaterial("nodraw") self.ZombieShield:DrawShadow(false)
		self.ZombieShield:Remove()	
		self.AttackProps = true
		self.PushProps = true
    local ShieldPlacement = self:LookupBone("ValveBiped.Bip01_L_Forearm")
        self:ManipulateBoneAngles(ShieldPlacement, Angle(0,0,0))	
	if GetConVar("vj_piv_climbing"):GetInt() == 2 && self.PIV_FuckingCrawlingLittleCunt == false && self.PIV_Crippled == false then
		self.PIV_CanClimb = true
	end

	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Cripple()
	self.PIV_Jogger = false
	self.PIV_Shambler = false
	self.PIV_Biter = false
	self.PIV_CanMutate = false
    self.FireRun = false
	self:DropTheFuckignWeaponGoddamn()
	self:DropTheShield()

	self.CanTurnWhileStationary = false
	
    self:SetCollisionBounds(Vector(13,13,20),Vector(-13,-13,0))
	self.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(30, 25, -20), 
	FirstP_Bone = "ValveBiped.Bip01_Head1", 
	FirstP_Offset = Vector(5, 0, -1), 
    }
    self:CapabilitiesRemove(bit.bor(CAP_MOVE_JUMP))
	self:CapabilitiesRemove(bit.bor(CAP_MOVE_CLIMB))
	self.HasDeathAnimation = false
	self.HasRangeAttack = false
	self.HasLeapAttack = false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:IsDirt(pos)
	local tr = util.TraceLine({
		start = pos,
		endpos = pos -Vector(0,0,40),
		filter = self,
		mask = MASK_NPCWORLDSTATIC
	})
	local mat = tr.MatType
	return tr.HitWorld && (mat == MAT_SAND || mat == MAT_DIRT || mat == MAT_FOLIAGE || mat == MAT_SLOSH || mat == 85)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Dig(forceRemove)

	if GetConVarNumber("vj_piv_spawnanim") == 0 or self.PIV_Crippled == true or self.PIV_FuckingCrawlingLittleCunt == true then return end

	if self:IsDirt(self:GetPos()) then
		self:SetNoDraw(true)
		self.IsDigging = true
		timer.Simple(0.02,function() if IsValid(self) then
			VJ.EmitSound(self,"vj_piv/rock_smashable_falling_debris_0"..math.random(1,4)..".wav",75,100)
			VJ.EmitSound(self,"vj_piv/rock_impact_small_hit_0"..math.random(1,3)..".wav",75,100)
			ParticleEffect("strider_impale_ground",self:GetPos(),self:GetAngles(),self)
			self:VJ_ACT_PLAYACTIVITY("emerge1",true,VJ.AnimDuration(self,"emerge1"),false)
			self.HasMeleeAttack = false
			timer.Simple(0.15,function() if IsValid(self) then self:SetNoDraw(false) end end)
			timer.Simple(VJ.AnimDuration(self,"emerge1"),function() if IsValid(self) then self.HasMeleeAttack = true self.IsDigging = false end end)
		end end)
	else
		if forceRemove then self:Remove() end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ForceDig(forceRemove)

		self:SetNoDraw(true)
		self.IsDigging = true
		timer.Simple(0.02,function() if IsValid(self) then
			VJ.EmitSound(self,"vj_piv/rock_smashable_falling_debris_0"..math.random(1,4)..".wav",75,100)
			VJ.EmitSound(self,"vj_piv/rock_impact_small_hit_0"..math.random(1,3)..".wav",75,100)
			ParticleEffect("strider_impale_ground",self:GetPos(),self:GetAngles(),self)
			self:VJ_ACT_PLAYACTIVITY("emerge1",true,VJ.AnimDuration(self,"emerge1"),false)
			self.HasMeleeAttack = false
			timer.Simple(0.15,function() if IsValid(self) then self:SetNoDraw(false) end end)
			timer.Simple(VJ.AnimDuration(self,"emerge1"),function() if IsValid(self) then self.HasMeleeAttack = true self.IsDigging = false end end)
		end end)
		if forceRemove then self:Remove() end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackKnockbackVelocity(hitEnt)
	return self:GetForward()*math.random(140, 180) + self:GetUp()*math.random(60,80)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PIV_Mutate()
 
	self.PIV_Mutated = true
	self.PIV_CanMutate = false

	self:VJ_ACT_PLAYACTIVITY({"vjseq_Idle_Alert_Injured_Straight_02"},true,false,false)

	self.HasIdleSounds = false
	self.HasAlertSounds = false
	self.HasMeleeAttack = false
	self.GodMode = true

	local mutatesounds = {
		"vj_piv/mutate_1.wav",
		"vj_piv/mutate_2.wav",
		"vj_piv/mutate_3.wav",
	}

	VJ.EmitSound(self,mutatesounds,90,math.random(100,90))
	VJ.EmitSound(self,self.SoundTbl_Pain,70,self:VJ_DecideSoundPitch(self.PainSoundPitch.a,self.PainSoundPitch.b))

	timer.Simple(2,function() if IsValid(self) then
		VJ.EmitSound(self,self.SoundTbl_Pain,70,self:VJ_DecideSoundPitch(self.PainSoundPitch.a,self.PainSoundPitch.b))
	end end)

	timer.Simple(4,function() if IsValid(self) then
		VJ.EmitSound(self,mutatesounds,90,math.random(100,90))
		VJ.EmitSound(self,self.SoundTbl_Pain,70,self:VJ_DecideSoundPitch(self.PainSoundPitch.a,self.PainSoundPitch.b))
	end end)

	timer.Simple(6,function() if IsValid(self) then
		VJ.EmitSound(self,self.SoundTbl_Death,70,self:VJ_DecideSoundPitch(self.DeathSoundPitch.a,self.DeathSoundPitch.b))
	end end)

	timer.Simple(8,function() if IsValid(self) then
		VJ.EmitSound(self,mutatesounds,90,math.random(100,90))
		VJ.EmitSound(self,self.SoundTbl_Death,70,self:VJ_DecideSoundPitch(self.DeathSoundPitch.a,self.DeathSoundPitch.b))
	end end)

	timer.Simple(10,function() if IsValid(self) then
		VJ.EmitSound(self,self.SoundTbl_Death,70,self:VJ_DecideSoundPitch(self.DeathSoundPitch.a,self.DeathSoundPitch.b))
	end end)

	timer.Simple(12.5,function() if IsValid(self) then
		self.HasMeleeAttack = true
		self.HasIdleSounds = true
		self.HasAlertSounds = true
		self:PIV_CustomMutate()
		self.GodMode = false
		VJ.EmitSound(self,"vj_piv/rebirthed.mp3",90,100)
	end end)

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PIV_CustomMutate()
	self.StartHealth = self.StartHealth *2
	self:SetHealth(self.StartHealth)
			
	local mymaxhealth = self:Health()
	self:SetMaxHealth(mymaxhealth)

	self.PIV_LegHP = self.PIV_LegHP *3

	if GetConVar("vj_piv_lights"):GetInt() == 1 then 

	self.Light2 = ents.Create("light_dynamic")
	self.Light2:SetKeyValue("brightness", "1")
	self.Light2:SetKeyValue("distance", "30")
	self.Light2:SetLocalPos(self:GetPos())
	self.Light2:SetLocalAngles(self:GetAngles())
	self.Light2:Fire("Color", "216 255 0 255")
	self.Light2:SetParent(self)
	self.Light2:Spawn()
	self.Light2:Activate()
	self.Light2:Fire("SetParentAttachment","eyes")
	self.Light2:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(self.Light2)

	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
	if act == ACT_IDLE && !self.PIV_WeHaveAWeapon && !self.PIV_Crippled && !self.PIV_FuckingCrawlingLittleCunt && !self.PIV_Shambler && GetConVar("vj_piv_classic_animations"):GetInt() == 0 && self:GetClass() != "npc_vj_piv_panzer" && self:GetClass() != "npc_vj_piv_panzer_boss" && self:GetClass() != "npc_vj_piv_husk" && self:GetClass() != "npc_vj_piv_husk_f" && self:GetClass() != "npc_vj_piv_husk_torso" && self:GetClass() != "npc_vj_piv_husk_torso_f" && self:GetClass() != "npc_vj_piv_virulent" && self:GetClass() != "npc_vj_piv_exploder" && self:GetClass() != "npc_vj_piv_cremator" then
		return ACT_IDLE_RELAXED
	end

	if act == ACT_RUN && !self.PIV_Jogger && !self.Running then
		return ACT_WALK
	elseif act == ACT_RUN && self.Running && self:GetClass() == "npc_vj_piv_phorid" then
		return ACT_RUN_AIM
	end

	if act == ACT_WALK && !self.Alerted && GetConVar("vj_piv_classic_animations"):GetInt() == 0 then
		return ACT_WALK_AIM_STEALTH
	end

	if self.PIV_IsAquatic && self:WaterLevel() > 2 && self:WaterLevel() < 12 && !self.PIV_Crippled && !self.PIV_FuckingCrawlingLittleCunt then
		if act == ACT_IDLE or act == ACT_IDLE_AIM_STEALTH or act == ACT_IDLE_ON_FIRE or act == ACT_IDLE_RELAXED then
			return ACT_HL2MP_SWIM_IDLE
		end
	end

	if self.PIV_Shambler then
		if !self.PIV_WeHaveAWeapon && (act == ACT_IDLE or act == ACT_IDLE_RELAXED) then
			return ACT_IDLE_AIM_RELAXED
		end
		if act == ACT_WALK or act == ACT_WALK_AIM_STEALTH then
			return ACT_WALK_RELAXED
		end
		if self.PIV_Jogger then
			if act == ACT_RUN or act == ACT_WALK_RELAXED && self.Alerted then
				return ACT_WALK_ANGRY
			end
		else
			if act == ACT_RUN then
				return ACT_WALK_RELAXED
			end
		end
	end
	
	if self.Charging then
		if act == ACT_WALK or act == ACT_RUN or act == ACT_IDLE then
			return ACT_RUN_AIM_RELAXED
		end
	end
	
	if self:GetClass() == "npc_vj_piv_cremator" then
		if act == ACT_IDLE then
			return ACT_IDLE_HURT
		end
		if act == ACT_WALK or act == ACT_WALK_AIM_STEALTH then
			return ACT_WALK_AIM
		end
		if act == ACT_RUN then
			return ACT_WALK_AIM
		end
	end
	
	if self:GetClass() == "npc_vj_piv_panzer" or self:GetClass() == "npc_vj_piv_panzer_boss" then
		if act == ACT_IDLE or act == ACT_IDLE_RELAXED && !self.PIV_Shambler then
			if self.Berserk then
				return ACT_IDLE_AIM_STEALTH
			else
				return ACT_IDLE_AIM_STIMULATED
			end
		end
		if act == ACT_WALK && !self.PIV_Shambler or act == ACT_WALK_AIM_STEALTH && !self.PIV_Shambler then
			return ACT_WALK_SCARED
		end
		if act == ACT_RUN then
			if self.Berserk then
				return ACT_RUN_RELAXED
			else
				return ACT_RUN_PROTECTED
			end
		end
	end

	if self:GetClass() == "npc_vj_piv_slammer" then
		if act == ACT_WALK then
			if self.Alerted then
				return ACT_WALK_ANGRY
			else
				return ACT_WALK
			end
		end
	end

	if self:GetClass() == "npc_vj_piv_husk" or self:GetClass() == "npc_vj_piv_husk_f" then
		if self.PIV_MovementAnims == 2 then
			if act == ACT_IDLE then
				return ACT_IDLE_STIMULATED
			end
			if act == ACT_WALK or act == ACT_WALK_AIM_STEALTH then
				return ACT_WALK_STIMULATED
			end
			if act == ACT_RUN && !self.Running then
				return ACT_WALK_STIMULATED
			end
		elseif self.PIV_MovementAnims == 3 then
			if act == ACT_IDLE then
				return ACT_IDLE_AGITATED
			end
			if act == ACT_WALK or act == ACT_WALK_AIM_STEALTH then
				return ACT_WALK_AGITATED
			end
			if act == ACT_RUN && !self.Running then
				return ACT_WALK_AGITATED
			end
		elseif self.PIV_MovementAnims == 4 then
			if act == ACT_IDLE then
				return ACT_IDLE_RELAXED
			end
			if act == ACT_WALK or act == ACT_WALK_AIM_STEALTH then
				return ACT_WALK_RELAXED
			end
			if act == ACT_RUN && !self.Running then
				return ACT_WALK_RELAXED
			end
		end
	end
	
	if self:GetClass() == "npc_vj_piv_husk_torso" or self:GetClass() == "npc_vj_piv_husk_torso_f" then
		if act == ACT_WALK_AIM_STEALTH then
			return ACT_WALK
		end
	end
	
	if self:GetClass() == "npc_vj_piv_virulent" then
		if self.PIV_MovementAnims == 2 then
			if act == ACT_IDLE then
				return ACT_IDLE_STIMULATED
			end
			if act == ACT_WALK or act == ACT_WALK_AIM_STEALTH then
				return ACT_WALK_STIMULATED
			end
			if act == ACT_RUN && !self.Running then
				return ACT_WALK_STIMULATED
			end
		end
	end

	if self.PIV_WeHaveAWeapon && self.PIV_WeaponType == 2  then
		if act == ACT_IDLE or act == ACT_IDLE_AIM_RELAXED or act == ACT_IDLE_RELAXED then
			return ACT_HL2MP_IDLE_MELEE
		end
		if self.PIV_Shambler then
			if act == ACT_WALK_RELAXED then
				return ACT_HL2MP_WALK_MELEE2
			end
			if act == ACT_WALK_RELAXED then
				return ACT_HL2MP_WALK_MELEE2
			end
		else
			if act == ACT_WALK or act == ACT_WALK_AIM_STEALTH then
				return ACT_HL2MP_WALK_MELEE
			end
			if act == ACT_RUN then
				return ACT_HL2MP_WALK_MELEE
			end
		end
	end
		
	if self.PIV_HasShield then
		if act == ACT_IDLE or act == ACT_IDLE_AIM_RELAXED or act == ACT_IDLE_RELAXED then
			return ACT_IDLE_AIM_AGITATED
		end
		if act == ACT_WALK or act == ACT_WALK_RELAXED or act == ACT_WALK_AIM_STEALTH then
			return ACT_WALK_AIM_AGITATED
		end
		if act == ACT_RUN or act == ACT_WALK_ANGRY then
			return ACT_WALK_AIM_AGITATED
		end
	end

	if self.PIV_GoblinMode then
		if act == ACT_IDLE or act == ACT_IDLE_AIM_RELAXED or act == ACT_IDLE_RELAXED then
			return ACT_CROUCHIDLE_STIMULATED
		end
		if act == ACT_WALK or act == ACT_WALK_RELAXED or act == ACT_WALK_AIM_STEALTH or act == ACT_WALK_ANGRY or act == ACT_RUN then
			return ACT_WALK_CARRY
		end
	end

	if self.Apeshit then
		if act == ACT_IDLE or act == ACT_IDLE_RELAXED then
			return ACT_IDLE_AIM_STEALTH
		end
		if act == ACT_WALK or act == ACT_WALK_AIM_STEALTH or act == ACT_RUN then
			return ACT_RUN_AIM
		end
	end
	
	if self.PIV_Resting == 1 then
		if act == ACT_IDLE or act == ACT_IDLE_AIM_RELAXED or act == ACT_IDLE_AIM_STIMULATED or act == ACT_IDLE_AIM_STEALTH or act == ACT_IDLE_RELAXED then
			return ACT_BUSY_SIT_GROUND
		end
	elseif self.PIV_Resting == 2 then
		if act == ACT_IDLE or act == ACT_IDLE_AIM_RELAXED or act == ACT_IDLE_AIM_STIMULATED or act == ACT_IDLE_AIM_STEALTH or act == ACT_IDLE_RELAXED then
			return ACT_BUSY_LEAN_BACK
		end
	end

	if self.PIV_Crippled or self.PIV_FuckingCrawlingLittleCunt then
		if act == ACT_IDLE or act == ACT_IDLE_AIM_RELAXED or act == ACT_IDLE_AIM_STIMULATED or act == ACT_IDLE_RELAXED then
			return ACT_IDLE_STIMULATED
		end
		if act == ACT_WALK or act == ACT_WALK_RELAXED or act == ACT_WALK_AIM_STEALTH then
			return ACT_WALK_STIMULATED
		end
		if act == ACT_RUN or act == ACT_WALK_ANGRY then
			return ACT_WALK_STIMULATED
		end
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/