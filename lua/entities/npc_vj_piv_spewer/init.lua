include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
-- this shit's supposed to be in Zombie_GiveVoice but it wouldn't load for some reason, i'll try fixing this later
	ENT.SoundTbl_BeforeRangeAttack = {"vj_piv/spewer/zombie_spitter_attack_grenade_00_0.wav","vj_piv/spewer/zombie_spitter_attack_grenade_01_0.wav","vj_piv/spewer/zombie_spitter_attack_spit_00_0.wav","vj_piv/spewer/zombie_spitter_attack_spit_01_0.wav","vj_piv/spewer/zombie_spitter_attack_spit_02_0.wav","vj_piv/spewer/zombie_spitter_attack_spit_03_0.wav","vj_piv/spewer/zombie_spitter_attack_spit_04_0.wav"}
	ENT.SoundTbl_FootStep = {"vj_piv/foot1.wav","vj_piv/foot2.wav","vj_piv/foot3.wav"}
	ENT.SoundTbl_Idle = {"vj_piv/spewer/zombie_spitter_recharge_00_0.wav","vj_piv/spewer/zombie_spitter_recharge_01_0.wav","vj_piv/spewer/zombie_spitter_recharge_02_0.wav"}
	ENT.SoundTbl_Alert = {"vj_piv/spewer/zombie_spitter_scream_00_0.wav","vj_piv/spewer/zombie_spitter_scream_01_0.wav","vj_piv/spewer/zombie_spitter_scream_02_0.wav"}
	ENT.SoundTbl_CombatIdle = {"vj_piv/spewer/zombie_spitter_upset_00_0.wav","vj_piv/spewer/zombie_spitter_upset_01_0.wav","vj_piv/spewer/zombie_spitter_run_00_0.wav","vj_piv/spewer/zombie_spitter_run_01_0.wav","vj_piv/spewer/zombie_spitter_run_02_0.wav","vj_piv/spewer/zombie_spitter_run_03_0.wav"}
	ENT.SoundTbl_Pain = {"vj_piv/spewer/zombie_spitter_pain_00_0.wav","vj_piv/spewer/zombie_spitter_pain_01_0.wav"}
	ENT.SoundTbl_Death = {"vj_piv/spewer/zombie_spitter_death_00_0.wav","vj_piv/spewer/zombie_spitter_death_01_0.wav"}
	ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/spewer/zombie_spitter_push_00_0.wav","vj_piv/spewer/zombie_spitter_push_01_0.wav"}
	ENT.SoundTbl_RangeAttack = {"vj_piv/spewer/zombie_vomit_00_0.wav","vj_piv/spewer/zombie_vomit_01_0.wav","vj_piv/spewer/zombie_vomit_02_0.wav","vj_piv/spewer/zombie_vomit_03_0.wav"}
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.Model = {"models/vj_piv/specials/spewer/spewer.mdl"}
	self.StartHealth = 250
	self.PIV_IsSpecial = true
	self.PIV_CanBeCrawler = false
	self.PIV_CanBeThrower = false
	self.BloodColor = "Red"
	self.HasRangeAttack = true
	self.RangeUseAttachmentForPos = true
	self.RangeUseAttachmentForPosID = "Mouth" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true
	self.AnimTbl_RangeAttack = {"vjseq_stand_threaten_0","vjseq_stand_threaten_0","vjseq_stand_threaten_0"} -- Range Attack Animations
	self.RangeAttackEntityToSpawn = "obj_vj_piv_puke" -- The entity that is spawned when range attacking
	self.RangeDistance = 500 -- This is how far away it can shoot
	self.RangeToMeleeDistance = 100 -- How close does it have to be until it uses melee?
	self.TimeUntilRangeAttackProjectileRelease = 0.65 -- How much time until the projectile code is ran?
	self.RangeAttackExtraTimers = {0.65, 0.65} -- Extra range attack timers | it will run the projectile code after the given amount of seconds
	self.NextRangeAttackTime = 5
	self.NextRangeAttackTime_DoRand = 10
	self.Immune_AcidPoisonRadiation = true -- Makes the SNPC not get damage from Acid, posion, radiation
	self.GeneralSoundPitch1 = 90
	self.GeneralSoundPitch2 = 80
end
--------------------
function ENT:Zombie_GiveVoice()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()	
	self:SetModelScale(1.15)
	self:SetSkin(math.random(0,3))
	self.CanFlinch = 0
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 500) + self:GetUp()*math.Rand(-100,100) + self:GetRight()*math.Rand(-100,100)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PIV_CustomMutate()
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
		self.Light2:Fire("Color", "127 255 0 255")
		self.Light2:SetParent(self)
		self.Light2:Spawn()
		self.Light2:Activate()
		self.Light2:Fire("SetParentAttachment","eyes")
		self.Light2:Fire("TurnOn", "", 0)
		self:DeleteOnRemove(self.Light2)
	end
end
--------------------