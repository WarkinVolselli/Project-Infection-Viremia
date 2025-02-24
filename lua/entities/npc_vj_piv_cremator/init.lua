include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.Model = {"models/vj_piv/hl2/charple.mdl"}

	self.PIV_IsSpecial = true

	self.PIV_HasSubclasses = false
	self.PIV_CanBeCrippled = false
	self.PIV_HasWeapons = false
	self.PIV_CanBeThrower = false

	self.StartHealth = 400

	self.MeleeAttackDamage = 0

	self.MeleeAttackDamageType = DMG_BURN
	self.MeleeAttackDistance = 150
	self.MeleeAttackDamageDistance = 200

	self.Immune_Fire = true
end
--------------------
function ENT:Zombie_GiveVoice()
	self.SoundTbl_Breath = {"ambient/fire/firebig.wav"}
	self.SoundTbl_Idle = {
		"vj_piv/cremator/volatile_attack_fake_00_0.wav",
		"vj_piv/cremator/volatile_attack_fake_01_0.wav",
		"vj_piv/cremator/volatile_attack_fake_02_0.wav",
		"vj_piv/cremator/volatile_attack_fake_03_0.wav",
		"vj_piv/cremator/volatile00_idle_calm_00_0.wav",
		"vj_piv/cremator/volatile00_idle_calm_01_0.wav"
	}
	self.SoundTbl_CombatIdle = {
		"vj_piv/cremator/volatile00_move_upset_00_0.wav",
		"vj_piv/cremator/volatile00_move_upset_01_0.wav",
		"vj_piv/cremator/volatile00_move_upset_02_0.wav",
		"vj_piv/cremator/volatile00_move_upset_03_0.wav",
		"vj_piv/cremator/volatile_buggy_grab_taunt_00_0.wav",
		"vj_piv/cremator/volatile_buggy_grab_taunt_01_0.wav",
		"vj_piv/cremator/volatile_buggy_grab_taunt_02_0.wav",
		"vj_piv/cremator/volatile00_idle_upset_00_0.wav",
		"vj_piv/cremator/volatile00_idle_upset_01_0.wav"
	}
	self.SoundTbl_Alert = {
		"vj_piv/cremator/volatile_taunt_00_0.wav",
		"vj_piv/cremator/volatile_taunt_01_0.wav",
		"vj_piv/cremator/volatile_taunt_02_0.wav",
		"vj_piv/cremator/volatile_taunt_03_0.wav",
		"vj_piv/cremator/volatile_alarming_00_0.wav",
		"vj_piv/cremator/volatile_alarming_01_0.wav",
		"vj_piv/cremator/volatile_alarming_02_0.wav",
		"vj_piv/cremator/volatile00_enemy_spotted_00_0.wav",
		"vj_piv/cremator/volatile00_enemy_spotted_01_0.wav",
		"vj_piv/cremator/volatile00_enemy_spotted_02_0.wav",
		"vj_piv/cremator/volatile00_enemy_spotted_03_0.wav"
	}
	self.SoundTbl_BeforeMeleeAttack = {
		"vj_piv/cremator/volatile00_jump_attack_00_0.wav",
		"vj_piv/cremator/volatile00_jump_attack_01_0.wav",
		"vj_piv/cremator/volatile00_jump_attack_02_0.wav",
		"vj_piv/cremator/volatile00_jump_attack_03_0.wav",
		"vj_piv/cremator/volatile00_jump_attack_04_0.wav",
		"vj_piv/cremator/volatile00_attack_00_0.wav",
		"vj_piv/cremator/volatile00_attack_01_0.wav",
		"vj_piv/cremator/volatile00_attack_02_0.wav",
		"vj_piv/cremator/volatile00_attack_03_0.wav",
		"vj_piv/cremator/volatile00_attack_04_0.wav",
		"vj_piv/cremator/volatile00_attack_05_0.wav"
	}
	self.SoundTbl_Death = {
		"vj_piv/cremator/volatile00_death_00_0.wav",
		"vj_piv/cremator/volatile00_death_01_0.wav",
		"vj_piv/cremator/volatile00_death_02_0.wav",
		"vj_piv/cremator/volatile00_death_03_0.wav"
	}
	self.SoundTbl_Pain = {
		"vj_piv/cremator/volatile_buggy_grab_attack_00_0.wav",
		"vj_piv/cremator/volatile_buggy_grab_attack_01_0.wav",
		"vj_piv/cremator/volatile_buggy_grab_attack_02_0.wav",
		"vj_piv/cremator/volatile00_pain_00_0.wav",
		"vj_piv/cremator/volatile00_pain_01_0.wav",
		"vj_piv/cremator/volatile00_pain_02_0.wav",
		"vj_piv/cremator/volatile00_pain_03_0.wav",
		"vj_piv/cremator/volatile00_pain_03_0.wav",
		"vj_piv/cremator/volatile00_pain_light_01_0.wav",
		"vj_piv/cremator/volatile00_pain_light_02_0.wav",
		"vj_piv/cremator/volatile00_pain_light_03_0.wav"
	}
	self.GeneralSoundPitch1 = 90
	self.GeneralSoundPitch2 = 80
	self.BreathSoundLevel = 60
end
--------------------
function ENT:Zombie_CustomOnInitialize()

	self:SetSkin(8)
	self:SetModelScale(1.1)
	self.HasBreathSound = true
	if self:IsDirt(self:GetPos()) then -- digout breaks particles, this respawns them with a slight delay if over dirt
		timer.Simple(0.2,function() if IsValid(self) then
			ParticleEffectAttach("fire_medium_03",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
		end end)
	end

    self.PIV_LegHP = self.StartHealth * 2

	ParticleEffectAttach("fire_medium_03",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))

	self.Light1 = ents.Create("light_dynamic")
	self.Light1:SetKeyValue("brightness", "0.04")
	self.Light1:SetKeyValue("distance", "250")
	self.Light1:SetLocalPos(self:GetPos())
	self.Light1:SetLocalAngles(self:GetAngles())
	self.Light1:Fire("Color", "255 100 0 0")
	self.Light1:SetParent(self)
	self.Light1:Spawn()
	self.Light1:Activate() 
	self.Light1:Fire("SetParentAttachment","chest")
	self.Light1:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(self.Light1)

end
--------------------
function ENT:CustomOnMeleeAttack_BeforeChecks()

    ParticleEffectAttach("striderbuster_break_explode",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
    ParticleEffectAttach("striderbuster_break_explode",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
	effects.BeamRingPoint(self:GetPos(), 0.3, 2, 400, 16, 0, Color(255, 255, 255), {material="sprites/flame01", framerate=20})
	effects.BeamRingPoint(self:GetPos(), 0.3, 2, 200, 16, 0, Color(255, 255, 255), {material="sprites/flame01", framerate=20})

	VJ.EmitSound(self,"ambient/fire/ignite.wav",100,math.random(80,100))

	VJ.ApplyRadiusDamage(self, self, self:GetPos(), 200, 10, self.MeleeAttackDamageType, true, true, {DisableVisibilityCheck=true, Force=80})
	util.ScreenShake(self:GetPos(),50,600,2,1000)
    util.ScreenShake(self:GetPos(),50,600,2,1000)

end
--------------------
function ENT:Zombie_CustomOnDeath_Finish(dmginfo, hitgroup)
	ParticleEffectAttach("striderbuster_break_explode",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
	ParticleEffectAttach("striderbuster_break_explode",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
	effects.BeamRingPoint(self:GetPos(), 0.3, 2, 400, 16, 0, Color(255, 255, 255), {material="sprites/flame01", framerate=20})
	effects.BeamRingPoint(self:GetPos(), 0.3, 2, 200, 16, 0, Color(255, 255, 255), {material="sprites/flame01", framerate=20})
	
	VJ.EmitSound(self,"ambient/fire/ignite.wav",100,math.random(80,100))
	
	VJ.ApplyRadiusDamage(self, self, self:GetPos(), 200, 10, self.MeleeAttackDamageType, true, true, {DisableVisibilityCheck=true, Force=80})
	util.ScreenShake(self:GetPos(),50,600,2,1000)
	util.ScreenShake(self:GetPos(),50,600,2,1000)
end
--------------------
function ENT:Zombie_CustomOnCreateDeathCorpse(dmginfo, hitgroup, corpseEnt)
	corpseEnt:SetSkin(7)
end