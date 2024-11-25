include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
ENT.Model = {"models/vj_piv/hl2/combine/Combine_Soldier.mdl"}
ENT.StartHealth = 150
--------------------
function ENT:Zombie_CustomOnPreInitialize()

	self.PIV_IsZombine = true

	if self:GetClass() == "npc_vj_piv_walker_combine_st" || self:GetClass() == "npc_vj_piv_runner_combine_st" then
		self.Model = {"models/vj_piv/hl2/combine/soldier_stripped.mdl"}
	elseif self:GetClass() == "npc_vj_piv_walker_combine_e" || self:GetClass() == "npc_vj_piv_runner_combine_e" then
		self.Model = {"models/vj_piv/hl2/combine/Combine_Super_Soldier.mdl"}
	end

	if self:GetClass() == "npc_vj_piv_runner_combine_s" || self:GetClass() == "npc_vj_piv_walker_combine_st" || self:GetClass() == "npc_vj_piv_runner_combine_p" then
		self.StartHealth = 125
	end
	if self:GetClass() == "npc_vj_piv_runner_combine_st" then
		self.StartHealth = 100
	end
	
	if self:GetClass() != "npc_vj_piv_walker_combine_st" || self:GetClass() != "npc_vj_piv_runner_combine_st" then -- Apply this if we're not a stripped combine
		self.Immune_AcidPoisonRadiation = true -- Immune to Acid, Poison and Radiation
		self.ImmuneDamagesTable = {DMG_PARALYZE,DMG_NERVEGAS}
		self.PIV_AllowedToVomit = false
		self.PIV_CanBeBiter = false
	end

	if self:GetClass() == "npc_vj_piv_walker_combine_e" || self:GetClass() == "npc_vj_piv_runner_combine_e" then -- If we're an elite
		self.StartHealth = self.StartHealth * 1.5
	end

	if
		self:GetClass() == "npc_vj_piv_runner_combine_s" ||
		self:GetClass() == "npc_vj_piv_runner_combine_st" ||
		self:GetClass() == "npc_vj_piv_runner_combine_p" ||
		self:GetClass() == "npc_vj_piv_runner_combine_e"
	then -- If we're a runner
		self.PIV_IsRunner = true
		self.PIV_Infection_IsWalker = false
	end
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	if self:GetClass() == "npc_vj_piv_walker_combine_p" || self:GetClass() == "npc_vj_piv_runner_combine_p" then
		self:SetSkin(math.random(2,3))
	else
		self:SetSkin(math.random(0,1))
	end
	self.NextSoundTime_Breath = VJ.SET(15,60)
	if self:GetClass() == "npc_vj_piv_walker_combine_e" || self:GetClass() == "npc_vj_piv_runner_combine_e" then
		if GetConVar("vj_piv_lights"):GetInt() == 1 then 

			self.Light2 = ents.Create("light_dynamic")
			self.Light2:SetKeyValue("brightness", "2")
			self.Light2:SetKeyValue("distance", "50")
			self.Light2:SetLocalPos(self:GetPos())
			self.Light2:SetLocalAngles(self:GetAngles())
			self.Light2:Fire("Color", "255 0 0 255")
			self.Light2:SetParent(self)
			self.Light2:Spawn()
			self.Light2:Activate()
			self.Light2:Fire("SetParentAttachment","eyes")
			self.Light2:Fire("TurnOn", "", 0)
			self:DeleteOnRemove(self.Light2)

			self.EyeGlow = ents.Create("env_sprite")
			self.EyeGlow:SetKeyValue("model","sprites/vj_piv/glow01.vmt")
			self.EyeGlow:SetKeyValue("scale","0.1")
			self.EyeGlow:SetKeyValue("rendermode","5")
			self.EyeGlow:SetKeyValue("rendercolor","255 0 0 255")
			self.EyeGlow:SetKeyValue("spawnflags","1") 
			self.EyeGlow:SetParent(self)
			self.EyeGlow:Fire("SetParentAttachment","eyes",0)
			self.EyeGlow:Spawn()
			self.EyeGlow:Activate()
			self:DeleteOnRemove(self.EyeGlow)

		end
	end
end
--------------------
function ENT:Zombie_GiveVoice()
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
	self.SoundTbl_Idle = {
		"vj_piv/combinezombie/zombine_idle1.wav",
		"vj_piv/combinezombie/zombine_idle2.wav",
		"vj_piv/combinezombie/zombine_idle3.wav",
		"vj_piv/combinezombie/zombine_idle4.wav",
		"vj_piv/combinezombie/zombine_idle5.wav",
		"vj_piv/combinezombie/zombine_idle6.wav"
	}
	self.SoundTbl_CombatIdle = {
		"vj_piv/combinezombie/zombine_alert1.wav",
		"vj_piv/combinezombie/zombine_alert2.wav",
		"vj_piv/combinezombie/zombine_alert3.wav",
		"vj_piv/combinezombie/zombine_alert4.wav",
		"vj_piv/combinezombie/zombine_alert5.wav",
		"vj_piv/combinezombie/zombine_alert6.wav",
		"vj_piv/combinezombie/zombine_alert7.wav"
	}
	self.SoundTbl_Alert = {
		"vj_piv/combinezombie/zombine_alert1.wav",
		"vj_piv/combinezombie/zombine_alert2.wav",
		"vj_piv/combinezombie/zombine_alert3.wav",
		"vj_piv/combinezombie/zombine_alert4.wav",
		"vj_piv/combinezombie/zombine_alert5.wav",
		"vj_piv/combinezombie/zombine_alert6.wav",
		"vj_piv/combinezombie/zombine_alert7.wav"
	}
	self.SoundTbl_BeforeMeleeAttack = {
		"vj_piv/combinezombie/zombine_readygrenade1.wav",
		"vj_piv/combinezombie/zombine_readygrenade2.wav",
		"vj_piv/combinezombie/zombine_readygrenade3.wav",
		"vj_piv/combinezombie/zombine_charge1.wav",
		"vj_piv/combinezombie/zombine_charge2.wav"
	}
	self.SoundTbl_Pain = {
		"vj_piv/combinezombie/zombine_pain1.wav",
		"vj_piv/combinezombie/zombine_pain2.wav",
		"vj_piv/combinezombie/zombine_pain3.wav",
		"vj_piv/combinezombie/zombine_pain4.wav",
		"vj_piv/combinezombie/zombine_pain5.wav",
		"vj_piv/combinezombie/zombine_pain6.wav",
		"vj_piv/combinezombie/zombine_pain7.wav"
	}
	self.SoundTbl_Death = {
		"vj_piv/combinezombie/zombine_die1.wav",
		"vj_piv/combinezombie/zombine_die2.wav",
		"vj_piv/combinezombie/zombine_die3.wav",
		"vj_piv/combinezombie/zombine_die4.wav"
	}
end
--------------------
function ENT:Zombie_CustomOnTakeDamage_PreDamage(dmginfo,hitgroup)

	if self:GetClass() == "npc_vj_piv_walker_combine_st" || self:GetClass() == "npc_vj_piv_runner_combine_st" then

		-- Only have armor on the legs if we're a stripped combine
		if (hitgroup == HITGROUP_LEFTLEG or hitgroup == HITGROUP_RIGHTLEG) && (dmginfo:IsBulletDamage()) then
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
			if self.HasSounds == true && self.HasImpactSounds == true then VJ.EmitSound(self,"vj_base/impact/armor"..math.random(1,10)..".wav",70) end
			dmginfo:ScaleDamage(0.50)
		end

	else

		if hitgroup != HITGROUP_HEAD && (dmginfo:IsBulletDamage()) then
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
			if self.HasSounds == true && self.HasImpactSounds == true then VJ.EmitSound(self,"vj_base/impact/armor"..math.random(1,10)..".wav",70) end
			dmginfo:ScaleDamage(0.50)
		end

	end

end
--------------------