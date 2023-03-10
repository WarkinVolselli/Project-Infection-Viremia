AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/hl2/citizens/male_01.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 100
ENT.HullType = HULL_HUMAN

ENT.VJC_Data = {
	CameraMode = 1,
	ThirdP_Offset = Vector(40, 20, -50),
	FirstP_Bone = "ValveBiped.Bip01_Spine2",
	FirstP_Offset = Vector(0, 0, 5),
}

ENT.MeleeAttackDamageType = DMG_CLUB -- Type of Damage

ENT.PIV_Infection = true
ENT.PIV_Infection_IsWalker = true
ENT.PIV_FuckingCrawlingLittleCunt = false
ENT.PIV_Jogger = false
ENT.PIV_Shambler = false
ENT.PIV_HasArmor = false

ENT.PIV_CanMutate = false
ENT.PIV_Mutated = false

ENT.PIV_DoorToBreak = NULL 

ENT.PIV_CurAnims = -1 -- 0 = Normal | 1 = On fire

ENT.PIV_CanClimb = false
ENT.PIV_IsClimbing = false
ENT.PIV_NextClimbT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"} -- NPCs with the same class with be allied to each other
ENT.BloodColor = "Red" -- The blood type, this will determine what it should use (decal, particle, etc.)
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_IdleStand = {ACT_IDLE} -- The idle animation when AI is enabled
ENT.AnimTbl_Walk = {ACT_WALK} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
ENT.AnimTbl_Run = {ACT_WALK} -- Set the running animations | Put multiple to let the base pick a random animation when it moves
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true 
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 60
ENT.TimeUntilMeleeAttackDamage = false
ENT.HasExtraMeleeAttackSounds = true
ENT.HasMeleeAttackSlowPlayerSound = false
ENT.MeleeAttackDamage = math.random(15,20)

ENT.AttackProps = true -- Should it attack props when trying to move?
ENT.PushProps = true -- Should it push props when trying to move?
ENT.PropAP_MaxSize = 0.6 -- This is a scale number for the max size it can attack/push | x < 1  = Smaller props & x > 1  = Larger props | Default base value: 1

ENT.HasBreathSound = true

ENT.MaxJumpLegalDistance = VJ_Set(25, 200) -- The max distance the NPC can jump (Usually from one node to another) | ( UP, DOWN )

ENT.DisableFootStepSoundTimer = true
ENT.HasExtraMeleeAttackSounds = true -- Set to true to use the extra melee attack sounds
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundpitch2 = 90

ENT.DeathAnimationChance = GetConVarNumber("vj_piv_deathanim_chance")

ENT.FireRun = false
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
ENT.FootStepPitch = VJ_Set(100, 100)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFootStepSound()
	if !self:IsOnGround() then return end
	local tr = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() +Vector(0,0,-150),
		filter = {self}
	})
	if tr.Hit && self.FootSteps[tr.MatType] then
		VJ_EmitSound(self,VJ_PICK(self.FootSteps[tr.MatType]),self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch.a,self.FootStepPitch.b))
	end
	if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
		VJ_EmitSound(self,"player/footsteps/wade" .. math.random(1,8) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
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
				((VJ_HasValue(self.AnimTbl_Run,self:GetMovementActivity())) or
				(CurSched != nil  && CurSched.IsMovingTask_Run == true))
			then

				self:CustomOnFootStepSound_Run()
				self.FootStepT = CurTime() + self.FootStepTimeRun
				return

			elseif 
				self.DisableFootStepOnWalk == false &&
				(VJ_HasValue(self.AnimTbl_Walk,self:GetMovementActivity()) or
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

    if GetConVar("vj_piv_rebirth"):GetInt() == 1 && GetConVar("vj_piv_rebirthall"):GetInt() == 1 && self:GetClass() != "npc_vj_piv_panzer_boss" then
		self.PIV_CanMutate = false
		self.PIV_Mutated = true
		self:PIV_CustomMutate()
	end

    if GetConVar("vj_piv_rebirth"):GetInt() == 1 &&	 self:GetClass() != "npc_vj_piv_panzer_boss" then 
		self.PIV_CanMutate = true
	end

    if GetConVar("vj_piv_doorbreaking"):GetInt() == 1 then
		self.CanOpenDoors = false -- Can it open doors?
	end

    if GetConVar("vj_piv_climbing"):GetInt() == 1 && self:GetClass() != "npc_vj_piv_husk" && self:GetClass() != "npc_vj_piv_husk_f" && self:GetClass() != "npc_vj_piv_virulent" then
		self.PIVCanClimb = true
	end

    if GetConVar("vj_piv_deathanim"):GetInt() == 1 then 
		self.HasDeathAnimation = true
    end

    self.PI_LegHP = self.StartHealth / 2

	if GetConVar("vj_piv_subtypes"):GetInt() == 1 && self:GetClass() != "npc_vj_piv_husk" && self:GetClass() != "npc_vj_piv_husk" && self:GetClass() != "npc_vj_piv_virulent" && self:GetClass() != "npc_vj_piv_husk_f" && self:GetClass() != "npc_vj_piv_panzer_boss" && self:GetClass() != "npc_vj_piv_stoker" && self.PIV_Mutated == false then

		-- joggers
		if math.random(1,GetConVar("vj_piv_jogger_chance"):GetInt()) == 1 && !PI_Crippled && !PI_FuckingCrawlingLittleCunt then
			self.AnimTbl_Run = {ACT_RUN}
			self.PI_Jogger = true
		end

		--shamblers
		if math.random(1,GetConVar("vj_piv_shambler_chance"):GetInt()) == 1 && !self.PI_Jogger && !PI_Crippled && !PI_FuckingCrawlingLittleCunt && self:GetClass() != "npc_vj_piv_shambler" then
			self.PI_Shambler = true
			self.AnimTbl_Walk = {ACT_WALK_RELAXED}
			self.AnimTbl_Run = {ACT_WALK_RELAXED}
			--[[
			self:SetKeyValue("rendercolor","117 158 126 255")
			GetConVarNumber("vj_npc_noidleparticle") == 0 then
				ParticleEffectAttach("smoke_exhaust_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
			end
			--]]
			self.StartHealth = self.StartHealth * 2 
		end

		if math.random(1,GetConVar("vj_piv_crawler_chance"):GetInt()) == 1 && self:GetClass() != "npc_vj_piv_spitter" then 
		    self.PIV_CanMutate = false
			self.PIV_FuckingCrawlingLittleCunt = true
			self:Cripple()    
			self.HasDeathAnimation = false
			self:CapabilitiesRemove(bit.bor(CAP_MOVE_JUMP))
			self:CapabilitiesRemove(bit.bor(CAP_MOVE_CLIMB))
			self.HasLeapAttack = false
		end

		if math.random(1,GetConVar("vj_piv_firerunners_chance"):GetInt()) == 1 && GetConVar("vj_piv_firerunners"):GetInt() == 1 then
			self.FireRun = true
		end

	end

	self.IsDigging = false
	self:Dig()

		if math.random(1,GetConVar("vj_piv_weapons_chance"):GetInt()) == 1 && self:GetClass() != "npc_vj_piv_husk"  && self:GetClass() != "npc_vj_piv_husk_f" && self:GetClass() != "npc_vj_piv_virulent" && self:GetClass() != "npc_vj_piv_panzer" && self:GetClass() != "npc_vj_piv_panzer_boss" && self.PIV_FuckingCrawlingLittleCunt == false then
				
			self.WeHaveAWeapon = true
			self.MeleeAttackDamage = math.random(20,25)

			local weapon = math.random(1,6)
			self.ExtraGunModel1 = ents.Create("prop_physics")

			if weapon == 1 then	
	
				self.ExtraGunModel1:SetModel("models/props_canal/mattpipe.mdl")
				self.SoundTbl_MeleeAttack = {"vj_piv/wrenchhit1.wav","vj_piv/wrenchhit2.wav","vj_piv/wrenchhit3.wav","vj_piv/wrenchhit4.wav"}

			end

			if weapon == 2 then

				self.ExtraGunModel1:SetModel("models/weapons/w_knife_t.mdl")
				self.SoundTbl_MeleeAttack = {"vj_piv/knife_hit_01.wav","vj_piv/knife_hit_02.wav","vj_piv/knife_hit_03.wav","vj_piv/knife_hit_04.wav","vj_piv/knife_hit_05.wav","vj_piv/knife_hit_06.wav"}
				self.SoundTbl_MeleeAttackMiss = {"vj_piv/knife_miss_01.wav","vj_piv/knife_miss_02.wav","vj_piv/knife_miss_03.wav","vj_piv/knife_miss_04.wav"}

			end

			if weapon == 3 then

				self.ExtraGunModel1:SetModel("models/weapons/w_crowbar.mdl")			
				self.SoundTbl_MeleeAttack = {"vj_piv/HammerWhack-1.wav","vj_piv/HammerWhack-2.wav","vj_piv/HammerWhack-3.wav"}

			end

			if weapon == 4 then

				self.ExtraGunModel1:SetModel("models/vj_piv/weapons/w_axe.mdl")			
				self.SoundTbl_MeleeAttack = {"vj_piv/SwordHit-1.wav","vj_piv/SwordHit-2.wav","vj_piv/SwordHit-3.wav","vj_piv/SwordHit-4.wav","vj_piv/SwordHit-5.wav","vj_piv/SwordHit-6.wav","vj_piv/SwordHit-7.wav","vj_piv/SwordHit-8.wav","vj_piv/SwordHit-9.wav"}
				
			end

			if weapon == 5 then	

				self.ExtraGunModel1:SetModel("models/vj_piv/weapons/w_shovel.mdl")
				self.SoundTbl_MeleeAttack = {"vj_piv/ShovelSmack-1.wav","vj_piv/ShovelSmack-2.wav","vj_piv/ShovelSmack-3.wav"}
			end

			if weapon == 6 then	

				self.ExtraGunModel1:SetModel("models/vj_piv/weapons/w_pan.mdl")		
				self.SoundTbl_MeleeAttack = {"vj_piv/fryingpan1.wav","vj_piv/fryingpan2.wav","vj_piv/fryingpan3.wav","vj_piv/fryingpan4.wav"}

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

	self:Zombie_CustomOnPreInitialize()

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnPreInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)

	if key == "step" then
		self:FootStepSoundCode()
	    if self.VJ_IsHugeMonster == true then
			util.ScreenShake(self:GetPos(), 1, 5, 1, 1000)
			VJ_EmitSound(self, "vj_piv/charger_run_left_0"..math.random(1,4)..".wav", 70, 100)
		end
		
	    if self.PIV_HasArmor == true && self.VJ_IsHugeMonster == false then
			VJ_EmitSound(self, "vj_piv/mil_zomb/step_"..math.random(1,4)..".mp3", 70, 100)
		elseif self.VJ_IsHugeMonster == true then
			VJ_EmitSound(self, "vj_piv/demolisher/step/step_"..math.random(1,4)..".mp3", 70, 100)
		end
	end

	if key == "slide" then
		VJ_EmitSound(self,"vj_piv/foot_slide"..math.random(1,3)..".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch.a,self.FootStepPitch.b))
	end

	if key == "crawl" then
		VJ_EmitSound(self,"vj_piv/foot_slide"..math.random(1,3)..".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch.a,self.FootStepPitch.b))
	end

	if key == "attack" then
		self:MeleeAttackCode()
    end
	
	if key == "attack_kick" then
		self:MeleeAttackCode()		
    end
	
	if key == "jumpland" then
		self:MeleeAttackCode()
		if self.VJ_IsHugeMonster == true then
			util.ScreenShake(self:GetPos(), 100, 500, 1, 1000)
			VJ_EmitSound(self, "vj_piv/charger_run_left_0"..math.random(1,4)..".wav", 70, 100)
			VJ_EmitSound(self,"vj_piv/tank_death_bodyfall_01.wav",75,100)
			util.VJ_SphereDamage(self,self,self:GetPos(),100,math.random(10,15),DMG_CRUSH,true,true)
			
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
	
		if self.VJ_IsHugeMonster == true then
			util.ScreenShake(self:GetPos(), 100, 500, 1, 1000)
			VJ_EmitSound(self,"vj_piv/tank_death_bodyfall_01.wav",75,100)
		end
		
		if self.PIV_HasArmor == true && self.VJ_IsHugeMonster == false then
			VJ_EmitSound(self, "vj_piv/mil_zomb/step_"..math.random(1,4)..".mp3", 70, 100)
		elseif self.VJ_IsHugeMonster == true then
			VJ_EmitSound(self, "vj_piv/demolisher/step/step_"..math.random(1,4)..".mp3", 70, 100)
		end

		VJ_EmitSound(self, "physics/body/body_medium_impact_soft"..math.random(1,7)..".wav", 75, 100)

		if GetConVar("vj_piv_weapons_dropping_stumble"):GetInt() == 1 then

			self:DropTheFuckignWeaponGoddamn()

		end

    end

	if key == "break_door" then
	
		if IsValid(self.PIVDoorToBreak) then
		
			VJ_CreateSound(self,self.SoundTbl_BeforeMeleeAttack,self.BeforeMeleeAttackSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a, self.BeforeMeleeAttackSoundPitch.b))
			VJ_EmitSound(self,"vj_piv/BangDoor"..math.random(1,10)..".wav",75,100)
			
			if self:GetClass() == "npc_vj_piv_berserker" or self:GetClass() == "npc_vj_piv_juggernaut" or self:GetClass() == "npc_vj_piv_bruiser" or self:GetClass() == "npc_vj_piv_exploder_walker" then
				util.ScreenShake(self:GetPos(), self.WorldShakeOnMoveAmplitude, self.WorldShakeOnMoveFrequency, self.WorldShakeOnMoveDuration, self.WorldShakeOnMoveRadius)
			end
			
			local doorDmg = self.MeleeAttackDamage
			local door = self.PIVDoorToBreak
			
			if door.DoorHealth == nil then
				door.DoorHealth = 200 - doorDmg
			elseif door.DoorHealth <= 0 then
				VJ_EmitSound(self,self.SoundTbl_MeleeAttackMiss,self.MeleeAttackMissSoundLevel,self:VJ_DecideSoundPitch(self.MeleeAttackMissSoundPitch.a,self.MeleeAttackMissSoundPitch.b))
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
			self:VJ_ACT_PLAYACTIVITY(ACT_STEP_BACK,true,1.6)
			
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
--[[
	if self.PIV_Shambler == true then
		util.VJ_SphereDamage(self,self,self:GetPos(),100,1,DMG_RADIATION,true,true)
	end
--]]	
	-- don't run this if the door breaking convar is off, we're a crawler, we're crippled, flinching, stumbling, spawning, or rising
	if
		GetConVar("vj_piv_doorbreaking"):GetInt() == 0 or
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
		self.PIVDoorToBreak = NULL
	return end
	
		-- do we have a door breaking animations?
		if VJ_AnimationExists(self,ACT_OPEN_DOOR) then
		
			if !IsValid(self.PIVDoorToBreak) then
				if ((!self.VJ_IsBeingControlled) or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_DUCK))) then
					for _,v in pairs(ents.FindInSphere(self:GetPos(),40)) do
						if v:GetClass() == "func_door_rotating" && v:Visible(self) then
							self.PIVDoorToBreak = v
						end
						if v:GetClass() == "prop_door_rotating" && v:Visible(self) then
							local anim = string.lower(v:GetSequenceName(v:GetSequence()))
							if string.find(anim,"idle") or string.find(anim,"open") /*or string.find(anim,"locked")*/ then
								self.PIVDoorToBreak = v
							break
							end
						end
					end
				end
			else
		    //local dist = self:VJ_GetNearestPointToEntityDistance(self.PIVDoorToBreak)
		    if self.PlayingAttackAnimation or !self.PIVDoorToBreak:Visible(self) /*or (self:GetActivity() == ACT_OPEN_DOOR && dist <= 100)*/ then self.PIVDoorToBreak = NULL return end
			if self:GetActivity() != ACT_OPEN_DOOR then
				local ang = self:GetAngles()
				self:SetAngles(Angle(ang.x,(self.PIVDoorToBreak:GetPos() -self:GetPos()):Angle().y,ang.z))
				self:VJ_ACT_PLAYACTIVITY(ACT_OPEN_DOOR,true,false,false)
				-- self:SetState(VJ_STATE_ONLY_ANIMATION)
			end
		end
	end
		if !IsValid(self.PIVDoorToBreak) then
			-- self:SetState()
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
	    self.AnimTbl_Walk = {ACT_RUN}
	    self.AnimTbl_Run = {ACT_RUN}
	end

	-- Climbing System
	if self.PIV_CanClimb == true && self.Dead == false && !PIV_Crippled && !PIV_FuckingCrawlingLittleCunt && self.PIV_IsClimbing == false && CurTime() > self.PIV_NextClimbT then

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
					anim = VJ_PICK({"vjseq_climb144_00_inplace","vjseq_climb144_00a_inplace","vjseq_climb144_01_inplace","vjseq_climb144_03_inplace","vjseq_climb144_03a_inplace","vjseq_climb144_04_inplace"})
					finalpos = tr5.HitPos
				end
			elseif IsValid(tr4.Entity) then
				anim = VJ_PICK({"vjseq_climb120_00_inplace","vjseq_climb120_00a_inplace","vjseq_climb120_01_inplace","vjseq_climb120_03_inplace","vjseq_climb120_03a_inplace","vjseq_climb120_04_inplace"})
				finalpos = tr4.HitPos
			elseif IsValid(tr3.Entity) then
				anim = VJ_PICK({"vjseq_climb96_00_inplace","vjseq_climb96_00a_inplace","vjseq_climb96_03_inplace","vjseq_climb96_03a_inplace","vjseq_climb96_04a_inplace","vjseq_climb96_05_inplace"})
				finalpos = tr3.HitPos
			elseif IsValid(tr2.Entity) then
				anim = VJ_PICK({"vjseq_climb72_03_inplace","vjseq_climb72_04_inplace","vjseq_climb72_05_inplace","vjseq_climb72_06_inplace","vjseq_climb72_07_inplace"})
				finalpos = tr2.HitPos
			elseif IsValid(tr1.Entity) then
				anim = VJ_PICK({"vjseq_climb48_01_inplace","vjseq_climb48_02_inplace","vjseq_climb48_03_inplace","vjseq_climb48_04_inplace"})
				finalpos = tr1.HitPos
			elseif IsValid(tr0.Entity) then
				anim = VJ_PICK({"vjseq_climb36_01_inplace","vjseq_climb36_02_inplace","vjseq_climb36_03_inplace","vjseq_climb36_04_inplace","vjseq_climb36_hurdle_04_inplace"})
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
	
	self:Zombie_CustomOnThink_AIEnabled()
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	-- When Crawling or Crippled --
    if self.PIV_Crippled or self.PIV_FuckingCrawlingLittleCunt then
		self.MeleeAttackAnimationAllowOtherTasks = false
		
		self.MeleeAttackDamage = math.random(15,20)
		self.HasMeleeAttackKnockBack = false
		self.MeleeAttackDistance = 40
        self.MeleeAttackDamageDistance = 60
		self.SoundTbl_MeleeAttack = {"vj_piv/z_hit-01.wav","vj_piv/z_hit-02.wav","vj_piv/z_hit-03.wav","vj_piv/z_hit-04.wav","vj_piv/z_hit-05.wav","vj_piv/z_hit-06.wav"}
		self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	
		
		self.AnimTbl_MeleeAttack = {
			"vjseq_crawl_attack",
			"vjseq_crawl_attack2"
		}

	return end

	-- When Standing --
	if !self:IsMoving()	then

		self.MeleeAttackAnimationAllowOtherTasks = false

		if self.WeHaveAWeapon == true then
		
			self.MeleeAttackDamage = math.random(20,25)
			self.MeleeAttackDistance = 40
			self.MeleeAttackDamageDistance = 60
		
			self.AnimTbl_MeleeAttack = {
				"vjges_melee_moving01a",
				"vjges_melee_moving03a",
				"vjges_melee_moving06a",
		}

		else
		
			self.MeleeAttackDamage = math.random(15,20)
			self.HasMeleeAttackKnockBack = false
			self.MeleeAttackDistance = 40
			self.MeleeAttackDamageDistance = 60
			self.SoundTbl_MeleeAttack = {"vj_piv/z_hit-01.wav","vj_piv/z_hit-02.wav","vj_piv/z_hit-03.wav","vj_piv/z_hit-04.wav","vj_piv/z_hit-05.wav","vj_piv/z_hit-06.wav"}
			self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	
			
			self.AnimTbl_MeleeAttack = {
				"vjseq_nz_attack_stand_ad_1",
				"vjseq_nz_attack_stand_ad_2-2",
				"vjseq_nz_attack_stand_ad_2-3",
				"vjseq_nz_attack_stand_ad_2-4",
			}
	        
			if math.random(1,4) == 1 then 
				
				self.MeleeAttackDamage = math.random(20,25)
				self.HasMeleeAttackKnockBack = true
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

		if self.WeHaveAWeapon == true then
		
			self.MeleeAttackDamage = math.random(20,25)
			self.MeleeAttackDistance = 40
			self.MeleeAttackDamageDistance = 60

			self.AnimTbl_MeleeAttack = {
				"vjges_melee_moving01a",
				"vjges_melee_moving03a",
				"vjges_melee_moving06a",
			}

		else

			self.MeleeAttackDamage = math.random(15,20)
			self.HasMeleeAttackKnockBack = false
			self.MeleeAttackDistance = 40
			self.MeleeAttackDamageDistance = 60
			self.SoundTbl_MeleeAttack = {"vj_piv/z_hit-01.wav","vj_piv/z_hit-02.wav","vj_piv/z_hit-03.wav","vj_piv/z_hit-04.wav","vj_piv/z_hit-05.wav","vj_piv/z_hit-06.wav"}
			self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	
			
			self.AnimTbl_MeleeAttack = {
				"vjges_nz_attack_walk_ad_1",
				"vjges_nz_attack_walk_ad_2",
				"vjges_nz_attack_walk_ad_3",
				"vjges_nz_attack_walk_ad_4",
				"vjges_nz_attack_walk_au_1",
				"vjges_nz_attack_walk_au_2",
				"vjges_nz_attack_walk_au_3",
				"vjges_nz_attack_walk_au_4"
			}

		end

	end

end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo, hitgroup)
	self:DropTheFuckignWeaponGoddamn()
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)

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
			"vjseq_death03"
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
			"vjges_nz_death_fire_3",
			"vjges_nz_death_fire_4",
			"vjges_nz_death_fire_5",
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

    if dmginfo:IsDamageType(DMG_SHOCK) then -- When killed by shock damage

	   self.AnimTbl_Death = {
			"vjseq_nz_death_elec_1",
			"vjseq_nz_death_elec_2",
			"vjseq_nz_death_elec_3",
			"vjseq_nz_death_elec_4",
			"vjseq_nz_death_elec_5"
		}

    end

    if dmginfo:IsDamageType(DMG_BUCKSHOT) then -- When killed by a shotgun

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

    if dmginfo:IsDamageType(DMG_DISSOLVE) then -- When killed by a shotgun

		self.AnimTbl_Death = {
			"vjseq_nz_death_deathray_1",
			"vjseq_nz_death_deathray_2",
			"vjseq_nz_death_deathray_3",
			"vjseq_nz_death_deathray_4"
		}

    end

    if dmginfo:IsDamageType(DMG_PARALYZE) then -- When killed by a shotgun

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

	if
		!self.Flinching &&
		self:IsMoving() &&
		!self.PIV_Crippled &&
		!self.PIV_FuckingCrawlingLittleCunt &&
		self.PIVNextStumbleT > CurTime() &&
		math.random(1,16) == 1
	then
		local anim = {"run_stumble_01","run_stumble1","run_stumble2","run_stumble3","run_stumble4","run_stumble5","run_stumble6"} -- falling animations
		self:VJ_ACT_PLAYACTIVITY(anim,true,false,false) -- play a fall animation 
		self.PIVNextStumbleT = CurTime() + 10 
	end

	if self.CanDoTheFunny == false or self.PIV_Crippled or self.PIV_FuckingCrawlingLittleCunt  then return end

	if dmginfo:IsBulletDamage() or dmginfo:IsDamageType(DMG_BUCKSHOT) or dmginfo:IsDamageType(DMG_SNIPER) then
		if hitgroup == HITGROUP_HEAD or hitgroup == HITGROUP_CHEST or hitgroup == HITGROUP_STOMACH then
			if self.PIVNextStumbleT < CurTime() then
				if dmginfo:GetDamage() > 49 or dmginfo:GetDamageForce():Length() > 10000 then
					if math.random (1,2) == 1 then
						self:VJ_ACT_PLAYACTIVITY(ACT_BIG_FLINCH,true,false,false)
						self.PIVNextStumbleT = CurTime() + 5
					end
				elseif dmginfo:GetDamage() > 24 or dmginfo:GetDamageForce():Length() > 5000 then
					if math.random (1,3) == 1 then
						self:VJ_ACT_PLAYACTIVITY(ACT_SMALL_FLINCH,true,false,false)
						self.PIVNextStumbleT = CurTime() + 5
					end
				else
					if math.random (1,5) == 1 then
						self:VJ_ACT_PLAYACTIVITY(ACT_STEP_BACK,true,1.6)
						self.PIVNextStumbleT = CurTime() + 3
					end
				end
			end
		elseif hitgroup == HITGROUP_LEFTLEG or hitgroup == HITGROUP_RIGHTLEG then		 
			if self.PIVNextStumbleT < CurTime() then
				if math.random (1,5) == 1 then
					self:VJ_ACT_PLAYACTIVITY(ACT_STEP_FORE,true,1.6)
					self.PIVNextStumbleT = CurTime() + 10
				end
			end
		end
	end

	if dmginfo:IsDamageType(DMG_CLUB) or dmginfo:IsDamageType(DMG_SLASH) or dmginfo:IsDamageType(DMG_GENERIC) then
		if dmginfo:GetDamage() > 49 or dmginfo:GetDamageForce():Length() > 10000 then
			if self.PIV_NextShoveT < CurTime() then
				self:VJ_ACT_PLAYACTIVITY(ACT_BIG_FLINCH,true,false,false)
				self.PIV_NextShoveT = CurTime() + math.random(5,8)
			end
		elseif dmginfo:GetDamage() > 24 or dmginfo:GetDamageForce():Length() > 5000 then
			if self.PIV_NextShoveT < CurTime() then
				self:VJ_ACT_PLAYACTIVITY(ACT_SMALL_FLINCH,true,false,false)
				self.PIV_NextShoveT = CurTime() + math.random(5,8)
			end
		end
    return !self.PIV_Crippled && !self.PIV_FuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH)
	end

	if dmginfo:IsExplosionDamage() then
		if self.NextSplodeStumbleT < CurTime() then
			self:DropTheFuckignWeaponGoddamn()
			if math.random(1,2) == 1 then
				self:VJ_ACT_PLAYACTIVITY("vjseq_shove_forward_01",true,false,false)
			else
				self:VJ_ACT_PLAYACTIVITY(ACT_BIG_FLINCH,true,false,false)
			end
			self.NextSplodeStumbleT = CurTime() + 5
		end
	return !self.PIV_Crippled && !self.PIV_FuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH)
	end

	if GetConVarNumber("VJ_piv_Cripple") == 1 then  -- if the convars not on don't run this
		if hitgroup == HITGROUP_LEFTLEG or hitgroup == HITGROUP_RIGHTLEG then -- are we hitting the leg?
			self.PIV_LegHP = self.PIV_LegHP -dmginfo:GetDamage() -- take away leg hp
		end
	end

	if self.PIV_LegHP <= 0 then -- we're out of leg hp
		self.PIV_Crippled = true -- aw fuck we're crippled now
		local anim = {"vjseq_nz_death_1","vjseq_nz_death_f_7","vjseq_nz_death_f_8"} -- falling animations
		self:VJ_ACT_PLAYACTIVITY(anim,true,false,false) -- play a fall animation 
		self:Cripple() -- crippled
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
			self:DropTheFuckignWeaponGoddamn()
		elseif hitgroup == HITGROUP_LEFTLEG then
			self:VJ_ACT_PLAYACTIVITY("vjseq_flinch_leftleg",true,false)
		elseif hitgroup == HITGROUP_RIGHTLEG then
			self:VJ_ACT_PLAYACTIVITY("vjseq_flinch_rightleg",true,false)
		end
    return !self.PIV_Crippled && !self.PIV_FuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH) -- If we are stumbling or rising out of the ground or other specific activities then DO NOT flinch!	
	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DropTheFuckignWeaponGoddamn()

	if GetConVar("vj_piv_weapons_dropping"):GetInt() == 0 then return end
	
	if IsValid(self.ExtraGunModel1) then
		self.MeleeAttackDamageType = DMG_CLUB
		self:CreateGibEntity("prop_physics",self.ExtraGunModel1:GetModel(),{Pos=self:GetAttachment(self:LookupAttachment("anim_attachment_RH")).Pos,Ang=self:GetAngles()}) self.ExtraGunModel1:SetMaterial("nodraw") self.ExtraGunModel1:DrawShadow(false) self.WeHaveAWeapon = false
		self.ExtraGunModel1:Remove()	
		self.MeleeAttackDamage = math.random(15,20)
		self.HasMeleeAttackKnockBack = false
		self.SoundTbl_MeleeAttack = {"vj_piv/z_hit-01.wav","vj_piv/z_hit-02.wav","vj_piv/z_hit-03.wav","vj_piv/z_hit-04.wav","vj_piv/z_hit-05.wav","vj_piv/z_hit-06.wav"}
		self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	
	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Cripple()
	self.PIV_CanMutate = false
	self:DropTheFuckignWeaponGoddamn()
	self.AnimTbl_IdleStand = {ACT_IDLE_STIMULATED}
	self.AnimTbl_Walk = {ACT_WALK_STIMULATED}
	self.AnimTbl_Run = {ACT_WALK_STIMULATED}
	
    self:SetCollisionBounds(Vector(13,13,20),Vector(-13,-13,0))
	self.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(30, 25, -20), 
	FirstP_Bone = "ValveBiped.Bip01_Head1", 
	FirstP_Offset = Vector(5, 0, -1), 
    }
    self.FireRun = false
    self:CapabilitiesRemove(bit.bor(CAP_MOVE_JUMP))
	self:CapabilitiesRemove(bit.bor(CAP_MOVE_CLIMB))
	self.HasDeathAnimation = false
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
			VJ_EmitSound(self,"vj_piv/rock_smashable_falling_debris_0"..math.random(1,4)..".wav",75,100)
			VJ_EmitSound(self,"vj_piv/rock_impact_small_hit_0"..math.random(1,3)..".wav",75,100)
			ParticleEffect("strider_impale_ground",self:GetPos(),self:GetAngles(),self)
			self:VJ_ACT_PLAYACTIVITY("emerge1",true,VJ_GetSequenceDuration(self,"emerge1"),false)
			self.HasMeleeAttack = false
			timer.Simple(0.15,function() if IsValid(self) then self:SetNoDraw(false) end end)
			timer.Simple(VJ_GetSequenceDuration(self,"emerge1"),function() if IsValid(self) then self.HasMeleeAttack = true self.IsDigging = false end end)
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
			VJ_EmitSound(self,"vj_piv/rock_smashable_falling_debris_0"..math.random(1,4)..".wav",75,100)
			VJ_EmitSound(self,"vj_piv/rock_impact_small_hit_0"..math.random(1,3)..".wav",75,100)
			ParticleEffect("strider_impale_ground",self:GetPos(),self:GetAngles(),self)
			self:VJ_ACT_PLAYACTIVITY("emerge1",true,VJ_GetSequenceDuration(self,"emerge1"),false)
			self.HasMeleeAttack = false
			timer.Simple(0.15,function() if IsValid(self) then self:SetNoDraw(false) end end)
			timer.Simple(VJ_GetSequenceDuration(self,"emerge1"),function() if IsValid(self) then self.HasMeleeAttack = true self.IsDigging = false end end)
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

	VJ_EmitSound(self,mutatesounds,90,math.random(100,90))
	VJ_EmitSound(self,self.SoundTbl_Pain,70,self:VJ_DecideSoundPitch(self.PainSoundPitch.a,self.PainSoundPitch.b))

	timer.Simple(2,function() if IsValid(self) then
		VJ_EmitSound(self,self.SoundTbl_Pain,70,self:VJ_DecideSoundPitch(self.PainSoundPitch.a,self.PainSoundPitch.b))
	end end)

	timer.Simple(4,function() if IsValid(self) then
		VJ_EmitSound(self,mutatesounds,90,math.random(100,90))
		VJ_EmitSound(self,self.SoundTbl_Pain,70,self:VJ_DecideSoundPitch(self.PainSoundPitch.a,self.PainSoundPitch.b))
	end end)

	timer.Simple(6,function() if IsValid(self) then
		VJ_EmitSound(self,self.SoundTbl_Death,70,self:VJ_DecideSoundPitch(self.DeathSoundPitch.a,self.DeathSoundPitch.b))
	end end)

	timer.Simple(8,function() if IsValid(self) then
		VJ_EmitSound(self,mutatesounds,90,math.random(100,90))
		VJ_EmitSound(self,self.SoundTbl_Death,70,self:VJ_DecideSoundPitch(self.DeathSoundPitch.a,self.DeathSoundPitch.b))
	end end)

	timer.Simple(10,function() if IsValid(self) then
		VJ_EmitSound(self,self.SoundTbl_Death,70,self:VJ_DecideSoundPitch(self.DeathSoundPitch.a,self.DeathSoundPitch.b))
	end end)

	timer.Simple(12.5,function() if IsValid(self) then
		self.HasMeleeAttack = true
		self.HasIdleSounds = true
		self.HasAlertSounds = true
		self:PIV_CustomMutate()
		self.GodMode = false
		VJ_EmitSound(self,"vj_piv/rebirthed.mp3",90,100)
	end end)

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PIV_CustomMutate()
self.AnimTbl_Walk = {ACT_WALK}
self.AnimTbl_Run = {ACT_RUN}

self.StartHealth = self.StartHealth *2
self:SetHealth(self.StartHealth)
		
local mymaxhealth = self:Health()
self:SetMaxHealth(mymaxhealth)

self.PIV_LegHP = self.PIV_LegHP *3

if GetConVar("vj_piv_lights"):GetInt() == 1 then 

self.Light2 = ents.Create("light_dynamic")
self.Light2:SetKeyValue("brightness", "7")
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
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/