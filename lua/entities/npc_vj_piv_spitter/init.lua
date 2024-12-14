include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.Model = {"models/vj_piv/specials/spitter/spitter.mdl"}
	self.StartHealth = 150 
	self.BloodColor = "Red" -- why is this here?
	self.Immune_AcidPoisonRadiation = true
	self.HasRangeAttack = true
	self.RangeUseAttachmentForPos = true
	self.RangeUseAttachmentForPosID = "Mouth"
	self.AnimTbl_RangeAttack = {"vjseq_nz_taunt_7","vjseq_nz_taunt_7","vjseq_nz_taunt_7"}
	self.RangeAttackEntityToSpawn = "obj_vj_piv_spit"
	self.RangeDistance = 2000
	self.RangeToMeleeDistance = 300
	self.TimeUntilRangeAttackProjectileRelease = 0.5
	self.NextRangeAttackTime = 5
	self.NextRangeAttackTime_DoRand = 10
	self.RangeAttackExtraTimers = {0.65, 0.65, 0.7, 0.75, 0.8}
	self.PIV_IsSpecial = true
	self.PIV_CanBeCrawler = false
end
--------------------
function ENT:Zombie_GiveVoice()
	self.HasBreathSound  =  true
	self.SoundTbl_Breath = {"vj_piv/spitter/gurgle_loop1.wav"}
	self.SoundTbl_BeforeRangeAttack = {"vj_piv/spitter/rangeattack1.mp3"}
	self.SoundTbl_FootStep = {
		"vj_piv/foot1.wav",
		"vj_piv/foot2.wav",
		"vj_piv/foot3.wav"
	}
	self.SoundTbl_Idle = {
		"vj_piv/spitter/idle1.mp3",
		"vj_piv/spitter/idle2.mp3",
		"vj_piv/spitter/idle3.mp3",
		"vj_piv/spitter/idle4.mp3",
		"vj_piv/spitter/idle5.mp3",
		"vj_piv/spitter/idle6.mp3"
	}
	self.SoundTbl_Alert = {
		"vj_piv/spitter/alert1.mp3",
		"vj_piv/spitter/alert2.mp3",
		"vj_piv/spitter/alert3.mp3",
		"vj_piv/spitter/alert4.mp3"
	}
	self.SoundTbl_CombatIdle = {
		"vj_piv/spitter/alert1.mp3",
		"vj_piv/spitter/alert2.mp3",
		"vj_piv/spitter/alert3.mp3",
		"vj_piv/spitter/alert4.mp3"
	}
	self.SoundTbl_Pain = {
		"vj_piv/spitter/pain1.mp3",
		"vj_piv/spitter/pain2.mp3",
		"vj_piv/spitter/pain3.mp3",
		"vj_piv/spitter/pain4.mp3",
		"vj_piv/spitter/pain5.mp3"
	}
	self.SoundTbl_Death = {
		"vj_piv/spitter/death1.mp3",
		"vj_piv/spitter/death2.mp3",
		"vj_piv/spitter/death3.mp3",
		"vj_piv/spitter/death4.mp3",
		"vj_piv/spitter/death5.mp3"
	}
	self.SoundTbl_BeforeMeleeAttack = {
		"vj_piv/spitter/super_puker_70.wav",
		"vj_piv/spitter/super_puker_71.wav",
		"vj_piv/spitter/super_puker_72.wav",
		"vj_piv/spitter/super_puker_73.wav"
	}
end
--------------------
function ENT:Zombie_CustomOnInitialize()	
	self:SetModelScale(1.1)
	self:SetSkin(math.random(0,3))
end	
--------------------
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 1500) + self:GetUp()*math.Rand(-30,30) + self:GetRight()*math.Rand(-40,40)
end
--------------------
function ENT:PIV_CustomMutate()

	-- this is deprectated baby!!1

	self.StartHealth = self.StartHealth *2
	self:SetHealth(self.StartHealth)
		
	local mymaxhealth = self:Health() -- the fuck is this for??
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