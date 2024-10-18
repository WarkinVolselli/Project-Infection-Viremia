AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/hl2/hev_helmet.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.PIV_IsHEV = true
ENT.StartHealth = 200

ENT.SoundTbl_Idle = {"vj_piv/hev/idle1.wav","vj_piv/hev/idle2.wav","vj_piv/hev/idle3.wav","vj_piv/hev/idle4.wav","vj_piv/hev/idle5.wav","vj_piv/hev/idle6.wav","vj_piv/hev/idle7.wav","vj_piv/hev/idle8.wav","vj_piv/hev/idle9.wav","vj_piv/hev/idle10.wav"}
ENT.SoundTbl_Alert = {"vj_piv/hev/alert1.wav","vj_piv/hev/alert2.wav","vj_piv/hev/alert3.wav","vj_piv/hev/alert4.wav","vj_piv/hev/alert5.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/hev/alert3.wav","vj_piv/hev/alert4.wav"}
ENT.SoundTbl_Pain = {"vj_piv/hev/pain1.wav","vj_piv/hev/pain2.wav","vj_piv/hev/pain3.wav","vj_piv/hev/pain4.wav","vj_piv/hev/pain5.wav","vj_piv/hev/pain6.wav","vj_piv/hev/pain7.wav","vj_piv/hev/pain8.wav"}
ENT.SoundTbl_Death = {"vj_piv/hev/death1.wav","vj_piv/hev/death2.wav","vj_piv/hev/death3.wav","vj_piv/hev/death4.wav","vj_piv/hev/death5.wav","vj_piv/hev/death6.wav"}

ENT.Immune_AcidPoisonRadiation = true
ENT.Immune_Electricity = true
ENT.Immune_Fire = true
ENT.ImmuneDamagesTable = {DMG_PARALYZE,DMG_NERVEGAS}
ENT.PIV_AllowedToVomit = false
ENT.PIV_CanBeBiter = false
---------------------------------------------------------------------------------------------------------------------------------------------
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
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
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
		if self.HasSounds == true && self.HasImpactSounds == true then VJ.EmitSound(self,"vj_base/impact/armor"..math.random(1,10)..".wav",70) end
		dmginfo:ScaleDamage(0.50)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/