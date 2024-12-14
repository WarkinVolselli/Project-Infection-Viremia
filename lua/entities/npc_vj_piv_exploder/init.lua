include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
-- ENT.MeleeAttackDamage = math.random(20,25) -- what's the point of this???
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.Model = {"models/vj_piv/specials/exploder/exploder.mdl"}
	self.StartHealth = 300
	self.HasDeathRagdoll = false
	self.GibOnDeathDamagesTable = {"All"}
	self.PIV_IsSpecial = true
	self.PIV_HasSubclasses = false
	self.PIV_CanBeCrippled = false
	self.PIV_AllowedToClimb = false
	self.PIV_HasWeapons = false
	self.PIV_CanBeThrower = false
	self.PIV_AllowedToRest = false
	self.GeneralSoundPitch1 = 130
	self.GeneralSoundpitch2 = 120
	self.MeleeAttackAnimationAllowOtherTasks = false		
	self.AnimTbl_MeleeAttack = {"vjseq_boomervar_squat"}
end
--------------------
function ENT:Zombie_GiveVoice()
	self.HasBreathSound = true
	self.BreathSoundLevel = 65
	self.SoundTbl_Breath = {"vj_piv/exploder/indigestion_loop.wav"}
	self.SoundTbl_Idle = {"vj_piv/exploder/breath.mp3"}
	self.SoundTbl_Alert = {"vj_piv/exploder/alert_1.mp3","vj_piv/exploder/alert_2.mp3","vj_piv/exploder/alert_3.mp3"}
	self.SoundTbl_BeforeMeleeAttack = {"vj_piv/exploder/death_1.mp3","vj_piv/exploder/death_2.mp3"}
	self.SoundTbl_Pain = {"vj_piv/exploder/pain_1.mp3","vj_piv/exploder/pain_2.mp3","vj_piv/exploder/pain_3.mp3"}
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetModelScale(1.2)
end
--------------------
function ENT:Zombie_CustomOnDeath_Finish(dmginfo, hitgroup)

	VJ.ApplyRadiusDamage(self,self,self:GetPos(),200,math.random(50,60),DMG_BLAST,true,true,{Force=20})
	-- for k,v in ipairs(ents.FindInSphere(self:GetPos(),200)) do
		-- v:TakeDamage(math.random(50,60))
	-- end
	util.ScreenShake(self:GetPos(),60,1200,3,2000)
	VJ.EmitSound(self,{"vj_piv/exploder/Explode1.wav","vj_piv/exploder/Explode2.wav","vj_piv/exploder/Explode3.wav"},100,math.random(100,100))

end
--------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
	if IsValid(self:GetEnemy()) then
		if self:GetPos():Distance(self:GetEnemy():GetPos()) < 400 then -- optimize this like we did with the ghillie
			self.Running = false
		else
			self.Running = true
		end
	end
end
--------------------
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)

	if self.HasGibOnDeathEffects == true then
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
--------------------
function ENT:Zombie_CustomOnTakeDamage_PreDamage(dmginfo,hitgroup)
	if hitgroup == HITGROUP_STOMACH or hitgroup == HITGROUP_CHEST then
		if (dmginfo:IsBulletDamage()) then
			dmginfo:ScaleDamage(3)
		end
	end
	if hitgroup == HITGROUP_HEAD && GetConVar("vj_piv_headshot_damage"):GetInt() == 1 then
		dmginfo:ScaleDamage(GetConVarNumber("vj_piv_headshot_damage_mult"))
	end
end
--------------------
function ENT:Zombie_CustomOnTakeDamage_PostDamage(dmginfo,hitgroup)

	if self.CanDoTheFunny == false then return end
	-- local stumble = VJ.PICK({"vjseq_shoved_backward_01","vjseq_shoved_rightward","vjseq_shoved_leftward","vjseq_shoved_forward",}) -- this isn't used anywhere
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
--------------------