AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/shambler/shambler_male.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 200
ENT.ReviveRevenant = false

ENT.PIV_IsSpecial = true

ENT.PIV_Charger = true
ENT.SoundTbl_Breath = {"vj_piv/revenant/crimhead_run.wav"}
ENT.SoundTbl_Idle = {""}
ENT.SoundTbl_Alert = {"vj_piv/revenant/crimhead_alert1.wav","vj_piv/revenant/crimhead_alert2.wav"}
ENT.SoundTbl_CombatIdle = {"vj_piv/revenant/crimhead_alert1.wav","vj_piv/revenant/crimhead_alert2.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/revenant/crimhead_frenzy.wav"}
ENT.SoundTbl_Pain = {"vj_piv/revenant/crimhead_pain.wav"}
ENT.SoundTbl_Death = {"vj_piv/revenant/crimhead_die.wav"}
	
ENT.AnimTbl_IdleStand = {ACT_IDLE_AIM_STEALTH}

ENT.AnimTbl_Walk = {ACT_RUN}
ENT.AnimTbl_Run = {ACT_RUN_RELAXED}

ENT.PIV_LegHP = 100 
ENT.BreathSoundLevel = 60



---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	if GetConVar("vj_piv_hl2skins"):GetInt() == 1 then -- if HL2 Skins Only is enabled, this will make the zombies only use HL2 skins
		self:SetSkin(1)
	else
		self:SetSkin(math.random(0,3))
	end
	self:SetBodygroup(0,1)
	self:SetBodygroup(1,1)
	self:SetBodygroup(2,math.random(0,1))
	
	self.HasBreathSound = true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD && GetConVar("vj_piv_headshot_damage"):GetInt() == 1 then
		dmginfo:ScaleDamage(GetConVarNumber("vj_piv_headshot_damage_mult"))
	else
		dmginfo:ScaleDamage(0.75)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PIV_CustomMutate()
self.AnimTbl_Walk = {ACT_RUN}
self.AnimTbl_Run = {ACT_RUN_RELAXED}

self.StartHealth = self.StartHealth *2
self:SetHealth(self.StartHealth)
		
local mymaxhealth = self:Health()
self:SetMaxHealth(mymaxhealth)

self.PIV_LegHP = self.PIV_LegHP *2

if GetConVar("vj_piv_lights"):GetInt() == 1 then 

self.Light2 = ents.Create("light_dynamic")
self.Light2:SetKeyValue("brightness", "2")
self.Light2:SetKeyValue("distance", "30")
self.Light2:SetLocalPos(self:GetPos())
self.Light2:SetLocalAngles(self:GetAngles())
self.Light2:Fire("Color", "255 93 0 255")
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