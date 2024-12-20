AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/exploder/exploder.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 300

ENT.PIV_IsSpecial = true

ENT.PIV_HasSubclasses = false
ENT.PIV_CanBeCrippled = false
ENT.PIV_AllowedToClimb = false
ENT.PIV_HasWeapons = false
ENT.PIV_CanBeThrower = false
ENT.PIV_AllowedToRest = false

ENT.GeneralSoundPitch1 = 130
ENT.GeneralSoundpitch2 = 120

ENT.MeleeAttackDamage = math.random(20,25)

ENT.HasDeathRagdoll = false -- If set to false, it will not spawn the regular ragdoll of the SNPC
ENT.GibOnDeathDamagesTable = {"All"}

ENT.HasBreathSound = true
ENT.BreathSoundLevel = 65

ENT.SoundTbl_Breath = {"vj_piv/exploder/indigestion_loop.wav"}
ENT.SoundTbl_Idle = {"vj_piv/exploder/breath.mp3"}
ENT.SoundTbl_Alert = {"vj_piv/exploder/alert_1.mp3","vj_piv/exploder/alert_2.mp3","vj_piv/exploder/alert_3.mp3"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/exploder/death_1.mp3","vj_piv/exploder/death_2.mp3"}
ENT.SoundTbl_Pain = {"vj_piv/exploder/pain_1.mp3","vj_piv/exploder/pain_2.mp3","vj_piv/exploder/pain_3.mp3"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetModelScale(1.2)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	self.MeleeAttackAnimationAllowOtherTasks = false		
	self.AnimTbl_MeleeAttack = {
		"vjseq_boomervar_squat"
	}
	
	timer.Simple(0.8,function() if IsValid(self) then
		self:TakeDamage(1000)
		end
	end)

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnKilled(dmginfo,hitgroup)
		VJ.ApplyRadiusDamage(self,self,self:GetPos(),200,math.random(0,0),DMG_BLAST,true,true,{Force=20})
	for k,v in ipairs(ents.FindInSphere(self:GetPos(),200)) do
		v:TakeDamage(math.random(50,60))
	end
		util.ScreenShake(self:GetPos(),60,1200,3,2000)
		VJ.EmitSound(self,{"vj_piv/exploder/Explode1.wav","vj_piv/exploder/Explode2.wav","vj_piv/exploder/Explode3.wav"},100,math.random(100,100))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
	if IsValid(self:GetEnemy()) then
		if self:GetPos():Distance(self:GetEnemy():GetPos()) < 400 then
			self.Running = false
		else
			self.Running = true
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)
	if self.HasGibDeathParticles == true then
		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetPos() +self:OBBCenter())
		bloodeffect:SetColor(VJ.Color2Byte(Color(130,19,10)))
		bloodeffect:SetScale(300)
		util.Effect("VJ_Blood1",bloodeffect)
		
		local bloodspray = EffectData()
		bloodspray:SetOrigin(self:GetPos())
		bloodspray:SetScale(12)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(0)
		util.Effect("bloodspray",bloodspray)
		util.Effect("bloodspray",bloodspray)
	end
	self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,35))})
	self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,50))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,50))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,20))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,20))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS.mdl",{Pos=self:LocalToWorld(Vector(0,0,60))})
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if hitgroup == HITGROUP_STOMACH or hitgroup == HITGROUP_CHEST then
		if (dmginfo:IsBulletDamage()) then
			dmginfo:ScaleDamage(3)
		end
	end
	
	if hitgroup == HITGROUP_HEAD && GetConVar("vj_piv_headshot_damage"):GetInt() == 1 then
		dmginfo:ScaleDamage(GetConVarNumber("vj_piv_headshot_damage_mult"))
    end

end
----------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
	if self.CanDoTheFunny == false then return end
	
	local stumble = VJ.PICK({"vjseq_shoved_backward_01","vjseq_shoved_rightward","vjseq_shoved_leftward","vjseq_shoved_forward",})
	
	if dmginfo:IsBulletDamage() or dmginfo:IsDamageType(DMG_BUCKSHOT) or dmginfo:IsDamageType(DMG_SNIPER) then
		if hitgroup == HITGROUP_HEAD or hitgroup == HITGROUP_CHEST or hitgroup == HITGROUP_STOMACH then
			if self.PIVNextStumbleT < CurTime() then
				if dmginfo:GetDamage() > 50 or dmginfo:GetDamageForce():Length() > 10000 then
					if math.random (1,2) == 1 then
						self:VJ_ACT_PLAYACTIVITY("vjseq_shoved_backward_01",true,false,false)
						self.PIVNextStumbleT = CurTime() + 5
					end
				end
			end
		end
	end

	if dmginfo:IsDamageType(DMG_CLUB) or dmginfo:IsDamageType(DMG_SLASH) or dmginfo:IsDamageType(DMG_GENERIC) then
		if dmginfo:GetDamage() > 30 or dmginfo:GetDamageForce():Length() > 10000 then
			if self.PIV_NextShoveT < CurTime() then
				self:VJ_ACT_PLAYACTIVITY("vjseq_shoved_backward_01",true,false,false)
				self.PIV_NextShoveT = CurTime() + math.random(5,8)
			end
		end
    return !self.PIV_Crippled && !self.PIV_FuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH)
	end

	if dmginfo:IsExplosionDamage() then
		if self.NextSplodeStumbleT < CurTime() then
			self:VJ_ACT_PLAYACTIVITY(stumble,true,VJ.AnimDuration(self,tbl),false)
			self.NextSplodeStumbleT = CurTime() + 5
		end
	return !self.PIV_Crippled && !self.PIV_FuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH)
	end
	
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/