include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
-- should we make this guy use the military zombie walker as a base instead of the base walker?
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.Model = {"models/vj_piv/specials/military/grenadier.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
	self.StartHealth = 200
-- 	self.HullType = HULL_HUMAN -- i don't think we need this
	self.PIV_AllowedToVomit = false
	self.PIV_CanBeBiter = false
	self.GeneralSoundPitch1 = 90
	self.GeneralSoundpitch2 = 80
	self.HasBreathSound = true
	self.PIV_IsSpecial = true
	self.PIV_IsMilitary = true

	self.PIV_CanBeCrawler = false
	self.PIV_HasWeapons = false
	self.PIV_CanBeThrower = false

	self.PIV_HasArmor = true

	self.HasRangeAttack = true
	self.RangeDistance = 1250
	self.RangeToMeleeDistance = 300
	self.NextRangeAttackTime = 6
	self.NextRangeAttackTime_DoRand = 16 

	self.PIV_UseAgitatedCrawlerMovement = true

	self.RangeAttackEntityToSpawn = "obj_vj_grenade"
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
end
--------------------
function ENT:Zombie_GiveVoice()
	self.SoundTbl_Idle = {
		"vj_piv/mil_zomb/radio/idle_1.wav",
		"vj_piv/mil_zomb/radio/idle_2.wav",
		"vj_piv/mil_zomb/radio/idle_3.wav",
		"vj_piv/mil_zomb/radio/idle_4.wav"
	}
	self.SoundTbl_Alert = {
		"vj_piv/mil_zomb/radio/alert_1.wav",
		"vj_piv/mil_zomb/radio/alert_2.wav",
		"vj_piv/mil_zomb/radio/alert_3.wav",
		"vj_piv/mil_zomb/radio/alert_4.wav",
		"vj_piv/mil_zomb/radio/alert_5.wav",
		"vj_piv/mil_zomb/radio/alert_6.wav",
		"vj_piv/mil_zomb/radio/alert_7.wav"
	}
	self.SoundTbl_CombatIdle = {
		"vj_piv/mil_zomb/radio/idle_1.wav",
		"vj_piv/mil_zomb/radio/idle_2.wav",
		"vj_piv/mil_zomb/radio/idle_3.wav",
		"vj_piv/mil_zomb/radio/idle_4.wav",
		"vj_piv/mil_zomb/radio/idle_1.wav",
		"vj_piv/mil_zomb/radio/idle_2.wav",
		"vj_piv/mil_zomb/radio/idle_3.wav",
		"vj_piv/mil_zomb/radio/idle_4.wav",
		"vj_piv/mil_zomb/radio/alert_1.wav",
		"vj_piv/mil_zomb/radio/alert_2.wav",
		"vj_piv/mil_zomb/radio/alert_3.wav",
		"vj_piv/mil_zomb/radio/alert_4.wav",
		"vj_piv/mil_zomb/radio/alert_5.wav",
		"vj_piv/mil_zomb/radio/alert_6.wav",
		"vj_piv/mil_zomb/radio/alert_7.wav"
	}
	self.SoundTbl_BeforeMeleeAttack = {
		"vj_piv/mil_zomb/radio/alert_1.wav",
		"vj_piv/mil_zomb/radio/alert_2.wav",
		"vj_piv/mil_zomb/radio/alert_3.wav",
		"vj_piv/mil_zomb/radio/alert_4.wav",
		"vj_piv/mil_zomb/radio/alert_5.wav",
		"vj_piv/mil_zomb/radio/alert_6.wav",
		"vj_piv/mil_zomb/radio/alert_7.wav"
	}
	self.SoundTbl_Pain = {
		"vj_piv/mil_zomb/radio/pain_1.wav",
		"vj_piv/mil_zomb/radio/pain_2.wav",
		"vj_piv/mil_zomb/radio/pain_3.wav",
		"vj_piv/mil_zomb/radio/pain_4.wav"
	}
	self.SoundTbl_Death = {
		"vj_piv/mil_zomb/radio/death_1.wav",
		"vj_piv/mil_zomb/radio/death_2.wav"
	}
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetBodygroup(1,math.random(0,1))
	self:SetBodygroup(3,math.random(0,1))
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
		if self.HasSounds == true && self.HasImpactSounds == true then VJ.EmitSound(self,"vj_base/impact/armor"..math.random(1,10)..".wav",70) end
		dmginfo:ScaleDamage(0.50)
	end
end
--------------------