AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/brawler/male_01.mdl","models/vj_piv/specials/brawler/male_02.mdl","models/vj_piv/specials/brawler/male_03.mdl","models/vj_piv/specials/brawler/male_04.mdl","models/vj_piv/specials/brawler/male_05.mdl","models/vj_piv/specials/brawler/male_07.mdl","models/vj_piv/specials/brawler/male_09.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 2000
ENT.VJ_IsHugeMonster = true
ENT.AnimTbl_IdleStand = {ACT_IDLE}
ENT.AnimTbl_Walk = {ACT_WALK}
ENT.AnimTbl_Run = {ACT_RUN}

ENT.HullType = HULL_MEDIUM_TALL

ENT.MeleeAttackDistance = 100
ENT.MeleeAttackDamageDistance = 60

ENT.GeneralSoundPitch1 = 120
ENT.GeneralSoundpitch2 = 120

ENT.PIV_NextStrafeT = 0
ENT.PIV_NextRunT = 0

ENT.DeathAnimationChance = 1

ENT.HasSoundTrack = true
ENT.SoundTrackVolume = 0.3
ENT.SoundTbl_SoundTrack = {"vj_piv/music/yakuzads_majima_theme.mp3"}

ENT.PIV_SpawnCoolDownT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
 
if GetConVar("vj_piv_lights"):GetInt() == 1 then 

self.Light2 = ents.Create("light_dynamic")
self.Light2:SetKeyValue("brightness", "7")
self.Light2:SetKeyValue("distance", "50")
self.Light2:SetLocalPos(self:GetPos())
self.Light2:SetLocalAngles(self:GetAngles())
self.Light2:Fire("Color", "255 0 0 255")
self.Light2:SetParent(self)
self.Light2:Spawn()
self.Light2:Activate()
self.Light2:Fire("SetParentAttachment","eyes")
self.Light2:Fire("TurnOn", "", 0)
self:DeleteOnRemove(self.Light2)

end

	self:SetModelScale(1.3)
	
	self.ExtraGunModel1 = ents.Create("prop_physics")
	self.ExtraGunModel1:SetModel("models/props_canal/mattpipe.mdl")
	self.ExtraGunModel1:SetOwner(self)
	self.ExtraGunModel1:SetParent(self)
	self.ExtraGunModel1:SetLocalAngles(Angle(-120,45,90))
	self.ExtraGunModel1:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
	self.ExtraGunModel1:Fire("SetParentAttachment","anim_attachment_RH")
	self.ExtraGunModel1:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	self.ExtraGunModel1:Spawn()
	self.ExtraGunModel1:Activate()
	self.ExtraGunModel1:SetSolid(SOLID_NONE)
	self.ExtraGunModel1:AddEffects(EF_BONEMERGE)
	self.ExtraGunModel1:SetLocalPos(self:GetPos())
	
self.SoundTbl_Idle = {
	"vj_piv/demolisher/idle_1.mp3",
	"vj_piv/demolisher/idle_2.mp3",
	"vj_piv/demolisher/idle_3.mp3",
	"vj_piv/demolisher/idle_4.mp3",
	"vj_piv/demolisher/idle_5.mp3",
	"vj_piv/demolisher/idle_6.mp3",
	"vj_piv/demolisher/idle_7.mp3",
	"vj_piv/demolisher/idle_8.mp3"
}

self.SoundTbl_Alert = {
	"vj_piv/demolisher/alert_1.mp3",
	"vj_piv/demolisher/alert_2.mp3"
}

self.SoundTbl_CombatIdle = {
	"vj_piv/demolisher/idle_1.mp3",
	"vj_piv/demolisher/idle_2.mp3",
	"vj_piv/demolisher/idle_3.mp3",
	"vj_piv/demolisher/idle_4.mp3",
	"vj_piv/demolisher/idle_5.mp3",
	"vj_piv/demolisher/idle_6.mp3",
	"vj_piv/demolisher/idle_7.mp3",
	"vj_piv/demolisher/idle_8.mp3"
}

self.SoundTbl_BeforeMeleeAttack = {
	"vj_piv/demolisher/attack_1.mp3",
	"vj_piv/demolisher/attack_2.mp3",
	"vj_piv/demolisher/attack_3.mp3",
	"vj_piv/demolisher/attack_4.mp3",
	"vj_piv/demolisher/attack_5.mp3",
	"vj_piv/demolisher/attack_6.mp3",
	"vj_piv/demolisher/attack_7.mp3"
}

self.SoundTbl_Pain = {
	"vj_piv/demolisher/pain_1.mp3",
	"vj_piv/demolisher/pain_2.mp3",
	"vj_piv/demolisher/pain_3.mp3",
	"vj_piv/demolisher/pain_4.mp3",
	"vj_piv/demolisher/pain_5.mp3"
}
	
self.SoundTbl_Death = {
	"vj_piv/demolisher/death_cutoff.mp3"
}

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	if math.random(1,3) == 1 then
	
		self.MeleeAttackAnimationAllowOtherTasks = true
		
		self.MeleeAttackDamage = math.random(25,30)
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackDistance = 40
		self.MeleeAttackDamageDistance = 70
		
		self.SoundTbl_MeleeAttackMiss = {"vj_piv/Miss1.wav","vj_piv/Miss2.wav","vj_piv/Miss3.wav","vj_piv/Miss4.wav","vj_piv/Miss5.wav"}
		self.SoundTbl_MeleeAttack = {"vj_piv/wrenchhit1.wav","vj_piv/wrenchhit2.wav","vj_piv/wrenchhit3.wav","vj_piv/wrenchhit4.wav"}

		self.AnimTbl_MeleeAttack = {
			"vjges_melee_moving01a",
			"vjges_melee_moving03a",
			"vjges_melee_moving06a",
		}
	
		elseif math.random(1,3) == 2 then
	
		self.MeleeAttackAnimationAllowOtherTasks = false
	
		self.MeleeAttackDamage = math.random(20,25)
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackDistance = 40
		self.MeleeAttackDamageDistance = 70
		
		self.SoundTbl_MeleeAttack = {"vj_piv/z_hit-01.wav","vj_piv/z_hit-02.wav","vj_piv/z_hit-03.wav","vj_piv/z_hit-04.wav","vj_piv/z_hit-05.wav","vj_piv/z_hit-06.wav"}
		self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	

		self.AnimTbl_MeleeAttack = {
			"vjseq_cmb01",
		}
		
		elseif math.random(1,3) == 3 then
		
			self.MeleeAttackAnimationAllowOtherTasks = false
			
			self.MeleeAttackDamage = math.random(28,33)
			self.HasMeleeAttackKnockBack = true
			self.MeleeAttackDistance = 160
			self.MeleeAttackDamageDistance = 70
		
			self.SoundTbl_MeleeAttack = {"vj_piv/BodyHit-3.wav","vj_piv/BodyHit-4.wav","vj_piv/BodyHit-5.wav","vj_piv/BodyHit-6.wav"}
			self.SoundTbl_MeleeAttackMiss = {"vj_piv/Miss1.wav","vj_piv/Miss2.wav","vj_piv/Miss3.wav","vj_piv/Miss4.wav","vj_piv/Miss5.wav"}

			self.AnimTbl_MeleeAttack = {
				"vjseq_atk_jumpkick",
				"vjseq_atk_jumpknee",
			}
	
	end
	        
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
	if !IsValid(self:GetEnemy()) then
		self.AnimTbl_Walk = {ACT_WALK}
		self.AnimTbl_Run = {ACT_RUN}
	else
		if self:GetPos():Distance(self:GetEnemy():GetPos()) < 200 then
			self.AnimTbl_Walk = {ACT_WALK}
			self.AnimTbl_Run = {ACT_WALK}
		else
			self.AnimTbl_Walk = {ACT_WALK}
			self.AnimTbl_Run = {ACT_RUN}
		end
	end
	
	-- Dodge System
    if self.VJ_IsBeingControlled == true or self.PIV_Crawler or self.PIV_Crippled or self.Flinching or self:GetSequence() == self:LookupSequence(ACT_BIG_FLINCH) or self.DeathAnimationCodeRan then return end
    if IsValid(self:GetEnemy()) == true && self.MeleeAttacking == false && self.VJ_IsBeingControlled == false && CurTime() > self.PIV_NextStrafeT && self:GetPos():Distance(self:GetEnemy():GetPos()) < 200 then
        self:StopMoving()
        self:VJ_ACT_PLAYACTIVITY({"vjseq_sway_b","vjseq_sway_f","vjseq_sway_l","vjseq_sway_r"}, true, false, false)
		VJ_EmitSound(self,"vj_piv/Miss"..math.random(1,5)..".wav",70,100)
		util.ScreenShake(self:GetPos(), 100, 200, 1, 1000)
        self.PIV_NextRunT = CurTime() + 2
        self.PIV_NextStrafeT = CurTime() + math.random(3,6)
	end

	if self.PIV_SpawnCoolDownT < CurTime() then

		self:PIV_SummonHelp_Spawn()
		
		self:VJ_ACT_PLAYACTIVITY("vjseq_nz_taunt_5",true,false,false)

		self.PIV_SpawnCoolDownT = CurTime() + 10

	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PIV_SummonHelp_Spawn()
	if !IsValid(self.ThugHelp1) then
		self.ThugHelp1 = self:PIV_SummonHelp()
		return 15
	elseif !IsValid(self.ThugHelp2) then
		self.ThugHelp2 = self:PIV_SummonHelp()
		return 15
	elseif !IsValid(self.ThugHelp3) then
		self.ThugHelp3 = self:PIV_SummonHelp()
		return 15
	elseif !IsValid(self.ThugHelp4) then
		self.ThugHelp4 = self:PIV_SummonHelp()
		return 15
	end
	return 15
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PIV_SummonHelp()
    
	if math.random(1,2) == 1 then
	self.ThugMinion = "npc_vj_piv_brawler"
	else
	self.ThugMinion = "npc_vj_piv_brawler_f"
    end
	
	local tr = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() + self:GetForward() * math.Rand(-2000, 2000) + self:GetRight() * math.Rand(-2000, 2000) + self:GetUp() * 50,
		filter = {self},
		mask = MASK_ALL,
	})
	local spawnpos = tr.HitPos + tr.HitNormal*300
	local ally = ents.Create(self.ThugMinion)
	ally:SetPos(spawnpos)
	ally:SetAngles(self:GetAngles())
	ally:Spawn()
	ally:Activate()
	ally:ForceDig()
	ally.VJ_NPC_Class = self.VJ_NPC_Class
	return ally
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
	if self.CanDoTheFunny == false then return end

	if dmginfo:IsBulletDamage() or dmginfo:IsDamageType(DMG_BUCKSHOT) or dmginfo:IsDamageType(DMG_SNIPER) then
		if hitgroup == HITGROUP_HEAD or hitgroup == HITGROUP_CHEST or hitgroup == HITGROUP_STOMACH then
			if self.PIVNextStumbleT < CurTime() then
				if dmginfo:GetDamage() > 60 or dmginfo:GetDamageForce():Length() > 10000 then
					if math.random (1,2) == 1 then
						self:VJ_ACT_PLAYACTIVITY("vjseq_flinch_heavy_f",true,false,false)
						self.PIVNextStumbleT = CurTime() + 5
					end
				end
			end
		end
	end

	if dmginfo:IsDamageType(DMG_CLUB) or dmginfo:IsDamageType(DMG_SLASH) or dmginfo:IsDamageType(DMG_GENERIC) then
		if dmginfo:GetDamage() > 40 or dmginfo:GetDamageForce():Length() > 10000 then
			if self.PIVNextShoveT < CurTime() then
				self:VJ_ACT_PLAYACTIVITY("vjseq_flinch_heavy_f",true,false,false)
				self.PIVNextShoveT = CurTime() + math.random(8,12)
			end
		end
    return !self.PIV_Crippled && !self.PIV_FuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH)
	end

	if dmginfo:IsExplosionDamage() then
		if self.NextSplodeStumbleT < CurTime() then
			self:VJ_ACT_PLAYACTIVITY("vjseq_flinch_heavy_f",true,false,false)
			self.NextSplodeStumbleT = CurTime() + 6
		end
	return !self.PIV_Crippled && !self.PIV_FuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH)
	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackKnockbackVelocity(hitEnt)
	return self:GetForward()*math.random(180, 220) + self:GetUp()*math.random(90,120)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/