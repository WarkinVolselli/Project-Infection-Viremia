AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/shikari/Fast.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 100

ENT.PIV_IsSpecial = true

ENT.AnimTbl_IdleStand = {ACT_IDLE}
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

ENT.SoundTbl_Alert = {"vj_piv/shikari/fz_alert_close1.wav","vj_piv/shikari/fz_alert_far1.wav","vj_piv/shikari/fz_alert_far2.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"npc/fast_zombie/leap1.wav"}
ENT.SoundTbl_Pain = {"vj_piv/shikari/pain1.wav","vj_piv/shikari/pain2.wav","vj_piv/shikari/pain3.wav","vj_piv/shikari/pain4.wav"}
ENT.SoundTbl_Death = {"vj_piv/shikari/die1.wav","vj_piv/shikari/die2.wav","vj_piv/shikari/die3.wav","vj_piv/shikari/die4.wav"}
ENT.SoundTbl_LeapAttackJump = {"vj_piv/shikari/leap1.wav"}

ENT.AlertSoundLevel = 85
ENT.BeforeMeleeAttackSoundLevel = 85
ENT.LeapAttackJumpSoundLevel = 85

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetCollisionBounds(Vector(13,13,50), Vector(-13,-13,0))
	self:SetSkin(math.random(0,3))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnAlert()
	if GetConVar("vj_piv_alert_anim"):GetInt() == 1 && self.PIV_Crippled == false && self.PIV_FuckingCrawlingLittleCunt == false && self.PIV_Resting == 0 && self:GetSequence() != self:LookupSequence(ACT_OPEN_DOOR) then
		if math.random(1,GetConVar("vj_piv_alert_anim_chance"):GetInt()) == 1 then
			local tbl = VJ_PICK({"vjseq_idle_angry","vjseq_br2_roar"})
			self:VJ_ACT_PLAYACTIVITY(tbl,true,false,true)
		end
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
		self.SoundTbl_MeleeAttack = {"vj_piv/husk/zombie_slice_1.wav","vj_piv/husk/zombie_slice_2.wav","vj_piv/husk/zombie_slice_3.wav","vj_piv/husk/zombie_slice_4.wav","vj_piv/husk/zombie_slice_5.wav","vj_piv/husk/zombie_slice_6.wav"}
		
	else
	
		self.MeleeAttackAnimationAllowOtherTasks = false
	
		self.AnimTbl_MeleeAttack = {"vjseq_melee"}
		self.MeleeAttackDistance = 32 
		self.MeleeAttackDamageDistance = 60 
		self.MeleeAttackDamage = math.random(5,10)
		self.SoundTbl_MeleeAttack = {"vj_piv/husk/zombie_slice_1.wav","vj_piv/husk/zombie_slice_2.wav","vj_piv/husk/zombie_slice_3.wav","vj_piv/husk/zombie_slice_4.wav","vj_piv/husk/zombie_slice_5.wav","vj_piv/husk/zombie_slice_6.wav"}

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
self.Light2:SetKeyValue("brightness", "2")
self.Light2:SetKeyValue("distance", "30")
self.Light2:SetLocalPos(self:GetPos())
self.Light2:SetLocalAngles(self:GetAngles())
self.Light2:Fire("Color", "255 93 0 255")
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