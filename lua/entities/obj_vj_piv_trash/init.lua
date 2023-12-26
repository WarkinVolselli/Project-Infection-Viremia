AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/items/healthkit.mdl"}
ENT.PhysicsInitType = SOLID_VPHYSICS
ENT.MoveType = MOVETYPE_VPHYSICS -- Move type, recommended to keep it as it is
ENT.MoveCollideType = MOVECOLLIDE_FLY_BOUNCE -- Move type | Some examples: MOVECOLLIDE_FLY_BOUNCE, MOVECOLLIDE_FLY_SLIDE
ENT.CollisionGroupType = COLLISION_GROUP_PROJECTILE -- Collision type, recommended to keep it as it is
ENT.SolidType = SOLID_CUSTOM -- Solid type, recommended to keep it as it is
ENT.IsBugBait = false
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Collision / Damage Variables ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.RemoveOnHit = false -- Should it remove itself when it touches something? | It will run the hit sound, place a decal, etc.
ENT.PaintDecalOnCollide = false -- Should it paint decals when it collides with something? | Use this only when using a projectile that doesn't get removed when it collides with something
ENT.DecalTbl_OnCollideDecals = {} -- Decals that paint when the projectile collides with something | It picks a random one from this table
ENT.CollideCodeWithoutRemoving = true -- If RemoveOnHit is set to false, you can still make the projectile deal damage, place a decal, etc.
ENT.NextCollideWithoutRemove = VJ_Set(1,1) -- Time until it can run the code again
	-- ====== Shake World On Death Variables ====== --
ENT.ShakeWorldOnDeath = true -- Should the world shake when the projectile hits something?
ENT.ShakeWorldOnDeathAmplitude = 1 -- How much the screen will shake | From 1 to 16, 1 = really low 16 = really high
ENT.ShakeWorldOnDeathRadius = 3000 -- How far the screen shake goes, in world units
ENT.ShakeWorldOnDeathDuration = 1 -- How long the screen shake will last, in seconds
ENT.ShakeWorldOnDeathFrequency = 200 -- The frequency
	-- ====== Direct Damage Variables ====== --
ENT.DoesDirectDamage = true -- Should it do a direct damage when it hits something?
ENT.DirectDamage = math.random(1,1) -- How much damage should it do when it hits something
ENT.DirectDamageType = DMG_CLUB -- Damage type
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Killed / Remove Variables ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.PaintDecalOnDeath = true -- Should it paint a decal when it hits something?
ENT.DecalTbl_DeathDecals = {} -- Decals that paint when the projectile dies | It picks a random one from this table
ENT.DelayedRemove = 0 -- Change this to a number greater than 0 to delay the removal of the entity
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Sound Variables ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasStartupSounds = true -- Does it make a sound when the projectile is created?
ENT.HasIdleSounds = true -- Does it have idle sounds?
ENT.HasOnCollideSounds = true -- Should it play a sound when it collides something?
ENT.HasOnRemoveSounds = true -- Should it play a sound when it gets removed?
	-- ====== File Path Variables ====== --
	-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Startup = {}
ENT.SoundTbl_Idle = {}
ENT.SoundTbl_OnCollide = {}
ENT.SoundTbl_OnRemove = {}
	-- ====== Sound Chance Variables ====== --
	-- Higher number = less chance of playing | 1 = Always play
ENT.StartupSoundChance = 1
ENT.IdleSoundChance = 1
ENT.OnCollideSoundChance = 1
ENT.OnRemoveSoundChance = 1
	-- ====== Timer Variables ====== --
ENT.NextSoundTime_Idle = VJ_Set(0.001,0.001)
	-- ====== Sound Level Variables ====== --
	-- The proper number are usually range from 0 to 180, though it can go as high as 511
	-- More Information: https://developer.valvesoftware.com/wiki/Soundscripts#SoundLevel_Flags
ENT.StartupSoundLevel = 80
ENT.IdleSoundLevel = 70
ENT.OnCollideSoundLevel = 80
ENT.OnRemoveSoundLevel = 75
	-- ====== Sound Pitch Variables ====== --
ENT.StartupSoundPitch = VJ_Set(125, 150)
ENT.IdleSoundPitch = VJ_Set(90, 100)
ENT.OnCollideSoundPitch = VJ_Set(90, 100)
ENT.OnRemoveSoundPitch = VJ_Set(90, 100)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:Wake()
	phys:EnableGravity(true)
	phys:EnableDrag(false)
	phys:SetBuoyancyRatio(0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize() 
	local Type = math.random(1,11)
	
		if Type == 1 then
			self.Model = {"models/props_junk/garbage_milkcarton001a.mdl","models/props_junk/garbage_milkcarton002a.mdl"}
			self.SoundTbl_OnCollide = {"physics/cardboard/cardboard_box_impact_soft1.wav",
				"physics/cardboard/cardboard_box_impact_soft2.wav",
				"physics/cardboard/cardboard_box_impact_soft3.wav",
				"physics/cardboard/cardboard_box_impact_soft4.wav",
				"physics/cardboard/cardboard_box_impact_soft5.wav",
				"physics/cardboard/cardboard_box_impact_soft6.wav",
				"physics/cardboard/cardboard_box_impact_soft7.wav"}
			self.SoundTbl_OnRemove = {"physics/cardboard/cardboard_box_break1.wav",
				"physics/cardboard/cardboard_box_break2.wav",
				"physics/cardboard/cardboard_box_break3.wav"}
			self.DirectDamage = math.random(5,10)
			
		elseif Type == 2 then
			self.Model = {"models/props_lab/binderblue.mdl",
				"models/props_lab/binderbluelabel.mdl",
				"models/props_lab/bindergraylabel01a.mdl",
				"models/props_lab/bindergreen.mdl",
				"models/props_lab/bindergraylabel01b.mdl",
				"models/props_lab/bindergreenlabel.mdl",
				"models/props_lab/binderredlabel.mdl"}
			self.SoundTbl_OnCollide = {"physics/cardboard/cardboard_box_impact_soft1.wav",
				"physics/cardboard/cardboard_box_impact_soft2.wav",
				"physics/cardboard/cardboard_box_impact_soft3.wav",
				"physics/cardboard/cardboard_box_impact_soft4.wav",
				"physics/cardboard/cardboard_box_impact_soft5.wav",
				"physics/cardboard/cardboard_box_impact_soft6.wav",
				"physics/cardboard/cardboard_box_impact_soft7.wav"}
			self.SoundTbl_OnRemove = {"physics/cardboard/cardboard_box_break1.wav",
				"physics/cardboard/cardboard_box_break2.wav",
				"physics/cardboard/cardboard_box_break3.wav"}
			self.DirectDamage = math.random(5,10)

		elseif Type == 3 then
			self.Model = {"models/props_junk/garbage_takeoutcarton001a.mdl","models/props_junk/garbage_bag001a.mdl","models/props_junk/garbage_newspaper001a.mdl"}
			self.SoundTbl_OnCollide = {"physics/cardboard/cardboard_box_impact_soft1.wav",
				"physics/cardboard/cardboard_box_impact_soft2.wav",
				"physics/cardboard/cardboard_box_impact_soft3.wav",
				"physics/cardboard/cardboard_box_impact_soft4.wav",
				"physics/cardboard/cardboard_box_impact_soft5.wav",
				"physics/cardboard/cardboard_box_impact_soft6.wav",
				"physics/cardboard/cardboard_box_impact_soft7.wav"}
			self.SoundTbl_OnRemove = {"physics/cardboard/cardboard_box_break1.wav",
				"physics/cardboard/cardboard_box_break2.wav",
				"physics/cardboard/cardboard_box_break3.wav"}
			self.DirectDamage = math.random(5,10)

		elseif Type == 4 then
			self.Model = {"models/props_junk/Shoe001a.mdl"}
			self.SoundTbl_OnCollide = {"physics/cardboard/cardboard_box_impact_soft1.wav",
				"physics/cardboard/cardboard_box_impact_soft2.wav",
				"physics/cardboard/cardboard_box_impact_soft3.wav",
				"physics/cardboard/cardboard_box_impact_soft4.wav",
				"physics/cardboard/cardboard_box_impact_soft5.wav",
				"physics/cardboard/cardboard_box_impact_soft6.wav",
				"physics/cardboard/cardboard_box_impact_soft7.wav"}
			self.SoundTbl_OnRemove = {"physics/cardboard/cardboard_box_break1.wav",
				"physics/cardboard/cardboard_box_break2.wav",
				"physics/cardboard/cardboard_box_break3.wav"}
			self.DirectDamage = math.random(10,15)

		elseif Type == 5 then
			self.Model = {"models/props_lab/clipboard.mdl"}
			self.SoundTbl_OnCollide = {"physics/wood/wood_box_impact_hard1.wav",
				"physics/wood/wood_box_impact_hard2.wav",
				"physics/wood/wood_box_impact_hard3.wav"}
			self.SoundTbl_OnRemove = {"physics/wood/wood_plank_break1.wav",
				"physics/wood/wood_plank_break2.wav",
				"physics/wood/wood_plank_break3.wav",
				"physics/wood/wood_plank_break4.wav"}
			self.DirectDamage = math.random(5,10)
			
		elseif Type == 6 then
			self.Model = {"models/props_junk/rock001a.mdl",
			"models/props_junk/rock001a.mdl",
			"models/props_junk/rock001a.mdl",
			"models/props_junk/rock001a.mdl",
			"models/props_junk/rock001a.mdl",
			"models/props_junk/rock001a.mdl",
			"models/props_junk/rock001a.mdl",
			"models/props_debris/concrete_chunk03a.mdl",
			"models/props_debris/concrete_chunk03a.mdl",
			"models/props_debris/concrete_chunk09a.mdl",
			"models/props_debris/concrete_spawnchunk001d.mdl",
			"models/props_debris/concrete_spawnchunk001g.mdl",
			"models/props_debris/concrete_spawnchunk001k.mdl"}
			self.SoundTbl_OnCollide = {"physics/concrete/rock_impact_hard1.wav",
			"physics/concrete/rock_impact_hard2.wav",
			"physics/concrete/rock_impact_hard3.wav",
			"physics/concrete/rock_impact_hard4.wav",
			"physics/concrete/rock_impact_hard5.wav",
			"physics/concrete/rock_impact_hard6.wav"}
			self.SoundTbl_OnRemove = {"physics/concrete/concrete_break2.wav",
			"physics/concrete/concrete_break3.wav"}
			self.DirectDamage = math.random(15,20)
	
		elseif Type == 7 then
			self.Model = {"models/props_c17/TrapPropeller_Lever.mdl",
			"models/props_c17/tools_wrench01a.mdl",
			"models/props_c17/tools_pliers01a.mdl"}
			self.SoundTbl_OnCollide = {"physics/metal/metal_solid_impact_hard1.wav",
			"physics/metal/metal_solid_impact_hard4.wav",
			"physics/metal/metal_solid_impact_hard5.wav"}
			self.SoundTbl_OnRemove = {"physics/metal/metal_box_break1.wav",
			"physics/metal/metal_box_break2.wav"}
			self.DirectDamage = math.random(15,20)
			
		elseif Type == 8 then
			self.Model = {"models/props_junk/garbage_plasticbottle001a.mdl","models/props_junk/garbage_plasticbottle002a.mdl","models/props_junk/garbage_plasticbottle003a.mdl","models/props_c17/doll01.mdl"}
			self.SoundTbl_OnCollide = {"physics/plastic/plastic_box_impact_hard1.wav",
			"physics/plastic/plastic_box_impact_hard2.wav",
			"physics/plastic/plastic_box_impact_hard3.wav",
			"physics/plastic/plastic_box_impact_hard4.wav"}
			self.SoundTbl_OnRemove = {"physics/plastic/plastic_box_break1.wav",
			"physics/plastic/plastic_barrel_impact_bullet1.wav",
			"physics/plastic/plastic_barrel_impact_bullet2.wav",
			"physics/plastic/plastic_barrel_impact_bullet3.wav"}
			self.DirectDamage = math.random(5,10)
			
		elseif Type == 9 then
			self.Model = {"models/props_junk/garbage_coffeemug001a.mdl",
			"models/props_junk/garbage_glassbottle001a.mdl",
			"models/props_junk/garbage_glassbottle002a.mdl",
			"models/props_junk/garbage_glassbottle003a.mdl",
			"models/props_junk/GlassBottle01a.mdl",
			"models/props_junk/glassjug01.mdl"}
			self.HasOnCollideSounds = false
			self.SoundTbl_OnRemove = {"physics/glass/glass_bottle_break1.wav",
			"physics/glass/glass_bottle_break2.wav",
			"physics/glass/glass_cup_break1.wav",
			"physics/glass/glass_cup_break2.wav"}
			self.RemoveOnHit = true
			self.DirectDamage = math.random(10,15)
			
		elseif Type == 10 then
			self.Model = {"models/props_junk/garbage_metalcan001a.mdl",
			"models/props_junk/garbage_metalcan002a.mdl",
			"models/props_junk/PopCan01a.mdl"}
			self.SoundTbl_OnCollide = {"physics/metal/soda_can_impact_hard1.wav",
			"physics/metal/soda_can_impact_hard2.wav",
			"physics/metal/soda_can_impact_hard3.wav"}
			self.SoundTbl_OnRemove = {"physics/metal/metal_solid_impact_soft1.wav",
			"physics/metal/metal_solid_impact_soft2.wav",
			"physics/metal/metal_solid_impact_soft2.wav"}
			self.DirectDamage = math.random(10,15)
			
		elseif Type == 11 then
			self.Model = {"models/Gibs/HGIBS.mdl",
			"models/Gibs/HGIBS_rib.mdl",
			"models/Gibs/HGIBS_scapula.mdl",
			"models/Gibs/HGIBS_spine.mdl",
			"models/gibs/antlion_gib_small_1.mdl",
			"models/gibs/antlion_gib_small_2.mdl",
			"models/gibs/antlion_gib_small_3.mdl"}
			self.SoundTbl_OnCollide = {"physics/body/body_medium_impact_hard1.wav",
			"physics/body/body_medium_impact_hard2.wav",
			"physics/body/body_medium_impact_hard3.wav",
			"physics/body/body_medium_impact_hard4.wav",
			"physics/body/body_medium_impact_hard5.wav",
			"physics/body/body_medium_impact_hard6.wav"}
			self.SoundTbl_OnRemove = {"physics/flesh/flesh_bloody_break.wav"}
			self.DirectDamage = math.random(5,10)
		end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize() 

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:Wake()
	phys:SetMass(1)
	phys:SetBuoyancyRatio(0)
	phys:EnableDrag(false)
	-- phys:EnableGravity(false)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnCollideWithoutRemove(data, phys) 
	self.HasIdleSounds = false
	VJ_STOPSOUND(self.CurrentIdleSound)
	self.DoesDirectDamage = false
	timer.Simple(GetConVarNumber("vj_npc_fadegibstime"),function() if IsValid(self) then
		self:Remove()
	end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDoDamage_Direct(data, phys, hitEnt)
	self.HasIdleSounds = false
	VJ_STOPSOUND(self.CurrentIdleSound)
	self.DoesDirectDamage = false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()

	if self.IsBugBait then
		local carproj = ents.Create("obj_vj_wbsb_bugbait_gas")
		carproj:SetPos(self:LocalToWorld(Vector(0,0,0)))
		carproj:SetAngles(Angle(math.random(0,360),math.random(0,360),math.random(0,360)))
		carproj:SetOwner(self)
		carproj:Spawn()
		carproj:Activate()
	end

end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/