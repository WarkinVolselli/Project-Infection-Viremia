AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/husk/zombie.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 200

ENT.PIV_IsSpecial = true

ENT.NextRunT = 0
ENT.Running = false
ENT.RunT = 0
ENT.PIV_MovementAnims = 0
ENT.PIV_Husk_Explode = false
 
ENT.PIV_LegHP = 100
ENT.PIV_Husk_Headless = false

ENT.SoundTbl_Idle = {"vj_piv/husk/zed_clot_alpha_vox_chuff_01.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_02.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_03.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_04.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_05.ogg","vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_01.ogg","vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_02.ogg","vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_03.ogg","vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_04.ogg","vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_05.ogg","vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_06.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_03.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_04.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_05.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_06.ogg"}
ENT.SoundTbl_Alert = {"vj_piv/husk/zed_clot_alpha_vox_taunt_chest_01.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_02.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_03.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_long_01.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_long_02.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_long_03.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_med_01.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_med_02.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_med_03.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_roar_light_short_03.ogg"}
ENT.SoundTbl_CombatIdle = {"vj_piv/husk/zed_clot_alpha_vox_yell_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_yell_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_yell_short_03.ogg","vj_piv/husk/zed_clot_alpha_vox_growl_short_alt_01.ogg","vj_piv/husk/zed_clot_alpha_vox_growl_short_alt_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_01.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_03.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_04.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_05.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_03.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_04.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_05.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_06.ogg"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/husk/zed_calpha_vox_aggro_01.ogg","vj_piv/husk/zed_clot_alpha_vox_bite_fast_02.ogg","vj_piv/husk/zed_clot_alpha_vox_bite_fast_03.ogg","vj_piv/husk/zed_clot_alpha_vox_bite_long_01.ogg","vj_piv/husk/zed_clot_alpha_vox_bite_long_02.ogg","vj_piv/husk/zed_clot_alpha_vox_bite_long_03.ogg","vj_piv/husk/zed_clot_alpha_vox_grab_01.ogg","vj_piv/husk/zed_clot_alpha_vox_grab_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grab_03.ogg","vj_piv/husk/zed_clot_alpha_vox_melee_01.ogg","vj_piv/husk/zed_clot_alpha_vox_melee_02.ogg","vj_piv/husk/zed_clot_alpha_vox_melee_03.ogg","vj_piv/husk/zed_clot_alpha_vox_melee_04.ogg"}
ENT.SoundTbl_Pain = {"vj_piv/husk/zed_clot_alpha_vox_pain_hvy_01.ogg","vj_piv/husk/zed_clot_alpha_vox_pain_hvy_02.ogg","vj_piv/husk/zed_clot_alpha_vox_pain_hvy_03.ogg","vj_piv/husk/zed_clot_alpha_vox_pain_lite_01.ogg","vj_piv/husk/zed_clot_alpha_vox_pain_lite_02.ogg","vj_piv/husk/zed_clot_alpha_vox_pain_lite_03.ogg"}
ENT.SoundTbl_Death = {"vj_piv/husk/zed_clotalpha_vox_roar_med_01.ogg","vj_piv/husk/zed_clotalpha_vox_roar_med_02.ogg","vj_piv/husk/zed_clotalpha_vox_roar_med_03.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_med_01.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_med_02.ogg"}
ENT.SoundTbl_Charge = {"vj_piv/husk/zed_clot_alpha_vox_taunt_chest_01.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_02.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_03.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_long_01.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_long_02.ogg"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	if GetConVar("vj_piv_hl2skins"):GetInt() == 1 then -- if HL2 Skins Only is enabled, this will make the zombies only use HL2 skins
		self:SetSkin(math.random(0,1))
	else
		self:SetSkin(math.random(0,7))
	end
	
	local type = math.random(1,8)
	
	if type == 1 then
		self.AnimTbl_IdleStand = {ACT_IDLE_STIMULATED}
		self.AnimTbl_Walk = {ACT_WALK_STIMULATED}
		self.AnimTbl_Run = {ACT_WALK_STIMULATED}
		self.PIV_MovementAnims = 2
	elseif type == 2 then
		self.AnimTbl_IdleStand = {ACT_IDLE_AGITATED}
		self.AnimTbl_Walk = {ACT_WALK_AGITATED}
		self.AnimTbl_Run = {ACT_WALK_AGITATED}
		self.PIV_MovementAnims = 3
	elseif type == 3 then
		self.AnimTbl_IdleStand = {ACT_IDLE_RELAXED}
		self.AnimTbl_Walk = {ACT_WALK_RELAXED}
		self.AnimTbl_Run = {ACT_WALK_RELAXED}
		self.PIV_MovementAnims = 4
	else
		self.AnimTbl_IdleStand = {ACT_IDLE}
		self.AnimTbl_Walk = {ACT_WALK}
		self.AnimTbl_Run = {ACT_WALK}
		self.PIV_MovementAnims = 1
	end
	
	if self.PIV_Mutated == true then
		self.AnimTbl_Run = {ACT_RUN}
	end
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnPreInitialize()
	if GetConVar("vj_piv_husk_headless"):GetInt() == 1 && math.random(1,GetConVar("vj_piv_husk_headless_chance"):GetInt()) == 1 then
		if self:GetClass() == "npc_vj_piv_husk_f" then
			self.Model = {"models/vj_piv/specials/husk/zombie_female_beta.mdl"}
		else
			self.Model = {"models/vj_piv/specials/husk/zombie_beta.mdl"}
		end
		self.PIV_Husk_Headless = true
	end
	
	if GetConVar("vj_piv_husk_explode"):GetInt() == 1 && math.random(1,GetConVar("vj_piv_husk_explode_chance"):GetInt()) == 1 then
		self.PIV_Husk_Explode = true
		self.HasDeathAnimation = true
		self.DeathAnimationChance = 1
		self.AnimTbl_Death = {"vjseq_releasecrab"}
		if self.PIV_Husk_Headless == true then
			self.DeathCorpseModel = {"models/vj_piv/specials/husk/zombie_legs_beta.mdl"} 		
		else
			self.DeathCorpseModel = {"models/vj_piv/specials/husk/zombie_legs.mdl"} 
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()

    if
		GetConVar("vj_piv_husk_run"):GetInt() == 1 && 
        self.NextRunT < CurTime() &&
        !self.Running &&
        self:GetEnemy() != nil &&
        !self.PIV_Crippled &&
        !self.Dead &&
        !self:IsBusy() &&
		self.PIV_Mutated == false
    then

        VJ_EmitSound(self,self.SoundTbl_Charge,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))

        self.Running = true
        self.RunT = CurTime() + math.random(5,10)

        self.AnimTbl_Run = {ACT_RUN}
		
		self.SoundTbl_CombatIdle = {"vj_piv/husk/zed_clot_alpha_vox_scream_crazy_01.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_crazy_02.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_crazy_03.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_med_01.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_med_02.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_short_03.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_01.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_02.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_03.ogg"}

    end

    if
        self.Running &&
        self.RunT < CurTime() &&
        !self.Dead &&
        !self.PIV_Crippled && 
		self.PIV_Mutated == false
    then

        self.Running = false
        self.NextRunT = CurTime() + math.random(6,12)
		
		if self.PIV_MovementAnims == 1 then
			self.AnimTbl_Run = {ACT_WALK}
		elseif self.PIV_MovementAnims == 2 then
			self.AnimTbl_Run = {ACT_WALK_STIMULATED}
		elseif self.PIV_MovementAnims == 3 then
			self.AnimTbl_Run = {ACT_WALK_AGITATED}
		elseif self.PIV_MovementAnims == 4 then
			self.AnimTbl_Run = {ACT_WALK_RELAXED}
		end
	
	    self.SoundTbl_CombatIdle = {"vj_piv/husk/zed_clot_alpha_vox_yell_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_yell_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_yell_short_03.ogg","vj_piv/husk/zed_clot_alpha_vox_growl_short_alt_01.ogg","vj_piv/husk/zed_clot_alpha_vox_growl_short_alt_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_01.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_03.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_04.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_05.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_03.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_04.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_05.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_06.ogg"}
	
        if self:IsMoving() && self:GetSequence() == self:LookupSequence(ACT_RUN) then

			local stop = VJ_PICK({"vjseq_running_to_standing","vjseq_running_to_standing_02","vjseq_shove_forward_01"})
		    self:VJ_ACT_PLAYACTIVITY(stop,true,VJ_GetSequenceDuration(self,tbl),false)
			VJ_EmitSound(self,self.SoundTbl_Pain,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))

        end

    end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnAlert()
    self.NextRunT = CurTime() + math.random(2,8)
	if GetConVar("vj_piv_alert_anim"):GetInt() == 1 && self.PIV_Crippled == false && self.PIV_FuckingCrawlingLittleCunt == false && self.PIV_Resting == 0 && self:GetSequence() != self:LookupSequence(ACT_OPEN_DOOR) then
		if math.random(1,GetConVar("vj_piv_alert_anim_chance"):GetInt()) == 1 then
			self:VJ_ACT_PLAYACTIVITY("vjges_tantrum",false,false,true)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnKilled(dmginfo,hitgroup)
   	if self.PIV_Husk_Explode == true then
			util.VJ_SphereDamage(self,self,self:GetPos(),150,math.random(0,0),DMG_BLAST,true,true,{Force=20})
		for k,v in ipairs(ents.FindInSphere(self:GetPos(),150)) do
			v:TakeDamage(math.random(20,30))
		end
			util.ScreenShake(self:GetPos(),44,600,1.5,2000)
		end
	end

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
	if self.PIV_Husk_Explode == true then
		VJ_EmitSound(self,{"vj_piv/gore/PreExplode1.wav","vj_piv/gore/PreExplode2.wav","vj_piv/gore/PreExplode3.wav"},75,math.random(100,100))
	timer.Simple(0.25,function() if IsValid(self) then
		VJ_EmitSound(self,{"vj_piv/gore/HeadshotDevestate3.wav","vj_piv/gore/HeadshotDevestate4.wav","vj_piv/gore/HeadshotDevestate5.wav"},75,math.random(100,100))
	timer.Simple(0.70,function() if IsValid(self) then
		VJ_EmitSound(self,{"vj_piv/gore/Explode1.wav","vj_piv/gore/Explode2.wav","vj_piv/gore/Explode3.wav"},100,math.random(100,100))
        local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetPos()+ self:GetUp()*80)
		bloodeffect:SetColor(VJ_Color2Byte(Color(127,0,0,255)))
		bloodeffect:SetScale(250)
		util.Effect("VJ_Blood1",bloodeffect)
		
		local bloodspray = EffectData()
			bloodspray:SetOrigin(self:GetPos() +self:OBBCenter())
			bloodspray:SetColor(VJ_Color2Byte(Color(127,0,0,255)))
			bloodspray:SetScale(1)
			bloodspray:SetFlags(3)
			bloodspray:SetColor(1)
			util.Effect("bloodspray",bloodspray)
			util.Effect("bloodspray",bloodspray)
		
		self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,400)})
		self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,400)})
		self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,200)})
		self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,200)})
		self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,500)})
		self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,500)})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,35))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,35))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,35))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,40))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,40))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,40))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,35))})
		self:CreateGibEntity("obj_vj_gib","UseHuman_Big",{Pos=self:LocalToWorld(Vector(0,0,30))})
end
end)
end
end)
end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	if self:IsMoving()	then
	
		self.MeleeAttackAnimationAllowOtherTasks = true
	
		self.MeleeAttackDamage = math.random(15,20)
		self.HasMeleeAttackKnockBack = false
		self.MeleeAttackDistance = 40
		self.MeleeAttackDamageDistance = 60
		self.SoundTbl_MeleeAttack = {"vj_piv/husk/zombie_slice_1.wav","vj_piv/husk/zombie_slice_2.wav","vj_piv/husk/zombie_slice_3.wav","vj_piv/husk/zombie_slice_4.wav","vj_piv/husk/zombie_slice_5.wav","vj_piv/husk/zombie_slice_6.wav"}
		self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	
			
		self.AnimTbl_MeleeAttack = {
			"vjges_attacka",
			"vjges_attackb",
			"vjges_attackc",
			"vjges_attackd",
			"vjges_attacke",
			"vjges_attackf",
			"vjges_fastattack",
			"vjges_swatleftlow",
			"vjges_swatleftmid",
			"vjges_swatrightlow",
			"vjges_swatrightmid"
		}

	else
	
		self.MeleeAttackAnimationAllowOtherTasks = false
	
		self.MeleeAttackDamage = math.random(15,20)
		self.HasMeleeAttackKnockBack = false
		self.MeleeAttackDistance = 40
		self.MeleeAttackDamageDistance = 60
		self.SoundTbl_MeleeAttack = {"vj_piv/husk/zombie_slice_1.wav","vj_piv/husk/zombie_slice_2.wav","vj_piv/husk/zombie_slice_3.wav","vj_piv/husk/zombie_slice_4.wav","vj_piv/husk/zombie_slice_5.wav","vj_piv/husk/zombie_slice_6.wav"}
		self.SoundTbl_MeleeAttackMiss = {"vj_piv/z-swipe-1.wav","vj_piv/z-swipe-2.wav","vj_piv/z-swipe-3.wav","vj_piv/z-swipe-4.wav","vj_piv/z-swipe-5.wav","vj_piv/z-swipe-6.wav"}	
			
		self.AnimTbl_MeleeAttack = {
			"vjseq_attacka_standing",
			"vjseq_attackb_standing",
			"vjseq_attackc_standing",
			"vjseq_attackd_standing",
			"vjseq_attacke_standing",
			"vjseq_attackf_standing",
			"vjseq_fastattack_standing",
			"vjseq_swatleftlow_standing",
			"vjseq_swatleftmid_standing",
			"vjseq_swatrightlow_standing",
			"vjseq_swatrightmid_standing"
		}
		
		if math.random(1,4) == 1 then 
			
			self.MeleeAttackDamage = math.random(20,25)
			self.HasMeleeAttackKnockBack = true
			self.MeleeAttackDistance = 50
			self.MeleeAttackDamageDistance = 70
			self.SoundTbl_MeleeAttack = {"vj_piv/BodyHit-3.wav","vj_piv/BodyHit-4.wav","vj_piv/BodyHit-5.wav","vj_piv/BodyHit-6.wav"}
			self.SoundTbl_MeleeAttackMiss = {"vj_piv/Miss1.wav","vj_piv/Miss2.wav","vj_piv/Miss3.wav","vj_piv/Miss4.wav","vj_piv/Miss5.wav"}	
		
			self.AnimTbl_MeleeAttack = {
				"vjseq_atk_kick"
			}
		
		end
	
	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD && GetConVar("vj_piv_headshot_damage"):GetInt() == 1 && self.PIV_Husk_Headless == false then
		dmginfo:ScaleDamage(GetConVarNumber("vj_piv_headshot_damage_mult"))
	elseif hitgroup == HITGROUP_HEAD && self.PIV_Husk_Headless == true then
		dmginfo:ScaleDamage(0.1)
	elseif self.PIV_Husk_Headless == true then
		dmginfo:ScaleDamage(0.8)
	else
		dmginfo:ScaleDamage(0.9)
	end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)

	if self:IsMoving() then -- When walking
	
		self.AnimTbl_Death = {
			"vjseq_witch_death",
			"vjseq_nz_death_f_1",
			"vjseq_nz_death_f_2",
			"vjseq_nz_death_f_3",
			"vjseq_nz_death_f_4",
			"vjseq_nz_death_f_5",
			"vjseq_nz_death_f_6",
			"vjseq_nz_death_f_7",
			"vjseq_nz_death_f_8",
			"vjseq_nz_death_f_9",
			"vjseq_nz_death_f_10",
			"vjseq_nz_death_f_11",
			"vjseq_nz_death_f_12",
			"vjseq_nz_death_f_13"
		}	

    end

	if
		self:IsMoving() &&
		(self:GetActivity() == ACT_SPRINT or self:GetActivity() == ACT_RUN_AIM or self:GetActivity() == ACT_RUN_RELAXED)
	then -- When running
	
		self.AnimTbl_Death = {
			"vjseq_witch_death",
			"vjseq_sonic_death_2",
			"vjseq_sonic_death_3",
			"vjseq_deathrunning_01",
			"vjseq_deathrunning_03",
			"vjseq_deathrunning_04",
			"vjseq_deathrunning_05",
			"vjseq_deathrunning_06",
			"vjseq_deathrunning_07",
			"vjseq_deathrunning_08",
			"vjseq_deathrunning_09",
			"vjseq_deathrunning_10",
			"vjseq_deathrunning_11",
			"vjseq_deathrunning_11a",
			"vjseq_deathrunning_11b",
			"vjseq_deathrunning_11c",
			"vjseq_deathrunning_11d",
			"vjseq_deathrunning_11e",
			"vjseq_death03"
		}

	end

	if hitgroup == HITGROUP_HEAD then -- When killed by a headshot

		self.AnimTbl_Death = {
			"vjseq_deathheadshotback",
			"vjseq_deathheadshotfront",
			"vjseq_death_shotgun_backward_collapse",
			"vjseq_death01",
			"vjseq_death02",
			"vjseq_death04",
			"vjseq_death_02a",
			"vjseq_death_05"
		}

    end

    if self:IsOnFire() && self.Immune_Fire == false then -- When killed by fire damage

		self.AnimTbl_Death = {
			"vjseq_witch_death",
			"vjseq_nz_death_fire_1",
			"vjseq_nz_death_fire_2",
			"vjges_nz_death_fire_3",
			"vjges_nz_death_fire_4",
			"vjges_nz_death_fire_5",
			"vjseq_death04",
			"vjseq_infectiondeath"
		} 

    end	

    if dmginfo:IsExplosionDamage() then -- When killed by explosion damage

		self.AnimTbl_Death = {
			"vjseq_nz_death_expl_f_1",
			"vjseq_nz_death_expl_f_2",
			"vjseq_nz_death_expl_f_3",
			"vjseq_nz_death_expl_b_1",
			"vjseq_nz_death_expl_l_1",
			"vjseq_nz_death_expl_r_1"
		}	

	end

    if dmginfo:IsDamageType(DMG_SHOCK) then -- When killed by shock damage

	   self.AnimTbl_Death = {
			"vjseq_nz_death_elec_1",
			"vjseq_nz_death_elec_2",
			"vjseq_nz_death_elec_3",
			"vjseq_nz_death_elec_4",
			"vjseq_nz_death_elec_5"
		}

    end

    if dmginfo:IsDamageType(DMG_BUCKSHOT) then -- When killed by a shotgun

		self.AnimTbl_Death = {
			"vjseq_death_shotgun_backward_03",
			"vjseq_death_shotgun_backward_04",
			"vjseq_death_shotgun_backward_05",
			"vjseq_death_shotgun_backward_06",
			"vjseq_death_shotgun_backward_07",
			"vjseq_death_shotgun_backward_08",
			"vjseq_death_shotgun_backward_09",
			"vjseq_death_shotgun_backward_collapse",
			"vjseq_death03"
		}

    end

    if dmginfo:IsDamageType(DMG_DISSOLVE) then -- When killed by a shotgun

		self.AnimTbl_Death = {
			"vjseq_nz_death_deathray_1",
			"vjseq_nz_death_deathray_2",
			"vjseq_nz_death_deathray_3",
			"vjseq_nz_death_deathray_4"
		}

    end

    if dmginfo:IsDamageType(DMG_PARALYZE) then -- When killed by a shotgun

		self.AnimTbl_Death = {
			"vjseq_nz_death_freeze_1",
			"vjseq_nz_death_freeze_2",
			"vjseq_nz_death_freeze_3",
			"vjseq_nz_death_freeze_4"
		}

    end
	
	if self.PIV_Husk_Explode then 
		self.AnimTbl_Death = {
			"vjseq_releasecrab"
		}
	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PIV_CustomMutate()
self.AnimTbl_Walk = {ACT_WALK}
self.AnimTbl_Run = {ACT_RUN}
		
local mymaxhealth = self:Health()
self:SetMaxHealth(mymaxhealth)

self.PIV_LegHP = self.PIV_LegHP *2

self.SoundTbl_CombatIdle = {"vj_piv/husk/zed_clot_alpha_vox_scream_crazy_01.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_crazy_02.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_crazy_03.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_med_01.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_med_02.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_scream_short_03.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_01.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_02.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_chest_03.ogg"}

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
if self:GetClass() == "npc_vj_piv_husk_f" then
self.Light2:Fire("SetParentAttachment","head")
else
self.Light2:Fire("SetParentAttachment","headcrab")
end
self.Light2:Fire("TurnOn", "", 0)
self:DeleteOnRemove(self.Light2)

end

end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/