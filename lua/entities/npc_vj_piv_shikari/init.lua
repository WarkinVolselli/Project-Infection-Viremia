AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/shikari/Fast.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 100

ENT.AnimTbl_Walk = {ACT_WALK} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
ENT.AnimTbl_Run = {ACT_RUN} -- Set the running animations | Put multiple to let the base pick a random animation when it moves

ENT.MeleeAttackDamage = math.random(5,10)

ENT.HasLeapAttack = true -- Should the SNPC have a leap attack?
ENT.AnimTbl_LeapAttack = {"vjseq_leapstrike"} -- Leap Attack Animations
ENT.LeapDistance = 600 -- The distance of the leap, for example if it is set to 500, when the SNPC is 500 Unit away, it will jump
ENT.LeapToMeleeDistance = 150 -- How close does it have to be until it uses melee?
ENT.NextLeapAttackTime = 5 -- How much time until it can use a leap attack?
ENT.TimeUntilLeapAttackVelocity = 0.2 -- How much time until it runs the velocity code?
ENT.LeapAttackVelocityForward = 500 -- How much forward force should it apply?
ENT.LeapAttackVelocityUp = 200 -- How much upward force should it apply?
ENT.LeapAttackDamage = 0
ENT.LeapAttackDamageDistance = 0 -- How far does the damage go?
ENT.TimeUntilLeapAttackDamage = false

	-- ====== Flinching Code ====== --
ENT.CanFlinch = 1 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.AnimTbl_Flinch = {ACT_FLINCH_PHYSICS} -- If it uses normal based animation, use this

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"vj_projectinfection/npc/foot1.wav","vj_projectinfection/npc/foot2.wav","vj_projectinfection/npc/foot3.wav"}
ENT.SoundTbl_Alert = {"vj_projectinfection/npc/shikari/fz_alert_close1.wav","vj_projectinfection/npc/shikari/fz_alert_far1.wav","vj_projectinfection/npc/shikari/fz_alert_far2.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"npc/fast_zombie/leap1.wav"}
ENT.SoundTbl_Pain = {"vj_projectinfection/npc/shikari/pain1.wav","vj_projectinfection/npc/shikari/pain2.wav","vj_projectinfection/npc/shikari/pain3.wav","vj_projectinfection/npc/shikari/pain4.wav"}
ENT.SoundTbl_Death = {"vj_projectinfection/npc/shikari/die1.wav","vj_projectinfection/npc/shikari/die2.wav","vj_projectinfection/npc/shikari/die3.wav","vj_projectinfection/npc/shikari/die4.wav"}
ENT.SoundTbl_LeapAttackJump = {"vj_projectinfection/npc/shikari/leap1.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetCollisionBounds(Vector(13,13,50), Vector(-13,-13,0))
	self:SetSkin(math.random(0,3))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert(argent)
    local alert = math.random(1,3)
	if self:GetSequence() == self:LookupSequence("emerge1") then return false end
	if alert == 1 then
		local tbl = VJ_PICK({"vjseq_Idle_Angry"})
		self:VJ_ACT_PLAYACTIVITY(tbl,true,VJ_GetSequenceDuration(self,tbl),false)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	if self:IsMoving()	then
	
		self.MeleeAttackAnimationAllowOtherTasks = true
		
		self.AnimTbl_MeleeAttack = {"vjges_fastattack"}
		self.MeleeAttackDistance = 44 
		self.MeleeAttackDamageDistance = 60
		self.MeleeAttackDamage = math.random(5,10)
		
	else
	
		self.MeleeAttackAnimationAllowOtherTasks = false
	
		self.AnimTbl_MeleeAttack = {"vjseq_melee"}
		self.MeleeAttackDistance = 32 
		self.MeleeAttackDamageDistance = 60 
		self.MeleeAttackDamage = math.random(5,10)

	end
		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PIV_CustomMutate()

self.StartHealth = self.StartHealth *2
self:SetHealth(self.StartHealth)

self.NextLeapAttackTime = 2.5
		
local mymaxhealth = self:Health()
self:SetMaxHealth(mymaxhealth)

self.PIV_LegHP = self.PIV_LegHP *3

if GetConVar("vj_piv_lights"):GetInt() == 1 then 

self.Light2 = ents.Create("light_dynamic")
self.Light2:SetKeyValue("brightness", "7")
self.Light2:SetKeyValue("distance", "30")
self.Light2:SetLocalPos(self:GetPos())
self.Light2:SetLocalAngles(self:GetAngles())
self.Light2:Fire("Color", "255 0 0 255")
self.Light2:SetParent(self)
self.Light2:Spawn()
self.Light2:Activate()
self.Light2:Fire("SetParentAttachment","head")
self.Light2:Fire("TurnOn", "", 0)
self:DeleteOnRemove(self.Light2)

end

end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/