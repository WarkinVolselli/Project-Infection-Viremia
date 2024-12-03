include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()

	if self:GetClass() == "npc_vj_piv_runner_mil" || self:GetClass() == "npc_vj_piv_runner_mil_police" || self:GetClass() == "npc_vj_piv_runner_mil_ghillie" then
		self.StartHealth = 125
		self.PIV_IsRunner = true
		self.PIV_Infection_IsWalker = false
	else
		self.StartHealth = 150
	end

	self.PIV_IsMilitary = true

	if self:GetClass() == "npc_vj_piv_walker_mil_police" || self:GetClass() == "npc_vj_piv_runner_mil_police" then

		self.Model = {"models/vj_piv/military/national_guard_riot.mdl"}

		if GetConVar("vj_piv_militaryskin"):GetInt() == 1 then
			self.Model = {"models/vj_piv/military/us_soldier_riot.mdl"}
		elseif GetConVar("vj_piv_militaryskin"):GetInt() == 2 then
			self.Model = {"models/vj_piv/military/us_desert_riot.mdl"}
		elseif GetConVar("vj_piv_militaryskin"):GetInt() == 3 then
			self.Model = {"models/vj_piv/military/us_snow_riot.mdl"}
		elseif GetConVar("vj_piv_militaryskin"):GetInt() == 4 then
			self.Model = {
				"models/vj_piv/military/national_guard_riot.mdl",
				"models/vj_piv/military/us_soldier_riot.mdl",
				"models/vj_piv/military/us_desert_riot.mdl",
				"models/vj_piv/military/us_snow_riot.mdl"
			}
		end

	elseif self:GetClass() == "npc_vj_piv_walker_mil_ghillie" || self:GetClass() == "npc_vj_piv_runner_mil_ghillie" then
		
		self.Model = {"models/vj_piv/military/national_guard_ghillie.mdl"}

		if GetConVar("vj_piv_militaryskin"):GetInt() == 1 then
			self.Model = {"models/vj_piv/military/us_soldier_ghillie.mdl"}
		elseif GetConVar("vj_piv_militaryskin"):GetInt() == 2 then
			self.Model = {"models/vj_piv/military/us_desert_ghillie.mdl"}
		elseif GetConVar("vj_piv_militaryskin"):GetInt() == 3 then
			self.Model = {"models/vj_piv/military/us_snow_ghillie.mdl"}
		elseif GetConVar("vj_piv_militaryskin"):GetInt() == 4 then
			self.Model = {
				"models/vj_piv/military/national_guard_ghillie.mdl",
				"models/vj_piv/military/us_soldier_ghillie.mdl",
				"models/vj_piv/military/us_desert_ghillie.mdl",
				"models/vj_piv/military/us_snow_ghillie.mdl"
			}
		end

	else

		self.Model = {
			"models/vj_piv/military/national_guard_1.mdl",
			"models/vj_piv/military/national_guard_2.mdl"
		}

		if GetConVar("vj_piv_militaryskin"):GetInt() == 1 then
			self.Model = {
				"models/vj_piv/military/us_soldier1.mdl",
				"models/vj_piv/military/us_soldier2.mdl"
			}
		elseif GetConVar("vj_piv_militaryskin"):GetInt() == 2 then
			self.Model = {
				"models/vj_piv/military/us_desert_1.mdl",
				"models/vj_piv/military/us_desert_2.mdl"
			}
		elseif GetConVar("vj_piv_militaryskin"):GetInt() == 3 then
			self.Model = {
				"models/vj_piv/military/us_snow_1.mdl",
				"models/vj_piv/military/us_snow_2.mdl"
			}
		elseif GetConVar("vj_piv_militaryskin"):GetInt() == 4 then
			self.Model = {
				"models/vj_piv/military/national_guard_1.mdl",
				"models/vj_piv/military/national_guard_2.mdl",
				"models/vj_piv/military/us_soldier1.mdl",
				"models/vj_piv/military/us_soldier2.mdl",
				"models/vj_piv/military/us_desert_1.mdl",
				"models/vj_piv/military/us_desert_2.mdl",
				"models/vj_piv/military/us_snow_1.mdl",
				"models/vj_piv/military/us_snow_2.mdl"
			}

		end

	end

	self.SoundTbl_Breath = {
		"ambient/levels/prison/radio_random1.wav",
		"ambient/levels/prison/radio_random2.wav",
		"ambient/levels/prison/radio_random3.wav",
		"ambient/levels/prison/radio_random4.wav",
		"ambient/levels/prison/radio_random5.wav",
		"ambient/levels/prison/radio_random6.wav",
		"ambient/levels/prison/radio_random7.wav",
		"ambient/levels/prison/radio_random8.wav",
		"ambient/levels/prison/radio_random9.wav",
		"ambient/levels/prison/radio_random10.wav",
		"ambient/levels/prison/radio_random11.wav",
		"ambient/levels/prison/radio_random12.wav",
		"ambient/levels/prison/radio_random13.wav",
		"ambient/levels/prison/radio_random14.wav"
	}
	self.NextSoundTime_Breath = VJ.SET(7,20)
	if GetConVar("vj_piv_mil_gasmask"):GetInt() == 1 && math.random(1,GetConVar("vj_piv_mil_gasmask_chance"):GetInt()) == 1 then
		self.PIV_Mil_SpawnWithGasmask = true
		self.ImmuneDamagesTable = {DMG_PARALYZE,DMG_POISON,DMG_PARALYZE,DMG_POISON,DMG_RADIATION,DMG_NERVEGAS}
		self.NextSoundTime_Idle = VJ.SET(16, 23)
		self.PIV_AllowedToVomit = false
		self.PIV_CanBeBiter = false
	end
end
--------------------
function ENT:Zombie_GiveVoice()
	if self.PIV_Mil_SpawnWithGasmask then
		self.SoundTbl_CombatIdle = {
			"vj_piv/mil_zomb/gasmask/walker_combatidle_1.wav",
			"vj_piv/mil_zomb/gasmask/walker_combatidle_2.wav",
			"vj_piv/mil_zomb/gasmask/walker_combatidle_3.wav",
			"vj_piv/mil_zomb/gasmask/walker_combatidle_4.wav"
		}
		self.SoundTbl_Idle = {
			"vj_piv/mil_zomb/gasmask/idle_1.wav",
			"vj_piv/mil_zomb/gasmask/idle_2.wav",
			"vj_piv/mil_zomb/gasmask/idle_3.wav"
		}
		self.SoundTbl_Alert = {
			"vj_piv/mil_zomb/gasmask/alert_1.wav",
			"vj_piv/mil_zomb/gasmask/alert_2.wav",
			"vj_piv/mil_zomb/gasmask/alert_3.wav",
			"vj_piv/mil_zomb/gasmask/alert_4.wav"
		}
		self.SoundTbl_Pain = {
			"vj_piv/mil_zomb/gasmask/pain_1.wav",
			"vj_piv/mil_zomb/gasmask/pain_2.wav",
			"vj_piv/mil_zomb/gasmask/pain_3.wav",
			"vj_piv/mil_zomb/gasmask/pain_4.wav",
			"vj_piv/mil_zomb/gasmask/pain_5.wav",
			"vj_piv/mil_zomb/gasmask/pain_6.wav"
		}
		self.SoundTbl_Death = {
			"vj_piv/mil_zomb/gasmask/death_1.wav",
			"vj_piv/mil_zomb/gasmask/death_2.wav",
			"vj_piv/mil_zomb/gasmask/death_3.wav"
		}
		self.SoundTbl_BeforeMeleeAttack = {
			"vj_piv/mil_zomb/gasmask/attack_1.wav",
			"vj_piv/mil_zomb/gasmask/attack_2.wav",
			"vj_piv/mil_zomb/gasmask/attack_3.wav",
			"vj_piv/mil_zomb/gasmask/attack_4.wav"
		}
	else
		self:Zombie_GiveVoice_Default()
	end
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	
	if self:GetClass() == "npc_vj_piv_walker_mil_police" || self:GetClass() == "npc_vj_piv_runner_mil_police" then
		self:SetBodygroup(1,math.random(0,1))
		self:SetBodygroup(3,math.random(0,1))
		self:SetBodygroup(4,math.random(1,2))
		if
			GetConVar("vj_piv_mil_shield"):GetInt() == 1 &&
			self.PIV_WeHaveAWeapon == false &&
			self.PIV_FuckingCrawlingLittleCunt == false &&
			self.PIV_Shambler == false
		then
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

				self.PIV_CanClimb = false
				self.AttackProps = false
				self.PushProps = false
				self.PIV_HasShield = true
			end
		end
	elseif self:GetClass() == "npc_vj_piv_walker_mil_ghillie" || self:GetClass() == "npc_vj_piv_runner_mil_ghillie" then
		self:SetBodygroup(2,math.random(0,2))
		self:SetBodygroup(3,math.random(0,2))
		self:SetBodygroup(4,math.random(0,3))
		if 
			GetConVar("vj_piv_mil_ghillie_stealth"):GetInt() == 1 &&
			math.random(1,GetConVar("vj_piv_mil_ghillie_stealth_chance"):GetInt()) == 1 &&
			self.PIV_WeHaveAWeapon == false &&
			self.PIV_Thrower == false &&
			self.PIV_Crippled == false &&
			self.PIV_FuckingCrawlingLittleCunt == false
		then
			self.PIV_LittleBastard = true
			self:SitTheFuckDown()
		end
	else
		self:SetBodygroup(1,math.random(0,1))
		self:SetBodygroup(3,math.random(0,1))
		self:SetBodygroup(4,math.random(1,6))
	end

	if math.random(1,5) == 1 then
		self:SetSkin(math.random(3,4))
	else
		self:SetSkin(math.random(0,2))
	end
	
	if GetConVar("vj_piv_mil_flakarmor"):GetInt() == 1 && math.random(1,GetConVar("vj_piv_mil_flakarmor_chance"):GetInt()) == 1 then
		self:SetBodygroup(2,3)
		self.PIV_HasArmor = true
	else
		if math.random(1,2) == 1 then
			self:SetBodygroup(2,math.random(1,2))	
		elseif math.random(1,3) == 2 then
			self:SetBodygroup(2,math.random(4,6))
		end
	end

	if self.PIV_Mil_SpawnWithGasmask then
		if self:GetClass() == "npc_vj_piv_walker_mil_ghillie" || self:GetClass() == "npc_vj_piv_runner_mil_ghillie" then
			self:SetBodygroup(4,4)
		else
			self:SetBodygroup(4,0)
		end
	end

end
--------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
	if self:GetClass() == "npc_vj_piv_walker_mil_ghillie" || self:GetClass() == "npc_vj_piv_runner_mil_ghillie" then
		if self.PIV_Crippled == false && self.PIV_LittleBastard == true && self.NextCrawlT < CurTime() then
			if IsValid(self:GetEnemy()) && self:GetPos():Distance(self:GetEnemy():GetPos()) < 150 && self.PIV_GoblinMode then
				self:StandTheFuckUp()
			else
				if !self.PIV_GoblinMode then
					PrintMessage(4,"Test")
					VJ.EmitSound(self,"vo/k_lab/kl_ahhhh.wav",0,math.random(60,130))
					self:SitTheFuckDown()
				end
			end
		end
	end
end
--------------------
function ENT:SpawnBloodParticles(dmginfo,hitgroup)
	if self.PIV_HasArmor == true && hitgroup == HITGROUP_HEAD then
		local p_name = VJ.PICK(self.CustomBlood_Particle)
		
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
--------------------
function ENT:Zombie_CustomOnTakeDamage_PreDamage(dmginfo,hitgroup)

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

	if self.HasSounds == true && self.HasImpactSounds == true then 
		VJ.EmitSound(self,"vj_base/impact/armor"..math.random(1,10)..".wav",70)
		dmginfo:ScaleDamage(0.50)
	end

	if hitgroup == HITGROUP_HEAD && GetConVar("vj_piv_headshot_damage"):GetInt() == 1 then
		dmginfo:ScaleDamage(GetConVar("vj_piv_headshot_damage_mult"):GetInt())
		-- dmginfo:ScaleDamage(999)
	end

	if self.PIV_HasArmor == true then
		if dmginfo:IsExplosionDamage() then
			dmginfo:ScaleDamage(0.60) -- Placeholder value; I don't know what the original/intended one is so this is just what we're going with
		end
		if dmginfo:IsBulletDamage() && hitgroup != HITGROUP_HEAD then
			dmginfo:ScaleDamage(0.80) -- Placeholder value
		end
	end
end
--------------------