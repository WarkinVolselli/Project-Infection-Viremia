AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/bruiser/bruiser.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 600

ENT.VJ_IsHugeMonster = true

ENT.AnimTbl_Walk = {ACT_WALK}
ENT.AnimTbl_Run = {ACT_WALK}
		
ENT.SoundTbl_Idle = {"vj_piv/bruiser/zombie_mutant_get_up_00_0.wav","vj_piv/bruiser/zombie_mutant_get_up_01_0.wav","vj_piv/bruiser/zombie_mutant_get_up_02_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_00_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_01_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_02_0.wav"}
ENT.SoundTbl_CombatIdle = {"vj_piv/bruiser/zombie_mutant_get_up_00_0.wav","vj_piv/bruiser/zombie_mutant_get_up_01_0.wav","vj_piv/bruiser/zombie_mutant_get_up_02_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_00_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_01_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_02_0.wav"}
ENT.SoundTbl_Alert = {"vj_piv/bruiser/zombie_mutant_enemy_spotted_00_0.wav","vj_piv/bruiser/zombie_mutant_enemy_spotted_01_0.wav","vj_piv/bruiser/zombie_mutant_enemy_spotted_02_0.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/bruiser/zombie_mutant_attack_00_0.wav","vj_piv/bruiser/zombie_mutant_attack_01_0.wav","vj_piv/bruiser/zombie_mutant_attack_02_0.wav","vj_piv/bruiser/zombie_mutant_attack_03_0.wav","vj_piv/bruiser/zombie_mutant_attack_04_0.wav"}
ENT.SoundTbl_Pain = {"vj_piv/bruiser/zombie_mutant_pain_00_0.wav","vj_piv/bruiser/zombie_mutant_pain_01_0.wav","vj_piv/bruiser/zombie_mutant_pain_02_0.wav"}
ENT.SoundTbl_Death = {"vj_piv/bruiser/zombie_mutant_death_00_0.wav","vj_piv/bruiser/zombie_mutant_death_01_0.wav","vj_piv/bruiser/zombie_mutant_death_02_0.wav"}
ENT.SoundTbl_AngyBitch = {"vj_piv/bruiser/zombie_mutant_pain_critical_00_0.wav","vj_piv/bruiser/zombie_mutant_pain_critical_01_0.wav","vj_piv/bruiser/zombie_mutant_pain_critical_02_0.wav"}

ENT.NextRunT = 0
ENT.RunT = 0
ENT.Running = false
ENT.PIV_BigBitch_Angy = false
ENT.PIV_BigBitch_Angy_AngyAmmount = 0
ENT.PIV_BigBitch_Angy_AmmountNeededToAngy = 100 -- ammount of damage it needs to take before going angy mode
ENT.PIV_BigBitch_Angy_AngyTime = 0

ENT.HitGroupFlinching_Values = {
{HitGroup = {HITGROUP_HEAD}, Animation = {"vjges_flinch_head"}}, 
{HitGroup = {HITGROUP_STOMACH}, Animation = {"vjges_flinch_back","vjges_flinch_stomach"}}, 
{HitGroup = {HITGROUP_CHEST}, Animation = {"vjges_flinch_chest","vjges_flinch_chest_2","vjges_flinch_chest_3"}}, 
{HitGroup = {HITGROUP_LEFTARM}, Animation = {"vjges_flinch_left"}}, 
{HitGroup = {HITGROUP_RIGHTARM}, Animation = {"vjges_flinch_right"}}, 
{HitGroup = {HITGROUP_LEFTLEG}, Animation = {"vjsges_flinch_leftleg"}}, 
{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {"vjges_flinch_rightleg"}}
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
self:SetSkin(math.random(0,3))
self.NextRunT = CurTime() + math.random(6,12)
self.PIV_LegHP = self.PIV_LegHP *2
self:SetModelScale(1.1)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()

	if self.PIV_BigBitch_Angy_AngyAmmount >= self.PIV_BigBitch_Angy_AmmountNeededToAngy && !self.PIV_BigBitch_Angy then -- if we have enough angy points and we're not angy then
		-- get angy
	
		self.PIV_BigBitch_Angy = true
		self.Running = false -- precaution
		self.PIV_BigBitch_Angy_AngyAmmount = 0
		self.PIV_BigBitch_Angy_AngyTime = CurTime() + math.random(10,20) -- how long we're angy for

		-- play beforemelee sound to audibly let them know we're angy
		VJ_EmitSound(self,self.SoundTbl_AngyBitch,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))

        self.AnimTbl_Walk = {ACT_WALK}
        self.AnimTbl_Run = {ACT_RUN}
		self.SoundTbl_CombatIdle = {"vj_piv/bruiser/zombie_mutant_taunt_00_0.wav","vj_piv/bruiser/zombie_mutant_taunt_01_0.wav","vj_piv/bruiser/zombie_mutant_taunt_02_0.wav"}

	end

	if self.PIV_BigBitch_Angy then
		if self:GetEnemy() == nil then
			-- calm down cause we lost them
			self.NextRunT = CurTime() + math.random(5,10)
			self.PIV_BigBitch_Angy = false
		    self.AnimTbl_Walk = {ACT_WALK}
			self.AnimTbl_Run = {ACT_WALK}
			self.SoundTbl_CombatIdle = {"vj_piv/bruiser/zombie_mutant_get_up_00_0.wav","vj_piv/bruiser/zombie_mutant_get_up_01_0.wav","vj_piv/bruiser/zombie_mutant_get_up_02_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_00_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_01_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_02_0.wav"}
		end
		if self.PIV_BigBitch_Angy_AngyTime < CurTime() then -- if the angy timer has run out
			self.NextRunT = CurTime() + math.random(5,10)
			self.PIV_BigBitch_Angy = false
		    self.AnimTbl_Walk = {ACT_WALK}
			self.AnimTbl_Run = {ACT_WALK}
			self.SoundTbl_CombatIdle = {"vj_piv/bruiser/zombie_mutant_get_up_00_0.wav","vj_piv/bruiser/zombie_mutant_get_up_01_0.wav","vj_piv/bruiser/zombie_mutant_get_up_02_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_00_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_01_0.wav","vj_piv/bruiser/zombie_mutant_idle_calm_02_0.wav"}
		end
	end

end
----------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt, isProp)
	if self.PIV_BigBitch_Angy then
		self.PIV_BigBitch_Angy_AngyTime = CurTime() - math.random(5,10) -- remove some time since hitting stuff calms us a little
	end
end
----------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
	if !self.PIV_BigBitch_Angy then -- if we're not angy then run this
		self.PIV_BigBitch_Angy_AngyAmmount = self.PIV_BigBitch_Angy_AngyAmmount +dmginfo:GetDamage() -- update angy ammount and add how much damage we took
	end
	
	if self.CanDoTheFunny == false then return end
	
	local stumble = VJ_PICK({"vjseq_shoved_backward","vjseq_shoved_rightward","vjseq_shoved_leftward","vjseq_shoved_forward",})
	
	if dmginfo:IsBulletDamage() or dmginfo:IsDamageType(DMG_BUCKSHOT) or dmginfo:IsDamageType(DMG_SNIPER) then
		if hitgroup == HITGROUP_HEAD or hitgroup == HITGROUP_CHEST or hitgroup == HITGROUP_STOMACH then
			if self.PIVNextStumbleT < CurTime() then
				if dmginfo:GetDamage() > 40 or dmginfo:GetDamageForce():Length() > 10000 then
					if math.random (1,2) == 1 then
						self:VJ_ACT_PLAYACTIVITY("vjseq_shoved_backward",true,false,false)
						self.PIVNextStumbleT = CurTime() + 5
					end
				end
			end
		end
	end

	if dmginfo:IsDamageType(DMG_CLUB) or dmginfo:IsDamageType(DMG_SLASH) or dmginfo:IsDamageType(DMG_GENERIC) then
		if dmginfo:GetDamage() > 20 or dmginfo:GetDamageForce():Length() > 10000 then
			if self.PIV_NextShoveT < CurTime() then
				self:VJ_ACT_PLAYACTIVITY("vjseq_shoved_backward",true,false,false)
				self.PIV_NextShoveT = CurTime() + math.random(5,8)
			end
		end
    return !self.PIVCrippled && !self.PIVFuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH)
	end

	if dmginfo:IsExplosionDamage() then
		if self.NextSplodeStumbleT < CurTime() then
			self:VJ_ACT_PLAYACTIVITY(stumble,true,VJ_GetSequenceDuration(self,tbl),false)
			self.NextSplodeStumbleT = CurTime() + 5
		end
	return !self.PIVCrippled && !self.PIVFuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH)
	end
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD && GetConVar("vj_piv_headshot_damage"):GetInt() == 1 then
		dmginfo:ScaleDamage(GetConVarNumber("vj_piv_headshot_damage_mult"))
    end
		if hitgroup == HITGROUP_RIGHTARM or hitgroup == HITGROUP_LEFTARM then
		dmginfo:ScaleDamage(0.5)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	if math.random(1,3) == 1 then
		
		self.MeleeAttackAnimationAllowOtherTasks = false
		self.MeleeAttackDamage = math.random(30,35)
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackDistance = 50
		self.MeleeAttackDamageDistance = 70
		self.SoundTbl_MeleeAttack = {"vj_piv/BodyHit-3.wav","vj_piv/BodyHit-4.wav","vj_piv/BodyHit-5.wav","vj_piv/BodyHit-6.wav"}
		self.SoundTbl_MeleeAttackMiss = {"vj_piv/Miss1.wav","vj_piv/Miss2.wav","vj_piv/Miss3.wav","vj_piv/Miss4.wav","vj_piv/Miss4.wav"}
		self.AnimTbl_MeleeAttack = {
			"vjseq_charger_pummel"
		}
		
		timer.Simple(0.7,function() if IsValid(self) then
			self:EmitSound("vj_piv/concrete_break"..math.random(2,3)..".wav",80,100)
			util.ScreenShake(self:GetPos(), 300, 500, 1.6, 1200) end end)
			local pos = self:LocalToWorld(Vector(50,0,0))
			timer.Simple(0.7,function() if IsValid(self) then
			ParticleEffect("strider_impale_ground",pos,Angle(0,0,0),nil)
			ParticleEffect("strider_cannon_impact",pos,Angle(0,0,0),nil)
			
			local effectdata = EffectData()
			effectdata:SetOrigin(pos,Angle(0,0,0))
			effectdata:SetScale( 50 )
			
			util.Effect( "ThumperDust", effectdata )
			util.VJ_SphereDamage(self, self, pos, 100, math.random(20,25), DMG_GENERIC, true, true, {DisableVisibilityCheck=true, Force=80})
			util.ScreenShake(pos, 300, 500, 1.6, 1200)
		end end)
		
	else

		self.MeleeAttackAnimationAllowOtherTasks = true
		self.MeleeAttackDamage = math.random(20,25)
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackDistance = 50
		self.MeleeAttackDamageDistance = 70
		self.SoundTbl_MeleeAttack = {"vj_piv/BodyHit-3.wav","vj_piv/BodyHit-4.wav","vj_piv/BodyHit-5.wav","vj_piv/BodyHit-6.wav"}
		self.SoundTbl_MeleeAttackMiss = {"vj_piv/Miss1.wav","vj_piv/Miss2.wav","vj_piv/Miss3.wav","vj_piv/Miss4.wav","vj_piv/Miss4.wav"}
		self.AnimTbl_MeleeAttack = {
			"vjges_melee_01",
			"vjges_melee_03"
		}
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/