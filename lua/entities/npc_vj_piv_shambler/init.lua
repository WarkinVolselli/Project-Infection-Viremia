include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	if self:GetClass() == "npc_vj_piv_shambler_f" then
		self.Model = {"models/vj_piv/specials/shambler/shambler_female.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
		self.ShamblerEntity = "npc_vj_piv_shambler_f"
		self.RevenantEntity = "npc_vj_piv_revenant_f"
	else
		self.Model = {"models/vj_piv/specials/shambler/shambler_male.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
		self.ShamblerEntity = "npc_vj_piv_shambler"
		self.RevenantEntity = "npc_vj_piv_revenant"
	end
	self.StartHealth = 200
	self.IsRevived = false
	self.CanRevive = true
	self.ReviveRevenant = false

	self.PIV_IsSpecial = true
	self.PIV_Shambler = true

	self.PIV_CanBeBrute = false
	self.PIV_CanBeShambler = false
end
--------------------
function ENT:Zombie_GiveVoice()
	self.SoundTbl_Idle = {
		"vj_piv/shambler/idle_1.mp3",
		"vj_piv/shambler/idle_2.mp3",
		"vj_piv/shambler/idle_3.mp3",
		"vj_piv/shambler/idle_4.mp3"
	}
	self.SoundTbl_Alert = {
		"vj_piv/shambler/alert_1.mp3",
		"vj_piv/shambler/alert_2.mp3",
		"vj_piv/shambler/alert_3.mp3",
		"vj_piv/shambler/alert_4.mp3"
	}
	self.SoundTbl_CombatIdle = {
		"vj_piv/shambler/alert_1.mp3",
		"vj_piv/shambler/alert_2.mp3",
		"vj_piv/shambler/alert_3.mp3",
		"vj_piv/shambler/alert_4.mp3",
		"vj_piv/shambler/idle_1.mp3",
		"vj_piv/shambler/idle_2.mp3",
		"vj_piv/shambler/idle_3.mp3",
		"vj_piv/shambler/idle_4.mp3"
	}
	self.SoundTbl_BeforeMeleeAttack = {
		"vj_piv/shambler/attack_1.mp3",
		"vj_piv/shambler/attack_2.mp3",
		"vj_piv/shambler/attack_3.mp3",
		"vj_piv/shambler/attack_4.mp3",
		"vj_piv/shambler/attack_5.mp3",
		"vj_piv/shambler/attack_6.mp3"
	}
	self.SoundTbl_Pain = {
		"vj_piv/shambler/attack_1.mp3",
		"vj_piv/shambler/attack_2.mp3",
		"vj_piv/shambler/attack_3.mp3",
		"vj_piv/shambler/attack_4.mp3",
		"vj_piv/shambler/attack_5.mp3",
		"vj_piv/shambler/attack_6.mp3"
	}
	self.SoundTbl_Death = {
		"vj_piv/shambler/death_1.mp3",
		"vj_piv/shambler/death_2.mp3",
		"vj_piv/shambler/death_3.mp3",
		"vj_piv/shambler/death_4.mp3",
		"vj_piv/shambler/death_5.mp3"
	}
	if self:GetClass() == "npc_vj_piv_shambler_f" then
		self.IdleSoundPitch = VJ.SET(120, 120)
		self.CombatIdleSoundPitch = VJ.SET(120, 120)
		self.AlertSoundPitch = VJ.SET(120, 120)
		self.CallForHelpSoundPitch = VJ.SET(120, 120)
		self.BeforeMeleeAttackSoundPitch = VJ.SET(120, 120)
		self.PainSoundPitch = VJ.SET(120, 120)
		self.DeathSoundPitch = VJ.SET(120, 120)
	end
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	if GetConVar("vj_piv_hl2skins"):GetInt() == 1 then -- if HL2 Skins Only is enabled, this will make the zombies only use HL2 skins
		self:SetSkin(1)
	else
		self:SetSkin(math.random(0,3))
	end
	self:SetBodygroup(2,math.random(0,1))
end
--------------------
function ENT:Zombie_CustomOnTakeDamage_PreDamage(dmginfo,hitgroup)
	if hitgroup != HITGROUP_HEAD then
		dmginfo:ScaleDamage(0.75)
	end
end
--------------------
function ENT:Zombie_CustomOnCreateDeathCorpse(dmginfo, hitgroup, corpseEnt)

	if corpseEnt:IsOnFire() then return false end
	
	if GetConVar("vj_piv_shambler_revive"):GetInt() == 1 && math.random(1,GetConVar("vj_piv_shambler_revive_chance"):GetInt()) == 1 && self.CanRevive == true then
		if IsValid(corpseEnt) then	
			local mutatesounds = {
				"vj_piv/mutate_1.wav",
				"vj_piv/mutate_2.wav",
				"vj_piv/mutate_3.wav",
			}
			timer.Simple(math.random(5,10),function() if IsValid(corpseEnt) then
				local TheDude = ents.Create(self.ShamblerEntity)			
				if GetConVar("vj_piv_shambler_revive_revenant"):GetInt() == 1 && math.random(1,GetConVar("vj_piv_shambler_revive_revenant_chance"):GetInt()) == 1 then
					TheDude = ents.Create(self.RevenantEntity)
					TheDude.ReviveRevenant = true
				end
				TheDude:SetPos(corpseEnt:GetPos())
				TheDude:SetAngles(corpseEnt:GetAngles())
				TheDude:Spawn()
				TheDude:Activate()
				undo.ReplaceEntity(self,TheDude)
				TheDude:SetMaterial()
				TheDude:SetModel(corpseEnt:GetModel())
				TheDude:SetSkin(corpseEnt:GetSkin())
				TheDude:SetBodygroup(2,corpseEnt:GetBodygroup(2))
				if TheDude.ReviveRevenant == true then
					VJ.EmitSound(TheDude,mutatesounds,90,math.random(100,90))
					VJ.EmitSound(TheDude,{"vj_piv/gore/HeadshotDevestate3.wav","vj_piv/gore/HeadshotDevestate4.wav","vj_piv/gore/HeadshotDevestate5.wav"},70,math.random(100,100))
					local bloodspray = EffectData()
					bloodspray:SetOrigin(TheDude:GetPos())
					bloodspray:SetScale(10)
					bloodspray:SetFlags(3)
					bloodspray:SetColor(0)
					util.Effect("bloodspray",bloodspray)
					util.Effect("bloodspray",bloodspray)
					local bloodeffect = EffectData()
					bloodeffect:SetOrigin(TheDude:GetPos())
					bloodeffect:SetColor(VJ.Color2Byte(Color(127,0,0,255)))
					bloodeffect:SetScale(125)
					util.Effect("VJ_Blood1",bloodeffect)
				end
				if math.random(1,4) == 1 then
					TheDude.CanRevive = true
				else
					TheDude.CanRevive = false
				end
				TheDude.IsRevived = true			
				TheDude:SetPos(TheDude:GetPos() + TheDude:GetUp()*-6)
				local rise = VJ.PICK({"vjseq_slumprise_a","vjseq_slumprise_a2","vjseq_slumprise_a_attack","vjseq_slumprise_b","vjseq_infectionrise","vjseq_lying_to_standing_alert","vjseq_lying_to_standing_alert03c","vjseq_lying_to_standing_alert03d"})
				TheDude:VJ_ACT_PLAYACTIVITY(rise,true,VJ.AnimDuration(self,tbl),false)
				if IsValid(corpseEnt) then
					corpseEnt:Remove()
				end
			end end)
		end
	end
end
--------------------
function ENT:PIV_CustomMutate()
	self.StartHealth = self.StartHealth *2
	self:SetHealth(self.StartHealth)
	local mymaxhealth = self:Health()
	self:SetMaxHealth(mymaxhealth)
	self.PIV_LegHP = self.PIV_LegHP *2
	if GetConVar("vj_piv_lights"):GetInt() == 1 then 
		self.Light2 = ents.Create("light_dynamic")
		self.Light2:SetKeyValue("brightness", "2")
		self.Light2:SetKeyValue("distance", "50")
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