include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	if math.random(1,3) == 1 then
		self.Model = {"models/vj_piv/hl2/combine/elitepolice.mdl"}
	else
		self.Model = {"models/vj_piv/hl2/combine/police.mdl"}
	end
	self.Immune_AcidPoisonRadiation = true -- Immune to Acid, Poison and Radiation
	self.ImmuneDamagesTable = {DMG_PARALYZE,DMG_NERVEGAS}
	self.PIV_AllowedToVomit = false
	self.PIV_CanBeBiter = false
	self.PIV_IsMetropolice = true
	if self:GetClass () == "npc_vj_piv_runner_metropolice" then
		self.StartHealth = 100
		self.PIV_IsRunner = true
		self.PIV_Infection_IsWalker = false
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
		"vj_piv/metrozombie/zombine_idle1.wav",
		"vj_piv/metrozombie/zombine_idle2.wav",
		"vj_piv/metrozombie/zombine_idle3.wav",
		"vj_piv/metrozombie/zombine_idle4.wav"
	}
	self.SoundTbl_CombatIdle = {
		"vj_piv/metrozombie/zombine_alert1.wav",
		"vj_piv/metrozombie/zombine_alert2.wav",
		"vj_piv/metrozombie/zombine_alert3.wav",
		"vj_piv/metrozombie/zombine_alert4.wav",
		"vj_piv/metrozombie/zombine_alert5.wav",
		"vj_piv/metrozombie/zombine_alert6.wav",
		"vj_piv/metrozombie/zombine_alert7.wav"
	}
	self.SoundTbl_Alert = {
		"vj_piv/metrozombie/zombine_alert1.wav",
		"vj_piv/metrozombie/zombine_alert2.wav",
		"vj_piv/metrozombie/zombine_alert3.wav",
		"vj_piv/metrozombie/zombine_alert4.wav",
		"vj_piv/metrozombie/zombine_alert5.wav",
		"vj_piv/metrozombie/zombine_alert6.wav",
		"vj_piv/metrozombie/zombine_alert7.wav"
	}
	self.SoundTbl_BeforeMeleeAttack = {
		"vj_piv/metrozombie/zombine_readygrenade1.wav",
		"vj_piv/metrozombie/zombine_readygrenade2.wav",
		"vj_piv/metrozombie/zombine_charge1.wav",
		"vj_piv/metrozombie/zombine_charge2.wav"
	}
	self.SoundTbl_Pain = {
		"vj_piv/metrozombie/zombine_pain1.wav",
		"vj_piv/metrozombie/zombine_pain2.wav",
		"vj_piv/metrozombie/zombine_pain3.wav",
		"vj_piv/metrozombie/zombine_pain4.wav"
	}
	self.SoundTbl_Death = {
		"vj_piv/metrozombie/zombine_die1.wav",
		"vj_piv/metrozombie/zombine_die2.wav"
	}
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,1))
	self.NextSoundTime_Breath = VJ.SET(15,60)
end
--------------------
function ENT:Zombie_CustomOnTakeDamage_PreDamage(dmginfo,hitgroup)
	if hitgroup == HITGROUP_CHEST then
		if dmginfo:IsBulletDamage() then
			dmginfo:ScaleDamage(0.9)
		end
		if self.HasSounds == true && self.HasImpactSounds == true then
			VJ.EmitSound(self,"physics/flesh/flesh_impact_bullet"..math.random(1,5)..".wav",70)
		end
	end
end
--------------------