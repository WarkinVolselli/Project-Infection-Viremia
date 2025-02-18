include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.Model = {"models/vj_piv/specials/military/juggernaut.mdl"} 
	self.StartHealth = 3000
	self.PIV_IsHugeZombie = true
	self.PIV_HasArmor = true
	self.Berserk = false
	self.PIV_CanMutate = false
	self.PIV_Tank = true
	self.PIV_Jogger = true

	self.PIV_IsBoss = true
	self.PIV_HasWeapons = false
end
--------------------
function ENT:Zombie_GiveVoice()
	self.SoundTbl_Breath = {
		"ambient/levels/prison/radio_random1.wav",
		"ambient/levels/prison/radio_random2.wav",
		"ambient/levels/prison/radio_random3.wav",
		"ambient/levels/prison/radio_random4.wav",
		"ambient/levels/prison/radio_random5.wav",
		"ambient/levels/prison/radio_random6.wav",
		"ambient/levels/prison/radio_random7.wav",
		"ambient/levels/prison/radio_random8.wav",
		"ambient/levels/prison/radio_random9.wav",
		"ambient/levels/prison/radio_random10.wav",
		"ambient/levels/prison/radio_random11.wav",
		"ambient/levels/prison/radio_random12.wav",
		"ambient/levels/prison/radio_random13.wav",
		"ambient/levels/prison/radio_random14.wav"
	}
	self.SoundTbl_Idle = {
		"vj_piv/mil_zomb/radio/idle_1.wav",
		"vj_piv/mil_zomb/radio/idle_2.wav",
		"vj_piv/mil_zomb/radio/idle_3.wav",
		"vj_piv/mil_zomb/radio/idle_4.wav"
	}
	self.SoundTbl_Alert = {
		"vj_piv/mil_zomb/radio/alert_1.wav",
		"vj_piv/mil_zomb/radio/alert_2.wav",
		"vj_piv/mil_zomb/radio/alert_3.wav",
		"vj_piv/mil_zomb/radio/alert_4.wav",
		"vj_piv/mil_zomb/radio/alert_5.wav",
		"vj_piv/mil_zomb/radio/alert_6.wav",
		"vj_piv/mil_zomb/radio/alert_7.wav"
	}
	self.SoundTbl_CombatIdle = {
		"vj_piv/mil_zomb/radio/idle_1.wav",
		"vj_piv/mil_zomb/radio/idle_2.wav",
		"vj_piv/mil_zomb/radio/idle_3.wav",
		"vj_piv/mil_zomb/radio/idle_4.wav",
		"vj_piv/mil_zomb/radio/idle_1.wav",
		"vj_piv/mil_zomb/radio/idle_2.wav",
		"vj_piv/mil_zomb/radio/idle_3.wav",
		"vj_piv/mil_zomb/radio/idle_4.wav",
		"vj_piv/mil_zomb/radio/alert_1.wav",
		"vj_piv/mil_zomb/radio/alert_2.wav",
		"vj_piv/mil_zomb/radio/alert_3.wav",
		"vj_piv/mil_zomb/radio/alert_4.wav",
		"vj_piv/mil_zomb/radio/alert_5.wav",
		"vj_piv/mil_zomb/radio/alert_6.wav",
		"vj_piv/mil_zomb/radio/alert_7.wav"
	}
	self.SoundTbl_BeforeMeleeAttack = {
		"vj_piv/mil_zomb/radio/alert_1.wav",
		"vj_piv/mil_zomb/radio/alert_2.wav",
		"vj_piv/mil_zomb/radio/alert_3.wav",
		"vj_piv/mil_zomb/radio/alert_4.wav",
		"vj_piv/mil_zomb/radio/alert_5.wav",
		"vj_piv/mil_zomb/radio/alert_6.wav",
		"vj_piv/mil_zomb/radio/alert_7.wav"
	}
	self.SoundTbl_Pain = {
		"vj_piv/mil_zomb/radio/pain_1.wav",
		"vj_piv/mil_zomb/radio/pain_2.wav",
		"vj_piv/mil_zomb/radio/pain_3.wav",
		"vj_piv/mil_zomb/radio/pain_4.wav"
	}
	self.SoundTbl_Death = {
		"vj_piv/mil_zomb/radio/death_1.wav",
		"vj_piv/mil_zomb/radio/death_2.wav"
	}
	self.GeneralSoundPitch1 = 70
	self.GeneralSoundpitch2 = 70
	self.GeneralSoundPitch1 = 50
	self.GeneralSoundpitch2 = 50
	self.HasSoundTrack = true
	self.SoundTrackVolume = 0.75
	self.SoundTbl_SoundTrack = {"vj_piv/music/megapanzer.mp3"}
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	self.NextSoundTime_Breath = VJ.SET(7,20)
	self:SetSkin(math.random(0,1))
	self:SetModelScale(1.4)

	if GetConVar("vj_piv_lights"):GetInt() == 1 then 

		self.Light2 = ents.Create("light_dynamic")
		self.Light2:SetKeyValue("brightness", "4")
		self.Light2:SetKeyValue("distance", "75")
		self.Light2:SetLocalPos(self:GetPos())
		self.Light2:SetLocalAngles(self:GetAngles())
		self.Light2:Fire("Color", "255 175 0 255")
		self.Light2:SetParent(self)
		self.Light2:Spawn()
		self.Light2:Activate()
		self.Light2:Fire("SetParentAttachment","eyes")
		self.Light2:Fire("TurnOn", "", 0)
		self:DeleteOnRemove(self.Light2)

	end

end
--------------------
function ENT:Zombie_CustomOnAlert()
	if GetConVar("vj_piv_alert_anim"):GetInt() == 1 && self.PIV_Crippled == false && self.PIV_FuckingCrawlingLittleCunt == false && self.PIV_Resting == 0 && self:GetSequence() != self:LookupSequence(ACT_OPEN_DOOR) then
		if math.random(1,GetConVar("vj_piv_alert_anim_chance"):GetInt()) == 1 then
			local tbl = VJ.PICK({"vjges_gesture_signal_forward","vjges_gesture_disagree"})
			self:VJ_ACT_PLAYACTIVITY(tbl,false,false,true)
		end
	end
end
--------------------
function ENT:Zombie_CustomOnTakeDamage_PreDamage(dmginfo,hitgroup)
	if self.Berserk == false && (self:Health() <= (self:GetMaxHealth() / 3)) then
		self.Berserk = true
		self.PIV_UseRunRelaxed = true
		self:PlaySoundSystem("Alert")	
		local tbl = VJ.PICK({"nz_taunt_9"})
		self:VJ_ACT_PLAYACTIVITY(tbl,true,VJ.AnimDuration(self,tbl),false)		
	end   
	if (dmginfo:IsBulletDamage()) then
		dmginfo:ScaleDamage(0.5)
		local attacker = dmginfo:GetAttacker()
		self.DamageSpark1 = ents.Create("env_spark")
		self.DamageSpark1:SetKeyValue("Magnitude","1")
		self.DamageSpark1:SetKeyValue("Spark Trail Length","1")
		self.DamageSpark1:SetPos(dmginfo:GetDamagePosition())
		self.DamageSpark1:SetAngles(self:GetAngles())
		self.DamageSpark1:SetParent(self)
		self.DamageSpark1:Spawn()
		self.DamageSpark1:Activate()
		self.DamageSpark1:Fire("StartSpark", "", 0)
		self.DamageSpark1:Fire("StopSpark", "", 0.001)
		self:DeleteOnRemove(self.DamageSpark1)
	end
	if self.HasSounds == true && self.HasImpactSounds == true then VJ.EmitSound(self,"vj_base/impact/armor"..math.random(1,10)..".wav",70) end	
	if hitgroup == HITGROUP_HEAD && GetConVar("vj_piv_headshot_damage"):GetInt() == 1 then
		dmginfo:ScaleDamage(GetConVar("vj_piv_headshot_damage_mult"):GetInt())
	end
end
--------------------