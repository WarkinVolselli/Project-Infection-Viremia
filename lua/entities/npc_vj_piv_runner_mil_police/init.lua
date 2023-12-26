AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/military/national_guard_riot.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 125
ENT.PIV_IsMilitary = true

ENT.PIV_HasShield = false

ENT.SoundTbl_Breath = {"ambient/levels/prison/radio_random1.wav","ambient/levels/prison/radio_random2.wav","ambient/levels/prison/radio_random3.wav","ambient/levels/prison/radio_random4.wav","ambient/levels/prison/radio_random5.wav","ambient/levels/prison/radio_random6.wav","ambient/levels/prison/radio_random7.wav","ambient/levels/prison/radio_random8.wav","ambient/levels/prison/radio_random9.wav","ambient/levels/prison/radio_random10.wav","ambient/levels/prison/radio_random11.wav","ambient/levels/prison/radio_random12.wav","ambient/levels/prison/radio_random13.wav","ambient/levels/prison/radio_random14.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnPreInitialize()
	if GetConVar("vj_piv_militaryskin"):GetInt() == 0 then
	self.Model = {"models/vj_piv/military/national_guard_riot.mdl"}
	elseif GetConVar("vj_piv_militaryskin"):GetInt() == 1 then
	self.Model = {"models/vj_piv/military/us_soldier_riot.mdl"}
	elseif GetConVar("vj_piv_militaryskin"):GetInt() == 2 then
	self.Model = {"models/vj_piv/military/us_desert_riot.mdl"}
	elseif GetConVar("vj_piv_militaryskin"):GetInt() == 3 then
	self.Model = {"models/vj_piv/military/us_snow_riot.mdl"}
	elseif GetConVar("vj_piv_militaryskin"):GetInt() == 4 then
	self.Model = {"models/vj_piv/military/national_guard_riot.mdl","models/vj_piv/military/us_soldier_riot.mdl","models/vj_piv/military/us_desert_riot.mdl","models/vj_piv/military/us_snow_riot.mdl"}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self.NextSoundTime_Breath = VJ_Set(7,20)
	self:SetBodygroup(1,math.random(0,1))
	self:SetBodygroup(3,math.random(0,1))
	self:SetBodygroup(4,math.random(1,2))

	if GetConVar("vj_piv_mil_flakarmor"):GetInt() == 1 then
		if math.random(1,GetConVar("vj_piv_mil_flakarmor_chance"):GetInt()) == 1 then
			self:SetBodygroup(2,3)
			self.PIV_HasArmor = true
		else
			if math.random(1,2) == 1 then
				self:SetBodygroup(2,math.random(0,2))
			else
				self:SetBodygroup(2,math.random(4,6))
			end
		end
	else
		if math.random(1,2) == 1 then
			self:SetBodygroup(2,math.random(1,2))	
		elseif math.random(1,3) == 2 then
			self:SetBodygroup(2,math.random(4,6))
		end
	end

	if math.random(1,5) == 1 then
		self:SetSkin(math.random(3,4))
	else
		self:SetSkin(math.random(0,2))
	end
	
	if GetConVar("vj_piv_mil_gasmask"):GetInt() == 1 then
		if math.random(1,GetConVar("vj_piv_mil_gasmask_chance"):GetInt()) == 1 then
			self:SetBodygroup(4,0)
			self.ImmuneDamagesTable = {DMG_PARALYZE,DMG_POISON,DMG_RADIATION,DMG_NERVEGAS}
			self.NextSoundTime_Idle = VJ_Set(16, 23)
			self.SoundTbl_CombatIdle = {"vj_piv/mil_zomb/gasmask/combatidle_1.wav","vj_piv/mil_zomb/gasmask/combatidle_2.wav","vj_piv/mil_zomb/gasmask/combatidle_3.wav","vj_piv/mil_zomb/gasmask/combatidle_4.wav"}
			self.SoundTbl_Idle = {"vj_piv/mil_zomb/gasmask/idle_1.wav","vj_piv/mil_zomb/gasmask/idle_2.wav","vj_piv/mil_zomb/gasmask/idle_3.wav"}
			self.SoundTbl_Alert = {"vj_piv/mil_zomb/gasmask/alert_1.wav","vj_piv/mil_zomb/gasmask/alert_2.wav","vj_piv/mil_zomb/gasmask/alert_3.wav","vj_piv/mil_zomb/gasmask/alert_4.wav"}
			self.SoundTbl_Pain = {"vj_piv/mil_zomb/gasmask/pain_1.wav","vj_piv/mil_zomb/gasmask/pain_2.wav","vj_piv/mil_zomb/gasmask/pain_3.wav","vj_piv/mil_zomb/gasmask/pain_4.wav","vj_piv/mil_zomb/gasmask/pain_5.wav","vj_piv/mil_zomb/gasmask/pain_6.wav"}
			self.SoundTbl_Death = {"vj_piv/mil_zomb/gasmask/infected_death_1.wav","vj_piv/mil_zomb/gasmask/infected_death_2.wav","vj_piv/mil_zomb/gasmask/infected_death_3.wav"}
			self.SoundTbl_BeforeMeleeAttack = {"vj_piv/mil_zomb/gasmask/attack_1.wav","vj_piv/mil_zomb/gasmask/attack_2.wav","vj_piv/mil_zomb/gasmask/attack_3.wav","vj_piv/mil_zomb/gasmask/attack_4.wav"}
		end
	end
	
	if GetConVar("vj_piv_mil_shield"):GetInt() == 1 && self.PIV_WeHaveAWeapon == false && self.PIV_FuckingCrawlingLittleCunt == false then
		if math.random(1,GetConVar("vj_piv_mil_shield_chance"):GetInt()) == 1 then
			local ShieldPlacement = self:LookupBone("ValveBiped.Bip01_L_Forearm")
			self.ZombieShield = ents.Create("prop_physics")
			self.ZombieShield:SetModel("models/vj_piv/weapons/shield.mdl")
			self.ZombieShield:SetPos(self:GetPos() + Vector(0,0,0))
			self.ZombieShield:SetAngles(self:GetAngles() + Angle(0,0,0))
			self.ZombieShield:Fire("SetParentAttachment","shield")
			self.ZombieShield:SetOwner(self) 
			self.ZombieShield:SetParent(self)
			self:ManipulateBoneAngles(ShieldPlacement, Angle(0,-80,-20))
			self.ZombieShield:Spawn()
			self.ZombieShield:Activate()	
			self.ZombieShield:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
			self.AnimTbl_Walk = {ACT_WALK_AIM_AGITATED}
			self.AnimTbl_Run = {ACT_RUN_AIM_STIMULATED}
			self.AnimTbl_IdleStand = {ACT_IDLE_AIM_AGITATED}
			self.PIV_CanClimb = false
			self.PIV_HasShield = true
			self.HasLeapAttack = false
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SpawnBloodParticles(dmginfo,hitgroup)
if self.PIV_HasArmor == true then
	if hitgroup == HITGROUP_HEAD then
		local p_name = VJ_PICK(self.CustomBlood_Particle)
		if p_name == false then return end
		
		local dmg_pos = dmginfo:GetDamagePosition()
		if dmg_pos == Vector(0,0,0) then dmg_pos = self:GetPos() + self:OBBCenter() end
		
		local spawnparticle = ents.Create("info_particle_system")
		spawnparticle:SetKeyValue("effect_name",p_name)
		spawnparticle:SetPos(dmg_pos)
		spawnparticle:Spawn()
		spawnparticle:Activate()
		spawnparticle:Fire("Start","",0)
		spawnparticle:Fire("Kill","",0.1)
	end
end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
if self.PIV_HasArmor == true then
	if hitgroup == HITGROUP_HEAD then return end
	if (dmginfo:IsBulletDamage() or dmginfo:IsExplosionDamage()) then
		local attacker = dmginfo:GetAttacker()
		self.DamageSpark1 = ents.Create("env_spark")
		self.DamageSpark1:SetKeyValue("Magnitude","1")
		self.DamageSpark1:SetKeyValue("Spark Trail Length","1")
		self.DamageSpark1:SetPos(dmginfo:GetDamagePosition())
		self.DamageSpark1:SetAngles(self:GetAngles())
		//self.DamageSpark1:Fire("LightColor", "255 255 255")
		self.DamageSpark1:SetParent(self)
		self.DamageSpark1:Spawn()
		self.DamageSpark1:Activate()
		self.DamageSpark1:Fire("StartSpark", "", 0)
		self.DamageSpark1:Fire("StopSpark", "", 0.001)
		self:DeleteOnRemove(self.DamageSpark1)
	end
	if self.HasSounds == true && self.HasImpactSounds == true then VJ_EmitSound(self,"vj_impact_metal/bullet_metal/metalsolid"..math.random(1,10)..".wav",70) end
	 dmginfo:ScaleDamage(0.50)
	end
	
	if hitgroup == HITGROUP_HEAD && GetConVar("vj_piv_headshot_damage"):GetInt() == 1 then
		dmginfo:ScaleDamage(GetConVarNumber("vj_piv_headshot_damage_mult"))
    end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/