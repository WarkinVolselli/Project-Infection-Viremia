include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.Model = {"models/vj_piv/hl2/hev_helmet.mdl"}
	self.StartHealth = 200
	self.Immune_AcidPoisonRadiation = true
	self.Immune_Electricity = true
	self.Immune_Fire = true
	self.ImmuneDamagesTable = {DMG_PARALYZE,DMG_NERVEGAS}
	self.PIV_CanBeBiter = false
	self.PIV_IsHEV = true
	self.PIV_AllowedToVomit = false
	if self:GetClass() == "npc_vj_piv_runner_hev" then
		self.PIV_IsRunner = true
		self.PIV_Infection_IsWalker = false
	end
end
--------------------
function ENT:Zombie_GiveVoice()
	self.SoundTbl_Idle = {
		"vj_piv/hev/idle1.wav",
		"vj_piv/hev/idle2.wav",
		"vj_piv/hev/idle3.wav",
		"vj_piv/hev/idle4.wav",
		"vj_piv/hev/idle5.wav",
		"vj_piv/hev/idle6.wav",
		"vj_piv/hev/idle7.wav",
		"vj_piv/hev/idle8.wav",
		"vj_piv/hev/idle9.wav",
		"vj_piv/hev/idle10.wav"
	}
	self.SoundTbl_Alert = {
		"vj_piv/hev/alert1.wav",
		"vj_piv/hev/alert2.wav",
		"vj_piv/hev/alert3.wav",
		"vj_piv/hev/alert4.wav",
		"vj_piv/hev/alert5.wav"
	}
	self.SoundTbl_BeforeMeleeAttack = {
		"vj_piv/hev/alert3.wav",
		"vj_piv/hev/alert4.wav"
	}
	self.SoundTbl_Pain = {
		"vj_piv/hev/pain1.wav",
		"vj_piv/hev/pain2.wav",
		"vj_piv/hev/pain3.wav",
		"vj_piv/hev/pain4.wav",
		"vj_piv/hev/pain5.wav",
		"vj_piv/hev/pain6.wav",
		"vj_piv/hev/pain7.wav",
		"vj_piv/hev/pain8.wav"
	}
	self.SoundTbl_Death = {
		"vj_piv/hev/death1.wav",
		"vj_piv/hev/death2.wav",
		"vj_piv/hev/death3.wav",
		"vj_piv/hev/death4.wav",
		"vj_piv/hev/death5.wav",
		"vj_piv/hev/death6.wav"
	}
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	if GetConVar("vj_piv_lights"):GetInt() == 1 then 
		self.Light2 = ents.Create("light_dynamic")
		self.Light2:SetKeyValue("brightness", "1")
		self.Light2:SetKeyValue("distance", "128")
		self.Light2:SetLocalPos(self:GetPos())
		self.Light2:SetLocalAngles(self:GetAngles())
		self.Light2:Fire("Color", "255 227 153 255")
		self.Light2:SetParent(self)
		self.Light2:Spawn()
		self.Light2:Activate()
		self.Light2:Fire("SetParentAttachment","eyes")
		self.Light2:Fire("TurnOn", "", 0)
		self:DeleteOnRemove(self.Light2)
	end
end
--------------------
function ENT:Zombie_CustomOnTakeDamage_PreDamage(dmginfo,hitgroup)
	if (dmginfo:IsBulletDamage()) then
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
		if	self.HasSounds == true && self.HasImpactSounds == true then
			VJ.EmitSound(self,"vj_base/impact/armor"..math.random(1,10)..".wav",70)
		end
		dmginfo:ScaleDamage(0.50)
	end
end
--------------------