include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.Model = {"models/vj_piv/specials/specimen/specimen.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want

	self.PIV_IsSpecial = true
	self.PIV_Super_Sprinter = true

	self.PIV_HasSubclasses = false
	self.PIV_CanBeThrower = false
	self.PIV_HasWeapons = false

	self.StartHealth = 100
	
	self.DeathAnimationChance = 1 -- Put 1 if you want it to play the animation all the time
	self.AnimTbl_Death = {"vjseq_nz_death_elec_1","vjseq_nz_death_elec_2","vjseq_nz_death_elec_3","vjseq_nz_death_elec_4","vjseq_nz_death_elec_5"} -- Death Animations

	self.MaxJumpLegalDistance = VJ.SET(50, 200) -- The max distance the NPC can jump (Usually from one node to another) | ( UP, DOWN )

	self.HasRangeAttack = true -- Should the SNPC have a range attack?
	self.AnimTbl_RangeAttack = {"vjseq_nz_sonic_attack_2","vjseq_nz_sonic_attack_2","vjseq_nz_sonic_attack_2"} -- Range Attack Animations
	self.RangeAttackEntityToSpawn = "obj_vj_piv_shock" -- The entity that is spawned when range attacking
	self.RangeDistance = 1000 -- This is how far away it can shoot
	self.RangeToMeleeDistance = 100 -- How close does it have to be until it uses melee?
	self.AnimTbl_RangeAttack = {ACT_RANGE_ATTACK1} -- Range Attack Animations
	self.RangeAttackAnimationFaceEnemy = true -- Should it face the enemy while playing the range attack animation?
	self.TimeUntilRangeAttackProjectileRelease = 1
	self.RangeUseAttachmentForPosID = "mouth" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true
	self.RangeUseAttachmentForPos = true -- Should the projectile spawn on a attachment?
	self.NextRangeAttackTime = 8
	self.NextRangeAttackTime_DoRand = 16

	self.PIV_LegHP = 10000
end
--------------------
function ENT:Zombie_GiveVoice()
	self.SoundTbl_Breath = {"ambient/energy/electric_loop.wav"}
	self.SoundTbl_Idle = 
	{
		"vj_piv/shocker/flesher_bark_generic_01.mp3",
		"vj_piv/shocker/flesher_bark_generic_02.mp3",
		"vj_piv/shocker/flesher_bark_generic_03.mp3",
		"vj_piv/shocker/flesher_bark_generic_04.mp3",
		"vj_piv/shocker/flesher_bark_generic_05.mp3",
		"vj_piv/shocker/flesher_bark_generic_06.mp3",
		"vj_piv/shocker/flesher_bark_generic_07.mp3",
		"vj_piv/shocker/flesher_bark_generic_08.mp3",
		"vj_piv/shocker/flesher_bark_generic_09.mp3",
		"vj_piv/shocker/flesher_bark_generic_10.mp3",
		"vj_piv/shocker/flesher_bark_generic_11.mp3",
		"vj_piv/shocker/flesher_bark_generic_12.mp3",
		"vj_piv/shocker/flesher_bark_generic_13.mp3",
		"vj_piv/shocker/flesher_bark_generic_14.mp3",
		"vj_piv/shocker/flesher_bark_generic_15.mp3",
		"vj_piv/shocker/flesher_bark_generic_16.mp3",
		"vj_piv/shocker/flesher_bark_generic_17.mp3",
		"vj_piv/shocker/flesher_bark_generic_18.mp3",
		"vj_piv/shocker/flesher_bark_generic_19.mp3",
		"vj_piv/shocker/flesher_bark_generic_20.mp3",
		"vj_piv/shocker/flesher_bark_generic_21.mp3",
		"vj_piv/shocker/flesher_bark_generic_22.mp3",
		"vj_piv/shocker/flesher_bark_generic_23.mp3",
		"vj_piv/shocker/flesher_bark_generic_24.mp3",
		"vj_piv/shocker/flesher_bark_generic_25.mp3",
		"vj_piv/shocker/flesher_bark_generic_26.mp3",
		"vj_piv/shocker/flesher_bark_generic_27.mp3",
		"vj_piv/shocker/flesher_bark_generic_28.mp3",
		"vj_piv/shocker/flesher_bark_generic_29.mp3",
		"vj_piv/shocker/flesher_bark_generic_30.mp3",
		"vj_piv/shocker/flesher_bark_generic_31.mp3",
		"vj_piv/shocker/flesher_bark_generic_32.mp3",
		"vj_piv/shocker/flesher_bark_generic_33.mp3",
		"vj_piv/shocker/flesher_bark_generic_34.mp3"
	}
	self.SoundTbl_CombatIdle = {
		"vj_piv/shocker/flesher_searching_01.mp3",
		"vj_piv/shocker/flesher_searching_02.mp3",
		"vj_piv/shocker/flesher_searching_03.mp3",
		"vj_piv/shocker/flesher_searching_04.mp3",
		"vj_piv/shocker/flesher_searching_05.mp3",
		"vj_piv/shocker/flesher_searching_06.mp3",
		"vj_piv/shocker/flesher_searching_07.mp3",
		"vj_piv/shocker/flesher_searching_08.mp3",
		"vj_piv/shocker/flesher_searching_09.mp3",
		"vj_piv/shocker/flesher_searching_10.mp3",
		"vj_piv/shocker/flesher_searching_11.mp3"
	}
	self.SoundTbl_Alert = {
		"vj_piv/shocker/flesher_see_shriek_01.mp3",
		"vj_piv/shocker/flesher_see_shriek_02.mp3",
		"vj_piv/shocker/flesher_see_shriek_03.mp3",
		"vj_piv/shocker/flesher_see_shriek_04.mp3",
		"vj_piv/shocker/flesher_see_shriek_05.mp3",
		"vj_piv/shocker/flesher_see_shriek_06.mp3",
		"vj_piv/shocker/flesher_see_shriek_07.mp3",
		"vj_piv/shocker/flesher_see_shriek_08.mp3"
	}
	self.SoundTbl_BeforeMeleeAttack = {
		"vj_piv/shocker/flesher_see_shriek_01.mp3",
		"vj_piv/shocker/flesher_see_shriek_02.mp3",
		"vj_piv/shocker/flesher_see_shriek_03.mp3",
		"vj_piv/shocker/flesher_see_shriek_04.mp3",
		"vj_piv/shocker/flesher_see_shriek_05.mp3",
		"vj_piv/shocker/flesher_see_shriek_06.mp3",
		"vj_piv/shocker/flesher_see_shriek_07.mp3",
		"vj_piv/shocker/flesher_see_shriek_08.mp3"
	}
	self.SoundTbl_Death = {
		"vj_piv/shocker/flesher_see_shriek_01.mp3",
		"vj_piv/shocker/flesher_see_shriek_02.mp3",
		"vj_piv/shocker/flesher_see_shriek_03.mp3",
		"vj_piv/shocker/flesher_see_shriek_04.mp3",
		"vj_piv/shocker/flesher_see_shriek_05.mp3",
		"vj_piv/shocker/flesher_see_shriek_06.mp3",
		"vj_piv/shocker/flesher_see_shriek_07.mp3",
		"vj_piv/shocker/flesher_see_shriek_08.mp3"
	}
	self.SoundTbl_BeforeRangeAttack = {
		"vj_piv/shocker/flesher_see_shriek_01.mp3",
		"vj_piv/shocker/flesher_see_shriek_02.mp3",
		"vj_piv/shocker/flesher_see_shriek_03.mp3",
		"vj_piv/shocker/flesher_see_shriek_04.mp3",
		"vj_piv/shocker/flesher_see_shriek_05.mp3",
		"vj_piv/shocker/flesher_see_shriek_06.mp3",
		"vj_piv/shocker/flesher_see_shriek_07.mp3",
		"vj_piv/shocker/flesher_see_shriek_08.mp3"
	}
	self.SoundTbl_Pain = {
		"vj_piv/shocker/flesher_searching_01.mp3",
		"vj_piv/shocker/flesher_searching_02.mp3",
		"vj_piv/shocker/flesher_searching_03.mp3",
		"vj_piv/shocker/flesher_searching_04.mp3",
		"vj_piv/shocker/flesher_searching_05.mp3",
		"vj_piv/shocker/flesher_searching_06.mp3",
		"vj_piv/shocker/flesher_searching_07.mp3",
		"vj_piv/shocker/flesher_searching_08.mp3",
		"vj_piv/shocker/flesher_searching_09.mp3",
		"vj_piv/shocker/flesher_searching_10.mp3",
		"vj_piv/shocker/flesher_searching_11.mp3"
	}
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetBodygroup(2,2)
	self:SetSkin(math.random(0,1))

	if math.random(1,4) == 1 then
		self.MeleeAttackBleedEnemy = true -- Should the enemy bleed when attacked by melee?
		self:SetBodygroup(1,1)
	end

	self:SetBodygroup(3,math.random(0,3))

	self.HasBreathSound = true

	self.PIV_LegHP = self.StartHealth * 2

	self.AnimTbl_RangeAttack = {"vjseq_nz_sonic_attack_2"} -- Range Attack Animations

	self:SetKeyValue("rendercolor","140 188 234 255")

	self.Light1 = ents.Create("light_dynamic")
	self.Light1:SetKeyValue("brightness", "0.04")
	self.Light1:SetKeyValue("distance", "250")
	self.Light1:SetLocalPos(self:GetPos())
	self.Light1:SetLocalAngles(self:GetAngles())
	self.Light1:Fire("Color", "0 161 255 255")
	self.Light1:SetParent(self)
	self.Light1:Spawn()
	self.Light1:Activate()
	self.Light1:Fire("SetParentAttachment","chest")
	self.Light1:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(self.Light1)
end
--------------------
function ENT:OnThink()
	if math.random(1,5) == 1 then
		ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("forward"))
		VJ.ApplyRadiusDamage(self, self, self:GetPos(), 100, math.random(1,5), DMG_SHOCK, true, true)	
	end	
end	
--------------------
function ENT:CustomOnRangeAttack_BeforeStartTimer(seed) 

	local rhandarc = ents.Create("info_particle_system")
	rhandarc:SetKeyValue("effect_name","electrical_arc_01_parent")
	rhandarc:SetPos(self:GetAttachment(self:LookupAttachment("anim_attachment_RH")).Pos)
	rhandarc:SetAngles(self:GetAttachment(self:LookupAttachment("anim_attachment_RH")).Ang)
	rhandarc:Fire("SetParentAttachment","anim_attachment_RH")
	rhandarc:Fire("Start","",0.3)
	rhandarc:Fire("Kill","",1.3)
	rhandarc:SetParent(self)
	rhandarc:Spawn()
	rhandarc:Activate()

	local lhandarc = ents.Create("info_particle_system")
	lhandarc:SetKeyValue("effect_name","electrical_arc_01_parent")
	lhandarc:SetPos(self:GetAttachment(self:LookupAttachment("anim_attachment_LH")).Pos)
	lhandarc:SetAngles(self:GetAttachment(self:LookupAttachment("anim_attachment_LH")).Ang)
	lhandarc:Fire("SetParentAttachment","anim_attachment_LH")
	lhandarc:Fire("Start","",0.3)
	lhandarc:Fire("Kill","",1.3)
	lhandarc:SetParent(self)
	lhandarc:Spawn()
	lhandarc:Activate()

	local rhandlightning = ents.Create("info_particle_system")
	rhandlightning:SetKeyValue("effect_name","striderbuster_break_lightning")
	rhandlightning:SetPos(self:GetAttachment(self:LookupAttachment("anim_attachment_RH")).Pos)
	rhandlightning:SetAngles(self:GetAttachment(self:LookupAttachment("anim_attachment_RH")).Ang)
	rhandlightning:Fire("SetParentAttachment","anim_attachment_RH")
	rhandlightning:Fire("Start","",0.3)
	rhandlightning:Fire("Kill","",1.3)
	rhandlightning:SetParent(self)
	rhandlightning:Spawn()
	rhandlightning:Activate()

	local lhandlightning = ents.Create("info_particle_system")
	lhandlightning:SetKeyValue("effect_name","striderbuster_break_lightning")
	lhandlightning:SetPos(self:GetAttachment(self:LookupAttachment("anim_attachment_LH")).Pos)
	lhandlightning:SetAngles(self:GetAttachment(self:LookupAttachment("anim_attachment_LH")).Ang)
	lhandlightning:Fire("SetParentAttachment","anim_attachment_LH")
	lhandlightning:Fire("Start","",0.3)
	lhandlightning:Fire("Kill","",1.3)
	lhandlightning:SetParent(self)
	lhandlightning:Spawn()
	lhandlightning:Activate()

end
--------------------