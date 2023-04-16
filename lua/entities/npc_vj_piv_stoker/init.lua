AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/hl2/charple.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 400

ENT.Immune_Fire = true -- Immune to fire-type damages

ENT.HasLeapAttack = false 
ENT.LeapAttackDamage = 25
ENT.LeapAttackDamageType = DMG_SLASH 
ENT.AnimTbl_LeapAttack = {ACT_LEAP} 
ENT.LeapDistance = 350
ENT.LeapToMeleeDistance = 250
ENT.LeapAttackDamageDistance = 150
ENT.TimeUntilLeapAttackDamage = 0.8
ENT.TimeUntilLeapAttackVelocity = 0.1 
ENT.NextLeapAttackTime = 5
ENT.NextAnyAttackTime_Leap = 1.5
ENT.LeapAttackVelocityForward = 100
ENT.LeapAttackVelocityUp = 250

ENT.SoundTbl_Breath = {"ambient/fire/firebig.wav"}
ENT.BreathSoundLevel = 60
ENT.SoundTbl_Idle = {"vj_piv/stoker/idle_1.mp3","vj_piv/stoker/idle_2.mp3","vj_piv/stoker/idle_3.mp3","vj_piv/stoker/idle_4.mp3"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/stoker/attack_1.mp3","vj_piv/stoker/attack_2.mp3"}
ENT.SoundTbl_Alert = {"vj_piv/stoker/attack_1.mp3","vj_piv/stoker/attack_2.mp3"}
ENT.SoundTbl_Death = {"vj_piv/stoker/death.mp3"}

ENT.SoundTbl_LeapAttackJump = {"vj_piv/stoker/attack_1.mp3","vj_piv/stoker/attack_2.mp3"}
ENT.SoundTbl_LeapAttackDamage = {"ambient/fire/ignite.wav"}

ENT.PI_LegHP = 10000
ENT.Apeshit = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetSkin(6)
	self:SetModelScale(1.1)
    self.PI_LegHP = self.StartHealth * 2
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()	
	self.IsDigging = false
	self:Dig()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)

	if hitgroup == HITGROUP_HEAD && GetConVar("vj_piv_headshot_damage"):GetInt() == 1 then
	dmginfo:ScaleDamage(GetConVarNumber("vj_piv_headshot_damage_mult"))
    end
	
		if self.Apeshit == false && (self:Health() <= (self:GetMaxHealth() / 2)) then
		        self.Apeshit = true

self.AnimTbl_IdleStand = {"ACT_CROUCHIDLE"} -- The idle animation when AI is enabled
self.AnimTbl_Walk = {ACT_RUN_STEALTH}
self.AnimTbl_Run = {ACT_RUN_STEALTH}

self.HasLeapAttack = true
self.GodMode = true -- Immune to everything

                VJ_EmitSound(self,"vj_piv/stoker/rage_"..math.random(1,2)..".mp3",0,90)
		        local tbl = VJ_PICK({"nz_sonic_attack_1"})
		        self:VJ_ACT_PLAYACTIVITY(tbl,true,VJ_GetSequenceDuration(self,tbl),false)
				
   timer.Simple(1.2,function() if IsValid(self) then
   	self:SetSkin(7)
	
    ParticleEffectAttach("fire_medium_03",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
	self.HasBreathSound = true
	
self.Light1 = ents.Create("light_dynamic")
	self.Light1:SetKeyValue("brightness", "0.04")
	self.Light1:SetKeyValue("distance", "250")
	self.Light1:SetLocalPos(self:GetPos())
	self.Light1:SetLocalAngles(self:GetAngles())
	self.Light1:Fire("Color", "255 100 0 0")
	self.Light1:SetParent(self)
	self.Light1:Spawn()
	self.Light1:Activate()
	self.Light1:Fire("SetParentAttachment","chest")
	self.Light1:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(self.Light1)
		
    ParticleEffectAttach("striderbuster_break_explode",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
    ParticleEffectAttach("striderbuster_break_explode",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
	effects.BeamRingPoint(self:GetPos(), 0.3, 2, 400, 16, 0, Color(255, 255, 255), {material="sprites/flame01", framerate=20})
	effects.BeamRingPoint(self:GetPos(), 0.3, 2, 200, 16, 0, Color(255, 255, 255), {material="sprites/flame01", framerate=20})
	
	VJ_EmitSound(self,"ambient/fire/ignite.wav",100,math.random(80,100))
	
	util.VJ_SphereDamage(self, self, self:GetPos(), 200, 10, self.MeleeAttackDamageType, true, true, {DisableVisibilityCheck=true, Force=80})
	util.ScreenShake(self:GetPos(),50,600,2,1000)
    util.ScreenShake(self:GetPos(),50,600,2,1000)
	
    end
end)

   timer.Simple(2.3,function() if IsValid(self) then
   self.GodMode = false -- Immune to everything
   end
end)
		
	self.SoundTbl_Idle = {"vj_piv/stoker/attack_1.mp3","vj_piv/stoker/attack_2.mp3"}
	self.SoundTbl_Alert = {"vj_piv/stoker/rage_1.mp3","vj_piv/stoker/rage_2.mp3"}

    end   
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnLeapAttack_AfterChecks(hitEnt, isProp)
    hitEnt:Ignite(math.random(2,4)) 
    return false
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
