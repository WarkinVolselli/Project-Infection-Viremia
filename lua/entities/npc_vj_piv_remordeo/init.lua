include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.Model = {"models/vj_piv/specials/remordeo/remordeo.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
	self.StartHealth = 200

	self.PIV_IsSpecial = true

	self.HasRangeAttack = true -- Should the SNPC have a range attack?
	self.RangeUseAttachmentForPos = true -- Should the projectile spawn on a attachment?
	self.RangeUseAttachmentForPosID = "mouth" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true
	self.AnimTbl_RangeAttack = {"vjseq_nz_taunt_3","vjseq_nz_taunt_3","vjseq_nz_taunt_3"} -- Range Attack Animations
	self.RangeAttackEntityToSpawn = "obj_vj_piv_smoke" -- The entity that is spawned when range attacking
	self.RangeDistance = 3000 -- This is how far away it can shoot
	self.RangeToMeleeDistance = 500 -- How close does it have to be until it uses melee?
	self.TimeUntilRangeAttackProjectileRelease = 0.6 -- How much time until the projectile code is ran?
	self.RangeAttackExtraTimers = {0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2,2.1,2.2,2.3,2.4}
	self.NextRangeAttackTime = 8 -- How much time until it can use a range attack?
	self.Immune_AcidPoisonRadiation = true -- Makes the SNPC not get damage from Acid, posion, radiation

	self.PIV_IsRunner = true
	self.PIV_Infection_IsWalker = false
	
	self.PIV_CanBeCrawler = false
	self.PIV_CanBeDiseased = false
	self.PIV_CanBeThrower = false

	self.PIV_AllowedToVomit = false
	self.PIV_CanBeBiter = false
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
	self.SoundTbl_BeforeRangeAttack = {"vj_piv/remordeo/gas_can_explode.wav"}
	self.SoundTbl_Idle = {
		"vj_piv/mil_zomb/gasmask/runner/idle1.wav",
		"vj_piv/mil_zomb/gasmask/runner/idle2.wav",
		"vj_piv/mil_zomb/gasmask/runner/idle3.wav",
		"vj_piv/mil_zomb/gasmask/runner/idle4.wav",
		"vj_piv/mil_zomb/gasmask/runner/idle5.wav",
		"vj_piv/mil_zomb/gasmask/runner/idle6.wav",
		"vj_piv/mil_zomb/gasmask/runner/idle7.wav",
		"vj_piv/mil_zomb/gasmask/runner/idle8.wav",
		"vj_piv/mil_zomb/gasmask/runner/idle9.wav"
	}
	self.SoundTbl_Alert = {"vj_piv/mil_zomb/gasmask/runner/alert1.wav"}
	self.SoundTbl_CombatIdle = {
		"vj_piv/mil_zomb/gasmask/runner/combatidle1.wav",
		"vj_piv/mil_zomb/gasmask/runner/combatidle2.wav",
		"vj_piv/mil_zomb/gasmask/runner/combatidle3.wav",
		"vj_piv/mil_zomb/gasmask/runner/combatidle4.wav",
		"vj_piv/mil_zomb/gasmask/runner/combatidle5.wav",
		"vj_piv/mil_zomb/gasmask/runner/combatidle6.wav",
		"vj_piv/mil_zomb/gasmask/runner/combatidle7.wav",
		"vj_piv/mil_zomb/gasmask/runner/combatidle8.wav",
		"vj_piv/mil_zomb/gasmask/runner/combatidle9.wav"
	}
	self.SoundTbl_Pain = {
		"vj_piv/mil_zomb/gasmask/runner/pain1.wav",
		"vj_piv/mil_zomb/gasmask/runner/pain2.wav",
		"vj_piv/mil_zomb/gasmask/runner/pain3.wav",
		"vj_piv/mil_zomb/gasmask/runner/pain4.wav",
		"vj_piv/mil_zomb/gasmask/runner/pain5.wav",
		"vj_piv/mil_zomb/gasmask/runner/pain6.wav",
		"vj_piv/mil_zomb/gasmask/runner/pain7.wav",
		"vj_piv/mil_zomb/gasmask/runner/pain8.wav"
	}
	self.SoundTbl_Death = {
		"vj_piv/mil_zomb/gasmask/runner/pain1.wav",
		"vj_piv/mil_zomb/gasmask/runner/pain2.wav",
		"vj_piv/mil_zomb/gasmask/runner/pain3.wav",
		"vj_piv/mil_zomb/gasmask/runner/pain4.wav",
		"vj_piv/mil_zomb/gasmask/runner/pain5.wav",
		"vj_piv/mil_zomb/gasmask/runner/pain6.wav",
		"vj_piv/mil_zomb/gasmask/runner/pain7.wav",
		"vj_piv/mil_zomb/gasmask/runner/pain8.wav"
	}
	self.SoundTbl_BeforeMeleeAttack = {
		"vj_piv/mil_zomb/gasmask/runner/idle1.wav",
		"vj_piv/mil_zomb/gasmask/runner/idle2.wav",
		"vj_piv/mil_zomb/gasmask/runner/idle3.wav",
		"vj_piv/mil_zomb/gasmask/runner/idle4.wav",
		"vj_piv/mil_zomb/gasmask/runner/idle5.wav",
		"vj_piv/mil_zomb/gasmask/runner/idle6.wav",
		"vj_piv/mil_zomb/gasmask/runner/idle7.wav",
		"vj_piv/mil_zomb/gasmask/runner/idle8.wav",
		"vj_piv/mil_zomb/gasmask/runner/idle9.wav"
	}

	self.AlertSoundLevel = 80
	self.CombatIdleSoundLevel = 80
	self.BeforeMeleeAttackSoundLevel = 80
	self.BeforeRangeAttackSoundLevel = 80
	self.PainSoundLevel = 80
	self.DeathSoundLevel = 80

	self.BeforeRangeAttackPitch = VJ.SET(90, 100)

end
--------------------
function ENT:Zombie_CustomOnInitialize()

	self.NextSoundTime_Breath = VJ.SET(7,20)
    self.PIV_LegHP = self.StartHealth * 2
	if GetConVar("vj_npc_reduce_vfx"):GetInt() == 0 then
 	    ParticleEffectAttach("smoke_exhaust_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
	end
	
end
--------------------
function ENT:Zombie_CustomOnThink() 
    VJ.ApplyRadiusDamage(self,self,self:GetPos(),100,0.25,DMG_RADIATION,true,true)
end
--------------------
function ENT:PIV_CustomMutate()

	self.PIV_UseRunRelaxed = true
	self.PIV_UseRunAsWalk = true

	self.StartHealth = self.StartHealth *2
	self:SetHealth(self.StartHealth)

	local mymaxhealth = self:Health()
	self:SetMaxHealth(mymaxhealth)

	self.PIV_LegHP = self.PIV_LegHP *2

	if GetConVar("vj_piv_lights"):GetInt() == 1 then 

	self.Light2 = ents.Create("light_dynamic")
	self.Light2:SetKeyValue("brightness", "1")
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

	end

end
--------------------