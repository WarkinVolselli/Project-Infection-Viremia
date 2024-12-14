include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	if self:GetClass() == "npc_vj_piv_brawler_f" then
		self.Model = {
			"models/vj_piv/specials/brawler/female_01.mdl",
			"models/vj_piv/specials/brawler/female_02.mdl",
			"models/vj_piv/specials/brawler/female_03.mdl",
			"models/vj_piv/specials/brawler/female_04.mdl",
			"models/vj_piv/specials/brawler/female_06.mdl",
			"models/vj_piv/specials/brawler/female_07.mdl"
		}
		self.PIV_Gender = 2
	else
		self.Model = {
			"models/vj_piv/specials/brawler/male_01.mdl",
			"models/vj_piv/specials/brawler/male_02.mdl",
			"models/vj_piv/specials/brawler/male_03.mdl",
			"models/vj_piv/specials/brawler/male_04.mdl",
			"models/vj_piv/specials/brawler/male_05.mdl",
			"models/vj_piv/specials/brawler/male_07.mdl",
			"models/vj_piv/specials/brawler/male_09.mdl"
		}
	end
	if self:GetClass() == "npc_vj_piv_brawler_boss" then
		self.StartHealth = 2000
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackDamageDistance = 70
		self.PIV_IsHugeZombie = true
		self.PIV_IsBoss = true
		self.HasSoundTrack = true
		self.SoundTrackVolume = 0.3
		self.SoundTbl_SoundTrack = {"vj_piv/music/yakuzads_majima_theme.mp3"}
		-- I don't see the point in having these since the stuff in CustomOnMeleeAttack_BeforeStartTimer changes these values anyways
		-- self.MeleeAttackDistance = 100
		-- self.MeleeAttackDamageDistance = 60
	else
		self.StartHealth = 200
		-- See above
		-- self.MeleeAttackDistance = 50
		-- self.MeleeAttackDamageDistance = 60
	end
	self.PIV_IsRunner = true
	self.PIV_Infection_IsWalker = false
	self.PIV_IsSpecial = true
	self.PIV_HasSubclasses = false
	self.PIV_CanBeThrower = false
	self.PIV_HasWeapons = false
	self.PIV_CanBeCrippled = false
	self.PIV_IsBrawlerThugGuyYeah = true
	self.HitGroupFlinching_Values = {
		{HitGroup = {HITGROUP_HEAD}, Animation = {"vjges_ep_flinch_head"}}, 
		{HitGroup = {HITGROUP_STOMACH}, Animation = {"vjges_ep_flinch_chest"}}, 
		{HitGroup = {HITGROUP_CHEST}, Animation = {"vjges_ep_flinch_chest"}}, 
		{HitGroup = {HITGROUP_LEFTARM}, Animation = {"vjges_ep_flinch_leftarm"}}, 
		{HitGroup = {HITGROUP_RIGHTARM}, Animation = {"vjges_ep_flinch_rightarm"}}, 
		{HitGroup = {HITGROUP_LEFTLEG}, Animation = {"vjseq_ep_flinch_leftLeg"}},
		{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {"vjseq_ep_flinch_rightLeg"}}
	}
end
--------------------
function ENT:Zombie_GiveVoice()
	if self:GetClass() == "npc_vj_piv_brawler_boss" then
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
		self.SoundTbl_Death = {"vj_piv/demolisher/death_cutoff.mp3"}
		self.GeneralSoundPitch1 = 120
		self.GeneralSoundpitch2 = 120
	else
		self:Zombie_GiveVoice_Default()
	end
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	if self:GetClass() == "npc_vj_piv_brawler_boss" then

		self.PIV_SpawnCoolDownT = CurTime() + 10

		--[[
		if GetConVar("vj_piv_lights"):GetInt() == 1 then 

		self.Light2 = ents.Create("light_dynamic")
		self.Light2:SetKeyValue("brightness", "1")
		self.Light2:SetKeyValue("distance", "75")
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
		--]]

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
	end
end
--------------------
function ENT:Zombie_CustomOnThink_AIEnabled()

    if
		self.VJ_IsBeingControlled == true or
		self.PIV_Crawler or
		self.PIV_Crippled or
		self.Flinching or
		self:GetSequence() == self:LookupSequence(ACT_BIG_FLINCH) or
		self.DeathAnimationCodeRan
	then
		return
	end

	-- Dodge System
    if
		IsValid(self:GetEnemy()) == true &&
		self.AttackType != VJ.ATTACK_TYPE_MELEE &&
		-- self.MeleeAttacking == false
		self.VJ_IsBeingControlled == false &&
		CurTime() > self.PIV_NextStrafeT &&
		-- math.random(1,20) == 1
		self:GetPos():Distance(self:GetEnemy():GetPos()) < 200 &&
		self:GetPos():Distance(self:GetEnemy():GetPos()) > 50
	then
        self:StopMoving()
        self:VJ_ACT_PLAYACTIVITY({"vjseq_sway_b","vjseq_sway_f","vjseq_sway_l","vjseq_sway_r"}, true, false, false)
		VJ.EmitSound(self,"vj_piv/Miss"..math.random(1,5)..".wav",70,100)
        -- self.PIV_NextRunT = CurTime() + 2 -- this seems to be unused/doesn't do anything?
        if self.PIV_Mutated == false then
			self.PIV_NextStrafeT = CurTime() + math.random(3,6)
		else
			self.PIV_NextStrafeT = CurTime() + math.random(2,4)
		end
	end
	
end
--------------------