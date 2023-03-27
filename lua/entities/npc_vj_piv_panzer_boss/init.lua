AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/military/juggernaut.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 3000
ENT.VJ_IsHugeMonster = true
ENT.PIV_HasArmor = true
ENT.Berserk = false
ENT.PIV_CanMutate = false

ENT.GeneralSoundPitch1 = 50
ENT.GeneralSoundpitch2 = 50

ENT.HasSoundTrack = true
ENT.SoundTrackVolume = 0.3
ENT.SoundTbl_SoundTrack = {"vj_piv/music/yakuzads_that_man.mp3"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,1))
	self:SetModelScale(1.4)

if GetConVar("vj_piv_lights"):GetInt() == 1 then 

self.Light2 = ents.Create("light_dynamic")
self.Light2:SetKeyValue("brightness", "7")
self.Light2:SetKeyValue("distance", "50")
self.Light2:SetLocalPos(self:GetPos())
self.Light2:SetLocalAngles(self:GetAngles())
self.Light2:Fire("Color", "216 255 0 255")
self.Light2:SetParent(self)
self.Light2:Spawn()
self.Light2:Activate()
self.Light2:Fire("SetParentAttachment","eyes")
self.Light2:Fire("TurnOn", "", 0)
self:DeleteOnRemove(self.Light2)

end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)

	if self.Berserk == false && (self:Health() <= (self:GetMaxHealth() / 2)) then
		self.Berserk = true
		self.AnimTbl_Run = {ACT_RUN_RELAXED}
        self:PlaySoundSystem("Alert")	
		local tbl = VJ_PICK({"nz_taunt_9"})
		self:VJ_ACT_PLAYACTIVITY(tbl,true,VJ_GetSequenceDuration(self,tbl),false)		
	end   

	if hitgroup == HITGROUP_HEAD then return end
		if (dmginfo:IsBulletDamage()) then
			dmginfo:ScaleDamage(0.75)
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
		if self.HasSounds == true && self.HasImpactSounds == true then VJ_EmitSound(self,"vj_impact_metal/bullet_metal/metalsolid"..math.random(1,10)..".wav",70) 
	end	
	
	if hitgroup == HITGROUP_HEAD && GetConVar("vj_piv_headshot_damage"):GetInt() == 1 then
		dmginfo:ScaleDamage(GetConVarNumber("vj_piv_headshot_damage_mult"))
    end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)

	if
		!self.Flinching &&
		self:IsMoving() &&
		!self.PIV_Crippled &&
		!self.PIV_FuckingCrawlingLittleCunt &&
		self.PIVNextStumbleT > CurTime() &&
		math.random(1,16) == 1
	then
		local anim = {"run_stumble_01","run_stumble1","run_stumble2","run_stumble3","run_stumble4","run_stumble5","run_stumble6"} -- falling animations
		self:VJ_ACT_PLAYACTIVITY(anim,true,false,false) -- play a fall animation 
		self.PIVNextStumbleT = CurTime() + 10 
	end

	if self.CanDoTheFunny == false or self.PIV_Crippled or self.PIV_FuckingCrawlingLittleCunt  then return end

	if dmginfo:IsBulletDamage() or dmginfo:IsDamageType(DMG_BUCKSHOT) or dmginfo:IsDamageType(DMG_SNIPER) then
		if hitgroup == HITGROUP_HEAD or hitgroup == HITGROUP_CHEST or hitgroup == HITGROUP_STOMACH then
			if self.PIVNextStumbleT < CurTime() then
				if dmginfo:GetDamage() > 60 or dmginfo:GetDamageForce():Length() > 10000 then
					if math.random (1,2) == 1 then
						self:VJ_ACT_PLAYACTIVITY(ACT_BIG_FLINCH,true,false,false)
						self.PIVNextStumbleT = CurTime() + math.random(5,10)
					end
				elseif dmginfo:GetDamage() > 40 or dmginfo:GetDamageForce():Length() > 5000 then
					if math.random (1,3) == 1 then
						self:VJ_ACT_PLAYACTIVITY(ACT_SMALL_FLINCH,true,false,false)
						self.PIVNextStumbleT = CurTime() + math.random(5,10)
					end
				else
					if math.random (1,5) == 1 then
						self:VJ_ACT_PLAYACTIVITY(ACT_STEP_BACK,true,1.6)
						self.PIVNextStumbleT = CurTime() + math.random(5,10)
					end
				end
			end
		elseif hitgroup == HITGROUP_LEFTLEG or hitgroup == HITGROUP_RIGHTLEG then		 
			if self.PIVNextStumbleT < CurTime() then
				if math.random (1,5) == 1 then
					self:VJ_ACT_PLAYACTIVITY(ACT_STEP_FORE,true,1.6)
					self.PIVNextStumbleT = CurTime() + math.random(6,12)
				end
			end
		end
	end

	if dmginfo:IsDamageType(DMG_CLUB) or dmginfo:IsDamageType(DMG_SLASH) or dmginfo:IsDamageType(DMG_GENERIC) then
		if dmginfo:GetDamage() > 80 or dmginfo:GetDamageForce():Length() > 10000 then
			if self.PIV_NextShoveT < CurTime() then
				self:VJ_ACT_PLAYACTIVITY(ACT_BIG_FLINCH,true,false,false)
				self.PIV_NextShoveT = CurTime() + math.random(8,12)
			end
		elseif dmginfo:GetDamage() > 60 or dmginfo:GetDamageForce():Length() > 5000 then
			if self.PIV_NextShoveT < CurTime() then
				self:VJ_ACT_PLAYACTIVITY(ACT_SMALL_FLINCH,true,false,false)
				self.PIV_NextShoveT = CurTime() + math.random(8,12)
			end
		end
    return !self.PIV_Crippled && !self.PIV_FuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH)
	end

	if dmginfo:IsExplosionDamage() then
		if self.NextSplodeStumbleT < CurTime() then
			self:DropTheFuckignWeaponGoddamn()
			if math.random(1,2) == 1 then
				self:VJ_ACT_PLAYACTIVITY("vjseq_shove_forward_01",true,false,false)
			else
				self:VJ_ACT_PLAYACTIVITY(ACT_BIG_FLINCH,true,false,false)
			end
			self.NextSplodeStumbleT = CurTime() + 5
		end
	return !self.PIV_Crippled && !self.PIV_FuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	self.MeleeAttackDamage = math.random(20,25)
	self.HasMeleeAttackKnockBack = true
	self.MeleeAttackDistance = 50
	self.MeleeAttackDamageDistance = 70
	self.SoundTbl_MeleeAttack = {"vj_piv/z_hit-01.wav","vj_piv/z_hit-02.wav","vj_piv/z_hit-03.wav","vj_piv/z_hit-04.wav","vj_piv/z_hit-05.wav","vj_piv/z_hit-06.wav"}
	self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	
	
    if self:IsMoving()then
	
		self.MeleeAttackAnimationAllowOtherTasks = true
	
		self.AnimTbl_MeleeAttack = {
			"vjges_melee_moving01",
			"vjges_melee_moving02",
			"vjges_melee_moving03",
			"vjges_melee_moving04",
			"vjges_melee_moving05",
			"vjges_melee_moving06",
		}
	
		if self.Berserk == true and math.random(1,4) == 1 then
		
			self.MeleeAttackAnimationAllowOtherTasks = false
	
			self.MeleeAttackDistance = 150
			self.MeleeAttackDamageDistance = 70
		
			self.AnimTbl_MeleeAttack = {
				"vjseq_atk_jump"
			}
		end
	
	else
	
		self.MeleeAttackAnimationAllowOtherTasks = false
		
		self.MeleeAttackDamage = math.random(20,25)
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackDistance = 50
		self.MeleeAttackDamageDistance = 70
		
		self.AnimTbl_MeleeAttack = {
			"vjseq_nz_attack_stand_ad_1",
			"vjseq_nz_attack_stand_ad_2-2",
			"vjseq_nz_attack_stand_ad_2-3",
			"vjseq_nz_attack_stand_ad_2-4",
		}

	end
	
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/