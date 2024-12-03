AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
ENT.Model = {"models/vj_piv/hl2/citizens/male_01.mdl"}
ENT.StartHealth = 125
ENT.JumpVars = {
	MaxRise = 64,
	MaxDrop = 512,
	MaxDistance = 256,
}
ENT.VJC_Data = {
	CameraMode = 1,
	ThirdP_Offset = Vector(40, 20, -50),
	FirstP_Bone = "ValveBiped.Bip01_Spine2",
	FirstP_Offset = Vector(0, 0, 5),
}
--------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.PropAP_MaxSize = 0.6
--------------------
ENT.BloodColor = "Red"
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
--------------------
ENT.AnimTbl_Death = {
	"vjseq_witch_death",
	"vjseq_nz_death_1",
	"vjseq_nz_death_2",
	"vjseq_nz_death_3",
	"vjseq_death02",
	"vjseq_death_01",
	"vjseq_death_02a",
	"vjseq_death_02c",
	"vjseq_death_03",
	"vjseq_death_05",
	"vjseq_death_06",
	"vjseq_death_07",
	"vjseq_death_08",
	"vjseq_death_08b",
	"vjseq_death_09",
	"vjseq_death_10ab",
	"vjseq_death_10b",
	"vjseq_death_10c",
	"vjseq_death_11_01a",
	"vjseq_death_11_01b",
	"vjseq_death_11_02a",
	"vjseq_death_11_02b",
	"vjseq_death_11_02c",
	"vjseq_death_11_02d",
	"vjseq_death_11_03a",
	"vjseq_death_11_03b",
	"vjseq_death_11_03c"
} 
--------------------
ENT.MeleeAttackDamage = math.random(15,20)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 60
ENT.TimeUntilMeleeAttackDamage = false
--------------------
ENT.HasRangeAttack = false
ENT.RangeAttackEntityToSpawn = "obj_vj_piv_trash"
ENT.AnimTbl_RangeAttack = {"vjges_melee_moving01a","vjges_melee_moving03a","vjges_melee_moving06a"}
ENT.RangeAttackAnimationStopMovement = false
ENT.RangeDistance = 600
ENT.RangeToMeleeDistance = 200
ENT.TimeUntilRangeAttackProjectileRelease = 0.7
ENT.NextRangeAttackTime = 5
ENT.NextRangeAttackTime_DoRand = 20
--------------------
ENT.RangeUseAttachmentForPos = true -- update this to RangeAttackProjSpawnPos
ENT.RangeUseAttachmentForPosID = "anim_attachment_RH"
--------------------
ENT.DisableFootStepSoundTimer = true
ENT.HasMeleeAttackSlowPlayerSound = false
ENT.SoundTbl_MeleeAttack = {"vj_piv/z_hit-01.wav","vj_piv/z_hit-02.wav","vj_piv/z_hit-03.wav","vj_piv/z_hit-04.wav","vj_piv/z_hit-05.wav","vj_piv/z_hit-06.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}
ENT.SoundTbl_MeleeAttack = {""}
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 90
ENT.FootStepPitch = VJ.SET(100, 100)
--------------------
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
--------------------
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

ENT.PIV_IsRunner = false

ENT.PIV_Jogger = false
ENT.PIV_Shambler = false
ENT.PIV_Brute = false
ENT.PIV_GoblinMode = false
ENT.PIV_LittleBastard = false
ENT.NextCrawlT = 0

ENT.PIV_HasSubclasses = true
ENT.PIV_CanBeJogger = true
ENT.PIV_CanBeShambler = true
ENT.PIV_CanBeCrawler = true
ENT.PIV_CanBeBrute = true
ENT.PIV_CanBeBiter = true
ENT.PIV_CanBeSuperSprinter = true
ENT.PIV_CanBeRusher = true
ENT.PIV_CanBeLeaper = true
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
ENT.IsDigging = false
ENT.Voice = 1
ENT.PIV_MakeCrispyCorpse = false
ENT.PIV_UseActIdleStimulated = false -- use ACT_IDLE_AIM_STIMULATED as our idle activity
ENT.PIV_IsInfectee = false
ENT.PIV_Type = 0
--[[
1 = Barney Calhoun
2 = Dr. Wallace Breen
3 = Eli Vance
4 = G-Man
5 = Dr. Isaac Kleiner
6 = Magnusson
7 = Father Grigori
8 = Colonel Odessa Cubbage
9 = Alyx Vance
10 = Judith Mossman
--]]
ENT.PIV_Mil_SpawnWithGasmask = false
--------------------
function ENT:Zombie_CustomOnPreInitialize() end
--------------------
function ENT:PreInit()

	self:Zombie_CustomOnPreInitialize()

	if self.PIV_IsRunner && self.StartHealth == 125 then
		self.StartHealth = 100 -- I don't really want to go into a ton of init files and set health values to 100, so we're just automating this.
	end

	if GetConVar("vj_piv_rebirth"):GetInt() == 1 && !self.PIV_IsBoss then
		self.PIV_CanMutate = true
		if GetConVar("vj_piv_rebirthall"):GetInt() == 1 then
			self.PIV_CanMutate = false
			self.PIV_Mutated = true
			self:PIV_CustomMutate()
		end
	end

    if GetConVar("vj_piv_door_breaking"):GetInt() == 1 && self.PIV_CanBreakDoors then
		self.CanOpenDoors = false
	end
	
    -- if GetConVar("vj_piv_jumping"):GetInt() == 2 then
	    -- self.AllowMovementJumping = true
	-- else
		-- self.AllowMovementJumping = false
	-- end
    if GetConVar("vj_piv_jumping"):GetInt() != 2 then
		self.AllowMovementJumping = false
	end

    if GetConVar("vj_piv_climbing"):GetInt() == 2 && self.PIV_AllowedToClimb then
		self.PIV_CanClimb = true
	end

    if GetConVar("vj_piv_deathanim"):GetInt() == 1 then 
		self.HasDeathAnimation = true
		self.DeathAnimationChance = GetConVar("vj_piv_deathanim_chance"):GetInt()
    end

    self.PIV_LegHP = self.StartHealth / 2


	if GetConVar("vj_piv_subclasses"):GetInt() == 1 && self.PIV_HasSubclasses && !self.PIV_IsBoss then

		if self.PIV_IsRunner then

			-- Rushers
			if math.random(1,GetConVar("vj_piv_rusher_chance"):GetInt()) == 1 && self.PIV_CanBeRusher then
				self.PIV_Rusher = true
				self.PIV_HasWeapons = false
				self.PIV_CanBeCrawler = false
				self.PIV_CanBeSuperSprinter = false
			end

			-- Super Sprinters
			if math.random(1,GetConVar("vj_piv_super_sprinter_chance"):GetInt()) == 1 && self.PIV_CanBeSuperSprinter then
				self.PIV_Super_Sprinter = true
				self.PIV_HasWeapons = false
				self.PIV_CanBeCrawler = false
				self.PIV_CanBeRusher = false
			end

			-- Leaper
			if math.random(1,GetConVar("vj_piv_leaper_chance"):GetInt()) == 1 && self.PIV_CanBeLeaper then
				self.PIV_Leaper = true
				self.PIV_CanBeCrawler = false
				
				self.SoundTbl_LeapAttackDamage = {"vj_piv/gore/HeadshotDevestate3.wav","vj_piv/gore/HeadshotDevestate4.wav","vj_piv/gore/HeadshotDevestate5.wav"}
				self.SoundTbl_LeapAttackJump = {self.SoundTbl_BeforeMeleeAttack}

				self.HasLeapAttack = true
				self.LeapAttackDamage = math.random(20,25)
				self.LeapAttackDamageType = DMG_SLASH 
				self.AnimTbl_LeapAttack = {ACT_LEAP} 
				self.LeapDistance = 200 
				self.LeapToMeleeDistance = 150
				self.LeapAttackDamageDistance = 150
				self.TimeUntilLeapAttackDamage = 0.35
				self.TimeUntilLeapAttackVelocity = 0.1 
				self.NextLeapAttackTime = 8
				self.NextAnyAttackTime_Leap = 1.5
				self.LeapAttackVelocityForward = 25
				self.LeapAttackVelocityUp = 200
			end

		else

			-- Joggers
			if math.random(1,GetConVar("vj_piv_jogger_chance"):GetInt()) == 1 && self.PIV_CanBeJogger then
				self.PIV_Jogger = true
				self.PIV_CanBeCrawler = false
				self.PIV_HasWeapons = false
				self.PIV_CanBeFireRunner = false
			end

			-- Shamblers
			-- if you make any changes to this then remember to update the corpse zombies
			if math.random(1,GetConVar("vj_piv_shambler_chance"):GetInt()) == 1 && self.PIV_CanBeShambler then
				self.PIV_Shambler = true
				self.PIV_CanBeCrawler = false
				self.StartHealth = self.StartHealth * 1.25
			end

			-- Brutes
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

			-- Biters
			if math.random(1,GetConVar("vj_piv_biter_chance"):GetInt()) == 1 && self.PIV_CanBeBiter  then
				self.PIV_Biter = true
				self.PIV_CanBeCrawler = false
			end

			-- Crawler
			if math.random(1,GetConVar("vj_piv_crawler_chance"):GetInt()) == 1 && self.PIV_CanBeCrawler then 
				self.PIV_FuckingCrawlingLittleCunt = true
				self:Cripple()    
				self.PIV_HasWeapons = false
				self.PIV_CanBeThrower = false
			end
		
		end

		-- Diseased
		-- if you make any changes to this then remember to update the corpse zombies
		if math.random(1,GetConVar("vj_piv_diseased_chance"):GetInt()) == 1 && self.PIV_CanBeDiseased then
			self.PIV_Diseased = true
			self.MeleeAttackBleedEnemyChance = 1
			self.MeleeAttackBleedEnemyDamage = 1
			self.MeleeAttackBleedEnemyTime = 1
			self.MeleeAttackBleedEnemyReps = math.random(5,20)
			self.MeleeAttackBleedEnemy = true
			ParticleEffectAttach("embers_medium_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
		end

		-- Crawlers
		if math.random(1,GetConVar("vj_piv_crawler_chance"):GetInt()) == 1 && self.PIV_CanBeCrawler then 
			self.PIV_FuckingCrawlingLittleCunt = true
			self:Cripple()    
			self.PIV_HasWeapons = false
			self.PIV_CanBeThrower = false
		end

		-- Diseased
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

	-- Fire Runner
	-- If you make changes to this, don't forget to update the Charple Walker
	if math.random(1,GetConVar("vj_piv_firerunners_chance"):GetInt()) == 1 && GetConVar("vj_piv_firerunners"):GetInt() == 1 && self.PIV_CanBeFireRunner && !self.Immune_Fire then
		self.FireRun = true
	end

	self:Dig()
	
	-- Weapons
	if GetConVar("vj_piv_weapons"):GetInt() == 1 && math.random(1,GetConVar("vj_piv_weapons_chance"):GetInt()) == 1 && self.PIV_HasWeapons && !self.PIV_IsInfectee then
			
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

	-- Throwers
	if GetConVar("vj_piv_throwing"):GetInt() == 1 && math.random(1,GetConVar("vj_piv_thrower_chance"):GetInt()) == 1 && self.PIV_CanBeThrower then
		self.PIV_Thrower = true
		self.PIV_ThrowCount = math.random(GetConVar("vj_piv_throwing_min"):GetInt(),GetConVar("vj_piv_throwing_max"):GetInt())
		self.HasRangeAttack = true
	end
			
	-- Resting
	if GetConVar("vj_piv_resting"):GetInt() == 1 && self.PIV_AllowedToRest then
		self.PIV_CanRest = true
		self.PIV_NextRestT = CurTime() + math.Rand(10, 120)
	end

end
--------------------
function ENT:Zombie_CustomOnInitialize() end
--------------------
function ENT:Zombie_GiveVoice_Default()

	if GetConVar("vj_piv_walk_voice"):GetInt() == 0 then
		self.Voice = 1 -- No More Room In Hell
	elseif GetConVar("vj_piv_walk_voice"):GetInt() == 1 then
		self.Voice = 2 -- Dying Light
	elseif GetConVar("vj_piv_walk_voice"):GetInt() == 2 then
		self.Voice = 3 -- Left 4 Dead
	elseif GetConVar("vj_piv_walk_voice"):GetInt() == 3 then
		self.Voice = 4 -- Contagion
	elseif GetConVar("vj_piv_walk_voice"):GetInt() == 4 then
		self.Voice = math.random(1,4) -- Random Voice Pack
	end

	if self.PIV_Gender == 2 then
		if self.PIV_IsRunner then
			if self.Voice == 1 then	
				self.IdleSoundPitch = VJ.SET(120, 120)
				self.CombatIdleSoundPitch = VJ.SET(120, 120)
				self.AlertSoundPitch = VJ.SET(120, 120)
				self.CallForHelpSoundPitch = VJ.SET(120, 120)
				self.BeforeMeleeAttackSoundPitch = VJ.SET(120, 120)
				self.BeforeLeapAttackSoundPitch = VJ.SET(120, 120)
				self.PainSoundPitch = VJ.SET(120, 120)
				self.DeathSoundPitch = VJ.SET(120, 120)
				self.SoundTbl_Idle = {
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
				self.SoundTbl_Alert = {
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
				self.SoundTbl_CombatIdle = {
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
				self.SoundTbl_BeforeMeleeAttack = {
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
				self.SoundTbl_BeforeLeapAttack = {
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
				self.SoundTbl_Pain = {
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
				self.SoundTbl_Death = {
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
			elseif self.Voice == 2 then
				self.SoundTbl_Idle = {
					"vj_piv/dl_inf_female/infected_female00_idle_calm_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_idle_calm_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_idle_calm_02_0.wav",
				}
				self.SoundTbl_Alert = {
					"vj_piv/dl_inf_female/infected_female00_buggy_grab_taunt_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_buggy_grab_taunt_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_buggy_grab_taunt_02_0.wav",
					"vj_piv/dl_inf_female/infected_female00_enemy_spotted_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_enemy_spotted_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_enemy_spotted_02_0.wav",
					"vj_piv/dl_inf_female/infected_female00_enemy_spotted_03_0.wav",
					"vj_piv/dl_inf_female/infected_female00_taunt_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_taunt_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_taunt_02_0.wav",
					"vj_piv/dl_inf_female/infected_female00_taunt_03_0.wav",
					"vj_piv/dl_inf_female/infected_female00_taunt_04_0.wav",
					"vj_piv/dl_inf_female/infected_female00_taunt_05_0.wav",
					"vj_piv/dl_inf_female/infected_female00_buggy_grab_taunt_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_buggy_grab_taunt_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_buggy_grab_taunt_02_0.wav",
					"vj_piv/dl_inf_female/infected_female00_enemy_spotted_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_enemy_spotted_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_enemy_spotted_02_0.wav",
					"vj_piv/dl_inf_female/infected_female00_enemy_spotted_03_0.wav",
					"vj_piv/dl_inf_female/infected_female00_taunt_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_taunt_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_taunt_02_0.wav",
					"vj_piv/dl_inf_female/infected_female00_taunt_03_0.wav",
					"vj_piv/dl_inf_female/infected_female00_taunt_04_0.wav",
					"vj_piv/dl_inf_female/infected_female00_taunt_05_0.wav",
					"vj_piv/dl_inf_female/infected_female00_humanity_head_left_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_humanity_head_right_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_humanity_head_right_02_0.wav",
					"vj_piv/dl_inf_female/infected_female00_humanity_stand_head_right_01_0.wav"
				}
				self.SoundTbl_CombatIdle = {
					"vj_piv/dl_inf_female/infected_female00_get_up_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_get_up_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_idle_alarmed_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_idle_alarmed_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_idle_alarmed_02_0.wav",
					"vj_piv/dl_inf_female/infected_female00_move_alarmed_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_move_alarmed_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_move_alarmed_02_0.wav"
				}
				self.SoundTbl_BeforeMeleeAttack = {
					"vj_piv/dl_inf_female/infected_female00_attack_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_attack_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_attack_02_0.wav",
					"vj_piv/dl_inf_female/infected_female00_attack_03_0.wav",
					"vj_piv/dl_inf_female/infected_female00_attack_04_0.wav",
					"vj_piv/dl_inf_female/infected_female00_attack_05_0.wav",
					"vj_piv/dl_inf_female/infected_female00_attack_06_0.wav",
					"vj_piv/dl_inf_female/infected_female00_attack_07_0.wav",
					"vj_piv/dl_inf_female/infected_female00_attack_08_0.wav",
					"vj_piv/dl_inf_female/infected_female00_buggy_grab_attack_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_buggy_grab_attack_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_buggy_grab_attack_02_0.wav",
					"vj_piv/dl_inf_female/infected_female00_buggy_grab_attack_03_0.wav"
				}
				self.SoundTbl_BeforeLeapAttack = {
					"vj_piv/dl_inf_female/infected_female00_buggy_grab_taunt_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_buggy_grab_taunt_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_buggy_grab_taunt_02_0.wav"
				}
				self.SoundTbl_Pain = {
					"vj_piv/dl_inf_female/infected_female00_pain_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_02_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_03_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_04_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_05_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_06_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_critical_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_critical_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_critical_02_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_critical_03_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_critical_04_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_electro_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_02_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_03_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_04_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_05_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_06_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_critical_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_critical_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_critical_02_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_critical_03_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_critical_04_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_electro_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_humanity_heavy_left_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_humanity_heavy_right_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_humanity_heavy_torso_front_right_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_humanity_torso_left_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_humanity_torso_right_01_0.wav",
				}
				self.SoundTbl_Death = {
					"vj_piv/dl_inf_female/infected_female00_death_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_death_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_death_02_0.wav",
					"vj_piv/dl_inf_female/infected_female00_death_03_0.wav",
					"vj_piv/dl_inf_female/infected_female00_death_04_0.wav",
					"vj_piv/dl_inf_female/infected_female00_death_car_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_death_car_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_death_car_02_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_burn_00_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_burn_01_0.wav",
					"vj_piv/dl_inf_female/infected_female00_pain_burn_02_0.wav"
				}
			elseif self.Voice == 3 then
				self.SoundTbl_Idle = {
					"vj_piv/l4d_common/idle/breathing/breathing01.wav",
					"vj_piv/l4d_common/idle/breathing/breathing08.wav",
					"vj_piv/l4d_common/idle/breathing/breathing09.wav",
					"vj_piv/l4d_common/idle/breathing/breathing10.wav",
					"vj_piv/l4d_common/idle/breathing/breathing13.wav",
					"vj_piv/l4d_common/idle/breathing/breathing16.wav",
					"vj_piv/l4d_common/idle/breathing/breathing18.wav",
					"vj_piv/l4d_common/idle/breathing/breathing25.wav",
					"vj_piv/l4d_common/idle/breathing/breathing26.wav",
					"vj_piv/l4d_common/idle/breathing/idle_breath_01.wav",
					"vj_piv/l4d_common/idle/breathing/idle_breath_02.wav",
					"vj_piv/l4d_common/idle/breathing/idle_breath_03.wav",
					"vj_piv/l4d_common/idle/breathing/idle_breath_04.wav",
					"vj_piv/l4d_common/idle/breathing/idle_breath_06.wav",
					"vj_piv/l4d_common/idle/moaning/moan01.wav",
					"vj_piv/l4d_common/idle/moaning/moan02.wav",
					"vj_piv/l4d_common/idle/moaning/moan03.wav",
					"vj_piv/l4d_common/idle/moaning/moan04.wav",
					"vj_piv/l4d_common/idle/moaning/moan05.wav",
					"vj_piv/l4d_common/idle/moaning/moan06.wav",
					"vj_piv/l4d_common/idle/moaning/moan07.wav",
					"vj_piv/l4d_common/idle/moaning/moan08.wav",
					"vj_piv/l4d_common/idle/moaning/moan09.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling01.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling02.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling03.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling03.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling05.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling06.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling07.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling08.wav"
				}
				self.SoundTbl_Alert = {
					"vj_piv/l4d_common/alert/becomeenraged/alert24.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged01.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged02.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged03.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged06.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged07.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged09.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged10.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged11.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged30.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged50.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged51.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged52.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged53.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged54.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged55.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged55.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged57.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged58.wav",
					"vj_piv/l4d_common/alert/becomeenraged/female/become_enraged40.wav",
					"vj_piv/l4d_common/alert/becomeenraged/female/become_enraged41.wav",
					"vj_piv/l4d_common/alert/becomeenraged/female/become_enraged42.wav",
					"vj_piv/l4d_common/alert/becomeenraged/female/become_enraged43.wav",
					"vj_piv/l4d_common/alert/becomealert/shout01.wav",
					"vj_piv/l4d_common/alert/becomealert/shout02.wav",
					"vj_piv/l4d_common/alert/becomealert/shout02.wav",
					"vj_piv/l4d_common/alert/becomealert/shout04.wav",
					"vj_piv/l4d_common/alert/becomealert/shout06.wav",
					"vj_piv/l4d_common/alert/becomealert/shout07.wav",
					"vj_piv/l4d_common/alert/becomealert/shout08.wav",
					"vj_piv/l4d_common/alert/becomealert/shout09.wav"
				}
				self.SoundTbl_CombatIdle = {
					"vj_piv/l4d_common/action/rageat/rage_at_victim01.wav",
					"vj_piv/l4d_common/action/rageat/rage_at_victim02.wav",
					"vj_piv/l4d_common/action/rageat/rage_at_victim02.wav",
					"vj_piv/l4d_common/action/rageat/rage_at_victim21.wav",
					"vj_piv/l4d_common/action/rageat/rage_at_victim22.wav",
					"vj_piv/l4d_common/action/rageat/rage_at_victim25.wav",
					"vj_piv/l4d_common/action/rageat/rage_at_victim26.wav",
					"vj_piv/l4d_common/action/rageat/rage_at_victim34.wav",
					"vj_piv/l4d_common/action/rageat/rage_at_victim35.wav",
					"vj_piv/l4d_common/action/rageat/snarl_4.wav",
					"vj_piv/l4d_common/action/rageat/female/rage_at_victim20.wav",
					"vj_piv/l4d_common/action/rageat/female/rage_at_victim21.wav",
					"vj_piv/l4d_common/action/rageat/female/rage_at_victim22.wav",
					"vj_piv/l4d_common/action/rageat/female/rage_at_victim23.wav",
					"vj_piv/l4d_common/action/rageat/female/rage_at_victim24.wav",
					"vj_piv/l4d_common/action/rageat/female/rage_at_victim25.wav",
					"vj_piv/l4d_common/action/rageat/female/rage_at_victim26.wav",
					"vj_piv/l4d_common/action/rageat/female/rage_at_victim27.wav",
					"vj_piv/l4d_common/action/rageat/female/rage_at_victim28.wav",
					"vj_piv/l4d_common/action/rageat/female/rage_at_victim29.wav",
					"vj_piv/l4d_common/action/rageat/female/rage_at_victim30.wav",
					"vj_piv/l4d_common/action/rageat/female/rage_at_victim31.wav",
					"vj_piv/l4d_common/action/rageat/female/rage_at_victim32.wav",
					"vj_piv/l4d_common/action/rageat/female/rage_at_victim33.wav",
					"vj_piv/l4d_common/action/rageat/female/rage_at_victim34.wav",
					"vj_piv/l4d_common/action/rageat/female/rage_at_victim35.wav",
					"vj_piv/l4d_common/action/rageat/female/rage_at_victim36.wav",
					"vj_piv/l4d_common/action/rageat/female/rage_at_victim37.wav",
					"vj_piv/l4d_common/alert/becomealert/shout01.wav",
					"vj_piv/l4d_common/alert/becomealert/shout02.wav",
					"vj_piv/l4d_common/alert/becomealert/shout02.wav",
					"vj_piv/l4d_common/alert/becomealert/shout04.wav",
					"vj_piv/l4d_common/alert/becomealert/shout06.wav",
					"vj_piv/l4d_common/alert/becomealert/shout07.wav",
					"vj_piv/l4d_common/alert/becomealert/shout08.wav",
					"vj_piv/l4d_common/alert/becomealert/shout09.wav"
				}
				self.SoundTbl_BeforeMeleeAttack = {
					"vj_piv/l4d_common/action/rage/female/rage_50.wav",
					"vj_piv/l4d_common/action/rage/female/rage_51.wav",
					"vj_piv/l4d_common/action/rage/female/rage_52.wav",
					"vj_piv/l4d_common/action/rage/female/rage_53.wav",
					"vj_piv/l4d_common/action/rage/female/rage_54.wav",
					"vj_piv/l4d_common/action/rage/female/rage_55.wav",
					"vj_piv/l4d_common/action/rage/female/rage_56.wav",
					"vj_piv/l4d_common/action/rage/female/rage_57.wav",
					"vj_piv/l4d_common/action/rage/female/rage_58.wav",
					"vj_piv/l4d_common/action/rage/female/rage_59.wav",
					"vj_piv/l4d_common/action/rage/female/rage_60.wav",
					"vj_piv/l4d_common/action/rage/female/rage_61.wav",
					"vj_piv/l4d_common/action/rage/female/rage_62.wav",
					"vj_piv/l4d_common/action/rage/female/rage_64.wav",
					"vj_piv/l4d_common/action/rage/female/rage_65.wav",
					"vj_piv/l4d_common/action/rage/female/rage_66.wav",
					"vj_piv/l4d_common/action/rage/female/rage_67.wav",
					"vj_piv/l4d_common/action/rage/female/rage_68.wav",
					"vj_piv/l4d_common/action/rage/female/rage_69.wav",
					"vj_piv/l4d_common/action/rage/female/rage_70.wav",
					"vj_piv/l4d_common/action/rage/female/rage_71.wav",
					"vj_piv/l4d_common/action/rage/female/rage_72.wav",
					"vj_piv/l4d_common/action/rage/female/rage_73.wav",
					"vj_piv/l4d_common/action/rage/female/rage_74.wav",
					"vj_piv/l4d_common/action/rage/female/rage_75.wav",
					"vj_piv/l4d_common/action/rage/female/rage_76.wav",
					"vj_piv/l4d_common/action/rage/female/rage_77.wav",
					"vj_piv/l4d_common/action/rage/female/rage_78.wav",
					"vj_piv/l4d_common/action/rage/female/rage_79.wav",
					"vj_piv/l4d_common/action/rage/female/rage_80.wav",
					"vj_piv/l4d_common/action/rage/female/rage_81.wav",
					"vj_piv/l4d_common/action/rage/female/rage_82.wav"
				}
				self.SoundTbl_BeforeLeapAttack = {
					"vj_piv/l4d_common/action/rage/female/rage_50.wav",
					"vj_piv/l4d_common/action/rage/female/rage_51.wav",
					"vj_piv/l4d_common/action/rage/female/rage_52.wav",
					"vj_piv/l4d_common/action/rage/female/rage_53.wav",
					"vj_piv/l4d_common/action/rage/female/rage_54.wav",
					"vj_piv/l4d_common/action/rage/female/rage_55.wav",
					"vj_piv/l4d_common/action/rage/female/rage_56.wav",
					"vj_piv/l4d_common/action/rage/female/rage_57.wav",
					"vj_piv/l4d_common/action/rage/female/rage_58.wav",
					"vj_piv/l4d_common/action/rage/female/rage_59.wav",
					"vj_piv/l4d_common/action/rage/female/rage_60.wav",
					"vj_piv/l4d_common/action/rage/female/rage_61.wav",
					"vj_piv/l4d_common/action/rage/female/rage_62.wav",
					"vj_piv/l4d_common/action/rage/female/rage_64.wav",
					"vj_piv/l4d_common/action/rage/female/rage_65.wav",
					"vj_piv/l4d_common/action/rage/female/rage_66.wav",
					"vj_piv/l4d_common/action/rage/female/rage_67.wav",
					"vj_piv/l4d_common/action/rage/female/rage_68.wav",
					"vj_piv/l4d_common/action/rage/female/rage_69.wav",
					"vj_piv/l4d_common/action/rage/female/rage_70.wav",
					"vj_piv/l4d_common/action/rage/female/rage_71.wav",
					"vj_piv/l4d_common/action/rage/female/rage_72.wav",
					"vj_piv/l4d_common/action/rage/female/rage_73.wav",
					"vj_piv/l4d_common/action/rage/female/rage_74.wav",
					"vj_piv/l4d_common/action/rage/female/rage_75.wav",
					"vj_piv/l4d_common/action/rage/female/rage_76.wav",
					"vj_piv/l4d_common/action/rage/female/rage_77.wav",
					"vj_piv/l4d_common/action/rage/female/rage_78.wav",
					"vj_piv/l4d_common/action/rage/female/rage_79.wav",
					"vj_piv/l4d_common/action/rage/female/rage_80.wav",
					"vj_piv/l4d_common/action/rage/female/rage_81.wav",
					"vj_piv/l4d_common/action/rage/female/rage_82.wav"
				}
				self.SoundTbl_Pain = {
					"vj_piv/l4d_common/action/been_shot/been_shot_01.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_02.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_04.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_05.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_06.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_08.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_09.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_12.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_13.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_14.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_18.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_19.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_20.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_21.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_22.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_24.wav",
					"vj_piv/l4d_common/action/been_shot/female/been_shot_30.wav",
					"vj_piv/l4d_common/action/been_shot/female/been_shot_31.wav",
					"vj_piv/l4d_common/action/been_shot/female/been_shot_32.wav",
					"vj_piv/l4d_common/action/been_shot/female/been_shot_32.wav",
					"vj_piv/l4d_common/action/been_shot/female/been_shot_34.wav",
					"vj_piv/l4d_common/action/been_shot/female/been_shot_35.wav",
					"vj_piv/l4d_common/action/been_shot/female/been_shot_36.wav",
					"vj_piv/l4d_common/action/been_shot/female/been_shot_37.wav",
					"vj_piv/l4d_common/action/rage/shoved_1.wav",
					"vj_piv/l4d_common/action/rage/shoved_2.wav",
					"vj_piv/l4d_common/action/rage/shoved_3.wav",
					"vj_piv/l4d_common/action/rage/shoved_4.wav",
					"vj_piv/l4d_common/action/die/mp/odd_2.wav",
					"vj_piv/l4d_common/action/die/mp/odd_3.wav",
					"vj_piv/l4d_common/action/die/mp/odd_3.wav",
					"vj_piv/l4d_common/action/die/mp/odd_5.wav",
				}
				self.SoundTbl_Death = {
					"vj_piv/l4d_common/action/die/death_14.wav",
					"vj_piv/l4d_common/action/die/death_17.wav",
					"vj_piv/l4d_common/action/die/death_17.wav",
					"vj_piv/l4d_common/action/die/death_19.wav",
					"vj_piv/l4d_common/action/die/death_22.wav",
					"vj_piv/l4d_common/action/die/death_23.wav",
					"vj_piv/l4d_common/action/die/death_24.wav",
					"vj_piv/l4d_common/action/die/death_25.wav",
					"vj_piv/l4d_common/action/die/death_26.wav",
					"vj_piv/l4d_common/action/die/death_27.wav",
					"vj_piv/l4d_common/action/die/death_28.wav",
					"vj_piv/l4d_common/action/die/death_29.wav",
					"vj_piv/l4d_common/action/die/death_30.wav",
					"vj_piv/l4d_common/action/die/death_32.wav",
					"vj_piv/l4d_common/action/die/death_33.wav",
					"vj_piv/l4d_common/action/die/death_34.wav",
					"vj_piv/l4d_common/action/die/death_35.wav",
					"vj_piv/l4d_common/action/die/death_35.wav",
					"vj_piv/l4d_common/action/die/death_37.wav",
					"vj_piv/l4d_common/action/die/death_38.wav",
					"vj_piv/l4d_common/action/die/female/death_40.wav",
					"vj_piv/l4d_common/action/die/female/death_41.wav",
					"vj_piv/l4d_common/action/die/female/death_42.wav",
					"vj_piv/l4d_common/action/die/female/death_43.wav",
					"vj_piv/l4d_common/action/die/female/death_44.wav",
					"vj_piv/l4d_common/action/die/female/death_45.wav",
					"vj_piv/l4d_common/action/die/female/death_46.wav",
					"vj_piv/l4d_common/action/die/female/death_47.wav",
					"vj_piv/l4d_common/action/die/female/death_48.wav",
					"vj_piv/l4d_common/action/die/female/death_49.wav",
					"vj_piv/l4d_common/action/die/mp/squeal_1.wav",
					"vj_piv/l4d_common/action/die/mp/squeal_2.wav",
					"vj_piv/l4d_common/action/die/mp/squeal_3.wav",
					"vj_piv/l4d_common/action/ignite/ignite01.wav",
					"vj_piv/l4d_common/action/ignite/ignite07.wav",
					"vj_piv/l4d_common/action/ignite/ignite08.wav",
					"vj_piv/l4d_common/action/ignite/ignite09.wav",
					"vj_piv/l4d_common/action/ignite/female/ignite10.wav",
					"vj_piv/l4d_common/action/ignite/female/ignite11.wav",
					"vj_piv/l4d_common/action/ignite/female/ignite12.wav",
					"vj_piv/l4d_common/action/ignite/female/ignite13.wav",
					"vj_piv/l4d_common/action/ignite/female/ignite14.wav"
				}
			elseif self.Voice == 4 then
				self.IdleSoundPitch = VJ.SET(120, 120)
				self.CombatIdleSoundPitch = VJ.SET(120, 120)
				self.AlertSoundPitch = VJ.SET(120, 120)
				self.CallForHelpSoundPitch = VJ.SET(120, 120)
				self.BeforeMeleeAttackSoundPitch = VJ.SET(120, 120)
				self.BeforeLeapAttackSoundPitch = VJ.SET(120, 120)
				self.PainSoundPitch = VJ.SET(120, 120)
				self.DeathSoundPitch = VJ.SET(120, 120)
				local ContagionVoice = math.random(1,4)
				if ContagionVoice == 1 then
				   self.SoundTbl_Idle = {"vj_piv/contagion/z_sham/shared/0245.wav","vj_piv/contagion/z_sham/shared/0244.wav","vj_piv/contagion/z_sham/idle/0128.wav","vj_piv/contagion/z_sham/idle/0123.wav","vj_piv/contagion/z_sham/idle/0122.wav","vj_piv/contagion/z_sham/idle/0121.wav","vj_piv/contagion/z_sham/idle/0120.wav","vj_piv/contagion/z_sham/idle/0119.wav","vj_piv/contagion/z_sham/idle/0118.wav","vj_piv/contagion/z_sham/idle/0117.wav","vj_piv/contagion/z_sham/idle/0116.wav","vj_piv/contagion/z_sham/idle/0115.wav","vj_piv/contagion/z_sham/idle/0114.wav","vj_piv/contagion/z_sham/idle/0113.wav","vj_piv/contagion/z_sham/idle/0112.wav","vj_piv/contagion/z_sham/idle/0111.wav","vj_piv/contagion/z_sham/idle/0110.wav","vj_piv/contagion/z_sham/idle/0109.wav","vj_piv/contagion/z_sham/idle/0108.wav","vj_piv/contagion/z_sham/idle/0107.wav","vj_piv/contagion/z_sham/idle/0106.wav","vj_piv/contagion/z_sham/idle/0105.wav","vj_piv/contagion/z_sham/idle/0104.wav","vj_piv/contagion/z_sham/idle/0103.wav","vj_piv/contagion/z_sham/idle/0102.wav","vj_piv/contagion/z_sham/idle/0101.wav","vj_piv/contagion/z_sham/idle/0100.wav","vj_piv/contagion/z_sham/idle/0099.wav","vj_piv/contagion/z_sham/idle/0098.wav","vj_piv/contagion/z_sham/idle/0097.wav","vj_piv/contagion/z_sham/idle/0096.wav","vj_piv/contagion/z_sham/idle/0095.wav","vj_piv/contagion/z_sham/idle/0094.wav","vj_piv/contagion/z_sham/idle/0093.wav","vj_piv/contagion/z_sham/idle/0092.wav","vj_piv/contagion/z_sham/idle/0091.wav","vj_piv/contagion/z_sham/idle/0090.wav","vj_piv/contagion/z_sham/idle/0089.wav","vj_piv/contagion/z_sham/idle/0088.wav","vj_piv/contagion/z_sham/idle/0087.wav","vj_piv/contagion/z_sham/idle/0086.wav","vj_piv/contagion/z_sham/idle/0085.wav","vj_piv/contagion/z_sham/idle/0084.wav","vj_piv/contagion/z_sham/idle/0083.wav","vj_piv/contagion/z_sham/idle/0082.wav","vj_piv/contagion/z_sham/idle/0081.wav","vj_piv/contagion/z_sham/idle/0080.wav","vj_piv/contagion/z_sham/idle/0079.wav","vj_piv/contagion/z_sham/idle/0077.wav","vj_piv/contagion/z_sham/idle/0076.wav"}
				   self.SoundTbl_Alert = {"vj_piv/contagion/z_sham/alert/0170.wav","vj_piv/contagion/z_sham/alert/0169.wav","vj_piv/contagion/z_sham/alert/0168.wav","vj_piv/contagion/z_sham/alert/0167.wav","vj_piv/contagion/z_sham/alert/0166.wav","vj_piv/contagion/z_sham/alert/0165.wav","vj_piv/contagion/z_sham/alert/0164.wav","vj_piv/contagion/z_sham/alert/0163.wav","vj_piv/contagion/z_sham/alert/0162.wav","vj_piv/contagion/z_sham/alert/0161.wav","vj_piv/contagion/z_sham/alert/0152.wav","vj_piv/contagion/z_sham/alert/0061.wav","vj_piv/contagion/z_sham/alert/0060.wav","vj_piv/contagion/z_sham/alert/0058.wav","vj_piv/contagion/z_sham/alert/0056.wav","vj_piv/contagion/z_sham/alert/0030.wav","vj_piv/contagion/z_sham/alert/0029.wav","vj_piv/contagion/z_sham/alert/0028.wav","vj_piv/contagion/z_sham/alert/0027.wav","vj_piv/contagion/z_sham/alert/0026.wav","vj_piv/contagion/z_sham/alert/0025.wav","vj_piv/contagion/z_sham/alert/0023.wav","vj_piv/contagion/z_sham/alert/0022.wav","vj_piv/contagion/z_sham/alert/0021.wav","vj_piv/contagion/z_arne/alert/0207.wav"}
				   self.SoundTbl_CallForHelp = {"vj_piv/contagion/z_sham/roar/0075.wav","vj_piv/contagion/z_sham/roar/0074.wav","vj_piv/contagion/z_sham/roar/0073.wav","vj_piv/contagion/z_sham/roar/0072.wav","vj_piv/contagion/z_sham/roar/0071.wav","vj_piv/contagion/z_sham/roar/0070.wav"}
				   self.SoundTbl_CombatIdle = {"vj_piv/contagion/z_sham/spot_player/0178.wav","vj_piv/contagion/z_sham/spot_player/0173.wav","vj_piv/contagion/z_sham/spot_player/0159.wav","vj_piv/contagion/z_sham/spot_player/0158.wav","vj_piv/contagion/z_sham/spot_player/0157.wav","vj_piv/contagion/z_sham/spot_player/0156.wav","vj_piv/contagion/z_sham/spot_player/0155.wav","vj_piv/contagion/z_sham/spot_player/0153.wav","vj_piv/contagion/z_sham/spot_player/0145.wav","vj_piv/contagion/z_sham/spot_player/0134.wav","vj_piv/contagion/z_sham/spot_player/0059.wav","vj_piv/contagion/z_sham/spot_player/0055.wav","vj_piv/contagion/z_sham/spot_player/0054.wav","vj_piv/contagion/z_sham/spot_player/0018.wav","vj_piv/contagion/z_sham/spot_player/0017.wav","vj_piv/contagion/z_sham/spot_player/0016.wav","vj_piv/contagion/z_sham/spot_player/0015.wav","vj_piv/contagion/z_sham/spot_player/0014.wav","","vj_piv/contagion/z_sham/spot_player/0013.wav","vj_piv/contagion/z_sham/spot_player/0003.wav","vj_piv/contagion/z_sham/spot_player/0002.wav","vj_piv/contagion/z_sham/spot_player/0001.wav"}
				   self.SoundTbl_BeforeMeleeAttack = {"vj_piv/contagion/z_sham/attacking/0053.wav","vj_piv/contagion/z_sham/attacking/0052.wav","vj_piv/contagion/z_sham/attacking/0051.wav","vj_piv/contagion/z_sham/attacking/0050.wav","vj_piv/contagion/z_sham/attacking/0049.wav","vj_piv/contagion/z_sham/attacking/0048.wav","vj_piv/contagion/z_sham/attacking/0047.wav","vj_piv/contagion/z_sham/attacking/0045.wav","vj_piv/contagion/z_sham/attacking/0044.wav","vj_piv/contagion/z_sham/attacking/0043.wav","vj_piv/contagion/z_sham/attacking/0042.wav","vj_piv/contagion/z_sham/attacking/0041.wav","vj_piv/contagion/z_sham/attacking/0040.wav","vj_piv/contagion/z_sham/attacking/0039.wav","vj_piv/contagion/z_sham/attacking/0038.wav","vj_piv/contagion/z_sham/attacking/0037.wav","vj_piv/contagion/z_sham/attacking/0036.wav","vj_piv/contagion/z_sham/attacking/0034.wav","vj_piv/contagion/z_sham/attacking/0033.wav"}
				   self.SoundTbl_BeforeLeapAttack = {"vj_piv/contagion/z_sham/attacking/0053.wav","vj_piv/contagion/z_sham/attacking/0052.wav","vj_piv/contagion/z_sham/attacking/0051.wav","vj_piv/contagion/z_sham/attacking/0050.wav","vj_piv/contagion/z_sham/attacking/0049.wav","vj_piv/contagion/z_sham/attacking/0048.wav","vj_piv/contagion/z_sham/attacking/0047.wav","vj_piv/contagion/z_sham/attacking/0045.wav","vj_piv/contagion/z_sham/attacking/0044.wav","vj_piv/contagion/z_sham/attacking/0043.wav","vj_piv/contagion/z_sham/attacking/0042.wav","vj_piv/contagion/z_sham/attacking/0041.wav","vj_piv/contagion/z_sham/attacking/0040.wav","vj_piv/contagion/z_sham/attacking/0039.wav","vj_piv/contagion/z_sham/attacking/0038.wav","vj_piv/contagion/z_sham/attacking/0037.wav","vj_piv/contagion/z_sham/attacking/0036.wav","vj_piv/contagion/z_sham/attacking/0034.wav","vj_piv/contagion/z_sham/attacking/0033.wav"}
				   self.SoundTbl_Pain = {"vj_piv/contagion/z_sham/shared/0187.wav","vj_piv/contagion/z_sham/shared/0186.wav","vj_piv/contagion/z_sham/shared/0185.wav","vj_piv/contagion/z_sham/shared/0184.wav","vj_piv/contagion/z_sham/shared/0183.wav","vj_piv/contagion/z_sham/shared/0182.wav","vj_piv/contagion/z_sham/shared/0181.wav","vj_piv/contagion/z_sham/shared/0180.wav","vj_piv/contagion/z_sham/shared/0179.wav","vj_piv/contagion/z_sham/shared/0177.wav","vj_piv/contagion/z_sham/shared/0176.wav","vj_piv/contagion/z_sham/shared/0175.wav","vj_piv/contagion/z_sham/shared/0174.wav","vj_piv/contagion/z_sham/shared/0174.wav"}
				   self.SoundTbl_Death = {"vj_piv/contagion/z_sham/death/0032.wav"}
				elseif ContagionVoice == 2 then
				   self.SoundTbl_Idle = {"vj_piv/contagion/z_arne/idle/0219.wav","vj_piv/contagion/z_arne/idle/0220.wav","vj_piv/contagion/z_arne/idle/0221.wav","vj_piv/contagion/z_arne/idle/0243.wav","vj_piv/contagion/z_arne/idle/0246.wav","vj_piv/contagion/z_arne/idle/0247.wav","vj_piv/contagion/z_arne/idle/0248.wav","vj_piv/contagion/z_arne/idle/0249.wav","vj_piv/contagion/z_arne/idle/0250.wav","vj_piv/contagion/z_arne/idle/0251.wav","vj_piv/contagion/z_arne/idle/0252.wav","vj_piv/contagion/z_arne/idle/0253.wav","vj_piv/contagion/z_arne/idle/0254.wav","vj_piv/contagion/z_arne/idle/0255.wav"}
				   self.SoundTbl_Alert = {"vj_piv/contagion/z_arne/alert/0208.wav","vj_piv/contagion/z_arne/alert/0209.wav","vj_piv/contagion/z_arne/alert/0210.wav","vj_piv/contagion/z_arne/alert/0211.wav","vj_piv/contagion/z_arne/alert/0212.wav","vj_piv/contagion/z_arne/alert/0213.wav","vj_piv/contagion/z_arne/alert/0214.wav","vj_piv/contagion/z_arne/alert/0215.wav","vj_piv/contagion/z_arne/alert/0216.wav","vj_piv/contagion/z_arne/alert/0217.wav","vj_piv/contagion/z_arne/alert/0218.wav"}
				   self.SoundTbl_CallForHelp = {"vj_piv/contagion/z_arne/alert/0208.wav","vj_piv/contagion/z_arne/alert/0209.wav","vj_piv/contagion/z_arne/alert/0210.wav","vj_piv/contagion/z_arne/alert/0211.wav","vj_piv/contagion/z_arne/alert/0212.wav","vj_piv/contagion/z_arne/alert/0213.wav","vj_piv/contagion/z_arne/alert/0214.wav","vj_piv/contagion/z_arne/alert/0215.wav","vj_piv/contagion/z_arne/alert/0216.wav","vj_piv/contagion/z_arne/alert/0217.wav","vj_piv/contagion/z_arne/alert/0218.wav"}
				   self.SoundTbl_BeforeMeleeAttack = {"vj_piv/contagion/z_arne/attack/0226.wav","vj_piv/contagion/z_arne/attack/0227.wav","vj_piv/contagion/z_arne/attack/0229.wav","vj_piv/contagion/z_arne/attack/0231.wav","vj_piv/contagion/z_arne/attack/0233.wav","vj_piv/contagion/z_arne/attack/0234.wav","vj_piv/contagion/z_arne/attack/0235.wav","vj_piv/contagion/z_arne/attack/0236.wav","vj_piv/contagion/z_arne/attack/0238.wav","vj_piv/contagion/z_arne/attack/0239.wav","vj_piv/contagion/z_arne/attack/0240.wav","vj_piv/contagion/z_arne/attack/0241.wav","vj_piv/contagion/z_arne/attack/0256.wav"}
				   self.SoundTbl_BeforeLeapAttack = {"vj_piv/contagion/z_arne/attack/0226.wav","vj_piv/contagion/z_arne/attack/0227.wav","vj_piv/contagion/z_arne/attack/0229.wav","vj_piv/contagion/z_arne/attack/0231.wav","vj_piv/contagion/z_arne/attack/0233.wav","vj_piv/contagion/z_arne/attack/0234.wav","vj_piv/contagion/z_arne/attack/0235.wav","vj_piv/contagion/z_arne/attack/0236.wav","vj_piv/contagion/z_arne/attack/0238.wav","vj_piv/contagion/z_arne/attack/0239.wav","vj_piv/contagion/z_arne/attack/0240.wav","vj_piv/contagion/z_arne/attack/0241.wav","vj_piv/contagion/z_arne/attack/0256.wav"}
				   self.SoundTbl_Pain = {"vj_piv/contagion/z_sham/pain/0148.wav","vj_piv/contagion/z_sham/pain/0149.wav","vj_piv/contagion/z_sham/pain/0147.wav","vj_piv/contagion/z_sham/pain/0146.wav","vj_piv/contagion/z_sham/pain/0143.wav","vj_piv/contagion/z_sham/pain/0141.wav","vj_piv/contagion/z_sham/pain/0140.wav","vj_piv/contagion/z_sham/pain/0139.wav","vj_piv/contagion/z_sham/pain/0138.wav","vj_piv/contagion/z_sham/pain/0137.wav","vj_piv/contagion/z_sham/pain/0136.wav","vj_piv/contagion/z_sham/pain/0135.wav","vj_piv/contagion/z_sham/pain/0133.wav","vj_piv/contagion/z_sham/pain/0132.wav","vj_piv/contagion/z_sham/pain/0131.wav","vj_piv/contagion/z_sham/pain/0130.wav","vj_piv/contagion/z_sham/pain/0129.wav","vj_piv/contagion/z_sham/pain/0127.wav","vj_piv/contagion/z_sham/pain/0126.wav","vj_piv/contagion/z_sham/pain/0125.wav","vj_piv/contagion/z_sham/pain/0124.wav","vj_piv/contagion/z_sham/pain/0069.wav","vj_piv/contagion/z_sham/pain/0066.wav","vj_piv/contagion/z_sham/pain/0065.wav","vj_piv/contagion/z_sham/pain/0064.wav","vj_piv/contagion/z_sham/pain/0063.wav","vj_piv/contagion/z_sham/pain/0062.wav"}
				   self.SoundTbl_Death = {"vj_piv/contagion/z_arne/die/0223.wav","vj_piv/contagion/z_arne/die/0224.wav","vj_piv/contagion/z_arne/die/0225.wav"}
				elseif ContagionVoice == 3 then
				   self.SoundTbl_Idle = {"vj_piv/contagion/growler/zombie_voice_shared-1.wav","vj_piv/contagion/growler/zombie_voice_shared-10.wav","vj_piv/contagion/growler/zombie_voice_shared-12.wav","vj_piv/contagion/growler/zombie_voice_shared-13.wav","vj_piv/contagion/growler/zombie_voice_shared-14.wav","vj_piv/contagion/growler/zombie_voice_shared-2.wav","vj_piv/contagion/growler/zombie_voice_shared-3.wav","vj_piv/contagion/growler/zombie_voice_shared-4.wav","vj_piv/contagion/growler/zombie_voice_shared-5.wav","vj_piv/contagion/growler/zombie_voice_shared-6.wav","vj_piv/contagion/growler/zombie_voice_shared-7.wav","vj_piv/contagion/growler/zombie_voice_shared-8.wav","vj_piv/contagion/growler/zombie_voice_shared-9.wav"}
				   self.SoundTbl_Alert = {"vj_piv/contagion/growler/zombie_voice_alert-1.wav","vj_piv/contagion/growler/zombie_voice_alert-2.wav","vj_piv/contagion/growler/zombie_voice_alert-3.wav","vj_piv/contagion/growler/zombie_voice_alert-4.wav"}
				   self.SoundTbl_CallForHelp = {"vj_piv/contagion/growler/zombie_voice_alert-1.wav","vj_piv/contagion/growler/zombie_voice_alert-2.wav","vj_piv/contagion/growler/zombie_voice_alert-3.wav","vj_piv/contagion/growler/zombie_voice_alert-4.wav"}
				   self.SoundTbl_BeforeMeleeAttack = {"vj_piv/contagion/growler/zombie_voice_shared-1.wav","vj_piv/contagion/growler/zombie_voice_shared-10.wav","vj_piv/contagion/growler/zombie_voice_shared-12.wav","vj_piv/contagion/growler/zombie_voice_shared-13.wav","vj_piv/contagion/growler/zombie_voice_shared-14.wav","vj_piv/contagion/growler/zombie_voice_shared-2.wav","vj_piv/contagion/growler/zombie_voice_shared-3.wav","vj_piv/contagion/growler/zombie_voice_shared-4.wav","vj_piv/contagion/growler/zombie_voice_shared-5.wav","vj_piv/contagion/growler/zombie_voice_shared-6.wav","vj_piv/contagion/growler/zombie_voice_shared-7.wav","vj_piv/contagion/growler/zombie_voice_shared-8.wav","vj_piv/contagion/growler/zombie_voice_shared-9.wav"}
				   self.SoundTbl_BeforeLeapAttack = {"vj_piv/contagion/growler/zombie_voice_shared-1.wav","vj_piv/contagion/growler/zombie_voice_shared-10.wav","vj_piv/contagion/growler/zombie_voice_shared-12.wav","vj_piv/contagion/growler/zombie_voice_shared-13.wav","vj_piv/contagion/growler/zombie_voice_shared-14.wav","vj_piv/contagion/growler/zombie_voice_shared-2.wav","vj_piv/contagion/growler/zombie_voice_shared-3.wav","vj_piv/contagion/growler/zombie_voice_shared-4.wav","vj_piv/contagion/growler/zombie_voice_shared-5.wav","vj_piv/contagion/growler/zombie_voice_shared-6.wav","vj_piv/contagion/growler/zombie_voice_shared-7.wav","vj_piv/contagion/growler/zombie_voice_shared-8.wav","vj_piv/contagion/growler/zombie_voice_shared-9.wav"}
				   self.SoundTbl_Pain = {"vj_piv/contagion/z_sham/pain/0148.wav","vj_piv/contagion/z_sham/pain/0149.wav","vj_piv/contagion/z_sham/pain/0147.wav","vj_piv/contagion/z_sham/pain/0146.wav","vj_piv/contagion/z_sham/pain/0143.wav","vj_piv/contagion/z_sham/pain/0141.wav","vj_piv/contagion/z_sham/pain/0140.wav","vj_piv/contagion/z_sham/pain/0139.wav","vj_piv/contagion/z_sham/pain/0138.wav","vj_piv/contagion/z_sham/pain/0137.wav","vj_piv/contagion/z_sham/pain/0136.wav","vj_piv/contagion/z_sham/pain/0135.wav","vj_piv/contagion/z_sham/pain/0133.wav","vj_piv/contagion/z_sham/pain/0132.wav","vj_piv/contagion/z_sham/pain/0131.wav","vj_piv/contagion/z_sham/pain/0130.wav","vj_piv/contagion/z_sham/pain/0129.wav","vj_piv/contagion/z_sham/pain/0127.wav","vj_piv/contagion/z_sham/pain/0126.wav","vj_piv/contagion/z_sham/pain/0125.wav","vj_piv/contagion/z_sham/pain/0124.wav","vj_piv/contagion/z_sham/pain/0069.wav","vj_piv/contagion/z_sham/pain/0066.wav","vj_piv/contagion/z_sham/pain/0065.wav","vj_piv/contagion/z_sham/pain/0064.wav","vj_piv/contagion/z_sham/pain/0063.wav","vj_piv/contagion/z_sham/pain/0062.wav"}
				   self.SoundTbl_Death = {"vj_piv/contagion/z_arne/die/0223.wav","vj_piv/contagion/z_arne/die/0224.wav","vj_piv/contagion/z_arne/die/0225.wav"}
				elseif ContagionVoice == 4 then
				   self.SoundTbl_Idle = {"vj_piv/contagion/screamer/idle-1.wav","vj_piv/contagion/screamer/idle-1.wav","vj_piv/contagion/screamer/idle-1.wav","vj_piv/contagion/screamer/idle-3.wav","vj_piv/contagion/screamer/idle-3.wav","vj_piv/contagion/screamer/idle-3.wav","vj_piv/contagion/screamer/idle-2.wav"}
				   self.SoundTbl_Alert = {"vj_piv/contagion/screamer/alert-1.wav","vj_piv/contagion/screamer/alert-2.wav"}
				   self.SoundTbl_CallForHelp = {"vj_piv/contagion/screamer/idle-2.wav"}
				   self.SoundTbl_BeforeMeleeAttack = {"vj_piv/contagion/screamer/idle-1.wav","vj_piv/contagion/screamer/idle-1.wav","vj_piv/contagion/screamer/idle-1.wav","vj_piv/contagion/screamer/idle-3.wav","vj_piv/contagion/screamer/idle-3.wav","vj_piv/contagion/screamer/idle-3.wav","vj_piv/contagion/screamer/idle-2.wav"}
				   self.SoundTbl_BeforeLeapAttack = {"vj_piv/contagion/screamer/alert-1.wav","vj_piv/contagion/screamer/alert-2.wav"}
				   self.SoundTbl_Pain = {"vj_piv/contagion/z_sham/pain/0148.wav","vj_piv/contagion/z_sham/pain/0149.wav","vj_piv/contagion/z_sham/pain/0147.wav","vj_piv/contagion/z_sham/pain/0146.wav","vj_piv/contagion/z_sham/pain/0143.wav","vj_piv/contagion/z_sham/pain/0141.wav","vj_piv/contagion/z_sham/pain/0140.wav","vj_piv/contagion/z_sham/pain/0139.wav","vj_piv/contagion/z_sham/pain/0138.wav","vj_piv/contagion/z_sham/pain/0137.wav","vj_piv/contagion/z_sham/pain/0136.wav","vj_piv/contagion/z_sham/pain/0135.wav","vj_piv/contagion/z_sham/pain/0133.wav","vj_piv/contagion/z_sham/pain/0132.wav","vj_piv/contagion/z_sham/pain/0131.wav","vj_piv/contagion/z_sham/pain/0130.wav","vj_piv/contagion/z_sham/pain/0129.wav","vj_piv/contagion/z_sham/pain/0127.wav","vj_piv/contagion/z_sham/pain/0126.wav","vj_piv/contagion/z_sham/pain/0125.wav","vj_piv/contagion/z_sham/pain/0124.wav","vj_piv/contagion/z_sham/pain/0069.wav","vj_piv/contagion/z_sham/pain/0066.wav","vj_piv/contagion/z_sham/pain/0065.wav","vj_piv/contagion/z_sham/pain/0064.wav","vj_piv/contagion/z_sham/pain/0063.wav","vj_piv/contagion/z_sham/pain/0062.wav"}
				   self.SoundTbl_Death = {"vj_piv/contagion/z_arne/die/0222.wav","vj_piv/contagion/z_arne/die/0223.wav","vj_piv/contagion/z_arne/die/0224.wav","vj_piv/contagion/z_arne/die/0225.wav"}
				end
			end
		else
			if self.Voice == 1 then
				self.SoundTbl_Idle = {
					"vj_piv/nmr_zomb_female/femzom_idle01.wav",
					"vj_piv/nmr_zomb_female/femzom_idle02.wav",
					"vj_piv/nmr_zomb_female/femzom_idle03.wav",
					"vj_piv/nmr_zomb_female/femzom_idle04.wav",
					"vj_piv/nmr_zomb_female/femzom_idle05.wav",
					"vj_piv/nmr_zomb_female/femzom_idle06.wav",
					"vj_piv/nmr_zomb_female/femzom_idle07.wav",
					"vj_piv/nmr_zomb_female/femzom_idle08.wav",
					"vj_piv/nmr_zomb_female/femzom_idle09.wav",
					"vj_piv/nmr_zomb_female/femzom_idle10.wav",
					"vj_piv/nmr_zomb_female/femzom_idle11.wav"
				}
				self.SoundTbl_Alert = {
					"vj_piv/nmr_zomb_female/femzom_sighted01.wav",
					"vj_piv/nmr_zomb_female/femzom_sighted02.wav",
					"vj_piv/nmr_zomb_female/femzom_sighted03.wav",
					"vj_piv/nmr_zomb_female/femzom_sighted04.wav",
					"vj_piv/nmr_zomb_female/femzom_sighted05.wav",
					"vj_piv/nmr_zomb_female/femzom_sighted06.wav",
					"vj_piv/nmr_zomb_female/femzom_sighted07.wav",
					"vj_piv/nmr_zomb_female/femzom_sighted08.wav",
					"vj_piv/nmr_zomb_female/femzom_sighted09.wav",
					"vj_piv/nmr_zomb_female/femzom_sighted10.wav",
					"vj_piv/nmr_zomb_female/femzom_sighted11.wav"
				}
				self.SoundTbl_CombatIdle = {
					"vj_piv/nmr_zomb_female/femzom_sighted01.wav",
					"vj_piv/nmr_zomb_female/femzom_sighted02.wav",
					"vj_piv/nmr_zomb_female/femzom_sighted03.wav",
					"vj_piv/nmr_zomb_female/femzom_sighted04.wav",
					"vj_piv/nmr_zomb_female/femzom_sighted05.wav",
					"vj_piv/nmr_zomb_female/femzom_sighted06.wav",
					"vj_piv/nmr_zomb_female/femzom_sighted07.wav",
					"vj_piv/nmr_zomb_female/femzom_sighted08.wav",
					"vj_piv/nmr_zomb_female/femzom_sighted09.wav",
					"vj_piv/nmr_zomb_female/femzom_sighted10.wav",
					"vj_piv/nmr_zomb_female/femzom_sighted11.wav"
				}
				self.SoundTbl_BeforeMeleeAttack = {
					"vj_piv/nmr_zomb_female/femzom_attack01.wav",
					"vj_piv/nmr_zomb_female/femzom_attack02.wav",
					"vj_piv/nmr_zomb_female/femzom_attack03.wav",
					"vj_piv/nmr_zomb_female/femzom_attack04.wav",
					"vj_piv/nmr_zomb_female/femzom_attack05.wav",
					"vj_piv/nmr_zomb_female/femzom_attack06.wav",
					"vj_piv/nmr_zomb_female/femzom_attack07.wav"

				}
				self.SoundTbl_BeforeLeapAttack = {
					"vj_piv/nmr_zomb_female/femzom_attack01.wav",
					"vj_piv/nmr_zomb_female/femzom_attack02.wav",
					"vj_piv/nmr_zomb_female/femzom_attack03.wav",
					"vj_piv/nmr_zomb_female/femzom_attack04.wav",
					"vj_piv/nmr_zomb_female/femzom_attack05.wav",
					"vj_piv/nmr_zomb_female/femzom_attack06.wav",
					"vj_piv/nmr_zomb_female/femzom_attack07.wav"
				}
				self.SoundTbl_Pain = {
					"vj_piv/nmr_zomb_female/femzom_pain01.wav",
					"vj_piv/nmr_zomb_female/femzom_pain02.wav",
					"vj_piv/nmr_zomb_female/femzom_pain03.wav",
					"vj_piv/nmr_zomb_female/femzom_pain04.wav",
					"vj_piv/nmr_zomb_female/femzom_pain05.wav",
					"vj_piv/nmr_zomb_female/femzom_pain06.wav",
					"vj_piv/nmr_zomb_female/femzom_pain07.wav"
				}
				self.SoundTbl_Death = {
					"vj_piv/nmr_zomb_female/femzom_pain01.wav",
					"vj_piv/nmr_zomb_female/femzom_pain02.wav",
					"vj_piv/nmr_zomb_female/femzom_pain03.wav",
					"vj_piv/nmr_zomb_female/femzom_pain04.wav",
					"vj_piv/nmr_zomb_female/femzom_pain05.wav",
					"vj_piv/nmr_zomb_female/femzom_pain06.wav",
					"vj_piv/nmr_zomb_female/femzom_pain07.wav"
				}
			elseif self.Voice == 2 then
				self.SoundTbl_Idle = {
					"vj_piv/dl_bite_female/walker_female00_idle_calm_00_0.wav",
					"vj_piv/dl_bite_female/walker_female00_idle_calm_01_0.wav",
					"vj_piv/dl_bite_female/walker_female00_idle_calm_02_0.wav",
					"vj_piv/dl_bite_female/walker_female00_enemy_spotted_00_0.wav",
					"vj_piv/dl_bite_female/walker_female00_enemy_spotted_01_0.wav",
					"vj_piv/dl_bite_female/walker_female00_enemy_spotted_02_0.wav",
					"vj_piv/dl_bite_female/walker_female00_enemy_spotted_03_0.wav",
					"vj_piv/dl_bite_female/walker_female00_enemy_spotted_04_0.wav"
					
				}
				if self.PIV_Jogger == true then
					self.SoundTbl_Alert = {
						"vj_piv/dl_bite_male/walker_male_call_nw_00_0.wav",
						"vj_piv/dl_bite_male/walker_male_call_nw_01_0.wav",
						"vj_piv/dl_bite_male/walker_male_call_nw_02_0.wav"
					}
					self.AlertSoundPitch = VJ.SET(115, 115)
				else
					self.SoundTbl_Alert = {
						"vj_piv/dl_bite_female/walker_female00_berserker_00_0.wav",
						"vj_piv/dl_bite_female/walker_female00_berserker_01_0.wav",
						"vj_piv/dl_bite_female/walker_female00_berserker_02_0.wav",
						"vj_piv/dl_bite_female/walker_female00_berserker_03_0.wav",
						"vj_piv/dl_bite_female/walker_female00_move_alarmed_00_0.wav",
						"vj_piv/dl_bite_female/walker_female00_move_alarmed_01_0.wav",
						"vj_piv/dl_bite_female/walker_female00_move_alarmed_02_0.wav",
						"vj_piv/dl_bite_female/walker_female00_falling_00_0.wav",
						"vj_piv/dl_bite_female/walker_female00_falling_01_0.wav",
						"vj_piv/dl_bite_female/walker_female00_falling_02_0.wav"
					}
				end
				self.SoundTbl_CombatIdle = {
					"vj_piv/dl_bite_female/walker_female00_berserker_00_0.wav",
					"vj_piv/dl_bite_female/walker_female00_berserker_01_0.wav",
					"vj_piv/dl_bite_female/walker_female00_berserker_02_0.wav",
					"vj_piv/dl_bite_female/walker_female00_berserker_03_0.wav",
					"vj_piv/dl_bite_female/walker_female00_move_alarmed_00_0.wav",
					"vj_piv/dl_bite_female/walker_female00_move_alarmed_01_0.wav",
					"vj_piv/dl_bite_female/walker_female00_move_alarmed_02_0.wav",
					"vj_piv/dl_bite_female/walker_female00_falling_00_0.wav",
					"vj_piv/dl_bite_female/walker_female00_falling_01_0.wav",
					"vj_piv/dl_bite_female/walker_female00_falling_02_0.wav"
				}
				self.SoundTbl_BeforeMeleeAttack = {
					"vj_piv/dl_bite_female/walker_female00_attack_00_0.wav",
					"vj_piv/dl_bite_female/walker_female00_attack_01_0.wav",
					"vj_piv/dl_bite_female/walker_female00_attack_02_0.wav",
					"vj_piv/dl_bite_female/walker_female00_attack_03_0.wav",
					"vj_piv/dl_bite_female/walker_female00_attack_04_0.wav",
					"vj_piv/dl_bite_female/walker_female00_attack_05_0.wav"
				}
				self.SoundTbl_BeforeLeapAttack = {
					"vj_piv/dl_bite_female/walker_female00_attack_00_0.wav",
					"vj_piv/dl_bite_female/walker_female00_attack_01_0.wav",
					"vj_piv/dl_bite_female/walker_female00_attack_02_0.wav",
					"vj_piv/dl_bite_female/walker_female00_attack_03_0.wav",
					"vj_piv/dl_bite_female/walker_female00_attack_04_0.wav",
					"vj_piv/dl_bite_female/walker_female00_attack_05_0.wav"
				}
				self.SoundTbl_Pain = {
					"vj_piv/dl_bite_female/walker_female00_neck_break_00_0.wav",
					"vj_piv/dl_bite_female/walker_female00_pain_00_0.wav",
					"vj_piv/dl_bite_female/walker_female00_pain_01_0.wav",
					"vj_piv/dl_bite_female/walker_female00_pain_02_0.wav",
					"vj_piv/dl_bite_female/walker_female00_pain_03_0.wav",
					"vj_piv/dl_bite_female/walker_female00_pain_04_0.wav",
					"vj_piv/dl_bite_female/walker_female00_pain_05_0.wav",
					"vj_piv/dl_bite_female/walker_female00_pain_critical_00_0.wav",
					"vj_piv/dl_bite_female/walker_female00_pain_critical_01_0.wav",
					"vj_piv/dl_bite_female/walker_female00_pain_critical_02_0.wav"
				}
				self.SoundTbl_Death = {
					"vj_piv/dl_bite_female/walker_female00_neck_break_00_0.wav",
					"vj_piv/dl_bite_female/walker_female00_pain_burn_00_0.wav",
					"vj_piv/dl_bite_female/walker_female00_pain_burn_01_0.wav",
					"vj_piv/dl_bite_female/walker_female00_death_00_0.wav",
					"vj_piv/dl_bite_female/walker_female00_death_01_0.wav",
					"vj_piv/dl_bite_female/walker_female00_death_02_0.wav",
					"vj_piv/dl_bite_female/walker_female00_death_03_0.wav",
					"vj_piv/dl_bite_female/walker_female00_death_car_00_0.wav",
					"vj_piv/dl_bite_female/walker_female00_death_car_01_0.wav",
					"vj_piv/dl_bite_female/walker_female00_death_car_02_0.wav",
					"vj_piv/dl_bite_female/walker_female00_death_car_03_0.wav",
				}
			elseif self.Voice == 3 then
				self.SoundTbl_Idle = {
					"vj_piv/l4d_common/idle/breathing/breathing01.wav",
					"vj_piv/l4d_common/idle/breathing/breathing08.wav",
					"vj_piv/l4d_common/idle/breathing/breathing09.wav",
					"vj_piv/l4d_common/idle/breathing/breathing10.wav",
					"vj_piv/l4d_common/idle/breathing/breathing13.wav",
					"vj_piv/l4d_common/idle/breathing/breathing16.wav",
					"vj_piv/l4d_common/idle/breathing/breathing18.wav",
					"vj_piv/l4d_common/idle/breathing/breathing25.wav",
					"vj_piv/l4d_common/idle/breathing/breathing26.wav",
					"vj_piv/l4d_common/idle/breathing/idle_breath_01.wav",
					"vj_piv/l4d_common/idle/breathing/idle_breath_02.wav",
					"vj_piv/l4d_common/idle/breathing/idle_breath_03.wav",
					"vj_piv/l4d_common/idle/breathing/idle_breath_04.wav",
					"vj_piv/l4d_common/idle/breathing/idle_breath_06.wav",
					"vj_piv/l4d_common/idle/moaning/moan01.wav",
					"vj_piv/l4d_common/idle/moaning/moan02.wav",
					"vj_piv/l4d_common/idle/moaning/moan03.wav",
					"vj_piv/l4d_common/idle/moaning/moan04.wav",
					"vj_piv/l4d_common/idle/moaning/moan05.wav",
					"vj_piv/l4d_common/idle/moaning/moan06.wav",
					"vj_piv/l4d_common/idle/moaning/moan07.wav",
					"vj_piv/l4d_common/idle/moaning/moan08.wav",
					"vj_piv/l4d_common/idle/moaning/moan09.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling01.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling02.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling03.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling03.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling05.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling06.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling07.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling08.wav"
				}
				self.SoundTbl_Alert = {
					"vj_piv/l4d_common/alert/becomealert/become_alert01.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert04.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert09.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert11.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert12.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert14.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert17.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert18.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert21.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert23.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert25.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert26.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert29.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert38.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert41.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert54.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert55.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert56.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert57.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert58.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert58.wav",
					"vj_piv/l4d_common/alert/becomealert/howl01.wav",
					"vj_piv/l4d_common/alert/becomealert/female/become_alert60.wav",
					"vj_piv/l4d_common/alert/becomealert/female/become_alert61.wav",
					"vj_piv/l4d_common/alert/becomealert/female/become_alert62.wav",
					"vj_piv/l4d_common/alert/becomealert/female/become_alert63.wav"
				}
				self.SoundTbl_CombatIdle = {
					"vj_piv/l4d_common/alert/alert/alert13.wav",
					"vj_piv/l4d_common/alert/alert/alert16.wav",
					"vj_piv/l4d_common/alert/alert/alert22.wav",
					"vj_piv/l4d_common/alert/alert/alert23.wav",
					"vj_piv/l4d_common/alert/alert/alert25.wav",
					"vj_piv/l4d_common/alert/alert/alert26.wav",
					"vj_piv/l4d_common/alert/alert/alert27.wav",
					"vj_piv/l4d_common/alert/alert/alert36.wav",
					"vj_piv/l4d_common/alert/alert/alert38.wav",
					"vj_piv/l4d_common/alert/alert/alert39.wav",
					"vj_piv/l4d_common/alert/alert/alert40.wav",
					"vj_piv/l4d_common/alert/alert/alert41.wav",
					"vj_piv/l4d_common/alert/alert/alert42.wav",
					"vj_piv/l4d_common/alert/alert/alert43.wav",
					"vj_piv/l4d_common/alert/alert/alert44.wav",
					"vj_piv/l4d_common/alert/alert/female/alert50.wav",
					"vj_piv/l4d_common/alert/alert/female/alert51.wav",
					"vj_piv/l4d_common/alert/alert/female/alert52.wav",
					"vj_piv/l4d_common/alert/alert/female/alert53.wav",
					"vj_piv/l4d_common/alert/alert/female/alert53.wav",
					"vj_piv/l4d_common/alert/alert/female/alert53.wav",
					"vj_piv/l4d_common/alert/becomealert/hiss01.wav",
					"vj_piv/l4d_common/alert/becomealert/recognize01.wav",
					"vj_piv/l4d_common/alert/becomealert/recognize02.wav",
					"vj_piv/l4d_common/alert/becomealert/recognize03.wav",
					"vj_piv/l4d_common/alert/becomealert/recognize04.wav",
					"vj_piv/l4d_common/alert/becomealert/recognize05.wav",
					"vj_piv/l4d_common/alert/becomealert/recognize06.wav",
					"vj_piv/l4d_common/alert/becomealert/recognize07.wav",
					"vj_piv/l4d_common/alert/becomealert/recognize08.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_long_1.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_long_2.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_long_2.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_01.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_02.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_03.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_04.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_05.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_06.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_07.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_08.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_09.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_10.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_11.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_12.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_13.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_14.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_15.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_16.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_17.wav"
				}
				self.SoundTbl_BeforeMeleeAttack = {
					"vj_piv/l4d_common/action/rage/female/rage_50.wav",
					"vj_piv/l4d_common/action/rage/female/rage_51.wav",
					"vj_piv/l4d_common/action/rage/female/rage_52.wav",
					"vj_piv/l4d_common/action/rage/female/rage_53.wav",
					"vj_piv/l4d_common/action/rage/female/rage_54.wav",
					"vj_piv/l4d_common/action/rage/female/rage_55.wav",
					"vj_piv/l4d_common/action/rage/female/rage_56.wav",
					"vj_piv/l4d_common/action/rage/female/rage_57.wav",
					"vj_piv/l4d_common/action/rage/female/rage_58.wav",
					"vj_piv/l4d_common/action/rage/female/rage_59.wav",
					"vj_piv/l4d_common/action/rage/female/rage_60.wav",
					"vj_piv/l4d_common/action/rage/female/rage_61.wav",
					"vj_piv/l4d_common/action/rage/female/rage_62.wav",
					"vj_piv/l4d_common/action/rage/female/rage_64.wav",
					"vj_piv/l4d_common/action/rage/female/rage_65.wav",
					"vj_piv/l4d_common/action/rage/female/rage_66.wav",
					"vj_piv/l4d_common/action/rage/female/rage_67.wav",
					"vj_piv/l4d_common/action/rage/female/rage_68.wav",
					"vj_piv/l4d_common/action/rage/female/rage_69.wav",
					"vj_piv/l4d_common/action/rage/female/rage_70.wav",
					"vj_piv/l4d_common/action/rage/female/rage_71.wav",
					"vj_piv/l4d_common/action/rage/female/rage_72.wav",
					"vj_piv/l4d_common/action/rage/female/rage_73.wav",
					"vj_piv/l4d_common/action/rage/female/rage_74.wav",
					"vj_piv/l4d_common/action/rage/female/rage_75.wav",
					"vj_piv/l4d_common/action/rage/female/rage_76.wav",
					"vj_piv/l4d_common/action/rage/female/rage_77.wav",
					"vj_piv/l4d_common/action/rage/female/rage_78.wav",
					"vj_piv/l4d_common/action/rage/female/rage_79.wav",
					"vj_piv/l4d_common/action/rage/female/rage_80.wav",
					"vj_piv/l4d_common/action/rage/female/rage_81.wav",
					"vj_piv/l4d_common/action/rage/female/rage_82.wav"
				}
				self.SoundTbl_BeforeLeapAttack = {
					"vj_piv/l4d_common/action/rage/female/rage_50.wav",
					"vj_piv/l4d_common/action/rage/female/rage_51.wav",
					"vj_piv/l4d_common/action/rage/female/rage_52.wav",
					"vj_piv/l4d_common/action/rage/female/rage_53.wav",
					"vj_piv/l4d_common/action/rage/female/rage_54.wav",
					"vj_piv/l4d_common/action/rage/female/rage_55.wav",
					"vj_piv/l4d_common/action/rage/female/rage_56.wav",
					"vj_piv/l4d_common/action/rage/female/rage_57.wav",
					"vj_piv/l4d_common/action/rage/female/rage_58.wav",
					"vj_piv/l4d_common/action/rage/female/rage_59.wav",
					"vj_piv/l4d_common/action/rage/female/rage_60.wav",
					"vj_piv/l4d_common/action/rage/female/rage_61.wav",
					"vj_piv/l4d_common/action/rage/female/rage_62.wav",
					"vj_piv/l4d_common/action/rage/female/rage_64.wav",
					"vj_piv/l4d_common/action/rage/female/rage_65.wav",
					"vj_piv/l4d_common/action/rage/female/rage_66.wav",
					"vj_piv/l4d_common/action/rage/female/rage_67.wav",
					"vj_piv/l4d_common/action/rage/female/rage_68.wav",
					"vj_piv/l4d_common/action/rage/female/rage_69.wav",
					"vj_piv/l4d_common/action/rage/female/rage_70.wav",
					"vj_piv/l4d_common/action/rage/female/rage_71.wav",
					"vj_piv/l4d_common/action/rage/female/rage_72.wav",
					"vj_piv/l4d_common/action/rage/female/rage_73.wav",
					"vj_piv/l4d_common/action/rage/female/rage_74.wav",
					"vj_piv/l4d_common/action/rage/female/rage_75.wav",
					"vj_piv/l4d_common/action/rage/female/rage_76.wav",
					"vj_piv/l4d_common/action/rage/female/rage_77.wav",
					"vj_piv/l4d_common/action/rage/female/rage_78.wav",
					"vj_piv/l4d_common/action/rage/female/rage_79.wav",
					"vj_piv/l4d_common/action/rage/female/rage_80.wav",
					"vj_piv/l4d_common/action/rage/female/rage_81.wav",
					"vj_piv/l4d_common/action/rage/female/rage_82.wav"
				}
				self.SoundTbl_Pain = {
					"vj_piv/l4d_common/action/been_shot/been_shot_01.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_02.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_04.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_05.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_06.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_08.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_09.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_12.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_13.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_14.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_18.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_19.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_20.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_21.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_22.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_24.wav",
					"vj_piv/l4d_common/action/been_shot/female/been_shot_30.wav",
					"vj_piv/l4d_common/action/been_shot/female/been_shot_31.wav",
					"vj_piv/l4d_common/action/been_shot/female/been_shot_32.wav",
					"vj_piv/l4d_common/action/been_shot/female/been_shot_32.wav",
					"vj_piv/l4d_common/action/been_shot/female/been_shot_34.wav",
					"vj_piv/l4d_common/action/been_shot/female/been_shot_35.wav",
					"vj_piv/l4d_common/action/been_shot/female/been_shot_36.wav",
					"vj_piv/l4d_common/action/been_shot/female/been_shot_37.wav",
					"vj_piv/l4d_common/action/rage/shoved_1.wav",
					"vj_piv/l4d_common/action/rage/shoved_2.wav",
					"vj_piv/l4d_common/action/rage/shoved_3.wav",
					"vj_piv/l4d_common/action/rage/shoved_4.wav",
					"vj_piv/l4d_common/action/die/mp/odd_2.wav",
					"vj_piv/l4d_common/action/die/mp/odd_3.wav",
					"vj_piv/l4d_common/action/die/mp/odd_3.wav",
					"vj_piv/l4d_common/action/die/mp/odd_5.wav",
				}
				self.SoundTbl_Death = {
					"vj_piv/l4d_common/action/die/death_14.wav",
					"vj_piv/l4d_common/action/die/death_17.wav",
					"vj_piv/l4d_common/action/die/death_17.wav",
					"vj_piv/l4d_common/action/die/death_19.wav",
					"vj_piv/l4d_common/action/die/death_22.wav",
					"vj_piv/l4d_common/action/die/death_23.wav",
					"vj_piv/l4d_common/action/die/death_24.wav",
					"vj_piv/l4d_common/action/die/death_25.wav",
					"vj_piv/l4d_common/action/die/death_26.wav",
					"vj_piv/l4d_common/action/die/death_27.wav",
					"vj_piv/l4d_common/action/die/death_28.wav",
					"vj_piv/l4d_common/action/die/death_29.wav",
					"vj_piv/l4d_common/action/die/death_30.wav",
					"vj_piv/l4d_common/action/die/death_32.wav",
					"vj_piv/l4d_common/action/die/death_33.wav",
					"vj_piv/l4d_common/action/die/death_34.wav",
					"vj_piv/l4d_common/action/die/death_35.wav",
					"vj_piv/l4d_common/action/die/death_35.wav",
					"vj_piv/l4d_common/action/die/death_37.wav",
					"vj_piv/l4d_common/action/die/death_38.wav",
					"vj_piv/l4d_common/action/die/female/death_40.wav",
					"vj_piv/l4d_common/action/die/female/death_41.wav",
					"vj_piv/l4d_common/action/die/female/death_42.wav",
					"vj_piv/l4d_common/action/die/female/death_43.wav",
					"vj_piv/l4d_common/action/die/female/death_44.wav",
					"vj_piv/l4d_common/action/die/female/death_45.wav",
					"vj_piv/l4d_common/action/die/female/death_46.wav",
					"vj_piv/l4d_common/action/die/female/death_47.wav",
					"vj_piv/l4d_common/action/die/female/death_48.wav",
					"vj_piv/l4d_common/action/die/female/death_49.wav",
					"vj_piv/l4d_common/action/die/mp/squeal_1.wav",
					"vj_piv/l4d_common/action/die/mp/squeal_2.wav",
					"vj_piv/l4d_common/action/die/mp/squeal_3.wav",
					"vj_piv/l4d_common/action/ignite/female/ignite10.wav",
					"vj_piv/l4d_common/action/ignite/female/ignite11.wav",
					"vj_piv/l4d_common/action/ignite/female/ignite12.wav",
					"vj_piv/l4d_common/action/ignite/female/ignite13.wav",
					"vj_piv/l4d_common/action/ignite/female/ignite14.wav"
				}
			elseif self.Voice == 4 then
				self.IdleSoundPitch = VJ.SET(120, 120)
				self.CombatIdleSoundPitch = VJ.SET(120, 120)
				self.AlertSoundPitch = VJ.SET(120, 120)
				self.CallForHelpSoundPitch = VJ.SET(120, 120)
				self.BeforeMeleeAttackSoundPitch = VJ.SET(120, 120)
				self.BeforeLeapAttackSoundPitch = VJ.SET(120, 120)
				self.PainSoundPitch = VJ.SET(120, 120)
				self.DeathSoundPitch = VJ.SET(120, 120)
				local ContagionVoice = math.random(1,4)
				if ContagionVoice == 1 then
					self.SoundTbl_Idle = {"vj_piv/contagion/z_sham/shared/0245.wav","vj_piv/contagion/z_sham/shared/0244.wav","vj_piv/contagion/z_sham/idle/0128.wav","vj_piv/contagion/z_sham/idle/0123.wav","vj_piv/contagion/z_sham/idle/0122.wav","vj_piv/contagion/z_sham/idle/0121.wav","vj_piv/contagion/z_sham/idle/0120.wav","vj_piv/contagion/z_sham/idle/0119.wav","vj_piv/contagion/z_sham/idle/0118.wav","vj_piv/contagion/z_sham/idle/0117.wav","vj_piv/contagion/z_sham/idle/0116.wav","vj_piv/contagion/z_sham/idle/0115.wav","vj_piv/contagion/z_sham/idle/0114.wav","vj_piv/contagion/z_sham/idle/0113.wav","vj_piv/contagion/z_sham/idle/0112.wav","vj_piv/contagion/z_sham/idle/0111.wav","vj_piv/contagion/z_sham/idle/0110.wav","vj_piv/contagion/z_sham/idle/0109.wav","vj_piv/contagion/z_sham/idle/0108.wav","vj_piv/contagion/z_sham/idle/0107.wav","vj_piv/contagion/z_sham/idle/0106.wav","vj_piv/contagion/z_sham/idle/0105.wav","vj_piv/contagion/z_sham/idle/0104.wav","vj_piv/contagion/z_sham/idle/0103.wav","vj_piv/contagion/z_sham/idle/0102.wav","vj_piv/contagion/z_sham/idle/0101.wav","vj_piv/contagion/z_sham/idle/0100.wav","vj_piv/contagion/z_sham/idle/0099.wav","vj_piv/contagion/z_sham/idle/0098.wav","vj_piv/contagion/z_sham/idle/0097.wav","vj_piv/contagion/z_sham/idle/0096.wav","vj_piv/contagion/z_sham/idle/0095.wav","vj_piv/contagion/z_sham/idle/0094.wav","vj_piv/contagion/z_sham/idle/0093.wav","vj_piv/contagion/z_sham/idle/0092.wav","vj_piv/contagion/z_sham/idle/0091.wav","vj_piv/contagion/z_sham/idle/0090.wav","vj_piv/contagion/z_sham/idle/0089.wav","vj_piv/contagion/z_sham/idle/0088.wav","vj_piv/contagion/z_sham/idle/0087.wav","vj_piv/contagion/z_sham/idle/0086.wav","vj_piv/contagion/z_sham/idle/0085.wav","vj_piv/contagion/z_sham/idle/0084.wav","vj_piv/contagion/z_sham/idle/0083.wav","vj_piv/contagion/z_sham/idle/0082.wav","vj_piv/contagion/z_sham/idle/0081.wav","vj_piv/contagion/z_sham/idle/0080.wav","vj_piv/contagion/z_sham/idle/0079.wav","vj_piv/contagion/z_sham/idle/0077.wav","vj_piv/contagion/z_sham/idle/0076.wav"}
					self.SoundTbl_Alert = {"vj_piv/contagion/z_sham/alert/0170.wav","vj_piv/contagion/z_sham/alert/0169.wav","vj_piv/contagion/z_sham/alert/0168.wav","vj_piv/contagion/z_sham/alert/0167.wav","vj_piv/contagion/z_sham/alert/0166.wav","vj_piv/contagion/z_sham/alert/0165.wav","vj_piv/contagion/z_sham/alert/0164.wav","vj_piv/contagion/z_sham/alert/0163.wav","vj_piv/contagion/z_sham/alert/0162.wav","vj_piv/contagion/z_sham/alert/0161.wav","vj_piv/contagion/z_sham/alert/0152.wav","vj_piv/contagion/z_sham/alert/0061.wav","vj_piv/contagion/z_sham/alert/0060.wav","vj_piv/contagion/z_sham/alert/0058.wav","vj_piv/contagion/z_sham/alert/0056.wav","vj_piv/contagion/z_sham/alert/0030.wav","vj_piv/contagion/z_sham/alert/0029.wav","vj_piv/contagion/z_sham/alert/0028.wav","vj_piv/contagion/z_sham/alert/0027.wav","vj_piv/contagion/z_sham/alert/0026.wav","vj_piv/contagion/z_sham/alert/0025.wav","vj_piv/contagion/z_sham/alert/0023.wav","vj_piv/contagion/z_sham/alert/0022.wav","vj_piv/contagion/z_sham/alert/0021.wav","vj_piv/contagion/z_arne/alert/0207.wav"}
					self.SoundTbl_CallForHelp = {"vj_piv/contagion/z_sham/roar/0075.wav","vj_piv/contagion/z_sham/roar/0074.wav","vj_piv/contagion/z_sham/roar/0073.wav","vj_piv/contagion/z_sham/roar/0072.wav","vj_piv/contagion/z_sham/roar/0071.wav","vj_piv/contagion/z_sham/roar/0070.wav"}
					self.SoundTbl_CombatIdle = {"vj_piv/contagion/z_sham/spot_player/0178.wav","vj_piv/contagion/z_sham/spot_player/0173.wav","vj_piv/contagion/z_sham/spot_player/0159.wav","vj_piv/contagion/z_sham/spot_player/0158.wav","vj_piv/contagion/z_sham/spot_player/0157.wav","vj_piv/contagion/z_sham/spot_player/0156.wav","vj_piv/contagion/z_sham/spot_player/0155.wav","vj_piv/contagion/z_sham/spot_player/0153.wav","vj_piv/contagion/z_sham/spot_player/0145.wav","vj_piv/contagion/z_sham/spot_player/0134.wav","vj_piv/contagion/z_sham/spot_player/0059.wav","vj_piv/contagion/z_sham/spot_player/0055.wav","vj_piv/contagion/z_sham/spot_player/0054.wav","vj_piv/contagion/z_sham/spot_player/0018.wav","vj_piv/contagion/z_sham/spot_player/0017.wav","vj_piv/contagion/z_sham/spot_player/0016.wav","vj_piv/contagion/z_sham/spot_player/0015.wav","vj_piv/contagion/z_sham/spot_player/0014.wav","","vj_piv/contagion/z_sham/spot_player/0013.wav","vj_piv/contagion/z_sham/spot_player/0003.wav","vj_piv/contagion/z_sham/spot_player/0002.wav","vj_piv/contagion/z_sham/spot_player/0001.wav"}
					self.SoundTbl_BeforeMeleeAttack = {"vj_piv/contagion/z_sham/attacking/0053.wav","vj_piv/contagion/z_sham/attacking/0052.wav","vj_piv/contagion/z_sham/attacking/0051.wav","vj_piv/contagion/z_sham/attacking/0050.wav","vj_piv/contagion/z_sham/attacking/0049.wav","vj_piv/contagion/z_sham/attacking/0048.wav","vj_piv/contagion/z_sham/attacking/0047.wav","vj_piv/contagion/z_sham/attacking/0045.wav","vj_piv/contagion/z_sham/attacking/0044.wav","vj_piv/contagion/z_sham/attacking/0043.wav","vj_piv/contagion/z_sham/attacking/0042.wav","vj_piv/contagion/z_sham/attacking/0041.wav","vj_piv/contagion/z_sham/attacking/0040.wav","vj_piv/contagion/z_sham/attacking/0039.wav","vj_piv/contagion/z_sham/attacking/0038.wav","vj_piv/contagion/z_sham/attacking/0037.wav","vj_piv/contagion/z_sham/attacking/0036.wav","vj_piv/contagion/z_sham/attacking/0034.wav","vj_piv/contagion/z_sham/attacking/0033.wav"}
					self.SoundTbl_BeforeLeapAttack = {"vj_piv/contagion/z_sham/attacking/0053.wav","vj_piv/contagion/z_sham/attacking/0052.wav","vj_piv/contagion/z_sham/attacking/0051.wav","vj_piv/contagion/z_sham/attacking/0050.wav","vj_piv/contagion/z_sham/attacking/0049.wav","vj_piv/contagion/z_sham/attacking/0048.wav","vj_piv/contagion/z_sham/attacking/0047.wav","vj_piv/contagion/z_sham/attacking/0045.wav","vj_piv/contagion/z_sham/attacking/0044.wav","vj_piv/contagion/z_sham/attacking/0043.wav","vj_piv/contagion/z_sham/attacking/0042.wav","vj_piv/contagion/z_sham/attacking/0041.wav","vj_piv/contagion/z_sham/attacking/0040.wav","vj_piv/contagion/z_sham/attacking/0039.wav","vj_piv/contagion/z_sham/attacking/0038.wav","vj_piv/contagion/z_sham/attacking/0037.wav","vj_piv/contagion/z_sham/attacking/0036.wav","vj_piv/contagion/z_sham/attacking/0034.wav","vj_piv/contagion/z_sham/attacking/0033.wav"}
					self.SoundTbl_Pain = {"vj_piv/contagion/z_sham/shared/0187.wav","vj_piv/contagion/z_sham/shared/0186.wav","vj_piv/contagion/z_sham/shared/0185.wav","vj_piv/contagion/z_sham/shared/0184.wav","vj_piv/contagion/z_sham/shared/0183.wav","vj_piv/contagion/z_sham/shared/0182.wav","vj_piv/contagion/z_sham/shared/0181.wav","vj_piv/contagion/z_sham/shared/0180.wav","vj_piv/contagion/z_sham/shared/0179.wav","vj_piv/contagion/z_sham/shared/0177.wav","vj_piv/contagion/z_sham/shared/0176.wav","vj_piv/contagion/z_sham/shared/0175.wav","vj_piv/contagion/z_sham/shared/0174.wav","vj_piv/contagion/z_sham/shared/0174.wav"}
					self.SoundTbl_Death = {"vj_piv/contagion/z_sham/death/0032.wav"}
				elseif ContagionVoice == 2 then
					self.SoundTbl_Idle = {"vj_piv/contagion/z_arne/idle/0219.wav","vj_piv/contagion/z_arne/idle/0220.wav","vj_piv/contagion/z_arne/idle/0221.wav","vj_piv/contagion/z_arne/idle/0243.wav","vj_piv/contagion/z_arne/idle/0246.wav","vj_piv/contagion/z_arne/idle/0247.wav","vj_piv/contagion/z_arne/idle/0248.wav","vj_piv/contagion/z_arne/idle/0249.wav","vj_piv/contagion/z_arne/idle/0250.wav","vj_piv/contagion/z_arne/idle/0251.wav","vj_piv/contagion/z_arne/idle/0252.wav","vj_piv/contagion/z_arne/idle/0253.wav","vj_piv/contagion/z_arne/idle/0254.wav","vj_piv/contagion/z_arne/idle/0255.wav"}
					self.SoundTbl_Alert = {"vj_piv/contagion/z_arne/alert/0208.wav","vj_piv/contagion/z_arne/alert/0209.wav","vj_piv/contagion/z_arne/alert/0210.wav","vj_piv/contagion/z_arne/alert/0211.wav","vj_piv/contagion/z_arne/alert/0212.wav","vj_piv/contagion/z_arne/alert/0213.wav","vj_piv/contagion/z_arne/alert/0214.wav","vj_piv/contagion/z_arne/alert/0215.wav","vj_piv/contagion/z_arne/alert/0216.wav","vj_piv/contagion/z_arne/alert/0217.wav","vj_piv/contagion/z_arne/alert/0218.wav"}
					self.SoundTbl_CallForHelp = {"vj_piv/contagion/z_arne/alert/0208.wav","vj_piv/contagion/z_arne/alert/0209.wav","vj_piv/contagion/z_arne/alert/0210.wav","vj_piv/contagion/z_arne/alert/0211.wav","vj_piv/contagion/z_arne/alert/0212.wav","vj_piv/contagion/z_arne/alert/0213.wav","vj_piv/contagion/z_arne/alert/0214.wav","vj_piv/contagion/z_arne/alert/0215.wav","vj_piv/contagion/z_arne/alert/0216.wav","vj_piv/contagion/z_arne/alert/0217.wav","vj_piv/contagion/z_arne/alert/0218.wav"}
					self.SoundTbl_BeforeMeleeAttack = {"vj_piv/contagion/z_arne/attack/0226.wav","vj_piv/contagion/z_arne/attack/0227.wav","vj_piv/contagion/z_arne/attack/0229.wav","vj_piv/contagion/z_arne/attack/0231.wav","vj_piv/contagion/z_arne/attack/0233.wav","vj_piv/contagion/z_arne/attack/0234.wav","vj_piv/contagion/z_arne/attack/0235.wav","vj_piv/contagion/z_arne/attack/0236.wav","vj_piv/contagion/z_arne/attack/0238.wav","vj_piv/contagion/z_arne/attack/0239.wav","vj_piv/contagion/z_arne/attack/0240.wav","vj_piv/contagion/z_arne/attack/0241.wav","vj_piv/contagion/z_arne/attack/0256.wav"}
					self.SoundTbl_BeforeLeapAttack = {"vj_piv/contagion/z_arne/attack/0226.wav","vj_piv/contagion/z_arne/attack/0227.wav","vj_piv/contagion/z_arne/attack/0229.wav","vj_piv/contagion/z_arne/attack/0231.wav","vj_piv/contagion/z_arne/attack/0233.wav","vj_piv/contagion/z_arne/attack/0234.wav","vj_piv/contagion/z_arne/attack/0235.wav","vj_piv/contagion/z_arne/attack/0236.wav","vj_piv/contagion/z_arne/attack/0238.wav","vj_piv/contagion/z_arne/attack/0239.wav","vj_piv/contagion/z_arne/attack/0240.wav","vj_piv/contagion/z_arne/attack/0241.wav","vj_piv/contagion/z_arne/attack/0256.wav"}
					self.SoundTbl_Pain = {"vj_piv/contagion/z_sham/pain/0148.wav","vj_piv/contagion/z_sham/pain/0149.wav","vj_piv/contagion/z_sham/pain/0147.wav","vj_piv/contagion/z_sham/pain/0146.wav","vj_piv/contagion/z_sham/pain/0143.wav","vj_piv/contagion/z_sham/pain/0141.wav","vj_piv/contagion/z_sham/pain/0140.wav","vj_piv/contagion/z_sham/pain/0139.wav","vj_piv/contagion/z_sham/pain/0138.wav","vj_piv/contagion/z_sham/pain/0137.wav","vj_piv/contagion/z_sham/pain/0136.wav","vj_piv/contagion/z_sham/pain/0135.wav","vj_piv/contagion/z_sham/pain/0133.wav","vj_piv/contagion/z_sham/pain/0132.wav","vj_piv/contagion/z_sham/pain/0131.wav","vj_piv/contagion/z_sham/pain/0130.wav","vj_piv/contagion/z_sham/pain/0129.wav","vj_piv/contagion/z_sham/pain/0127.wav","vj_piv/contagion/z_sham/pain/0126.wav","vj_piv/contagion/z_sham/pain/0125.wav","vj_piv/contagion/z_sham/pain/0124.wav","vj_piv/contagion/z_sham/pain/0069.wav","vj_piv/contagion/z_sham/pain/0066.wav","vj_piv/contagion/z_sham/pain/0065.wav","vj_piv/contagion/z_sham/pain/0064.wav","vj_piv/contagion/z_sham/pain/0063.wav","vj_piv/contagion/z_sham/pain/0062.wav"}
					self.SoundTbl_Death = {"vj_piv/contagion/z_arne/die/0223.wav","vj_piv/contagion/z_arne/die/0224.wav","vj_piv/contagion/z_arne/die/0225.wav"}
				elseif ContagionVoice == 3 then
					self.SoundTbl_Idle = {"vj_piv/contagion/growler/zombie_voice_shared-1.wav","vj_piv/contagion/growler/zombie_voice_shared-10.wav","vj_piv/contagion/growler/zombie_voice_shared-12.wav","vj_piv/contagion/growler/zombie_voice_shared-13.wav","vj_piv/contagion/growler/zombie_voice_shared-14.wav","vj_piv/contagion/growler/zombie_voice_shared-2.wav","vj_piv/contagion/growler/zombie_voice_shared-3.wav","vj_piv/contagion/growler/zombie_voice_shared-4.wav","vj_piv/contagion/growler/zombie_voice_shared-5.wav","vj_piv/contagion/growler/zombie_voice_shared-6.wav","vj_piv/contagion/growler/zombie_voice_shared-7.wav","vj_piv/contagion/growler/zombie_voice_shared-8.wav","vj_piv/contagion/growler/zombie_voice_shared-9.wav"}
					self.SoundTbl_Alert = {"vj_piv/contagion/growler/zombie_voice_alert-1.wav","vj_piv/contagion/growler/zombie_voice_alert-2.wav","vj_piv/contagion/growler/zombie_voice_alert-3.wav","vj_piv/contagion/growler/zombie_voice_alert-4.wav"}
					self.SoundTbl_CallForHelp = {"vj_piv/contagion/growler/zombie_voice_alert-1.wav","vj_piv/contagion/growler/zombie_voice_alert-2.wav","vj_piv/contagion/growler/zombie_voice_alert-3.wav","vj_piv/contagion/growler/zombie_voice_alert-4.wav"}
					self.SoundTbl_BeforeMeleeAttack = {"vj_piv/contagion/growler/zombie_voice_shared-1.wav","vj_piv/contagion/growler/zombie_voice_shared-10.wav","vj_piv/contagion/growler/zombie_voice_shared-12.wav","vj_piv/contagion/growler/zombie_voice_shared-13.wav","vj_piv/contagion/growler/zombie_voice_shared-14.wav","vj_piv/contagion/growler/zombie_voice_shared-2.wav","vj_piv/contagion/growler/zombie_voice_shared-3.wav","vj_piv/contagion/growler/zombie_voice_shared-4.wav","vj_piv/contagion/growler/zombie_voice_shared-5.wav","vj_piv/contagion/growler/zombie_voice_shared-6.wav","vj_piv/contagion/growler/zombie_voice_shared-7.wav","vj_piv/contagion/growler/zombie_voice_shared-8.wav","vj_piv/contagion/growler/zombie_voice_shared-9.wav"}
					self.SoundTbl_BeforeLeapAttack = {"vj_piv/contagion/growler/zombie_voice_shared-1.wav","vj_piv/contagion/growler/zombie_voice_shared-10.wav","vj_piv/contagion/growler/zombie_voice_shared-12.wav","vj_piv/contagion/growler/zombie_voice_shared-13.wav","vj_piv/contagion/growler/zombie_voice_shared-14.wav","vj_piv/contagion/growler/zombie_voice_shared-2.wav","vj_piv/contagion/growler/zombie_voice_shared-3.wav","vj_piv/contagion/growler/zombie_voice_shared-4.wav","vj_piv/contagion/growler/zombie_voice_shared-5.wav","vj_piv/contagion/growler/zombie_voice_shared-6.wav","vj_piv/contagion/growler/zombie_voice_shared-7.wav","vj_piv/contagion/growler/zombie_voice_shared-8.wav","vj_piv/contagion/growler/zombie_voice_shared-9.wav"}
					self.SoundTbl_Pain = {"vj_piv/contagion/z_sham/pain/0148.wav","vj_piv/contagion/z_sham/pain/0149.wav","vj_piv/contagion/z_sham/pain/0147.wav","vj_piv/contagion/z_sham/pain/0146.wav","vj_piv/contagion/z_sham/pain/0143.wav","vj_piv/contagion/z_sham/pain/0141.wav","vj_piv/contagion/z_sham/pain/0140.wav","vj_piv/contagion/z_sham/pain/0139.wav","vj_piv/contagion/z_sham/pain/0138.wav","vj_piv/contagion/z_sham/pain/0137.wav","vj_piv/contagion/z_sham/pain/0136.wav","vj_piv/contagion/z_sham/pain/0135.wav","vj_piv/contagion/z_sham/pain/0133.wav","vj_piv/contagion/z_sham/pain/0132.wav","vj_piv/contagion/z_sham/pain/0131.wav","vj_piv/contagion/z_sham/pain/0130.wav","vj_piv/contagion/z_sham/pain/0129.wav","vj_piv/contagion/z_sham/pain/0127.wav","vj_piv/contagion/z_sham/pain/0126.wav","vj_piv/contagion/z_sham/pain/0125.wav","vj_piv/contagion/z_sham/pain/0124.wav","vj_piv/contagion/z_sham/pain/0069.wav","vj_piv/contagion/z_sham/pain/0066.wav","vj_piv/contagion/z_sham/pain/0065.wav","vj_piv/contagion/z_sham/pain/0064.wav","vj_piv/contagion/z_sham/pain/0063.wav","vj_piv/contagion/z_sham/pain/0062.wav"}
					self.SoundTbl_Death = {"vj_piv/contagion/z_arne/die/0223.wav","vj_piv/contagion/z_arne/die/0224.wav","vj_piv/contagion/z_arne/die/0225.wav"}
				elseif ContagionVoice == 4 then
					self.SoundTbl_Idle = {"vj_piv/contagion/screamer/idle-1.wav","vj_piv/contagion/screamer/idle-1.wav","vj_piv/contagion/screamer/idle-1.wav","vj_piv/contagion/screamer/idle-3.wav","vj_piv/contagion/screamer/idle-3.wav","vj_piv/contagion/screamer/idle-3.wav","vj_piv/contagion/screamer/idle-2.wav"}
					self.SoundTbl_Alert = {"vj_piv/contagion/screamer/alert-1.wav","vj_piv/contagion/screamer/alert-2.wav"}
					self.SoundTbl_CallForHelp = {"vj_piv/contagion/screamer/idle-2.wav"}
					self.SoundTbl_BeforeMeleeAttack = {"vj_piv/contagion/screamer/idle-1.wav","vj_piv/contagion/screamer/idle-1.wav","vj_piv/contagion/screamer/idle-1.wav","vj_piv/contagion/screamer/idle-3.wav","vj_piv/contagion/screamer/idle-3.wav","vj_piv/contagion/screamer/idle-3.wav","vj_piv/contagion/screamer/idle-2.wav"}
					self.SoundTbl_BeforeLeapAttack = {"vj_piv/contagion/screamer/alert-1.wav","vj_piv/contagion/screamer/alert-2.wav"}
					self.SoundTbl_Pain = {"vj_piv/contagion/z_sham/pain/0148.wav","vj_piv/contagion/z_sham/pain/0149.wav","vj_piv/contagion/z_sham/pain/0147.wav","vj_piv/contagion/z_sham/pain/0146.wav","vj_piv/contagion/z_sham/pain/0143.wav","vj_piv/contagion/z_sham/pain/0141.wav","vj_piv/contagion/z_sham/pain/0140.wav","vj_piv/contagion/z_sham/pain/0139.wav","vj_piv/contagion/z_sham/pain/0138.wav","vj_piv/contagion/z_sham/pain/0137.wav","vj_piv/contagion/z_sham/pain/0136.wav","vj_piv/contagion/z_sham/pain/0135.wav","vj_piv/contagion/z_sham/pain/0133.wav","vj_piv/contagion/z_sham/pain/0132.wav","vj_piv/contagion/z_sham/pain/0131.wav","vj_piv/contagion/z_sham/pain/0130.wav","vj_piv/contagion/z_sham/pain/0129.wav","vj_piv/contagion/z_sham/pain/0127.wav","vj_piv/contagion/z_sham/pain/0126.wav","vj_piv/contagion/z_sham/pain/0125.wav","vj_piv/contagion/z_sham/pain/0124.wav","vj_piv/contagion/z_sham/pain/0069.wav","vj_piv/contagion/z_sham/pain/0066.wav","vj_piv/contagion/z_sham/pain/0065.wav","vj_piv/contagion/z_sham/pain/0064.wav","vj_piv/contagion/z_sham/pain/0063.wav","vj_piv/contagion/z_sham/pain/0062.wav"}
					self.SoundTbl_Death = {"vj_piv/contagion/z_arne/die/0222.wav","vj_piv/contagion/z_arne/die/0223.wav","vj_piv/contagion/z_arne/die/0224.wav","vj_piv/contagion/z_arne/die/0225.wav"}
				end
			end
		end
	else
		if self.PIV_IsRunner then
			if self.Voice == 1 then
				self.SoundTbl_Idle = {
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
				self.SoundTbl_Alert = {
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
				self.SoundTbl_CombatIdle = {
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
				self.SoundTbl_BeforeMeleeAttack = {
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
				self.SoundTbl_BeforeLeapAttack = {
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
				self.SoundTbl_Pain = {
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
				self.SoundTbl_Death = {
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
			elseif self.Voice == 2 then
				self.SoundTbl_Idle = {
					"vj_piv/dl_inf_male/infected_male00_get_up_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_get_up_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_idle_calm_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_idle_calm_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_idle_upset_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_idle_upset_01_0.wav"
				}
				self.SoundTbl_Alert = {
					"vj_piv/dl_inf_male/infected_male00_enemy_spotted_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_enemy_spotted_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_taunt_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_taunt_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_buggy_grab_taunt_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_buggy_grab_taunt_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_enemy_spotted_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_enemy_spotted_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_taunt_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_taunt_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_buggy_grab_taunt_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_buggy_grab_taunt_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_humanity_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_humanity_02_0.wav"
				}
				self.SoundTbl_CombatIdle = {
					"vj_piv/dl_inf_male/infected_male00_dodge_long_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_dodge_long_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_dodge_short_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_dodge_short_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_move_alarmed_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_move_alarmed_01_0.wav"
				}
				self.SoundTbl_BeforeMeleeAttack = {
					"vj_piv/dl_inf_male/infected_male00_attack_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_attack_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_attack_02_0.wav",
					"vj_piv/dl_inf_male/infected_male00_attack_03_0.wav",
					"vj_piv/dl_inf_male/infected_male00_attack_04_0.wav",
					"vj_piv/dl_inf_male/infected_male00_buggy_grab_attack_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_buggy_grab_attack_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_buggy_grab_attack_02_0.wav"
				}
				self.SoundTbl_BeforeLeapAttack = {
					"vj_piv/dl_inf_male/infected_male00_buggy_grab_taunt_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_buggy_grab_taunt_01_0.wav",
				}
				self.SoundTbl_Pain = {
					"vj_piv/dl_inf_male/infected_male00_pain_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_pain_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_pain_critical_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_pain_electro_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_pain_light_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_pain_light_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_buggy_grab_drop_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_buggy_grab_drop_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_pain_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_pain_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_pain_critical_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_pain_electro_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_pain_light_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_pain_light_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_buggy_grab_drop_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_buggy_grab_drop_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_humanity_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_humanity_03_0.wav",
					"vj_piv/dl_inf_male/infected_male00_humanity_04_0.wav"
				}
				self.SoundTbl_Death = {
					"vj_piv/dl_inf_male/infected_male00_death_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_death_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_death_car_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_death_car_01_0.wav",
					"vj_piv/dl_inf_male/infected_male00_death_car_02_0.wav",
					"vj_piv/dl_inf_male/infected_male00_pain_burn_00_0.wav",
					"vj_piv/dl_inf_male/infected_male00_pain_burn_01_0.wav",
				}
			elseif self.Voice == 3 then
				self.SoundTbl_Idle = {
					"vj_piv/l4d_common/idle/breathing/breathing01.wav",
					"vj_piv/l4d_common/idle/breathing/breathing08.wav",
					"vj_piv/l4d_common/idle/breathing/breathing09.wav",
					"vj_piv/l4d_common/idle/breathing/breathing10.wav",
					"vj_piv/l4d_common/idle/breathing/breathing13.wav",
					"vj_piv/l4d_common/idle/breathing/breathing16.wav",
					"vj_piv/l4d_common/idle/breathing/breathing18.wav",
					"vj_piv/l4d_common/idle/breathing/breathing25.wav",
					"vj_piv/l4d_common/idle/breathing/breathing26.wav",
					"vj_piv/l4d_common/idle/breathing/idle_breath_01.wav",
					"vj_piv/l4d_common/idle/breathing/idle_breath_02.wav",
					"vj_piv/l4d_common/idle/breathing/idle_breath_03.wav",
					"vj_piv/l4d_common/idle/breathing/idle_breath_04.wav",
					"vj_piv/l4d_common/idle/breathing/idle_breath_06.wav",
					"vj_piv/l4d_common/idle/moaning/moan01.wav",
					"vj_piv/l4d_common/idle/moaning/moan02.wav",
					"vj_piv/l4d_common/idle/moaning/moan03.wav",
					"vj_piv/l4d_common/idle/moaning/moan04.wav",
					"vj_piv/l4d_common/idle/moaning/moan05.wav",
					"vj_piv/l4d_common/idle/moaning/moan06.wav",
					"vj_piv/l4d_common/idle/moaning/moan07.wav",
					"vj_piv/l4d_common/idle/moaning/moan08.wav",
					"vj_piv/l4d_common/idle/moaning/moan09.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling01.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling02.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling03.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling03.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling05.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling06.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling07.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling08.wav"
				}
				self.SoundTbl_Alert = {
					"vj_piv/l4d_common/alert/becomeenraged/alert24.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged01.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged02.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged03.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged06.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged07.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged09.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged10.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged11.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged30.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged50.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged51.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged52.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged53.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged54.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged55.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged55.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged57.wav",
					"vj_piv/l4d_common/alert/becomeenraged/become_enraged58.wav",
					"vj_piv/l4d_common/alert/becomeenraged/male/become_enraged40.wav",
					"vj_piv/l4d_common/alert/becomeenraged/male/become_enraged41.wav",
					"vj_piv/l4d_common/alert/becomeenraged/male/become_enraged42.wav",
					"vj_piv/l4d_common/alert/becomeenraged/male/become_enraged43.wav",
					"vj_piv/l4d_common/alert/becomealert/shout01.wav",
					"vj_piv/l4d_common/alert/becomealert/shout02.wav",
					"vj_piv/l4d_common/alert/becomealert/shout02.wav",
					"vj_piv/l4d_common/alert/becomealert/shout04.wav",
					"vj_piv/l4d_common/alert/becomealert/shout06.wav",
					"vj_piv/l4d_common/alert/becomealert/shout07.wav",
					"vj_piv/l4d_common/alert/becomealert/shout08.wav",
					"vj_piv/l4d_common/alert/becomealert/shout09.wav"
				}
				self.SoundTbl_CombatIdle = {
					"vj_piv/l4d_common/action/rageat/rage_at_victim01.wav",
					"vj_piv/l4d_common/action/rageat/rage_at_victim02.wav",
					"vj_piv/l4d_common/action/rageat/rage_at_victim02.wav",
					"vj_piv/l4d_common/action/rageat/rage_at_victim21.wav",
					"vj_piv/l4d_common/action/rageat/rage_at_victim22.wav",
					"vj_piv/l4d_common/action/rageat/rage_at_victim25.wav",
					"vj_piv/l4d_common/action/rageat/rage_at_victim26.wav",
					"vj_piv/l4d_common/action/rageat/rage_at_victim34.wav",
					"vj_piv/l4d_common/action/rageat/rage_at_victim35.wav",
					"vj_piv/l4d_common/action/rageat/snarl_4.wav",
					"vj_piv/l4d_common/action/rageat/male/rage_at_victim20.wav",
					"vj_piv/l4d_common/action/rageat/male/rage_at_victim21.wav",
					"vj_piv/l4d_common/action/rageat/male/rage_at_victim22.wav",
					"vj_piv/l4d_common/action/rageat/male/rage_at_victim23.wav",
					"vj_piv/l4d_common/action/rageat/male/rage_at_victim24.wav",
					"vj_piv/l4d_common/action/rageat/male/rage_at_victim25.wav",
					"vj_piv/l4d_common/action/rageat/male/rage_at_victim26.wav",
					"vj_piv/l4d_common/action/rageat/male/rage_at_victim27.wav",
					"vj_piv/l4d_common/action/rageat/male/rage_at_victim28.wav",
					"vj_piv/l4d_common/action/rageat/male/rage_at_victim29.wav",
					"vj_piv/l4d_common/action/rageat/male/rage_at_victim30.wav",
					"vj_piv/l4d_common/action/rageat/male/rage_at_victim31.wav",
					"vj_piv/l4d_common/action/rageat/male/rage_at_victim32.wav",
					"vj_piv/l4d_common/action/rageat/male/rage_at_victim33.wav",
					"vj_piv/l4d_common/action/rageat/male/rage_at_victim34.wav",
					"vj_piv/l4d_common/action/rageat/male/rage_at_victim35.wav",
					"vj_piv/l4d_common/action/rageat/male/rage_at_victim36.wav",
					"vj_piv/l4d_common/action/rageat/male/rage_at_victim37.wav",
					"vj_piv/l4d_common/alert/becomealert/shout01.wav",
					"vj_piv/l4d_common/alert/becomealert/shout02.wav",
					"vj_piv/l4d_common/alert/becomealert/shout02.wav",
					"vj_piv/l4d_common/alert/becomealert/shout04.wav",
					"vj_piv/l4d_common/alert/becomealert/shout06.wav",
					"vj_piv/l4d_common/alert/becomealert/shout07.wav",
					"vj_piv/l4d_common/alert/becomealert/shout08.wav",
					"vj_piv/l4d_common/alert/becomealert/shout09.wav"
				}
				self.SoundTbl_BeforeMeleeAttack = {
					"vj_piv/l4d_common/action/rage/male/rage_50.wav",
					"vj_piv/l4d_common/action/rage/male/rage_51.wav",
					"vj_piv/l4d_common/action/rage/male/rage_52.wav",
					"vj_piv/l4d_common/action/rage/male/rage_53.wav",
					"vj_piv/l4d_common/action/rage/male/rage_54.wav",
					"vj_piv/l4d_common/action/rage/male/rage_55.wav",
					"vj_piv/l4d_common/action/rage/male/rage_56.wav",
					"vj_piv/l4d_common/action/rage/male/rage_57.wav",
					"vj_piv/l4d_common/action/rage/male/rage_58.wav",
					"vj_piv/l4d_common/action/rage/male/rage_59.wav",
					"vj_piv/l4d_common/action/rage/male/rage_60.wav",
					"vj_piv/l4d_common/action/rage/male/rage_61.wav",
					"vj_piv/l4d_common/action/rage/male/rage_62.wav",
					"vj_piv/l4d_common/action/rage/male/rage_64.wav",
					"vj_piv/l4d_common/action/rage/male/rage_65.wav",
					"vj_piv/l4d_common/action/rage/male/rage_66.wav",
					"vj_piv/l4d_common/action/rage/male/rage_67.wav",
					"vj_piv/l4d_common/action/rage/male/rage_68.wav",
					"vj_piv/l4d_common/action/rage/male/rage_69.wav",
					"vj_piv/l4d_common/action/rage/male/rage_70.wav",
					"vj_piv/l4d_common/action/rage/male/rage_71.wav",
					"vj_piv/l4d_common/action/rage/male/rage_72.wav",
					"vj_piv/l4d_common/action/rage/male/rage_73.wav",
					"vj_piv/l4d_common/action/rage/male/rage_74.wav",
					"vj_piv/l4d_common/action/rage/male/rage_75.wav",
					"vj_piv/l4d_common/action/rage/male/rage_76.wav",
					"vj_piv/l4d_common/action/rage/male/rage_77.wav",
					"vj_piv/l4d_common/action/rage/male/rage_78.wav",
					"vj_piv/l4d_common/action/rage/male/rage_79.wav",
					"vj_piv/l4d_common/action/rage/male/rage_80.wav",
					"vj_piv/l4d_common/action/rage/male/rage_81.wav",
					"vj_piv/l4d_common/action/rage/male/rage_82.wav"
				}
				self.SoundTbl_BeforeLeapAttack = {
					"vj_piv/l4d_common/action/rage/male/rage_50.wav",
					"vj_piv/l4d_common/action/rage/male/rage_51.wav",
					"vj_piv/l4d_common/action/rage/male/rage_52.wav",
					"vj_piv/l4d_common/action/rage/male/rage_53.wav",
					"vj_piv/l4d_common/action/rage/male/rage_54.wav",
					"vj_piv/l4d_common/action/rage/male/rage_55.wav",
					"vj_piv/l4d_common/action/rage/male/rage_56.wav",
					"vj_piv/l4d_common/action/rage/male/rage_57.wav",
					"vj_piv/l4d_common/action/rage/male/rage_58.wav",
					"vj_piv/l4d_common/action/rage/male/rage_59.wav",
					"vj_piv/l4d_common/action/rage/male/rage_60.wav",
					"vj_piv/l4d_common/action/rage/male/rage_61.wav",
					"vj_piv/l4d_common/action/rage/male/rage_62.wav",
					"vj_piv/l4d_common/action/rage/male/rage_64.wav",
					"vj_piv/l4d_common/action/rage/male/rage_65.wav",
					"vj_piv/l4d_common/action/rage/male/rage_66.wav",
					"vj_piv/l4d_common/action/rage/male/rage_67.wav",
					"vj_piv/l4d_common/action/rage/male/rage_68.wav",
					"vj_piv/l4d_common/action/rage/male/rage_69.wav",
					"vj_piv/l4d_common/action/rage/male/rage_70.wav",
					"vj_piv/l4d_common/action/rage/male/rage_71.wav",
					"vj_piv/l4d_common/action/rage/male/rage_72.wav",
					"vj_piv/l4d_common/action/rage/male/rage_73.wav",
					"vj_piv/l4d_common/action/rage/male/rage_74.wav",
					"vj_piv/l4d_common/action/rage/male/rage_75.wav",
					"vj_piv/l4d_common/action/rage/male/rage_76.wav",
					"vj_piv/l4d_common/action/rage/male/rage_77.wav",
					"vj_piv/l4d_common/action/rage/male/rage_78.wav",
					"vj_piv/l4d_common/action/rage/male/rage_79.wav",
					"vj_piv/l4d_common/action/rage/male/rage_80.wav",
					"vj_piv/l4d_common/action/rage/male/rage_81.wav",
					"vj_piv/l4d_common/action/rage/male/rage_82.wav"
				}
				self.SoundTbl_Pain = {
					"vj_piv/l4d_common/action/been_shot/been_shot_01.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_02.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_04.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_05.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_06.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_08.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_09.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_12.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_13.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_14.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_18.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_19.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_20.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_21.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_22.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_24.wav",
					"vj_piv/l4d_common/action/been_shot/male/been_shot_30.wav",
					"vj_piv/l4d_common/action/been_shot/male/been_shot_31.wav",
					"vj_piv/l4d_common/action/been_shot/male/been_shot_32.wav",
					"vj_piv/l4d_common/action/been_shot/male/been_shot_32.wav",
					"vj_piv/l4d_common/action/been_shot/male/been_shot_34.wav",
					"vj_piv/l4d_common/action/been_shot/male/been_shot_35.wav",
					"vj_piv/l4d_common/action/been_shot/male/been_shot_36.wav",
					"vj_piv/l4d_common/action/been_shot/male/been_shot_37.wav",
					"vj_piv/l4d_common/action/rage/shoved_1.wav",
					"vj_piv/l4d_common/action/rage/shoved_2.wav",
					"vj_piv/l4d_common/action/rage/shoved_3.wav",
					"vj_piv/l4d_common/action/rage/shoved_4.wav",
					"vj_piv/l4d_common/action/die/mp/odd_2.wav",
					"vj_piv/l4d_common/action/die/mp/odd_3.wav",
					"vj_piv/l4d_common/action/die/mp/odd_3.wav",
					"vj_piv/l4d_common/action/die/mp/odd_5.wav",
				}
				self.SoundTbl_Death = {
					"vj_piv/l4d_common/action/die/death_14.wav",
					"vj_piv/l4d_common/action/die/death_17.wav",
					"vj_piv/l4d_common/action/die/death_17.wav",
					"vj_piv/l4d_common/action/die/death_19.wav",
					"vj_piv/l4d_common/action/die/death_22.wav",
					"vj_piv/l4d_common/action/die/death_23.wav",
					"vj_piv/l4d_common/action/die/death_24.wav",
					"vj_piv/l4d_common/action/die/death_25.wav",
					"vj_piv/l4d_common/action/die/death_26.wav",
					"vj_piv/l4d_common/action/die/death_27.wav",
					"vj_piv/l4d_common/action/die/death_28.wav",
					"vj_piv/l4d_common/action/die/death_29.wav",
					"vj_piv/l4d_common/action/die/death_30.wav",
					"vj_piv/l4d_common/action/die/death_32.wav",
					"vj_piv/l4d_common/action/die/death_33.wav",
					"vj_piv/l4d_common/action/die/death_34.wav",
					"vj_piv/l4d_common/action/die/death_35.wav",
					"vj_piv/l4d_common/action/die/death_35.wav",
					"vj_piv/l4d_common/action/die/death_37.wav",
					"vj_piv/l4d_common/action/die/death_38.wav",
					"vj_piv/l4d_common/action/die/male/death_40.wav",
					"vj_piv/l4d_common/action/die/male/death_41.wav",
					"vj_piv/l4d_common/action/die/male/death_42.wav",
					"vj_piv/l4d_common/action/die/male/death_43.wav",
					"vj_piv/l4d_common/action/die/male/death_44.wav",
					"vj_piv/l4d_common/action/die/male/death_45.wav",
					"vj_piv/l4d_common/action/die/male/death_46.wav",
					"vj_piv/l4d_common/action/die/male/death_47.wav",
					"vj_piv/l4d_common/action/die/male/death_48.wav",
					"vj_piv/l4d_common/action/die/male/death_49.wav",
					"vj_piv/l4d_common/action/die/mp/squeal_1.wav",
					"vj_piv/l4d_common/action/die/mp/squeal_2.wav",
					"vj_piv/l4d_common/action/die/mp/squeal_3.wav",
					"vj_piv/l4d_common/action/ignite/ignite01.wav",
					"vj_piv/l4d_common/action/ignite/ignite07.wav",
					"vj_piv/l4d_common/action/ignite/ignite08.wav",
					"vj_piv/l4d_common/action/ignite/ignite09.wav",
					"vj_piv/l4d_common/action/ignite/male/ignite10.wav",
					"vj_piv/l4d_common/action/ignite/male/ignite11.wav",
					"vj_piv/l4d_common/action/ignite/male/ignite12.wav",
					"vj_piv/l4d_common/action/ignite/male/ignite13.wav",
					"vj_piv/l4d_common/action/ignite/male/ignite14.wav"
				}
			elseif self.Voice == 4 then
				local ContagionVoice = math.random(1,4)
				if ContagionVoice == 1 then
				   self.SoundTbl_Idle = {"vj_piv/contagion/z_sham/shared/0245.wav","vj_piv/contagion/z_sham/shared/0244.wav","vj_piv/contagion/z_sham/idle/0128.wav","vj_piv/contagion/z_sham/idle/0123.wav","vj_piv/contagion/z_sham/idle/0122.wav","vj_piv/contagion/z_sham/idle/0121.wav","vj_piv/contagion/z_sham/idle/0120.wav","vj_piv/contagion/z_sham/idle/0119.wav","vj_piv/contagion/z_sham/idle/0118.wav","vj_piv/contagion/z_sham/idle/0117.wav","vj_piv/contagion/z_sham/idle/0116.wav","vj_piv/contagion/z_sham/idle/0115.wav","vj_piv/contagion/z_sham/idle/0114.wav","vj_piv/contagion/z_sham/idle/0113.wav","vj_piv/contagion/z_sham/idle/0112.wav","vj_piv/contagion/z_sham/idle/0111.wav","vj_piv/contagion/z_sham/idle/0110.wav","vj_piv/contagion/z_sham/idle/0109.wav","vj_piv/contagion/z_sham/idle/0108.wav","vj_piv/contagion/z_sham/idle/0107.wav","vj_piv/contagion/z_sham/idle/0106.wav","vj_piv/contagion/z_sham/idle/0105.wav","vj_piv/contagion/z_sham/idle/0104.wav","vj_piv/contagion/z_sham/idle/0103.wav","vj_piv/contagion/z_sham/idle/0102.wav","vj_piv/contagion/z_sham/idle/0101.wav","vj_piv/contagion/z_sham/idle/0100.wav","vj_piv/contagion/z_sham/idle/0099.wav","vj_piv/contagion/z_sham/idle/0098.wav","vj_piv/contagion/z_sham/idle/0097.wav","vj_piv/contagion/z_sham/idle/0096.wav","vj_piv/contagion/z_sham/idle/0095.wav","vj_piv/contagion/z_sham/idle/0094.wav","vj_piv/contagion/z_sham/idle/0093.wav","vj_piv/contagion/z_sham/idle/0092.wav","vj_piv/contagion/z_sham/idle/0091.wav","vj_piv/contagion/z_sham/idle/0090.wav","vj_piv/contagion/z_sham/idle/0089.wav","vj_piv/contagion/z_sham/idle/0088.wav","vj_piv/contagion/z_sham/idle/0087.wav","vj_piv/contagion/z_sham/idle/0086.wav","vj_piv/contagion/z_sham/idle/0085.wav","vj_piv/contagion/z_sham/idle/0084.wav","vj_piv/contagion/z_sham/idle/0083.wav","vj_piv/contagion/z_sham/idle/0082.wav","vj_piv/contagion/z_sham/idle/0081.wav","vj_piv/contagion/z_sham/idle/0080.wav","vj_piv/contagion/z_sham/idle/0079.wav","vj_piv/contagion/z_sham/idle/0077.wav","vj_piv/contagion/z_sham/idle/0076.wav"}
				   self.SoundTbl_Alert = {"vj_piv/contagion/z_sham/alert/0170.wav","vj_piv/contagion/z_sham/alert/0169.wav","vj_piv/contagion/z_sham/alert/0168.wav","vj_piv/contagion/z_sham/alert/0167.wav","vj_piv/contagion/z_sham/alert/0166.wav","vj_piv/contagion/z_sham/alert/0165.wav","vj_piv/contagion/z_sham/alert/0164.wav","vj_piv/contagion/z_sham/alert/0163.wav","vj_piv/contagion/z_sham/alert/0162.wav","vj_piv/contagion/z_sham/alert/0161.wav","vj_piv/contagion/z_sham/alert/0152.wav","vj_piv/contagion/z_sham/alert/0061.wav","vj_piv/contagion/z_sham/alert/0060.wav","vj_piv/contagion/z_sham/alert/0058.wav","vj_piv/contagion/z_sham/alert/0056.wav","vj_piv/contagion/z_sham/alert/0030.wav","vj_piv/contagion/z_sham/alert/0029.wav","vj_piv/contagion/z_sham/alert/0028.wav","vj_piv/contagion/z_sham/alert/0027.wav","vj_piv/contagion/z_sham/alert/0026.wav","vj_piv/contagion/z_sham/alert/0025.wav","vj_piv/contagion/z_sham/alert/0023.wav","vj_piv/contagion/z_sham/alert/0022.wav","vj_piv/contagion/z_sham/alert/0021.wav","vj_piv/contagion/z_arne/alert/0207.wav"}
				   self.SoundTbl_CallForHelp = {"vj_piv/contagion/z_sham/roar/0075.wav","vj_piv/contagion/z_sham/roar/0074.wav","vj_piv/contagion/z_sham/roar/0073.wav","vj_piv/contagion/z_sham/roar/0072.wav","vj_piv/contagion/z_sham/roar/0071.wav","vj_piv/contagion/z_sham/roar/0070.wav"}
				   self.SoundTbl_CombatIdle = {"vj_piv/contagion/z_sham/spot_player/0178.wav","vj_piv/contagion/z_sham/spot_player/0173.wav","vj_piv/contagion/z_sham/spot_player/0159.wav","vj_piv/contagion/z_sham/spot_player/0158.wav","vj_piv/contagion/z_sham/spot_player/0157.wav","vj_piv/contagion/z_sham/spot_player/0156.wav","vj_piv/contagion/z_sham/spot_player/0155.wav","vj_piv/contagion/z_sham/spot_player/0153.wav","vj_piv/contagion/z_sham/spot_player/0145.wav","vj_piv/contagion/z_sham/spot_player/0134.wav","vj_piv/contagion/z_sham/spot_player/0059.wav","vj_piv/contagion/z_sham/spot_player/0055.wav","vj_piv/contagion/z_sham/spot_player/0054.wav","vj_piv/contagion/z_sham/spot_player/0018.wav","vj_piv/contagion/z_sham/spot_player/0017.wav","vj_piv/contagion/z_sham/spot_player/0016.wav","vj_piv/contagion/z_sham/spot_player/0015.wav","vj_piv/contagion/z_sham/spot_player/0014.wav","","vj_piv/contagion/z_sham/spot_player/0013.wav","vj_piv/contagion/z_sham/spot_player/0003.wav","vj_piv/contagion/z_sham/spot_player/0002.wav","vj_piv/contagion/z_sham/spot_player/0001.wav"}
				   self.SoundTbl_BeforeMeleeAttack = {"vj_piv/contagion/z_sham/attacking/0053.wav","vj_piv/contagion/z_sham/attacking/0052.wav","vj_piv/contagion/z_sham/attacking/0051.wav","vj_piv/contagion/z_sham/attacking/0050.wav","vj_piv/contagion/z_sham/attacking/0049.wav","vj_piv/contagion/z_sham/attacking/0048.wav","vj_piv/contagion/z_sham/attacking/0047.wav","vj_piv/contagion/z_sham/attacking/0045.wav","vj_piv/contagion/z_sham/attacking/0044.wav","vj_piv/contagion/z_sham/attacking/0043.wav","vj_piv/contagion/z_sham/attacking/0042.wav","vj_piv/contagion/z_sham/attacking/0041.wav","vj_piv/contagion/z_sham/attacking/0040.wav","vj_piv/contagion/z_sham/attacking/0039.wav","vj_piv/contagion/z_sham/attacking/0038.wav","vj_piv/contagion/z_sham/attacking/0037.wav","vj_piv/contagion/z_sham/attacking/0036.wav","vj_piv/contagion/z_sham/attacking/0034.wav","vj_piv/contagion/z_sham/attacking/0033.wav"}
				   self.SoundTbl_BeforeLeapAttack = {"vj_piv/contagion/z_sham/attacking/0053.wav","vj_piv/contagion/z_sham/attacking/0052.wav","vj_piv/contagion/z_sham/attacking/0051.wav","vj_piv/contagion/z_sham/attacking/0050.wav","vj_piv/contagion/z_sham/attacking/0049.wav","vj_piv/contagion/z_sham/attacking/0048.wav","vj_piv/contagion/z_sham/attacking/0047.wav","vj_piv/contagion/z_sham/attacking/0045.wav","vj_piv/contagion/z_sham/attacking/0044.wav","vj_piv/contagion/z_sham/attacking/0043.wav","vj_piv/contagion/z_sham/attacking/0042.wav","vj_piv/contagion/z_sham/attacking/0041.wav","vj_piv/contagion/z_sham/attacking/0040.wav","vj_piv/contagion/z_sham/attacking/0039.wav","vj_piv/contagion/z_sham/attacking/0038.wav","vj_piv/contagion/z_sham/attacking/0037.wav","vj_piv/contagion/z_sham/attacking/0036.wav","vj_piv/contagion/z_sham/attacking/0034.wav","vj_piv/contagion/z_sham/attacking/0033.wav"}
				   self.SoundTbl_Pain = {"vj_piv/contagion/z_sham/shared/0187.wav","vj_piv/contagion/z_sham/shared/0186.wav","vj_piv/contagion/z_sham/shared/0185.wav","vj_piv/contagion/z_sham/shared/0184.wav","vj_piv/contagion/z_sham/shared/0183.wav","vj_piv/contagion/z_sham/shared/0182.wav","vj_piv/contagion/z_sham/shared/0181.wav","vj_piv/contagion/z_sham/shared/0180.wav","vj_piv/contagion/z_sham/shared/0179.wav","vj_piv/contagion/z_sham/shared/0177.wav","vj_piv/contagion/z_sham/shared/0176.wav","vj_piv/contagion/z_sham/shared/0175.wav","vj_piv/contagion/z_sham/shared/0174.wav","vj_piv/contagion/z_sham/shared/0174.wav"}
				   self.SoundTbl_Death = {"vj_piv/contagion/z_sham/death/0032.wav"}
				elseif ContagionVoice == 2 then
				   self.SoundTbl_Idle = {"vj_piv/contagion/z_arne/idle/0219.wav","vj_piv/contagion/z_arne/idle/0220.wav","vj_piv/contagion/z_arne/idle/0221.wav","vj_piv/contagion/z_arne/idle/0243.wav","vj_piv/contagion/z_arne/idle/0246.wav","vj_piv/contagion/z_arne/idle/0247.wav","vj_piv/contagion/z_arne/idle/0248.wav","vj_piv/contagion/z_arne/idle/0249.wav","vj_piv/contagion/z_arne/idle/0250.wav","vj_piv/contagion/z_arne/idle/0251.wav","vj_piv/contagion/z_arne/idle/0252.wav","vj_piv/contagion/z_arne/idle/0253.wav","vj_piv/contagion/z_arne/idle/0254.wav","vj_piv/contagion/z_arne/idle/0255.wav"}
				   self.SoundTbl_Alert = {"vj_piv/contagion/z_arne/alert/0208.wav","vj_piv/contagion/z_arne/alert/0209.wav","vj_piv/contagion/z_arne/alert/0210.wav","vj_piv/contagion/z_arne/alert/0211.wav","vj_piv/contagion/z_arne/alert/0212.wav","vj_piv/contagion/z_arne/alert/0213.wav","vj_piv/contagion/z_arne/alert/0214.wav","vj_piv/contagion/z_arne/alert/0215.wav","vj_piv/contagion/z_arne/alert/0216.wav","vj_piv/contagion/z_arne/alert/0217.wav","vj_piv/contagion/z_arne/alert/0218.wav"}
				   self.SoundTbl_CallForHelp = {"vj_piv/contagion/z_arne/alert/0208.wav","vj_piv/contagion/z_arne/alert/0209.wav","vj_piv/contagion/z_arne/alert/0210.wav","vj_piv/contagion/z_arne/alert/0211.wav","vj_piv/contagion/z_arne/alert/0212.wav","vj_piv/contagion/z_arne/alert/0213.wav","vj_piv/contagion/z_arne/alert/0214.wav","vj_piv/contagion/z_arne/alert/0215.wav","vj_piv/contagion/z_arne/alert/0216.wav","vj_piv/contagion/z_arne/alert/0217.wav","vj_piv/contagion/z_arne/alert/0218.wav"}
				   self.SoundTbl_BeforeMeleeAttack = {"vj_piv/contagion/z_arne/attack/0226.wav","vj_piv/contagion/z_arne/attack/0227.wav","vj_piv/contagion/z_arne/attack/0229.wav","vj_piv/contagion/z_arne/attack/0231.wav","vj_piv/contagion/z_arne/attack/0233.wav","vj_piv/contagion/z_arne/attack/0234.wav","vj_piv/contagion/z_arne/attack/0235.wav","vj_piv/contagion/z_arne/attack/0236.wav","vj_piv/contagion/z_arne/attack/0238.wav","vj_piv/contagion/z_arne/attack/0239.wav","vj_piv/contagion/z_arne/attack/0240.wav","vj_piv/contagion/z_arne/attack/0241.wav","vj_piv/contagion/z_arne/attack/0256.wav"}
				   self.SoundTbl_BeforeLeapAttack = {"vj_piv/contagion/z_arne/attack/0226.wav","vj_piv/contagion/z_arne/attack/0227.wav","vj_piv/contagion/z_arne/attack/0229.wav","vj_piv/contagion/z_arne/attack/0231.wav","vj_piv/contagion/z_arne/attack/0233.wav","vj_piv/contagion/z_arne/attack/0234.wav","vj_piv/contagion/z_arne/attack/0235.wav","vj_piv/contagion/z_arne/attack/0236.wav","vj_piv/contagion/z_arne/attack/0238.wav","vj_piv/contagion/z_arne/attack/0239.wav","vj_piv/contagion/z_arne/attack/0240.wav","vj_piv/contagion/z_arne/attack/0241.wav","vj_piv/contagion/z_arne/attack/0256.wav"}
				   self.SoundTbl_Pain = {"vj_piv/contagion/z_sham/pain/0148.wav","vj_piv/contagion/z_sham/pain/0149.wav","vj_piv/contagion/z_sham/pain/0147.wav","vj_piv/contagion/z_sham/pain/0146.wav","vj_piv/contagion/z_sham/pain/0143.wav","vj_piv/contagion/z_sham/pain/0141.wav","vj_piv/contagion/z_sham/pain/0140.wav","vj_piv/contagion/z_sham/pain/0139.wav","vj_piv/contagion/z_sham/pain/0138.wav","vj_piv/contagion/z_sham/pain/0137.wav","vj_piv/contagion/z_sham/pain/0136.wav","vj_piv/contagion/z_sham/pain/0135.wav","vj_piv/contagion/z_sham/pain/0133.wav","vj_piv/contagion/z_sham/pain/0132.wav","vj_piv/contagion/z_sham/pain/0131.wav","vj_piv/contagion/z_sham/pain/0130.wav","vj_piv/contagion/z_sham/pain/0129.wav","vj_piv/contagion/z_sham/pain/0127.wav","vj_piv/contagion/z_sham/pain/0126.wav","vj_piv/contagion/z_sham/pain/0125.wav","vj_piv/contagion/z_sham/pain/0124.wav","vj_piv/contagion/z_sham/pain/0069.wav","vj_piv/contagion/z_sham/pain/0066.wav","vj_piv/contagion/z_sham/pain/0065.wav","vj_piv/contagion/z_sham/pain/0064.wav","vj_piv/contagion/z_sham/pain/0063.wav","vj_piv/contagion/z_sham/pain/0062.wav"}
				   self.SoundTbl_Death = {"vj_piv/contagion/z_arne/die/0223.wav","vj_piv/contagion/z_arne/die/0224.wav","vj_piv/contagion/z_arne/die/0225.wav"}
				elseif ContagionVoice == 3 then
				   self.SoundTbl_Idle = {"vj_piv/contagion/growler/zombie_voice_shared-1.wav","vj_piv/contagion/growler/zombie_voice_shared-10.wav","vj_piv/contagion/growler/zombie_voice_shared-12.wav","vj_piv/contagion/growler/zombie_voice_shared-13.wav","vj_piv/contagion/growler/zombie_voice_shared-14.wav","vj_piv/contagion/growler/zombie_voice_shared-2.wav","vj_piv/contagion/growler/zombie_voice_shared-3.wav","vj_piv/contagion/growler/zombie_voice_shared-4.wav","vj_piv/contagion/growler/zombie_voice_shared-5.wav","vj_piv/contagion/growler/zombie_voice_shared-6.wav","vj_piv/contagion/growler/zombie_voice_shared-7.wav","vj_piv/contagion/growler/zombie_voice_shared-8.wav","vj_piv/contagion/growler/zombie_voice_shared-9.wav"}
				   self.SoundTbl_Alert = {"vj_piv/contagion/growler/zombie_voice_alert-1.wav","vj_piv/contagion/growler/zombie_voice_alert-2.wav","vj_piv/contagion/growler/zombie_voice_alert-3.wav","vj_piv/contagion/growler/zombie_voice_alert-4.wav"}
				   self.SoundTbl_CallForHelp = {"vj_piv/contagion/growler/zombie_voice_alert-1.wav","vj_piv/contagion/growler/zombie_voice_alert-2.wav","vj_piv/contagion/growler/zombie_voice_alert-3.wav","vj_piv/contagion/growler/zombie_voice_alert-4.wav"}
				   self.SoundTbl_BeforeMeleeAttack = {"vj_piv/contagion/growler/zombie_voice_shared-1.wav","vj_piv/contagion/growler/zombie_voice_shared-10.wav","vj_piv/contagion/growler/zombie_voice_shared-12.wav","vj_piv/contagion/growler/zombie_voice_shared-13.wav","vj_piv/contagion/growler/zombie_voice_shared-14.wav","vj_piv/contagion/growler/zombie_voice_shared-2.wav","vj_piv/contagion/growler/zombie_voice_shared-3.wav","vj_piv/contagion/growler/zombie_voice_shared-4.wav","vj_piv/contagion/growler/zombie_voice_shared-5.wav","vj_piv/contagion/growler/zombie_voice_shared-6.wav","vj_piv/contagion/growler/zombie_voice_shared-7.wav","vj_piv/contagion/growler/zombie_voice_shared-8.wav","vj_piv/contagion/growler/zombie_voice_shared-9.wav"}
				   self.SoundTbl_BeforeLeapAttack = {"vj_piv/contagion/growler/zombie_voice_shared-1.wav","vj_piv/contagion/growler/zombie_voice_shared-10.wav","vj_piv/contagion/growler/zombie_voice_shared-12.wav","vj_piv/contagion/growler/zombie_voice_shared-13.wav","vj_piv/contagion/growler/zombie_voice_shared-14.wav","vj_piv/contagion/growler/zombie_voice_shared-2.wav","vj_piv/contagion/growler/zombie_voice_shared-3.wav","vj_piv/contagion/growler/zombie_voice_shared-4.wav","vj_piv/contagion/growler/zombie_voice_shared-5.wav","vj_piv/contagion/growler/zombie_voice_shared-6.wav","vj_piv/contagion/growler/zombie_voice_shared-7.wav","vj_piv/contagion/growler/zombie_voice_shared-8.wav","vj_piv/contagion/growler/zombie_voice_shared-9.wav"}
				   self.SoundTbl_Pain = {"vj_piv/contagion/z_sham/pain/0148.wav","vj_piv/contagion/z_sham/pain/0149.wav","vj_piv/contagion/z_sham/pain/0147.wav","vj_piv/contagion/z_sham/pain/0146.wav","vj_piv/contagion/z_sham/pain/0143.wav","vj_piv/contagion/z_sham/pain/0141.wav","vj_piv/contagion/z_sham/pain/0140.wav","vj_piv/contagion/z_sham/pain/0139.wav","vj_piv/contagion/z_sham/pain/0138.wav","vj_piv/contagion/z_sham/pain/0137.wav","vj_piv/contagion/z_sham/pain/0136.wav","vj_piv/contagion/z_sham/pain/0135.wav","vj_piv/contagion/z_sham/pain/0133.wav","vj_piv/contagion/z_sham/pain/0132.wav","vj_piv/contagion/z_sham/pain/0131.wav","vj_piv/contagion/z_sham/pain/0130.wav","vj_piv/contagion/z_sham/pain/0129.wav","vj_piv/contagion/z_sham/pain/0127.wav","vj_piv/contagion/z_sham/pain/0126.wav","vj_piv/contagion/z_sham/pain/0125.wav","vj_piv/contagion/z_sham/pain/0124.wav","vj_piv/contagion/z_sham/pain/0069.wav","vj_piv/contagion/z_sham/pain/0066.wav","vj_piv/contagion/z_sham/pain/0065.wav","vj_piv/contagion/z_sham/pain/0064.wav","vj_piv/contagion/z_sham/pain/0063.wav","vj_piv/contagion/z_sham/pain/0062.wav"}
				   self.SoundTbl_Death = {"vj_piv/contagion/z_arne/die/0223.wav","vj_piv/contagion/z_arne/die/0224.wav","vj_piv/contagion/z_arne/die/0225.wav"}
				elseif ContagionVoice == 4 then
				   self.SoundTbl_Idle = {"vj_piv/contagion/screamer/idle-1.wav","vj_piv/contagion/screamer/idle-1.wav","vj_piv/contagion/screamer/idle-1.wav","vj_piv/contagion/screamer/idle-3.wav","vj_piv/contagion/screamer/idle-3.wav","vj_piv/contagion/screamer/idle-3.wav","vj_piv/contagion/screamer/idle-2.wav"}
				   self.SoundTbl_Alert = {"vj_piv/contagion/screamer/alert-1.wav","vj_piv/contagion/screamer/alert-2.wav"}
				   self.SoundTbl_CallForHelp = {"vj_piv/contagion/screamer/idle-2.wav"}
				   self.SoundTbl_BeforeMeleeAttack = {"vj_piv/contagion/screamer/idle-1.wav","vj_piv/contagion/screamer/idle-1.wav","vj_piv/contagion/screamer/idle-1.wav","vj_piv/contagion/screamer/idle-3.wav","vj_piv/contagion/screamer/idle-3.wav","vj_piv/contagion/screamer/idle-3.wav","vj_piv/contagion/screamer/idle-2.wav"}
				   self.SoundTbl_BeforeLeapAttack = {"vj_piv/contagion/screamer/alert-1.wav","vj_piv/contagion/screamer/alert-2.wav"}
				   self.SoundTbl_Pain = {"vj_piv/contagion/z_sham/pain/0148.wav","vj_piv/contagion/z_sham/pain/0149.wav","vj_piv/contagion/z_sham/pain/0147.wav","vj_piv/contagion/z_sham/pain/0146.wav","vj_piv/contagion/z_sham/pain/0143.wav","vj_piv/contagion/z_sham/pain/0141.wav","vj_piv/contagion/z_sham/pain/0140.wav","vj_piv/contagion/z_sham/pain/0139.wav","vj_piv/contagion/z_sham/pain/0138.wav","vj_piv/contagion/z_sham/pain/0137.wav","vj_piv/contagion/z_sham/pain/0136.wav","vj_piv/contagion/z_sham/pain/0135.wav","vj_piv/contagion/z_sham/pain/0133.wav","vj_piv/contagion/z_sham/pain/0132.wav","vj_piv/contagion/z_sham/pain/0131.wav","vj_piv/contagion/z_sham/pain/0130.wav","vj_piv/contagion/z_sham/pain/0129.wav","vj_piv/contagion/z_sham/pain/0127.wav","vj_piv/contagion/z_sham/pain/0126.wav","vj_piv/contagion/z_sham/pain/0125.wav","vj_piv/contagion/z_sham/pain/0124.wav","vj_piv/contagion/z_sham/pain/0069.wav","vj_piv/contagion/z_sham/pain/0066.wav","vj_piv/contagion/z_sham/pain/0065.wav","vj_piv/contagion/z_sham/pain/0064.wav","vj_piv/contagion/z_sham/pain/0063.wav","vj_piv/contagion/z_sham/pain/0062.wav"}
				   self.SoundTbl_Death = {"vj_piv/contagion/z_arne/die/0222.wav","vj_piv/contagion/z_arne/die/0223.wav","vj_piv/contagion/z_arne/die/0224.wav","vj_piv/contagion/z_arne/die/0225.wav"}
				end
			end
		else
			if self.Voice == 1 then
				self.SoundTbl_Idle = {
					"vj_piv/nmr_zomb2/idle1.wav",
					"vj_piv/nmr_zomb2/idle2.wav",
					"vj_piv/nmr_zomb2/idle3.wav",
					"vj_piv/nmr_zomb2/idle4.wav",
					"vj_piv/nmr_zomb2/idle5.wav",
					"vj_piv/nmr_zomb2/idle6.wav",
					"vj_piv/nmr_zomb2/idle7.wav",
					"vj_piv/nmr_zomb2/idle8.wav",
					"vj_piv/nmr_zomb2/idle9.wav",
					"vj_piv/nmr_zomb2/idle10.wav",
					"vj_piv/nmr_zomb2/idle11.wav",
					"vj_piv/nmr_zomb2/idle12.wav",
					"vj_piv/nmr_zomb2/idle13.wav",
					"vj_piv/nmr_zomb2/idle14.wav",
					"vj_piv/nmr_zomb2/idle15.wav"
				}
				self.SoundTbl_Alert = {
					"vj_piv/nmr_zomb2/alert_sham_m_01.wav",
					"vj_piv/nmr_zomb2/alert_sham_m_02.wav",
					"vj_piv/nmr_zomb2/alert_sham_m_03.wav",
					"vj_piv/nmr_zomb2/alert_sham_m_04.wav",
					"vj_piv/nmr_zomb2/alert_sham_m_05.wav",
					"vj_piv/nmr_zomb2/alert_sham_m_06.wav",
					"vj_piv/nmr_zomb2/alert_sham_m_07.wav",
					"vj_piv/nmr_zomb2/alert_sham_m_08.wav",
					"vj_piv/nmr_zomb2/alert_sham_m_09.wav",
					"vj_piv/nmr_zomb2/alert_sham_m_10.wav",
					"vj_piv/nmr_zomb2/alert_sham_m_11.wav",
					"vj_piv/nmr_zomb2/alert_sham_m_12.wav",
					"vj_piv/nmr_zomb2/alert_sham_m_13.wav",
					"vj_piv/nmr_zomb2/alert_sham_m_14.wav",
					"vj_piv/nmr_zomb2/alert_sham_m_15.wav",
					"vj_piv/nmr_zomb2/alert_sham_m_16.wav",
					"vj_piv/nmr_zomb2/alert_sham_m_17.wav",
					"vj_piv/nmr_zomb2/alert_sham_m_18.wav",
					"vj_piv/nmr_zomb2/alert_sham_m_19.wav",
					"vj_piv/nmr_zomb2/alert_sham_m_20.wav",	
					"vj_piv/nmr_zomb2/alert_sham_m_21.wav"
				}
				self.SoundTbl_CombatIdle = {
					"vj_piv/nmr_zomb2/pursuit_sham_m_01.wav",
					"vj_piv/nmr_zomb2/pursuit_sham_m_02.wav",
					"vj_piv/nmr_zomb2/pursuit_sham_m_03.wav",
					"vj_piv/nmr_zomb2/pursuit_sham_m_04.wav",
					"vj_piv/nmr_zomb2/pursuit_sham_m_05.wav",
					"vj_piv/nmr_zomb2/pursuit_sham_m_06.wav",
					"vj_piv/nmr_zomb2/pursuit_sham_m_07.wav",
					"vj_piv/nmr_zomb2/pursuit_sham_m_08.wav",
					"vj_piv/nmr_zomb2/pursuit_sham_m_09.wav",
					"vj_piv/nmr_zomb2/pursuit_sham_m_10.wav",
					"vj_piv/nmr_zomb2/pursuit_sham_m_11.wav",
					"vj_piv/nmr_zomb2/pursuit_sham_m_12.wav",
					"vj_piv/nmr_zomb2/pursuit_sham_m_13.wav",
					"vj_piv/nmr_zomb2/pursuit_sham_m_14.wav",
					"vj_piv/nmr_zomb2/pursuit_sham_m_15.wav",
					"vj_piv/nmr_zomb2/pursuit_sham_m_16.wav",
					"vj_piv/nmr_zomb2/pursuit_sham_m_17.wav",
					"vj_piv/nmr_zomb2/pursuit_sham_m_18.wav"
				}
				self.SoundTbl_BeforeMeleeAttack = {
					"vj_piv/nmr_zomb1/attack_sham_m_01.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_02.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_03.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_04.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_05.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_06.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_07.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_08.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_09.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_10.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_11.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_12.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_13.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_14.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_15.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_16.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_17.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_18.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_19.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_20.wav",	
					"vj_piv/nmr_zomb1/attack_sham_m_21.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_22.wav"	
				}
				self.SoundTbl_BeforeLeapAttack = {
					"vj_piv/nmr_zomb1/attack_sham_m_01.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_02.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_03.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_04.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_05.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_06.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_07.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_08.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_09.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_10.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_11.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_12.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_13.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_14.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_15.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_16.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_17.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_18.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_19.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_20.wav",	
					"vj_piv/nmr_zomb1/attack_sham_m_21.wav",
					"vj_piv/nmr_zomb1/attack_sham_m_22.wav"
				}
				self.SoundTbl_Pain = {
					"vj_piv/nmr_zomb2/pain01.wav",
					"vj_piv/nmr_zomb2/pain02.wav",
					"vj_piv/nmr_zomb2/pain03.wav", 
					"vj_piv/nmr_zomb2/pain04.wav",
					"vj_piv/nmr_zomb2/pain05.wav"
				}
				self.SoundTbl_Death = {
					"vj_piv/nmr_zomb2/die01.wav",
					"vj_piv/nmr_zomb2/die02.wav",
					"vj_piv/nmr_zomb2/die03.wav",
					"vj_piv/nmr_zomb2/die04.wav",
					"vj_piv/nmr_zomb2/die05.wav"
				}
			elseif self.Voice == 2 then
				self.SoundTbl_Idle = {
					"vj_piv/dl_bite_male/walker_male00_get_up_00_0.wav",
					"vj_piv/dl_bite_male/walker_male00_get_up_01_0.wav",
					"vj_piv/dl_bite_male/walker_male00_idle_calm_00_0.wav",
					"vj_piv/dl_bite_male/walker_male00_idle_calm_01_0.wav",
					"vj_piv/dl_bite_male/walker_male00_idle_calm_02_0.wav",
					"vj_piv/dl_bite_male/walker_male00_idle_calm_03_0.wav",
					"vj_piv/dl_bite_male/walker_male00_idle_calm_04_0.wav",
					"vj_piv/dl_bite_male/walker_male00_idle_calm_05_0.wav",
					"vj_piv/dl_bite_male/walker_male00_idle_alarmed_00_0.wav",
					"vj_piv/dl_bite_male/walker_male00_idle_alarmed_01_0.wav",
					"vj_piv/dl_bite_male/walker_male00_idle_alarmed_02_0.wav"
				}
				if self.PIV_Jogger == true then
					self.SoundTbl_Alert = {
						"vj_piv/dl_bite_male/walker_male_call_nw_00_0.wav",
						"vj_piv/dl_bite_male/walker_male_call_nw_01_0.wav",
						"vj_piv/dl_bite_male/walker_male_call_nw_02_0.wav"
					}
				else
					self.SoundTbl_Alert = {
						"vj_piv/dl_bite_male/walker_male00_enemy_spotted_00_0.wav",
						"vj_piv/dl_bite_male/walker_male00_enemy_spotted_01_0.wav",
						"vj_piv/dl_bite_male/walker_male00_enemy_spotted_02_0.wav",
						"vj_piv/dl_bite_male/walker_male00_enemy_spotted_03_0.wav",
						"vj_piv/dl_bite_male/walker_male00_enemy_spotted_04_0.wav",
						"vj_piv/dl_bite_male/walker_male00_falling_00_0.wav",
						"vj_piv/dl_bite_male/walker_male00_falling_01_0.wav",
						"vj_piv/dl_bite_male/walker_male00_falling_03_0.wav"
					}
				end
				self.SoundTbl_CombatIdle = {
					"vj_piv/dl_bite_male/walker_male00_move_alarmed_00_0.wav",
					"vj_piv/dl_bite_male/walker_male00_move_alarmed_01_0.wav",
					"vj_piv/dl_bite_male/walker_male00_move_alarmed_02_0.wav",
					"vj_piv/dl_bite_male/walker_male00_berserker_long_00_0.wav",
					"vj_piv/dl_bite_male/walker_male00_berserker_long_01_0.wav",
					"vj_piv/dl_bite_male/walker_male00_berserker_long_02_0.wav",
					"vj_piv/dl_bite_male/walker_male00_berserker_long_03_0.wav",
					"vj_piv/dl_bite_male/walker_male00_berserker_long_04_0.wav",
					"vj_piv/dl_bite_male/walker_male00_berserker_short_00_0.wav",
					"vj_piv/dl_bite_male/walker_male00_berserker_short_01_0.wav",
					"vj_piv/dl_bite_male/walker_male00_berserker_short_02_0.wav",
					"vj_piv/dl_bite_male/walker_male00_berserker_short_03_0.wav",
					"vj_piv/dl_bite_male/walker_male00_berserker_short_04_0.wav",
					"vj_piv/dl_bite_male/walker_male00_berserker_short_05_0.wav",
					"vj_piv/dl_bite_male/walker_male00_berserker_short_06_0.wav"
				}
				self.SoundTbl_BeforeMeleeAttack = {
					"vj_piv/dl_bite_male/walker_male00_attack_00_0.wav",
					"vj_piv/dl_bite_male/walker_male00_attack_01_0.wav",
					"vj_piv/dl_bite_male/walker_male00_attack_02_0.wav",
					"vj_piv/dl_bite_male/walker_male00_attack_03_0.wav",
					"vj_piv/dl_bite_male/walker_male00_attack_04_0.wav"
				}
				self.SoundTbl_BeforeLeapAttack = {
					"vj_piv/dl_bite_male/walker_male00_attack_00_0.wav",
					"vj_piv/dl_bite_male/walker_male00_attack_01_0.wav",
					"vj_piv/dl_bite_male/walker_male00_attack_02_0.wav",
					"vj_piv/dl_bite_male/walker_male00_attack_03_0.wav",
					"vj_piv/dl_bite_male/walker_male00_attack_04_0.wav"
				}
				self.SoundTbl_Pain = {
					"vj_piv/dl_bite_male/walker_male00_pain_00_0.wav",
					"vj_piv/dl_bite_male/walker_male00_pain_01_0.wav",
					"vj_piv/dl_bite_male/walker_male00_pain_02_0.wav",
					"vj_piv/dl_bite_male/walker_male00_pain_03_0.wav",
					"vj_piv/dl_bite_male/walker_male00_pain_04_0.wav",
					"vj_piv/dl_bite_male/walker_male00_pain_05_0.wav",
					"vj_piv/dl_bite_male/walker_male00_pain_06_0.wav",
					"vj_piv/dl_bite_male/walker_male00_pain_07_0.wav",
					"vj_piv/dl_bite_male/walker_male00_pain_critical_00_0.wav",
					"vj_piv/dl_bite_male/walker_male00_pain_critical_01_0.wav",
					"vj_piv/dl_bite_male/walker_male00_pain_critical_02_0.wav",
					"vj_piv/dl_bite_male/walker_male00_pain_critical_03_0.wav",
					"vj_piv/dl_bite_male/walker_male00_neck_break_00_0.wav"
				}
				self.SoundTbl_Death = {
					"vj_piv/dl_bite_male/walker_male00_pain_burn_00_0.wav",
					"vj_piv/dl_bite_male/walker_male00_pain_burn_01_0.wav",
					"vj_piv/dl_bite_male/walker_male00_pain_burn_02_0.wav",
					"vj_piv/dl_bite_male/walker_male00_pain_burn_03_0.wav",
					"vj_piv/dl_bite_male/walker_male00_death_00_0.wav",
					"vj_piv/dl_bite_male/walker_male00_death_01_0.wav",
					"vj_piv/dl_bite_male/walker_male00_death_02_0.wav",
					"vj_piv/dl_bite_male/walker_male00_death_03_0.wav",
					"vj_piv/dl_bite_male/walker_male00_death_04_0.wav",
					"vj_piv/dl_bite_male/walker_male00_death_car_00_0.wav",
					"vj_piv/dl_bite_male/walker_male00_death_car_01_0.wav",
					"vj_piv/dl_bite_male/walker_male00_death_car_02_0.wav",
					"vj_piv/dl_bite_male/walker_male00_death_car_03_0.wav",
					"vj_piv/dl_bite_male/walker_male00_neck_break_00_0.wav"
					
				}
			elseif self.Voice == 3 then
				self.SoundTbl_Idle = {
					"vj_piv/l4d_common/idle/breathing/breathing01.wav",
					"vj_piv/l4d_common/idle/breathing/breathing08.wav",
					"vj_piv/l4d_common/idle/breathing/breathing09.wav",
					"vj_piv/l4d_common/idle/breathing/breathing10.wav",
					"vj_piv/l4d_common/idle/breathing/breathing13.wav",
					"vj_piv/l4d_common/idle/breathing/breathing16.wav",
					"vj_piv/l4d_common/idle/breathing/breathing18.wav",
					"vj_piv/l4d_common/idle/breathing/breathing25.wav",
					"vj_piv/l4d_common/idle/breathing/breathing26.wav",
					"vj_piv/l4d_common/idle/breathing/idle_breath_01.wav",
					"vj_piv/l4d_common/idle/breathing/idle_breath_02.wav",
					"vj_piv/l4d_common/idle/breathing/idle_breath_03.wav",
					"vj_piv/l4d_common/idle/breathing/idle_breath_04.wav",
					"vj_piv/l4d_common/idle/breathing/idle_breath_06.wav",
					"vj_piv/l4d_common/idle/moaning/moan01.wav",
					"vj_piv/l4d_common/idle/moaning/moan02.wav",
					"vj_piv/l4d_common/idle/moaning/moan03.wav",
					"vj_piv/l4d_common/idle/moaning/moan04.wav",
					"vj_piv/l4d_common/idle/moaning/moan05.wav",
					"vj_piv/l4d_common/idle/moaning/moan06.wav",
					"vj_piv/l4d_common/idle/moaning/moan07.wav",
					"vj_piv/l4d_common/idle/moaning/moan08.wav",
					"vj_piv/l4d_common/idle/moaning/moan09.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling01.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling02.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling03.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling03.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling05.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling06.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling07.wav",
					"vj_piv/l4d_common/idle/mumbling/mumbling08.wav"
				}
				self.SoundTbl_Alert = {
					"vj_piv/l4d_common/alert/becomealert/become_alert01.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert04.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert09.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert11.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert12.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert14.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert17.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert18.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert21.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert23.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert25.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert26.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert29.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert38.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert41.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert54.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert55.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert56.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert57.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert58.wav",
					"vj_piv/l4d_common/alert/becomealert/become_alert58.wav",
					"vj_piv/l4d_common/alert/becomealert/howl01.wav",
					"vj_piv/l4d_common/alert/becomealert/male/become_alert60.wav",
					"vj_piv/l4d_common/alert/becomealert/male/become_alert61.wav",
					"vj_piv/l4d_common/alert/becomealert/male/become_alert62.wav",
					"vj_piv/l4d_common/alert/becomealert/male/become_alert63.wav"
				}
				self.SoundTbl_CombatIdle = {
					"vj_piv/l4d_common/alert/alert/alert13.wav",
					"vj_piv/l4d_common/alert/alert/alert16.wav",
					"vj_piv/l4d_common/alert/alert/alert22.wav",
					"vj_piv/l4d_common/alert/alert/alert23.wav",
					"vj_piv/l4d_common/alert/alert/alert25.wav",
					"vj_piv/l4d_common/alert/alert/alert26.wav",
					"vj_piv/l4d_common/alert/alert/alert27.wav",
					"vj_piv/l4d_common/alert/alert/alert36.wav",
					"vj_piv/l4d_common/alert/alert/alert38.wav",
					"vj_piv/l4d_common/alert/alert/alert39.wav",
					"vj_piv/l4d_common/alert/alert/alert40.wav",
					"vj_piv/l4d_common/alert/alert/alert41.wav",
					"vj_piv/l4d_common/alert/alert/alert42.wav",
					"vj_piv/l4d_common/alert/alert/alert43.wav",
					"vj_piv/l4d_common/alert/alert/alert44.wav",
					"vj_piv/l4d_common/alert/alert/male/alert50.wav",
					"vj_piv/l4d_common/alert/alert/male/alert51.wav",
					"vj_piv/l4d_common/alert/alert/male/alert52.wav",
					"vj_piv/l4d_common/alert/alert/male/alert53.wav",
					"vj_piv/l4d_common/alert/alert/male/alert53.wav",
					"vj_piv/l4d_common/alert/alert/male/alert53.wav",
					"vj_piv/l4d_common/alert/becomealert/hiss01.wav",
					"vj_piv/l4d_common/alert/becomealert/recognize01.wav",
					"vj_piv/l4d_common/alert/becomealert/recognize02.wav",
					"vj_piv/l4d_common/alert/becomealert/recognize03.wav",
					"vj_piv/l4d_common/alert/becomealert/recognize04.wav",
					"vj_piv/l4d_common/alert/becomealert/recognize05.wav",
					"vj_piv/l4d_common/alert/becomealert/recognize06.wav",
					"vj_piv/l4d_common/alert/becomealert/recognize07.wav",
					"vj_piv/l4d_common/alert/becomealert/recognize08.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_long_1.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_long_2.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_long_2.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_01.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_02.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_03.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_04.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_05.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_06.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_07.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_08.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_09.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_10.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_11.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_12.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_13.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_14.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_15.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_16.wav",
					"vj_piv/l4d_common/action/shoved/mp/shoved_17.wav"
				}
				self.SoundTbl_BeforeMeleeAttack = {
					"vj_piv/l4d_common/action/rage/male/rage_50.wav",
					"vj_piv/l4d_common/action/rage/male/rage_51.wav",
					"vj_piv/l4d_common/action/rage/male/rage_52.wav",
					"vj_piv/l4d_common/action/rage/male/rage_53.wav",
					"vj_piv/l4d_common/action/rage/male/rage_54.wav",
					"vj_piv/l4d_common/action/rage/male/rage_55.wav",
					"vj_piv/l4d_common/action/rage/male/rage_56.wav",
					"vj_piv/l4d_common/action/rage/male/rage_57.wav",
					"vj_piv/l4d_common/action/rage/male/rage_58.wav",
					"vj_piv/l4d_common/action/rage/male/rage_59.wav",
					"vj_piv/l4d_common/action/rage/male/rage_60.wav",
					"vj_piv/l4d_common/action/rage/male/rage_61.wav",
					"vj_piv/l4d_common/action/rage/male/rage_62.wav",
					"vj_piv/l4d_common/action/rage/male/rage_64.wav",
					"vj_piv/l4d_common/action/rage/male/rage_65.wav",
					"vj_piv/l4d_common/action/rage/male/rage_66.wav",
					"vj_piv/l4d_common/action/rage/male/rage_67.wav",
					"vj_piv/l4d_common/action/rage/male/rage_68.wav",
					"vj_piv/l4d_common/action/rage/male/rage_69.wav",
					"vj_piv/l4d_common/action/rage/male/rage_70.wav",
					"vj_piv/l4d_common/action/rage/male/rage_71.wav",
					"vj_piv/l4d_common/action/rage/male/rage_72.wav",
					"vj_piv/l4d_common/action/rage/male/rage_73.wav",
					"vj_piv/l4d_common/action/rage/male/rage_74.wav",
					"vj_piv/l4d_common/action/rage/male/rage_75.wav",
					"vj_piv/l4d_common/action/rage/male/rage_76.wav",
					"vj_piv/l4d_common/action/rage/male/rage_77.wav",
					"vj_piv/l4d_common/action/rage/male/rage_78.wav",
					"vj_piv/l4d_common/action/rage/male/rage_79.wav",
					"vj_piv/l4d_common/action/rage/male/rage_80.wav",
					"vj_piv/l4d_common/action/rage/male/rage_81.wav",
					"vj_piv/l4d_common/action/rage/male/rage_82.wav"
				}
				self.SoundTbl_BeforeLeapAttack = {
					"vj_piv/l4d_common/action/rage/male/rage_50.wav",
					"vj_piv/l4d_common/action/rage/male/rage_51.wav",
					"vj_piv/l4d_common/action/rage/male/rage_52.wav",
					"vj_piv/l4d_common/action/rage/male/rage_53.wav",
					"vj_piv/l4d_common/action/rage/male/rage_54.wav",
					"vj_piv/l4d_common/action/rage/male/rage_55.wav",
					"vj_piv/l4d_common/action/rage/male/rage_56.wav",
					"vj_piv/l4d_common/action/rage/male/rage_57.wav",
					"vj_piv/l4d_common/action/rage/male/rage_58.wav",
					"vj_piv/l4d_common/action/rage/male/rage_59.wav",
					"vj_piv/l4d_common/action/rage/male/rage_60.wav",
					"vj_piv/l4d_common/action/rage/male/rage_61.wav",
					"vj_piv/l4d_common/action/rage/male/rage_62.wav",
					"vj_piv/l4d_common/action/rage/male/rage_64.wav",
					"vj_piv/l4d_common/action/rage/male/rage_65.wav",
					"vj_piv/l4d_common/action/rage/male/rage_66.wav",
					"vj_piv/l4d_common/action/rage/male/rage_67.wav",
					"vj_piv/l4d_common/action/rage/male/rage_68.wav",
					"vj_piv/l4d_common/action/rage/male/rage_69.wav",
					"vj_piv/l4d_common/action/rage/male/rage_70.wav",
					"vj_piv/l4d_common/action/rage/male/rage_71.wav",
					"vj_piv/l4d_common/action/rage/male/rage_72.wav",
					"vj_piv/l4d_common/action/rage/male/rage_73.wav",
					"vj_piv/l4d_common/action/rage/male/rage_74.wav",
					"vj_piv/l4d_common/action/rage/male/rage_75.wav",
					"vj_piv/l4d_common/action/rage/male/rage_76.wav",
					"vj_piv/l4d_common/action/rage/male/rage_77.wav",
					"vj_piv/l4d_common/action/rage/male/rage_78.wav",
					"vj_piv/l4d_common/action/rage/male/rage_79.wav",
					"vj_piv/l4d_common/action/rage/male/rage_80.wav",
					"vj_piv/l4d_common/action/rage/male/rage_81.wav",
					"vj_piv/l4d_common/action/rage/male/rage_82.wav"
				}
				self.SoundTbl_Pain = {
					"vj_piv/l4d_common/action/been_shot/been_shot_01.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_02.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_04.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_05.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_06.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_08.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_09.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_12.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_13.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_14.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_18.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_19.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_20.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_21.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_22.wav",
					"vj_piv/l4d_common/action/been_shot/been_shot_24.wav",
					"vj_piv/l4d_common/action/been_shot/male/been_shot_30.wav",
					"vj_piv/l4d_common/action/been_shot/male/been_shot_31.wav",
					"vj_piv/l4d_common/action/been_shot/male/been_shot_32.wav",
					"vj_piv/l4d_common/action/been_shot/male/been_shot_32.wav",
					"vj_piv/l4d_common/action/been_shot/male/been_shot_34.wav",
					"vj_piv/l4d_common/action/been_shot/male/been_shot_35.wav",
					"vj_piv/l4d_common/action/been_shot/male/been_shot_36.wav",
					"vj_piv/l4d_common/action/been_shot/male/been_shot_37.wav",
					"vj_piv/l4d_common/action/rage/shoved_1.wav",
					"vj_piv/l4d_common/action/rage/shoved_2.wav",
					"vj_piv/l4d_common/action/rage/shoved_3.wav",
					"vj_piv/l4d_common/action/rage/shoved_4.wav",
					"vj_piv/l4d_common/action/die/mp/odd_2.wav",
					"vj_piv/l4d_common/action/die/mp/odd_3.wav",
					"vj_piv/l4d_common/action/die/mp/odd_3.wav",
					"vj_piv/l4d_common/action/die/mp/odd_5.wav",
				}
				self.SoundTbl_Death = {
					"vj_piv/l4d_common/action/die/death_14.wav",
					"vj_piv/l4d_common/action/die/death_17.wav",
					"vj_piv/l4d_common/action/die/death_17.wav",
					"vj_piv/l4d_common/action/die/death_19.wav",
					"vj_piv/l4d_common/action/die/death_22.wav",
					"vj_piv/l4d_common/action/die/death_23.wav",
					"vj_piv/l4d_common/action/die/death_24.wav",
					"vj_piv/l4d_common/action/die/death_25.wav",
					"vj_piv/l4d_common/action/die/death_26.wav",
					"vj_piv/l4d_common/action/die/death_27.wav",
					"vj_piv/l4d_common/action/die/death_28.wav",
					"vj_piv/l4d_common/action/die/death_29.wav",
					"vj_piv/l4d_common/action/die/death_30.wav",
					"vj_piv/l4d_common/action/die/death_32.wav",
					"vj_piv/l4d_common/action/die/death_33.wav",
					"vj_piv/l4d_common/action/die/death_34.wav",
					"vj_piv/l4d_common/action/die/death_35.wav",
					"vj_piv/l4d_common/action/die/death_35.wav",
					"vj_piv/l4d_common/action/die/death_37.wav",
					"vj_piv/l4d_common/action/die/death_38.wav",
					"vj_piv/l4d_common/action/die/male/death_40.wav",
					"vj_piv/l4d_common/action/die/male/death_41.wav",
					"vj_piv/l4d_common/action/die/male/death_42.wav",
					"vj_piv/l4d_common/action/die/male/death_43.wav",
					"vj_piv/l4d_common/action/die/male/death_44.wav",
					"vj_piv/l4d_common/action/die/male/death_45.wav",
					"vj_piv/l4d_common/action/die/male/death_46.wav",
					"vj_piv/l4d_common/action/die/male/death_47.wav",
					"vj_piv/l4d_common/action/die/male/death_48.wav",
					"vj_piv/l4d_common/action/die/male/death_49.wav",
					"vj_piv/l4d_common/action/die/mp/squeal_1.wav",
					"vj_piv/l4d_common/action/die/mp/squeal_2.wav",
					"vj_piv/l4d_common/action/die/mp/squeal_3.wav",
					"vj_piv/l4d_common/action/ignite/male/ignite10.wav",
					"vj_piv/l4d_common/action/ignite/male/ignite11.wav",
					"vj_piv/l4d_common/action/ignite/male/ignite12.wav",
					"vj_piv/l4d_common/action/ignite/male/ignite13.wav",
					"vj_piv/l4d_common/action/ignite/male/ignite14.wav"
				}
			elseif self.Voice == 4 then
				local ContagionVoice = math.random(1,4)
				if ContagionVoice == 1 then
				   self.SoundTbl_Idle = {"vj_piv/contagion/z_sham/shared/0245.wav","vj_piv/contagion/z_sham/shared/0244.wav","vj_piv/contagion/z_sham/idle/0128.wav","vj_piv/contagion/z_sham/idle/0123.wav","vj_piv/contagion/z_sham/idle/0122.wav","vj_piv/contagion/z_sham/idle/0121.wav","vj_piv/contagion/z_sham/idle/0120.wav","vj_piv/contagion/z_sham/idle/0119.wav","vj_piv/contagion/z_sham/idle/0118.wav","vj_piv/contagion/z_sham/idle/0117.wav","vj_piv/contagion/z_sham/idle/0116.wav","vj_piv/contagion/z_sham/idle/0115.wav","vj_piv/contagion/z_sham/idle/0114.wav","vj_piv/contagion/z_sham/idle/0113.wav","vj_piv/contagion/z_sham/idle/0112.wav","vj_piv/contagion/z_sham/idle/0111.wav","vj_piv/contagion/z_sham/idle/0110.wav","vj_piv/contagion/z_sham/idle/0109.wav","vj_piv/contagion/z_sham/idle/0108.wav","vj_piv/contagion/z_sham/idle/0107.wav","vj_piv/contagion/z_sham/idle/0106.wav","vj_piv/contagion/z_sham/idle/0105.wav","vj_piv/contagion/z_sham/idle/0104.wav","vj_piv/contagion/z_sham/idle/0103.wav","vj_piv/contagion/z_sham/idle/0102.wav","vj_piv/contagion/z_sham/idle/0101.wav","vj_piv/contagion/z_sham/idle/0100.wav","vj_piv/contagion/z_sham/idle/0099.wav","vj_piv/contagion/z_sham/idle/0098.wav","vj_piv/contagion/z_sham/idle/0097.wav","vj_piv/contagion/z_sham/idle/0096.wav","vj_piv/contagion/z_sham/idle/0095.wav","vj_piv/contagion/z_sham/idle/0094.wav","vj_piv/contagion/z_sham/idle/0093.wav","vj_piv/contagion/z_sham/idle/0092.wav","vj_piv/contagion/z_sham/idle/0091.wav","vj_piv/contagion/z_sham/idle/0090.wav","vj_piv/contagion/z_sham/idle/0089.wav","vj_piv/contagion/z_sham/idle/0088.wav","vj_piv/contagion/z_sham/idle/0087.wav","vj_piv/contagion/z_sham/idle/0086.wav","vj_piv/contagion/z_sham/idle/0085.wav","vj_piv/contagion/z_sham/idle/0084.wav","vj_piv/contagion/z_sham/idle/0083.wav","vj_piv/contagion/z_sham/idle/0082.wav","vj_piv/contagion/z_sham/idle/0081.wav","vj_piv/contagion/z_sham/idle/0080.wav","vj_piv/contagion/z_sham/idle/0079.wav","vj_piv/contagion/z_sham/idle/0077.wav","vj_piv/contagion/z_sham/idle/0076.wav"}
				   self.SoundTbl_Alert = {"vj_piv/contagion/z_sham/alert/0170.wav","vj_piv/contagion/z_sham/alert/0169.wav","vj_piv/contagion/z_sham/alert/0168.wav","vj_piv/contagion/z_sham/alert/0167.wav","vj_piv/contagion/z_sham/alert/0166.wav","vj_piv/contagion/z_sham/alert/0165.wav","vj_piv/contagion/z_sham/alert/0164.wav","vj_piv/contagion/z_sham/alert/0163.wav","vj_piv/contagion/z_sham/alert/0162.wav","vj_piv/contagion/z_sham/alert/0161.wav","vj_piv/contagion/z_sham/alert/0152.wav","vj_piv/contagion/z_sham/alert/0061.wav","vj_piv/contagion/z_sham/alert/0060.wav","vj_piv/contagion/z_sham/alert/0058.wav","vj_piv/contagion/z_sham/alert/0056.wav","vj_piv/contagion/z_sham/alert/0030.wav","vj_piv/contagion/z_sham/alert/0029.wav","vj_piv/contagion/z_sham/alert/0028.wav","vj_piv/contagion/z_sham/alert/0027.wav","vj_piv/contagion/z_sham/alert/0026.wav","vj_piv/contagion/z_sham/alert/0025.wav","vj_piv/contagion/z_sham/alert/0023.wav","vj_piv/contagion/z_sham/alert/0022.wav","vj_piv/contagion/z_sham/alert/0021.wav","vj_piv/contagion/z_arne/alert/0207.wav"}
				   self.SoundTbl_CallForHelp = {"vj_piv/contagion/z_sham/roar/0075.wav","vj_piv/contagion/z_sham/roar/0074.wav","vj_piv/contagion/z_sham/roar/0073.wav","vj_piv/contagion/z_sham/roar/0072.wav","vj_piv/contagion/z_sham/roar/0071.wav","vj_piv/contagion/z_sham/roar/0070.wav"}
				   self.SoundTbl_CombatIdle = {"vj_piv/contagion/z_sham/spot_player/0178.wav","vj_piv/contagion/z_sham/spot_player/0173.wav","vj_piv/contagion/z_sham/spot_player/0159.wav","vj_piv/contagion/z_sham/spot_player/0158.wav","vj_piv/contagion/z_sham/spot_player/0157.wav","vj_piv/contagion/z_sham/spot_player/0156.wav","vj_piv/contagion/z_sham/spot_player/0155.wav","vj_piv/contagion/z_sham/spot_player/0153.wav","vj_piv/contagion/z_sham/spot_player/0145.wav","vj_piv/contagion/z_sham/spot_player/0134.wav","vj_piv/contagion/z_sham/spot_player/0059.wav","vj_piv/contagion/z_sham/spot_player/0055.wav","vj_piv/contagion/z_sham/spot_player/0054.wav","vj_piv/contagion/z_sham/spot_player/0018.wav","vj_piv/contagion/z_sham/spot_player/0017.wav","vj_piv/contagion/z_sham/spot_player/0016.wav","vj_piv/contagion/z_sham/spot_player/0015.wav","vj_piv/contagion/z_sham/spot_player/0014.wav","","vj_piv/contagion/z_sham/spot_player/0013.wav","vj_piv/contagion/z_sham/spot_player/0003.wav","vj_piv/contagion/z_sham/spot_player/0002.wav","vj_piv/contagion/z_sham/spot_player/0001.wav"}
				   self.SoundTbl_BeforeMeleeAttack = {"vj_piv/contagion/z_sham/attacking/0053.wav","vj_piv/contagion/z_sham/attacking/0052.wav","vj_piv/contagion/z_sham/attacking/0051.wav","vj_piv/contagion/z_sham/attacking/0050.wav","vj_piv/contagion/z_sham/attacking/0049.wav","vj_piv/contagion/z_sham/attacking/0048.wav","vj_piv/contagion/z_sham/attacking/0047.wav","vj_piv/contagion/z_sham/attacking/0045.wav","vj_piv/contagion/z_sham/attacking/0044.wav","vj_piv/contagion/z_sham/attacking/0043.wav","vj_piv/contagion/z_sham/attacking/0042.wav","vj_piv/contagion/z_sham/attacking/0041.wav","vj_piv/contagion/z_sham/attacking/0040.wav","vj_piv/contagion/z_sham/attacking/0039.wav","vj_piv/contagion/z_sham/attacking/0038.wav","vj_piv/contagion/z_sham/attacking/0037.wav","vj_piv/contagion/z_sham/attacking/0036.wav","vj_piv/contagion/z_sham/attacking/0034.wav","vj_piv/contagion/z_sham/attacking/0033.wav"}
				   self.SoundTbl_Pain = {"vj_piv/contagion/z_sham/shared/0187.wav","vj_piv/contagion/z_sham/shared/0186.wav","vj_piv/contagion/z_sham/shared/0185.wav","vj_piv/contagion/z_sham/shared/0184.wav","vj_piv/contagion/z_sham/shared/0183.wav","vj_piv/contagion/z_sham/shared/0182.wav","vj_piv/contagion/z_sham/shared/0181.wav","vj_piv/contagion/z_sham/shared/0180.wav","vj_piv/contagion/z_sham/shared/0179.wav","vj_piv/contagion/z_sham/shared/0177.wav","vj_piv/contagion/z_sham/shared/0176.wav","vj_piv/contagion/z_sham/shared/0175.wav","vj_piv/contagion/z_sham/shared/0174.wav","vj_piv/contagion/z_sham/shared/0174.wav"}
				   self.SoundTbl_Death = {"vj_piv/contagion/z_sham/death/0032.wav"}
				elseif ContagionVoice == 2 then
				   self.SoundTbl_Idle = {"vj_piv/contagion/z_arne/idle/0219.wav","vj_piv/contagion/z_arne/idle/0220.wav","vj_piv/contagion/z_arne/idle/0221.wav","vj_piv/contagion/z_arne/idle/0243.wav","vj_piv/contagion/z_arne/idle/0246.wav","vj_piv/contagion/z_arne/idle/0247.wav","vj_piv/contagion/z_arne/idle/0248.wav","vj_piv/contagion/z_arne/idle/0249.wav","vj_piv/contagion/z_arne/idle/0250.wav","vj_piv/contagion/z_arne/idle/0251.wav","vj_piv/contagion/z_arne/idle/0252.wav","vj_piv/contagion/z_arne/idle/0253.wav","vj_piv/contagion/z_arne/idle/0254.wav","vj_piv/contagion/z_arne/idle/0255.wav"}
				   self.SoundTbl_Alert = {"vj_piv/contagion/z_arne/alert/0208.wav","vj_piv/contagion/z_arne/alert/0209.wav","vj_piv/contagion/z_arne/alert/0210.wav","vj_piv/contagion/z_arne/alert/0211.wav","vj_piv/contagion/z_arne/alert/0212.wav","vj_piv/contagion/z_arne/alert/0213.wav","vj_piv/contagion/z_arne/alert/0214.wav","vj_piv/contagion/z_arne/alert/0215.wav","vj_piv/contagion/z_arne/alert/0216.wav","vj_piv/contagion/z_arne/alert/0217.wav","vj_piv/contagion/z_arne/alert/0218.wav"}
				   self.SoundTbl_CallForHelp = {"vj_piv/contagion/z_arne/alert/0208.wav","vj_piv/contagion/z_arne/alert/0209.wav","vj_piv/contagion/z_arne/alert/0210.wav","vj_piv/contagion/z_arne/alert/0211.wav","vj_piv/contagion/z_arne/alert/0212.wav","vj_piv/contagion/z_arne/alert/0213.wav","vj_piv/contagion/z_arne/alert/0214.wav","vj_piv/contagion/z_arne/alert/0215.wav","vj_piv/contagion/z_arne/alert/0216.wav","vj_piv/contagion/z_arne/alert/0217.wav","vj_piv/contagion/z_arne/alert/0218.wav"}
				   self.SoundTbl_BeforeMeleeAttack = {"vj_piv/contagion/z_arne/attack/0226.wav","vj_piv/contagion/z_arne/attack/0227.wav","vj_piv/contagion/z_arne/attack/0229.wav","vj_piv/contagion/z_arne/attack/0231.wav","vj_piv/contagion/z_arne/attack/0233.wav","vj_piv/contagion/z_arne/attack/0234.wav","vj_piv/contagion/z_arne/attack/0235.wav","vj_piv/contagion/z_arne/attack/0236.wav","vj_piv/contagion/z_arne/attack/0238.wav","vj_piv/contagion/z_arne/attack/0239.wav","vj_piv/contagion/z_arne/attack/0240.wav","vj_piv/contagion/z_arne/attack/0241.wav","vj_piv/contagion/z_arne/attack/0256.wav"}
				   self.SoundTbl_Pain = {"vj_piv/contagion/z_sham/pain/0148.wav","vj_piv/contagion/z_sham/pain/0149.wav","vj_piv/contagion/z_sham/pain/0147.wav","vj_piv/contagion/z_sham/pain/0146.wav","vj_piv/contagion/z_sham/pain/0143.wav","vj_piv/contagion/z_sham/pain/0141.wav","vj_piv/contagion/z_sham/pain/0140.wav","vj_piv/contagion/z_sham/pain/0139.wav","vj_piv/contagion/z_sham/pain/0138.wav","vj_piv/contagion/z_sham/pain/0137.wav","vj_piv/contagion/z_sham/pain/0136.wav","vj_piv/contagion/z_sham/pain/0135.wav","vj_piv/contagion/z_sham/pain/0133.wav","vj_piv/contagion/z_sham/pain/0132.wav","vj_piv/contagion/z_sham/pain/0131.wav","vj_piv/contagion/z_sham/pain/0130.wav","vj_piv/contagion/z_sham/pain/0129.wav","vj_piv/contagion/z_sham/pain/0127.wav","vj_piv/contagion/z_sham/pain/0126.wav","vj_piv/contagion/z_sham/pain/0125.wav","vj_piv/contagion/z_sham/pain/0124.wav","vj_piv/contagion/z_sham/pain/0069.wav","vj_piv/contagion/z_sham/pain/0066.wav","vj_piv/contagion/z_sham/pain/0065.wav","vj_piv/contagion/z_sham/pain/0064.wav","vj_piv/contagion/z_sham/pain/0063.wav","vj_piv/contagion/z_sham/pain/0062.wav"}
				   self.SoundTbl_Death = {"vj_piv/contagion/z_arne/die/0223.wav","vj_piv/contagion/z_arne/die/0224.wav","vj_piv/contagion/z_arne/die/0225.wav"}
				elseif ContagionVoice == 3 then
				   self.SoundTbl_Idle = {"vj_piv/contagion/growler/zombie_voice_shared-1.wav","vj_piv/contagion/growler/zombie_voice_shared-10.wav","vj_piv/contagion/growler/zombie_voice_shared-12.wav","vj_piv/contagion/growler/zombie_voice_shared-13.wav","vj_piv/contagion/growler/zombie_voice_shared-14.wav","vj_piv/contagion/growler/zombie_voice_shared-2.wav","vj_piv/contagion/growler/zombie_voice_shared-3.wav","vj_piv/contagion/growler/zombie_voice_shared-4.wav","vj_piv/contagion/growler/zombie_voice_shared-5.wav","vj_piv/contagion/growler/zombie_voice_shared-6.wav","vj_piv/contagion/growler/zombie_voice_shared-7.wav","vj_piv/contagion/growler/zombie_voice_shared-8.wav","vj_piv/contagion/growler/zombie_voice_shared-9.wav"}
				   self.SoundTbl_Alert = {"vj_piv/contagion/growler/zombie_voice_alert-1.wav","vj_piv/contagion/growler/zombie_voice_alert-2.wav","vj_piv/contagion/growler/zombie_voice_alert-3.wav","vj_piv/contagion/growler/zombie_voice_alert-4.wav"}
				   self.SoundTbl_CallForHelp = {"vj_piv/contagion/growler/zombie_voice_alert-1.wav","vj_piv/contagion/growler/zombie_voice_alert-2.wav","vj_piv/contagion/growler/zombie_voice_alert-3.wav","vj_piv/contagion/growler/zombie_voice_alert-4.wav"}
				   self.SoundTbl_BeforeMeleeAttack = {"vj_piv/contagion/growler/zombie_voice_shared-1.wav","vj_piv/contagion/growler/zombie_voice_shared-10.wav","vj_piv/contagion/growler/zombie_voice_shared-12.wav","vj_piv/contagion/growler/zombie_voice_shared-13.wav","vj_piv/contagion/growler/zombie_voice_shared-14.wav","vj_piv/contagion/growler/zombie_voice_shared-2.wav","vj_piv/contagion/growler/zombie_voice_shared-3.wav","vj_piv/contagion/growler/zombie_voice_shared-4.wav","vj_piv/contagion/growler/zombie_voice_shared-5.wav","vj_piv/contagion/growler/zombie_voice_shared-6.wav","vj_piv/contagion/growler/zombie_voice_shared-7.wav","vj_piv/contagion/growler/zombie_voice_shared-8.wav","vj_piv/contagion/growler/zombie_voice_shared-9.wav"}
				   self.SoundTbl_Pain = {"vj_piv/contagion/z_sham/pain/0148.wav","vj_piv/contagion/z_sham/pain/0149.wav","vj_piv/contagion/z_sham/pain/0147.wav","vj_piv/contagion/z_sham/pain/0146.wav","vj_piv/contagion/z_sham/pain/0143.wav","vj_piv/contagion/z_sham/pain/0141.wav","vj_piv/contagion/z_sham/pain/0140.wav","vj_piv/contagion/z_sham/pain/0139.wav","vj_piv/contagion/z_sham/pain/0138.wav","vj_piv/contagion/z_sham/pain/0137.wav","vj_piv/contagion/z_sham/pain/0136.wav","vj_piv/contagion/z_sham/pain/0135.wav","vj_piv/contagion/z_sham/pain/0133.wav","vj_piv/contagion/z_sham/pain/0132.wav","vj_piv/contagion/z_sham/pain/0131.wav","vj_piv/contagion/z_sham/pain/0130.wav","vj_piv/contagion/z_sham/pain/0129.wav","vj_piv/contagion/z_sham/pain/0127.wav","vj_piv/contagion/z_sham/pain/0126.wav","vj_piv/contagion/z_sham/pain/0125.wav","vj_piv/contagion/z_sham/pain/0124.wav","vj_piv/contagion/z_sham/pain/0069.wav","vj_piv/contagion/z_sham/pain/0066.wav","vj_piv/contagion/z_sham/pain/0065.wav","vj_piv/contagion/z_sham/pain/0064.wav","vj_piv/contagion/z_sham/pain/0063.wav","vj_piv/contagion/z_sham/pain/0062.wav"}
				   self.SoundTbl_Death = {"vj_piv/contagion/z_arne/die/0223.wav","vj_piv/contagion/z_arne/die/0224.wav","vj_piv/contagion/z_arne/die/0225.wav"}
				elseif ContagionVoice == 4 then
				   self.SoundTbl_Idle = {"vj_piv/contagion/oldman/zombie_voice_shared-1.wav","vj_piv/contagion/oldman/zombie_voice_shared-2.wav","vj_piv/contagion/oldman/zombie_voice_shared-3.wav","vj_piv/contagion/oldman/zombie_voice_shared-4.wav","vj_piv/contagion/oldman/zombie_voice_shared-5.wav","vj_piv/contagion/oldman/zombie_voice_shared-6.wav","vj_piv/contagion/oldman/zombie_voice_shared-7.wav","vj_piv/contagion/oldman/zombie_voice_shared-8.wav","vj_piv/contagion/oldman/zombie_voice_shared-9.wav"}
				   self.SoundTbl_Alert = {"vj_piv/contagion/oldman/zombie_voice_shared-1.wav","vj_piv/contagion/oldman/zombie_voice_shared-2.wav","vj_piv/contagion/oldman/zombie_voice_shared-3.wav","vj_piv/contagion/oldman/zombie_voice_shared-4.wav","vj_piv/contagion/oldman/zombie_voice_shared-5.wav","vj_piv/contagion/oldman/zombie_voice_shared-6.wav","vj_piv/contagion/oldman/zombie_voice_shared-7.wav","vj_piv/contagion/oldman/zombie_voice_shared-8.wav","vj_piv/contagion/oldman/zombie_voice_shared-9.wav"}
				   self.SoundTbl_CallForHelp = {"vj_piv/contagion/oldman/zombie_voice_shared-1.wav","vj_piv/contagion/oldman/zombie_voice_shared-2.wav","vj_piv/contagion/oldman/zombie_voice_shared-3.wav","vj_piv/contagion/oldman/zombie_voice_shared-4.wav","vj_piv/contagion/oldman/zombie_voice_shared-5.wav","vj_piv/contagion/oldman/zombie_voice_shared-6.wav","vj_piv/contagion/oldman/zombie_voice_shared-7.wav","vj_piv/contagion/oldman/zombie_voice_shared-8.wav","vj_piv/contagion/oldman/zombie_voice_shared-9.wav"}
				   self.SoundTbl_BeforeMeleeAttack = {"vj_piv/contagion/oldman/zombie_voice_shared-1.wav","vj_piv/contagion/oldman/zombie_voice_shared-2.wav","vj_piv/contagion/oldman/zombie_voice_shared-3.wav","vj_piv/contagion/oldman/zombie_voice_shared-4.wav","vj_piv/contagion/oldman/zombie_voice_shared-5.wav","vj_piv/contagion/oldman/zombie_voice_shared-6.wav","vj_piv/contagion/oldman/zombie_voice_shared-7.wav","vj_piv/contagion/oldman/zombie_voice_shared-8.wav","vj_piv/contagion/oldman/zombie_voice_shared-9.wav"}
				   self.SoundTbl_Pain = {"vj_piv/contagion/z_sham/pain/0148.wav","vj_piv/contagion/z_sham/pain/0149.wav","vj_piv/contagion/z_sham/pain/0147.wav","vj_piv/contagion/z_sham/pain/0146.wav","vj_piv/contagion/z_sham/pain/0143.wav","vj_piv/contagion/z_sham/pain/0141.wav","vj_piv/contagion/z_sham/pain/0140.wav","vj_piv/contagion/z_sham/pain/0139.wav","vj_piv/contagion/z_sham/pain/0138.wav","vj_piv/contagion/z_sham/pain/0137.wav","vj_piv/contagion/z_sham/pain/0136.wav","vj_piv/contagion/z_sham/pain/0135.wav","vj_piv/contagion/z_sham/pain/0133.wav","vj_piv/contagion/z_sham/pain/0132.wav","vj_piv/contagion/z_sham/pain/0131.wav","vj_piv/contagion/z_sham/pain/0130.wav","vj_piv/contagion/z_sham/pain/0129.wav","vj_piv/contagion/z_sham/pain/0127.wav","vj_piv/contagion/z_sham/pain/0126.wav","vj_piv/contagion/z_sham/pain/0125.wav","vj_piv/contagion/z_sham/pain/0124.wav","vj_piv/contagion/z_sham/pain/0069.wav","vj_piv/contagion/z_sham/pain/0066.wav","vj_piv/contagion/z_sham/pain/0065.wav","vj_piv/contagion/z_sham/pain/0064.wav","vj_piv/contagion/z_sham/pain/0063.wav","vj_piv/contagion/z_sham/pain/0062.wav"}
				   self.SoundTbl_Death = {"vj_piv/contagion/z_arne/die/0222.wav","vj_piv/contagion/z_arne/die/0223.wav","vj_piv/contagion/z_arne/die/0224.wav","vj_piv/contagion/z_arne/die/0225.wav"}
				end
			end
		end
	end
end
--------------------
function ENT:Zombie_GiveVoice()
	self:Zombie_GiveVoice_Default() -- just give them a default voice pack if they don't use this function
end
--------------------
function ENT:Init()
	self:Zombie_CustomOnInitialize()
	self:Zombie_GiveVoice()
end
--------------------
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
--------------------
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
--------------------
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
--------------------
function ENT:OnFootstepSound(moveType, sdFile)
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
--------------------
-- is this necessary?
-- function ENT:FootStepSoundCode(CustomTbl)
	-- if self.HasSounds == false or self.HasFootStepSound == false or self.MovementType == VJ_MOVETYPE_STATIONARY then return end
	-- if self:IsOnGround() && self:GetGroundEntity() != NULL then
		-- if self.DisableFootStepSoundTimer == true then
			-- self:OnFootstepSound()
			-- return
		-- elseif self:IsMoving() && CurTime() > self.FootStepT then
			-- self:OnFootstepSound()
			-- local CurSched = self.CurrentSchedule
			-- if
				-- self.DisableFootStepOnRun == false &&
				-- ((VJ.HasValue(self.AnimTbl_Run,self:GetMovementActivity())) or
				-- (CurSched != nil  && CurSched.IsMovingTask_Run == true))
			-- then

				-- self:CustomOnFootStepSound_Run()
				-- self.FootStepT = CurTime() + self.FootStepTimeRun
				-- return

			-- elseif 
				-- self.DisableFootStepOnWalk == false &&
				-- (VJ.HasValue(self.AnimTbl_Walk,self:GetMovementActivity()) or
				-- (CurSched != nil  && CurSched.IsMovingTask_Walk == true))
			-- then
				-- self:CustomOnFootStepSound_Walk()
				-- self.FootStepT = CurTime() + self.FootStepTimeWalk
				-- return
			-- end
		-- end
	-- end
-- end
--------------------
function ENT:OnInput(key,activator,caller,data)

	if key == "step" then
		self:FootStepSoundCode()

	    if self.PIV_IsHugeZombie == true then
			if self.PIV_Tank then
				util.ScreenShake(self:GetPos(), 2, 5, 1, 1000)
				VJ.EmitSound(self, "vj_piv/tank/step_"..math.random(1,5)..".wav", 75, 100)
			else
				if self.PIV_HasArmor then
					VJ.EmitSound(self, "vj_piv/demolisher/step/step_"..math.random(1,4)..".mp3", 75, 100)
				end
				util.ScreenShake(self:GetPos(), 1, 5, 1, 1000)
				VJ.EmitSound(self, "vj_piv/charger_run_left_0"..math.random(1,4)..".wav", 70, 100)
			end
		else
			if self.PIV_HasArmor then
				VJ.EmitSound(self, "vj_piv/mil_zomb/step_"..math.random(1,4)..".mp3", 75, 100)
			end
			if self.PIV_IsZombine then
				VJ.EmitSound(self, "npc/combine_soldier/gear"..math.random(1,6)..".wav", 70, 100)
			end
			if self.PIV_IsMetropolice then
				VJ.EmitSound(self, "npc/metropolice/gear"..math.random(1,6)..".wav", 70, 100)
			end
			if self.PIV_IsMilitary == true then
				VJ.EmitSound(self, "vj_piv/mil_zomb/gear"..math.random(1,6)..".wav", 70, 100)
			end
			if self.PIV_IsHEV == true then
				VJ.EmitSound(self, "physics/metal/metal_box_footstep"..math.random(1,4)..".wav", 70, 100)
			end		
		end
		if self:GetClass() == "npc_vj_piv_phorid" then
			VJ.EmitSound(self, "vj_piv/phorid/brut_fs_walk_heel_01_"..math.random(0,20)..".wav", 70, 100)
		end
	end

	if key == "slide" || key == "crawl" then
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
			if self.PIV_HasArmor then
				VJ.EmitSound(self, "vj_piv/demolisher/step/step_"..math.random(1,4)..".mp3", 70, 80)
			end
		else
			if self.PIV_HasArmor then
				VJ.EmitSound(self, "vj_piv/mil_zomb/step_"..math.random(1,4)..".mp3", 70, 80)
			end
			if self.PIV_IsZombine then
				VJ.EmitSound(self, "npc/combine_soldier/gear"..math.random(1,6)..".wav", 70, 80)
			end
			if self.PIV_IsMetropolice == true then
				VJ.EmitSound(self, "npc/metropolice/gear"..math.random(1,6)..".wav", 70, 80)
			end
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
--------------------
-- function ENT:CustomOnIsJumpLegal(startPos, apex, endPos) -- this function doesn't exist, just make it so they can't jump at all
	-- if self.PIV_Crippled or self.PIV_FuckingCrawlingLittleCunt then
		-- return false
	-- end
-- end
--------------------
function ENT:StandTheFuckUp()
	if self.PIV_GoblinMode == true then
		self.NextCrawlT = CurTime() + math.random(5,10)
		self.HasIdleSounds = true
		self.HasAlertSounds = true		
		local stop = VJ.PICK({"vjseq_crouch_to_stand"})
		self:VJ_ACT_PLAYACTIVITY(stop,true,VJ.AnimDuration(self,tbl),false)
		self.PIV_GoblinMode = false
	end
end
--------------------
function ENT:SitTheFuckDown()
	if self.PIV_GoblinMode == false then
		self.HasIdleSounds = false
		self.HasAlertSounds = false
		local start = VJ.PICK({"vjseq_stand_to_crouch"})
		self:VJ_ACT_PLAYACTIVITY(start,true,VJ.AnimDuration(self,tbl),false)
		self.PIV_GoblinMode = true
	end
end
--------------------
function ENT:OnThink()

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
--------------------
function ENT:Zombie_CustomOnThink()
end
--------------------
function ENT:OnThinkActive()

	self:Zombie_CustomOnThink_AIEnabled()

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
end
--------------------
function ENT:Zombie_CustomOnThink_AIEnabled() end
--------------------
function ENT:TranslateActivity(act)

	if self.PIV_UseActIdleStimulated && act == ACT_IDLE && !self.PIV_WeHaveAWeapon && !self.PIV_Crippled && !self.PIV_FuckingCrawlingLittleCunt then
		return ACT_IDLE_AIM_STIMULATED
	end

	if self.PIV_IsRunner then
		if
			act == ACT_IDLE &&
			GetConVar("vj_piv_classic_animations"):GetInt() == 0 &&
			!self.PIV_WeHaveAWeapon &&
			!self.PIV_Crippled &&
			!self.PIV_FuckingCrawlingLittleCunt &&
			!self.PIV_Rusher &&
			-- maybe add a value like ENT.PIV_UseOnFireIdles or something so we don't need all these GetClass checks
			self:GetClass() != "npc_vj_piv_shocker" &&
			self:GetClass() != "npc_vj_piv_creep" && 
			self:GetClass() != "npc_vj_piv_shikari" &&
			self:GetClass() != "npc_vj_piv_shikari_torso" &&
			self:GetClass() != "npc_vj_piv_brawler" &&
			self:GetClass() != "npc_vj_piv_brawler" &&
			self:GetClass() != "npc_vj_piv_brawler_boss" &&
			self:GetClass() != "npc_vj_piv_sickler" then
			return ACT_IDLE_ON_FIRE
		end
		if act == ACT_IDLE && self.PIV_Rusher && self:GetClass() != "npc_vj_piv_creep" then
			return ACT_IDLE_AIM_STEALTH
		end
		if act == ACT_WALK then
			if GetConVar("vj_piv_classic_animations"):GetInt() == 0 then
				return ACT_WALK_ON_FIRE
			end
		end
		if act == ACT_RUN then
			if self.PIV_Super_Sprinter then
				return ACT_RUN_AIM
			elseif self.PIV_Rusher then
				return ACT_RUN_RELAXED
			else
				return ACT_SPRINT
			end
		end
	else
		if
			act == ACT_IDLE &&
			!self.PIV_WeHaveAWeapon &&
			!self.PIV_Crippled &&
			!self.PIV_FuckingCrawlingLittleCunt &&
			!self.PIV_Shambler &&
			GetConVar("vj_piv_classic_animations"):GetInt() == 0 &&
			-- maybe add a value like ENT.PIV_UseRelaxedIdles or something so we don't need all these GetClass checks
			self:GetClass() != "npc_vj_piv_panzer" &&
			self:GetClass() != "npc_vj_piv_panzer_boss" &&
			self:GetClass() != "npc_vj_piv_husk" &&
			self:GetClass() != "npc_vj_piv_husk_f" &&
			self:GetClass() != "npc_vj_piv_husk_torso" &&
			self:GetClass() != "npc_vj_piv_husk_torso_f" &&
			self:GetClass() != "npc_vj_piv_virulent" &&
			self:GetClass() != "npc_vj_piv_exploder" &&
			self:GetClass() != "npc_vj_piv_cremator"
		then
			return ACT_IDLE_RELAXED
		end
		if act == ACT_RUN && !self.PIV_Jogger && !self.Running then
			return ACT_WALK
		elseif act == ACT_RUN && self.Running && self:GetClass() == "npc_vj_piv_phorid" then
			return ACT_RUN_AIM
		end
	end

	if self.PIV_IsAquatic && self:WaterLevel() > 2 && self:WaterLevel() < 12 && !self.PIV_Crippled && !self.PIV_FuckingCrawlingLittleCunt then
		if act == ACT_IDLE or act == ACT_IDLE_AIM_STEALTH or act == ACT_IDLE_ON_FIRE or act == ACT_IDLE_RELAXED then
			return ACT_HL2MP_SWIM_IDLE
		end
	end

	if act == ACT_WALK && !self.Alerted && GetConVar("vj_piv_classic_animations"):GetInt() == 0 then
		return ACT_WALK_AIM_STEALTH
	end

	if self.PIV_WeHaveAWeapon && self.PIV_WeaponType == 2  then
		if act == ACT_IDLE or act == ACT_IDLE_AIM_STEALTH or act == ACT_IDLE_ON_FIRE or act == ACT_IDLE_AIM_RELAXED or act == ACT_IDLE_RELAXED then
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
			if act == ACT_WALK or act == ACT_WALK_AIM_STEALTH or act == ACT_WALK_ON_FIRE then
				return ACT_HL2MP_WALK_MELEE
			end
			if act == ACT_RUN or act == ACT_SPRINT then
				return ACT_HL2MP_RUN_MELEE
			end
		end
	end

	if self.PIV_HasShield then
		if act == ACT_IDLE or act == ACT_IDLE_AIM_RELAXED or act == ACT_IDLE_RELAXED or act == ACT_IDLE_AIM_STEALTH or act == ACT_IDLE_ON_FIRE then
			return ACT_IDLE_AIM_AGITATED
		end
		if act == ACT_WALK or act == ACT_WALK_RELAXED or act == ACT_WALK_AIM_STEALTH or act == ACT_WALK_AIM_STEALTH or act == ACT_WALK_ON_FIRE then
			return ACT_WALK_AIM_AGITATED
		end
		if act == ACT_RUN or act == ACT_WALK_ANGRY or act == ACT_SPRINT or act == ACT_RUN_AIM or act == ACT_RUN_RELAXED then
			return ACT_WALK_AIM_AGITATED
		end
	end

	if self.PIV_GoblinMode then
		if self:GetClass() == "npc_vj_piv_creep" then
			if act == ACT_IDLE or act == ACT_IDLE_AIM_STEALTH or act == ACT_IDLE_ON_FIRE then
				return ACT_CROUCHIDLE
			end
			if act == ACT_WALK or act == ACT_WALK_AIM_STEALTH or act == ACT_WALK_ON_FIRE then
				return ACT_WALK_CROUCH_AIM
			end
			if act == ACT_RUN or act == ACT_SPRINT or act == ACT_RUN_AIM or act == ACT_RUN_RELAXED then
				return ACT_RUN_STEALTH
			end
		else
			if act == ACT_IDLE or act == ACT_IDLE_AIM_RELAXED or act == ACT_IDLE_RELAXED or act == ACT_IDLE_AIM_STEALTH or act == ACT_IDLE_ON_FIRE then
				return ACT_CROUCHIDLE_STIMULATED
			end			
			if self.PIV_IsRunner then
				if act == ACT_RUN or act == ACT_SPRINT or act == ACT_RUN_AIM or act == ACT_RUN_RELAXED then
					return ACT_RUN_CROUCH
				end	
			else
				if act == ACT_WALK or act == ACT_WALK_RELAXED or act == ACT_WALK_AIM_STEALTH or act == ACT_WALK_ANGRY or act == ACT_RUN or act == ACT_WALK_AIM_STEALTH or act == ACT_WALK_ON_FIRE then
					return ACT_WALK_CARRY
				end
			end
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
		if act == ACT_IDLE or act == ACT_IDLE_AIM_RELAXED or act == ACT_IDLE_AIM_STIMULATED or act == ACT_IDLE_AIM_STEALTH or act == ACT_IDLE_RELAXED or act == ACT_IDLE_AIM_STEALTH or act == ACT_IDLE_ON_FIRE then
			return ACT_BUSY_SIT_GROUND
		end
	elseif self.PIV_Resting == 2 then
		if act == ACT_IDLE or act == ACT_IDLE_AIM_RELAXED or act == ACT_IDLE_AIM_STIMULATED or act == ACT_IDLE_AIM_STEALTH or act == ACT_IDLE_RELAXED or act == ACT_IDLE_AIM_STEALTH or act == ACT_IDLE_ON_FIRE then
			return ACT_BUSY_LEAN_BACK
		end
	end

	if self.PIV_Crippled or self.PIV_FuckingCrawlingLittleCunt then
		if act == ACT_IDLE or act == ACT_IDLE_AIM_RELAXED or act == ACT_IDLE_AIM_STIMULATED or act == ACT_IDLE_RELAXED or act == ACT_IDLE_AIM_STEALTH or act == ACT_IDLE_ON_FIRE then
			return ACT_IDLE_STIMULATED
		end
		if act == ACT_WALK or act == ACT_WALK_RELAXED or act == ACT_WALK_AIM_STEALTH or act == ACT_WALK_AIM_STEALTH or act == ACT_WALK_ON_FIRE then
			return ACT_WALK_STIMULATED
		end
		if act == ACT_RUN or act == ACT_WALK_ANGRY or act == ACT_SPRINT then
			return ACT_WALK_STIMULATED
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

	if self:GetClass() == "npc_vj_piv_shocker" then
		if act == ACT_IDLE then
			return ACT_IDLE_STEALTH
		end
		if act == ACT_WALK or act == ACT_WALK_ON_FIRE or act == ACT_WALK_AIM_STEALTH then
			return ACT_RUN_AIM
		end
	end

	if self:GetClass() == "npc_vj_piv_tank" then
		if act == ACT_RUN then
			return ACT_WALK
		end
		if self.Charging then
			if act == ACT_WALK or act == ACT_RUN or act == ACT_IDLE then
				return ACT_RUN_PROTECTED
			end
		end
	end

	if self:GetClass() == "npc_vj_piv_creep" then
		if act == ACT_IDLE or act == ACT_IDLE_AIM_STEALTH or act == ACT_IDLE_ON_FIRE then
			return ACT_IDLE_HURT
		end
	end
end
--------------------
function ENT:OnAlert(ent)
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
--------------------
function ENT:Zombie_CustomOnAlert()
	if
		GetConVar("vj_piv_alert_anim"):GetInt() == 1 &&
		self.PIV_Crippled == false &&
		self.PIV_FuckingCrawlingLittleCunt == false &&
		self.PIV_Resting == 0 &&
		self:GetSequence() != self:LookupSequence(ACT_OPEN_DOOR) &&
		!self.PIV_WeHaveAWeapon &&
		self.PIV_HasShield == false &&
		self.PIV_GoblinMode == true &&
		self:GetClass() != "npc_vj_piv_slammer" &&
		self:GetClass() != "npc_vj_piv_bruiser" &&
		self:GetClass() != "npc_vj_piv_exploder"
	then
		if math.random(1,GetConVar("vj_piv_alert_anim_chance"):GetInt()) == 1 then
			local tbl = VJ.PICK({"vjseq_nz_taunt_1","vjseq_nz_taunt_2","vjseq_nz_taunt_3","vjseq_nz_taunt_4","vjseq_nz_taunt_5","vjseq_nz_taunt_6","vjseq_nz_taunt_7","vjseq_nz_taunt_8","vjseq_nz_taunt_9","vjseq_stand_threaten_0"})
			self:VJ_ACT_PLAYACTIVITY(tbl,true,false,true)
		end
	end
end
--------------------
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
--------------------
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
--------------------
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
		
		self.AnimTbl_MeleeAttack = {"vjseq_crawl_attack"}
	return end

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

	else

		-- When Standing --
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

end
--------------------
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
--------------------
function ENT:MeleeAttackKnockbackVelocity(hitEnt)
	return self:GetForward()*math.random(140, 180) + self:GetUp()*math.random(60,80)
end
--------------------
function ENT:CustomOnMeleeAttack_Miss()
	-- why do we need this AttackType check?
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
--------------------
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 1000) + self:GetUp()*math.Rand(-30,30) + self:GetRight()*math.Rand(-40,40)
end
--------------------
function ENT:CustomOnRangeAttack_AfterStartTimer(seed)
	if self.PIV_Thrower == true then
		self.PIV_ThrowCount = self.PIV_ThrowCount -1
		if self.PIV_ThrowCount <= 0 then
			self.HasRangeAttack = false
		end
	end
end
--------------------
function ENT:DropTheFuckignWeaponGoddamn()

	if GetConVar("vj_piv_weapons_dropping"):GetInt() == 0 or self.PIV_WeHaveAWeapon == false then return end

	if IsValid(self.ExtraGunModel1) then
		self.PIV_WeHaveAWeapon = false
		self.MeleeAttackDamageType = DMG_CLUB
		self:CreateGibEntity("prop_physics",self.ExtraGunModel1:GetModel(),{Pos=self:GetAttachment(self:LookupAttachment("anim_attachment_RH")).Pos,Ang=self:GetAngles()}) self.ExtraGunModel1:SetMaterial("nodraw") self.ExtraGunModel1:DrawShadow(false) self.PIV_WeHaveAWeapon = false
		self.ExtraGunModel1:Remove()
	end

end
--------------------
function ENT:DropTheShield()

	if GetConVar("vj_piv_weapons_dropping"):GetInt() == 0 or !self.PIV_HasShield then return end

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
--------------------
function ENT:Cripple()
	self.PIV_Jogger = false
	self.PIV_Shambler = false
	self.PIV_Biter = false
	self.PIV_CanMutate = false
    self.FireRun = false
	self:DropTheFuckignWeaponGoddamn()
	self:DropTheShield()

	self.CanTurnWhileStationary = false
	self.CanFlinch = 0
	
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
--------------------
function ENT:Zombie_CustomOnTakeDamage_PreDamage(dmginfo,hitgroup) end
--------------------
function ENT:Zombie_CustomOnTakeDamage_PostDamage(dmginfo,hitgroup) end -- Just gonna leave this here incase it's used in the future.
--------------------
function ENT:OnDamaged(dmginfo,hitgroup,status)

	if status == "PreDamage" then
		if hitgroup == HITGROUP_HEAD && GetConVar("vj_piv_headshot_damage"):GetInt() == 1 && self.PIV_IsBoss == false then
			dmginfo:ScaleDamage(GetConVarNumber("vj_piv_headshot_damage_mult"))
		end
		-- have commons/non-specials take extra damage from explosives
		if
			!self.PIV_IsSpecial &&
			(
				dmginfo:IsExplosionDamage() or
				dmginfo:IsDamageType(DMG_BLAST_SURFACE) or
				dmginfo:IsDamageType(DMG_MISSILEDEFENSE) or
				dmginfo:IsDamageType(DMG_ALWAYSGIB)
			)
		then
			dmginfo:ScaleDamage(1.5)
		end
		self:Zombie_CustomOnTakeDamage_PreDamage(dmginfo,hitgroup)
	end

	if status == "PostDamage" then

		self:Zombie_CustomOnTakeDamage_PostDamage(dmginfo,hitgroup)

		-- Don't run any of this if "CanDoTheFunny" is false (what the hell does this do?), we're crippled, we're a crawler, we're raging, we're crawling on all fours, or we're a husk torso
		if !self.CanDoTheFunny or self.PIV_Crippled or self.PIV_FuckingCrawlingLittleCunt or self.Apeshit or self.PIV_GoblinMode or self:GetClass() == "npc_vj_piv_husk_torso" or self:GetClass() == "npc_vj_piv_husk_torso_f" then return end

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
end
--------------------
function ENT:OnFlinch(dmginfo,hitgroup,status)

	if status == "PriorExecution" then

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
		-- If we are stumbling or rising out of the ground or other specific activities then DO NOT flinch!	
		return !self.PIV_Crippled && !self.PIV_FuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH)
		end

	end

end
--------------------
function ENT:OnDeath(dmginfo, hitgroup, status)

	if status == "Initial" then
		self:DropTheFuckignWeaponGoddamn()
		self:DropTheShield()
		if self:IsOnFire() && !self.Immune_Fire then
			self.PIV_MakeCrispyCorpse = true
		end
	end

	if status == "DeathAnim" then
		if self:IsMoving() then
			-- We're Running
			if self:GetActivity() == ACT_SPRINT || self:GetActivity() == ACT_RUN_AIM || self:GetActivity() == ACT_RUN_RELAXED then
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
			else
			-- We're Walking
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

		if self:IsOnFire() && !self.Immune_Fire then -- When killed by fire damage
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

		-- disabled until it's fixed
		-- if
			-- dmginfo:IsDamageType(DMG_SHOCK)
			-- dmginfo:GetAttacker():IsPlayer()
			-- dmginfo:GetAttacker():GetActiveWeapon():GetClass() == "arc9_go_zeus" or
			-- dmginfo:GetAttacker():GetActiveWeapon():GetClass() == "arc9_go_akimbo_taser"
		-- then -- When killed by shock damage or a taser
		   -- self.AnimTbl_Death = {
				-- "vjseq_nz_death_elec_1",
				-- "vjseq_nz_death_elec_2",
				-- "vjseq_nz_death_elec_3",
				-- "vjseq_nz_death_elec_4",
				-- "vjseq_nz_death_elec_5"
			-- }
		-- end

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
end
--------------------
function ENT:Zombie_CustomOnCreateDeathCorpse(dmginfo, hitgroup, corpseEnt) end
--------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpseEnt)
	self:Zombie_CustomOnCreateDeathCorpse(dmginfo, hitgroup, corpseEnt)
	if GetConVar("vj_piv_burntexture"):GetInt() == 1 && self.PIV_MakeCrispyCorpse then
		corpseEnt:SetMaterial("models/vj_piv/shared/burning/burning")
		corpseEnt:SetKeyValue("rendercolor","255 255 255 255")
	end
end
--------------------