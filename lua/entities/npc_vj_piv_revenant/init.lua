include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	if self:GetClass() == "npc_vj_piv_revenant_f" then
		self.Model = {"models/vj_piv/specials/shambler/shambler_female.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
	else
		self.Model = {"models/vj_piv/specials/shambler/shambler_male.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
	end
	self.StartHealth = 200
	self.ReviveRevenant = false

	self.PIV_IsSpecial = true
	self.PIV_Rusher = true

	self.PIV_HasSubclasses = false
	self.PIV_CanBeThrower = false
	self.PIV_HasWeapons = false

	self.PIV_IsRunner = true
	self.PIV_Infection_IsWalker = false

	self.PIV_LegHP = 100
end
--------------------
function ENT:Zombie_GiveVoice()
	self.BreathSoundLevel = 60
	self.SoundTbl_Breath = {"vj_piv/revenant/crimhead_run.wav"}
	self.SoundTbl_Idle = {""}
	self.SoundTbl_Alert = {"vj_piv/revenant/crimhead_alert1.wav","vj_piv/revenant/crimhead_alert2.wav"}
	self.SoundTbl_CombatIdle = {"vj_piv/revenant/crimhead_alert1.wav","vj_piv/revenant/crimhead_alert2.wav"}
	self.SoundTbl_BeforeMeleeAttack = {"vj_piv/revenant/crimhead_frenzy.wav"}
	self.SoundTbl_Pain = {"vj_piv/revenant/crimhead_pain.wav"}
	self.SoundTbl_Death = {"vj_piv/revenant/crimhead_die.wav"}
	if self:GetClass() == "npc_vj_piv_revenant_f" then
		self.IdleSoundPitch = VJ.SET(120, 120)
		self.CombatIdleSoundPitch = VJ.SET(120, 120)
		self.AlertSoundPitch = VJ.SET(120, 120)
		self.CallForHelpSoundPitch = VJ.SET(120, 120)
		self.BeforeMeleeAttackSoundPitch = VJ.SET(120, 120)
		self.PainSoundPitch = VJ.SET(120, 120)
		self.DeathSoundPitch = VJ.SET(120, 120)
		self.BreathSoundPitch = VJ.SET(120, 120)
	end
end
--------------------
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
--------------------
function ENT:Zombie_CustomOnTakeDamage_PreDamage(dmginfo,hitgroup)
	if hitgroup != HITGROUP_HEAD then
		dmginfo:ScaleDamage(0.75)
    end
end
--------------------
function ENT:Zombie_CustomOnAlert()
	if GetConVar("vj_piv_alert_anim"):GetInt() == 1 && self.PIV_Crippled == false && self.PIV_FuckingCrawlingLittleCunt == false && self.PIV_Resting == 0 && self:GetSequence() != self:LookupSequence(ACT_OPEN_DOOR) then
		if math.random(1,GetConVar("vj_piv_alert_anim_chance"):GetInt()) == 1 then
			local tbl = VJ.PICK({"vjseq_nz_taunt_1","vjseq_nz_taunt_2","vjseq_nz_taunt_3","vjseq_nz_taunt_4","vjseq_nz_taunt_5","vjseq_nz_taunt_6","vjseq_nz_taunt_7","vjseq_nz_taunt_8","vjseq_nz_taunt_9","vjseq_stand_threaten_0"})
			self:VJ_ACT_PLAYACTIVITY(tbl,true,false,true)
		end
	end
end
--------------------
function ENT:PIV_CustomMutate()
	self.PIV_UseRunRelaxed = true
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
--------------------