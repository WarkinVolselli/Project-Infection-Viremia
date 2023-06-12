AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/specimen/specimen.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 150

ENT.AnimTbl_IdleStand = {ACT_IDLE_HURT}
ENT.AnimTbl_Walk = {ACT_WALK}
ENT.AnimTbl_Run = {ACT_RUN_AIM}

ENT.HasLeapAttack = false 
ENT.LeapAttackDamage = math.random(20,25)
ENT.LeapAttackDamageType = DMG_SLASH 
ENT.AnimTbl_LeapAttack = {ACT_LEAP} 
ENT.LeapDistance = 350
ENT.LeapToMeleeDistance = 150
ENT.LeapAttackDamageDistance = 150
ENT.TimeUntilLeapAttackDamage = 0.8
ENT.TimeUntilLeapAttackVelocity = 0.1 
ENT.NextLeapAttackTime = 10
ENT.NextAnyAttackTime_Leap = 1.5
ENT.LeapAttackVelocityForward = 100
ENT.LeapAttackVelocityUp = 250
		
ENT.SoundTbl_Idle = {"vj_piv/creep/idle_1.mp3","vj_piv/creep/idle_2.mp3","vj_piv/creep/idle_3.mp3","vj_piv/creep/idle_4.mp3"}
ENT.SoundTbl_Alert = {"vj_piv/creep/long_scream_1.mp3","vj_piv/creep/long_scream_2.mp3","vj_piv/creep/long_scream_3.mp3","vj_piv/creep/long_scream_4.mp3"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/creep/long_scream_1.mp3","vj_piv/creep/long_scream_2.mp3","vj_piv/creep/long_scream_3.mp3","vj_piv/creep/long_scream_4.mp3"}
ENT.SoundTbl_LeapAttackJump = {"vj_piv/creep/howl_1.mp3","vj_piv/creep/howl_2.mp3","vj_piv/creep/howl_3.mp3","vj_piv/creep/howl_4.mp3"}
ENT.SoundTbl_LeapAttackDamage = {"vj_piv/gore/HeadshotDevestate3.wav","vj_piv/gore/HeadshotDevestate4.wav","vj_piv/gore/HeadshotDevestate5.wav"}
ENT.SoundTbl_Pain = {"vj_piv/creep/pain_1.mp3","vj_piv/creep/pain_2.mp3","vj_piv/creep/pain_3.mp3","vj_piv/creep/pain_4.mp3","vj_piv/creep/pain_5.mp3"}
ENT.SoundTbl_Death = {"vj_piv/creep/death.mp3"}

ENT.AlertSoundLevel = 85
ENT.BeforeMeleeAttackSoundLevel = 85
ENT.LeapAttackJumpSoundLevel = 85


ENT.NextRunT = 0
ENT.RunT = 0
ENT.Running = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self:SetSkin(math.random(2,3))
	
self.HasLeapAttack = true 

self.NextRunT = CurTime() + math.random(6,12)
		
if math.random(1,4) == 1 then
self.MeleeAttackBleedEnemy = true -- Should the enemy bleed when attacked by melee?
self:SetBodygroup(1,1)
end

self:SetBodygroup(2,math.random(0,1))

if math.random(1,2) == 1 then
self:SetBodygroup(3,math.random(0,1))
else
self:SetBodygroup(3,3)
end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()

    if
        self.NextRunT < CurTime() &&
        self.Running == false &&
        self:GetEnemy() != nil &&
        !self.PIV_Crippled &&
        !self.Dead &&
        !self:IsBusy()
    then

        self.Running = true
		self.HasLeapAttack = false 
        self.RunT = CurTime() + math.random(6,12)

		self.AnimTbl_IdleStand = {ACT_CROUCHIDLE}
        self.AnimTbl_Walk = {ACT_WALK_CROUCH_AIM}
        self.AnimTbl_Run = {ACT_RUN_STEALTH}
		
		local start = VJ_PICK({"vjseq_stand_to_crouch"})
		self:VJ_ACT_PLAYACTIVITY(start,true,VJ_GetSequenceDuration(self,tbl),false)
		
    end

    if
        self.Running &&
        self.RunT < CurTime() &&
        !self.Dead &&
        !self.PIV_Crippled && 
		self.PIV_Mutated == false
    then

        self.Running = false
		self.HasLeapAttack = true 
        self.NextRunT = CurTime() + math.random(6,12)
		
		self.AnimTbl_IdleStand = {ACT_IDLE}
        self.AnimTbl_Walk = {ACT_WALK}
		self.AnimTbl_Run = {ACT_RUN_AIM}

		local stop = VJ_PICK({"vjseq_crouch_to_stand"})
		self:VJ_ACT_PLAYACTIVITY(stop,true,VJ_GetSequenceDuration(self,tbl),false)

    end
	
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/