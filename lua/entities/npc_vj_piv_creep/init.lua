include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.Model = {"models/vj_piv/specials/specimen/specimen.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
	self.StartHealth = 150

	self.PIV_IsSpecial = true
	self.PIV_Rusher = true
	
	self.AnimTbl_IdleStand = {ACT_IDLE_HURT}
	self.AnimTbl_Walk = {ACT_WALK}
	self.AnimTbl_Run = {ACT_RUN_AIM}

	self.PIV_HasSubclasses = false
	self.PIV_CanBeThrower = false
	self.PIV_HasWeapons = false
	self.PIV_IsRunner = true
	self.PIV_Infection_IsWalker = false

	self.HasLeapAttack = false 
	self.LeapAttackDamage = math.random(20,25)
	self.LeapAttackDamageType = DMG_SLASH 
	self.AnimTbl_LeapAttack = {ACT_LEAP} 
	self.LeapDistance = 350
	self.LeapToMeleeDistance = 150
	self.LeapAttackDamageDistance = 150
	self.TimeUntilLeapAttackDamage = 0.8
	self.TimeUntilLeapAttackVelocity = 0.1 
	self.NextLeapAttackTime = 10
	self.NextAnyAttackTime_Leap = 1.5
	self.LeapAttackVelocityForward = 100
	self.LeapAttackVelocityUp = 250
end
--------------------
function ENT:Zombie_GiveVoice()
	self.SoundTbl_Idle = {
		"vj_piv/creep/idle_1.mp3",
		"vj_piv/creep/idle_2.mp3",
		"vj_piv/creep/idle_3.mp3",
		"vj_piv/creep/idle_4.mp3"
	}
	self.SoundTbl_Alert = {
		"vj_piv/creep/long_scream_1.mp3",
		"vj_piv/creep/long_scream_2.mp3",
		"vj_piv/creep/long_scream_3.mp3",
		"vj_piv/creep/long_scream_4.mp3"
	}
	self.SoundTbl_BeforeMeleeAttack = {
		"vj_piv/creep/long_scream_1.mp3",
		"vj_piv/creep/long_scream_2.mp3",
		"vj_piv/creep/long_scream_3.mp3",
		"vj_piv/creep/long_scream_4.mp3"
	}
	self.SoundTbl_LeapAttackJump = {
		"vj_piv/creep/howl_1.mp3",
		"vj_piv/creep/howl_2.mp3",
		"vj_piv/creep/howl_3.mp3",
		"vj_piv/creep/howl_4.mp3"
	}
	self.SoundTbl_LeapAttackDamage = {
		"vj_piv/gore/HeadshotDevestate3.wav",
		"vj_piv/gore/HeadshotDevestate4.wav",
		"vj_piv/gore/HeadshotDevestate5.wav"
	}
	self.SoundTbl_Pain = {
		"vj_piv/creep/pain_1.mp3",
		"vj_piv/creep/pain_2.mp3",
		"vj_piv/creep/pain_3.mp3",
		"vj_piv/creep/pain_4.mp3",
		"vj_piv/creep/pain_5.mp3"
	}
	self.SoundTbl_Death = {
		"vj_piv/creep/death.mp3"
	}

	self.AlertSoundLevel = 85
	self.BeforeMeleeAttackSoundLevel = 85
	self.LeapAttackJumpSoundLevel = 85
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()

	self:SetSkin(math.random(2,3))
	self.HasLeapAttack = true 
	self.PIV_NextRunT = CurTime() + math.random(6,12)

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
        self.PIV_NextRunT < CurTime() &&
        self.PIV_GoblinMode == false &&
        self:GetEnemy() != nil &&
        self.PIV_Crippled == false &&
        !self.Dead &&
        !self:IsBusy()
    then

        self.PIV_GoblinMode = true
		self.HasLeapAttack = false 
        self.RunT = CurTime() + math.random(6,12)
		
		local start = VJ.PICK({"vjseq_stand_to_crouch"})
		self:VJ_ACT_PLAYACTIVITY(start,true,VJ.AnimDuration(self,tbl),false)
		
    end

    if
        self.PIV_GoblinMode &&
        self.RunT < CurTime() &&
        !self.Dead &&
        self.PIV_Crippled == false && 
		self.PIV_Mutated == false
    then

        self.PIV_GoblinMode = false
		self.HasLeapAttack = true 
        self.PIV_NextRunT = CurTime() + math.random(6,12)

		local stop = VJ.PICK({"vjseq_crouch_to_stand"})
		self:VJ_ACT_PLAYACTIVITY(stop,true,VJ.AnimDuration(self,tbl),false)

    end
	
end
--------------------