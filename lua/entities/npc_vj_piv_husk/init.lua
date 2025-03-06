include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	if self:GetClass() == "npc_vj_piv_husk_f" then
		self.Model = {"models/vj_piv/specials/husk/zombie_female.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
	else
		self.Model = {"models/vj_piv/specials/husk/zombie.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
	end
	self.StartHealth = 200

	self.PIV_IsSpecial = true

	self.PIV_HasSubclasses = false
	self.PIV_AllowedToClimb = false
	self.PIV_CanBeThrower = false

	self.PIV_HasWeapons = false

	self.NextRunT = 0
	self.Running = false
	self.RunT = 0
	self.PIV_MovementAnims = 0
	self.PIV_Husk_Explode = false

	self.TorsoEntity = "npc_vj_piv_husk_torso"

	self.PIV_LegHP = 100
	self.PIV_Husk_Headless = false

	if GetConVar("vj_piv_husk_headless"):GetInt() == 1 && math.random(1,GetConVar("vj_piv_husk_headless_chance"):GetInt()) == 1 then
		if self:GetClass() == "npc_vj_piv_husk_f" then
			self.Model = {"models/vj_piv/specials/husk/zombie_female_beta.mdl"}
		else
			self.Model = {"models/vj_piv/specials/husk/zombie_beta.mdl"}
		end
		self.PIV_Husk_Headless = true
	end
	
	if self:GetClass() == "npc_vj_piv_husk_f" then
		self.TorsoEntity = "npc_vj_piv_husk_torso_f"
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
--------------------
function ENT:Zombie_GiveVoice()
	self.SoundTbl_Idle = {
		"vj_piv/husk/zed_clot_alpha_vox_chuff_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_chuff_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_chuff_03.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_chuff_04.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_chuff_05.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_03.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_04.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_05.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_breath_walk_hvy_06.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_03.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_04.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_05.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_06.ogg"
	}
	self.SoundTbl_Alert = {
		"vj_piv/husk/zed_clot_alpha_vox_taunt_chest_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_taunt_chest_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_taunt_chest_03.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_roar_light_long_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_roar_light_long_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_roar_light_long_03.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_roar_light_med_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_roar_light_med_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_roar_light_med_03.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_roar_light_short_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_roar_light_short_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_roar_light_short_03.ogg"
	}
	self.SoundTbl_CombatIdle = {
		"vj_piv/husk/zed_clot_alpha_vox_yell_short_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_yell_short_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_yell_short_03.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_growl_short_alt_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_growl_short_alt_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_03.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_04.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_05.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_03.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_04.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_05.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_06.ogg"
	}
	self.SoundTbl_BeforeMeleeAttack = {
		"vj_piv/husk/zed_calpha_vox_aggro_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_bite_fast_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_bite_fast_03.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_bite_long_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_bite_long_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_bite_long_03.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_grab_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_grab_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_grab_03.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_melee_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_melee_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_melee_03.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_melee_04.ogg"
	}
	self.SoundTbl_Pain = {
		"vj_piv/husk/zed_clot_alpha_vox_pain_hvy_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_pain_hvy_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_pain_hvy_03.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_pain_lite_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_pain_lite_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_pain_lite_03.ogg"
	}
	self.SoundTbl_Death = {
		"vj_piv/husk/zed_clotalpha_vox_roar_med_01.ogg",
		"vj_piv/husk/zed_clotalpha_vox_roar_med_02.ogg",
		"vj_piv/husk/zed_clotalpha_vox_roar_med_03.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_taunt_med_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_taunt_med_02.ogg"
	}
	self.SoundTbl_Charge = {
		"vj_piv/husk/zed_clot_alpha_vox_taunt_chest_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_taunt_chest_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_taunt_chest_03.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_taunt_long_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_taunt_long_02.ogg"
	}
	if self:GetClass() == "npc_vj_piv_husk_f" then
		self.IdleSoundPitch = VJ.SET(150, 150)
		self.CombatIdleSoundPitch = VJ.SET(150, 150)
		self.AlertSoundPitch = VJ.SET(150, 150)
		self.CallForHelpSoundPitch = VJ.SET(150, 150)
		self.BeforeMeleeAttackSoundPitch = VJ.SET(150, 150)
		self.PainSoundPitch = VJ.SET(150, 150)
		self.DeathSoundPitch = VJ.SET(150, 150)
	end
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	if GetConVar("vj_piv_hl2skins"):GetInt() == 1 then -- if HL2 Skins Only is enabled, this will make the zombies only use HL2 skins
		self:SetSkin(math.random(0,1))
	else
		self:SetSkin(math.random(0,7))
	end
	
	local type = math.random(1,8)
	
	if type == 1 then
		self.PIV_MovementAnims = 2
	elseif type == 2 then
		self.PIV_MovementAnims = 3
	elseif type == 3 then
		self.PIV_MovementAnims = 4
	else
		self.PIV_MovementAnims = 1
	end
end
--------------------
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

		if self:GetClass() == "npc_vj_piv_husk_f" then
			VJ.EmitSound(self,self.SoundTbl_Charge,self.AlertSoundLevel,150)
		else
			VJ.EmitSound(self,self.SoundTbl_Charge,self.AlertSoundLevel,math.random(90,100))
		end

        self.Running = true
        self.RunT = CurTime() + math.random(5,10)
		
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
	
	    self.SoundTbl_CombatIdle = {"vj_piv/husk/zed_clot_alpha_vox_yell_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_yell_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_yell_short_03.ogg","vj_piv/husk/zed_clot_alpha_vox_growl_short_alt_01.ogg","vj_piv/husk/zed_clot_alpha_vox_growl_short_alt_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_01.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_03.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_04.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_med_05.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_01.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_03.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_04.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_05.ogg","vj_piv/husk/zed_clot_alpha_vox_grunt_hard_short_06.ogg"}
	
        if self:IsMoving() && self:GetSequence() == self:LookupSequence(ACT_RUN) then

			local stop = VJ.PICK({"vjseq_running_to_standing","vjseq_running_to_standing_02","vjseq_shove_forward_01"})
		    self:VJ_ACT_PLAYACTIVITY(stop,true,VJ.AnimDuration(self,tbl),false)
			if self:GetClass() == "npc_vj_piv_husk_f" then
				VJ.EmitSound(self,self.SoundTbl_Pain,self.AlertSoundLevel,150)
			else
				VJ.EmitSound(self,self.SoundTbl_Pain,self.AlertSoundLevel,math.random(90,100))
			end

        end

    end

end
--------------------
function ENT:TranslateActivity(act)
	if self.PIV_MovementAnims == 2 then
		if act == ACT_IDLE then
			return ACT_IDLE_STIMULATED
		elseif act == ACT_WALK then
			return ACT_WALK_STIMULATED
		elseif act == ACT_RUN && !self.PIV_Mutated && !self.Running then
			return ACT_WALK_STIMULATED
		end
	elseif self.PIV_MovementAnims == 3 then
		if act == ACT_IDLE then
			return ACT_IDLE_AGITATED
		elseif act == ACT_WALK then
			return ACT_WALK_AGITATED
		elseif act == ACT_RUN && !self.PIV_Mutated && !self.Running then
			return ACT_WALK_AGITATED
		end
	elseif self.PIV_MovementAnims == 4 then
		if act == ACT_IDLE then
			return ACT_IDLE_RELAXED
		elseif act == ACT_WALK then
			return ACT_WALK_RELAXED
		elseif act == ACT_RUN && !self.PIV_Mutated && !self.Running then
			return ACT_WALK_RELAXED
		end
	else
		if act == ACT_RUN && !self.PIV_Mutated && !self.Running then
			return ACT_WALK
		end
	end
	return act
end
--------------------
function ENT:Zombie_CustomOnAlert()
    self.NextRunT = CurTime() + math.random(2,8)
	if GetConVar("vj_piv_alert_anim"):GetInt() == 1 && self.PIV_Crippled == false && self.PIV_FuckingCrawlingLittleCunt == false && self.PIV_Resting == 0 && self:GetSequence() != self:LookupSequence(ACT_OPEN_DOOR) then
		if math.random(1,GetConVar("vj_piv_alert_anim_chance"):GetInt()) == 1 then
			self:VJ_ACT_PLAYACTIVITY("vjges_tantrum",false,false,true)
		end
	end
end
--------------------
function ENT:OnDeath(dmginfo,hitgroup,status)

	if status == "Initial" then

		if self.PIV_Husk_Explode == true then

			VJ.EmitSound(self,{"vj_piv/gore/PreExplode1.wav","vj_piv/gore/PreExplode2.wav","vj_piv/gore/PreExplode3.wav"},75,math.random(100,100))

			timer.Simple(0.25,function() if IsValid(self) then

				VJ.EmitSound(self,{"vj_piv/gore/HeadshotDevestate3.wav","vj_piv/gore/HeadshotDevestate4.wav","vj_piv/gore/HeadshotDevestate5.wav"},75,math.random(100,100))

				timer.Simple(0.70,function() if IsValid(self) then

					VJ.EmitSound(self,{"vj_piv/gore/Explode1.wav","vj_piv/gore/Explode2.wav","vj_piv/gore/Explode3.wav"},100,math.random(100,100))
					local bloodeffect = EffectData()
					bloodeffect:SetOrigin(self:GetPos()+ self:GetUp()*80)
					bloodeffect:SetColor(VJ.Color2Byte(Color(127,0,0,255)))
					bloodeffect:SetScale(250)
					util.Effect("VJ_Blood1",bloodeffect)

					local bloodspray = EffectData()
					bloodspray:SetOrigin(self:GetPos() +self:OBBCenter())
					bloodspray:SetColor(VJ.Color2Byte(Color(127,0,0,255)))
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
				end end)
			end	end)
		end
	end

	if status == "DeathAnim" then

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

	if status == "Finish" then
		if self.PIV_Husk_Explode == true then
				VJ.ApplyRadiusDamage(self,self,self:GetPos(),150,math.random(0,0),DMG_BLAST,true,true,{Force=20})
			for k,v in ipairs(ents.FindInSphere(self:GetPos(),150)) do
				v:TakeDamage(math.random(20,30))
			end
				util.ScreenShake(self:GetPos(),44,600,1.5,2000)
		end
	end

end
--------------------
function ENT:OnDamaged(dmginfo,hitgroup,status)
	if status == "PreDamage" then
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
end

--------------------
function ENT:PIV_CustomMutate()
	local mymaxhealth = self:Health()
	self:SetMaxHealth(mymaxhealth)

	self.PIV_LegHP = self.PIV_LegHP *2

	self.SoundTbl_CombatIdle = {
		"vj_piv/husk/zed_clot_alpha_vox_scream_crazy_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_scream_crazy_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_scream_crazy_03.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_scream_med_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_scream_med_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_scream_short_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_scream_short_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_scream_short_03.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_taunt_chest_01.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_taunt_chest_02.ogg",
		"vj_piv/husk/zed_clot_alpha_vox_taunt_chest_03.ogg"
	}

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
--------------------
function ENT:Cripple()
	self.PIV_Crippled = true
	self.PIV_Husk_Explode = false
	self.HasDeathAnimation = false
	if self.PIV_Husk_Headless == true then
		self.DeathCorpseModel = {"models/vj_piv/specials/husk/zombie_legs_beta.mdl"} 		
	else
		self.DeathCorpseModel = {"models/vj_piv/specials/husk/zombie_legs.mdl"} 
	end
	self:TakeDamage(self:Health() + 1000)
end
--------------------
function ENT:Zombie_CustomOnCreateDeathCorpse(dmginfo, hitgroup, corpseEnt)
	if IsValid(corpseEnt) && self.PIV_Crippled == true then
		
		local TheDude = ents.Create(self.TorsoEntity)
		TheDude:SetPos(corpseEnt:GetPos())
		TheDude:SetAngles(corpseEnt:GetAngles())
		TheDude:Spawn()
		TheDude:Activate()
		TheDude:SetMaterial()
		TheDude:SetSkin(corpseEnt:GetSkin())
		TheDude:VJ_ACT_PLAYACTIVITY("vjseq_fall",true,VJ.AnimDuration(self,tbl),false)
		TheDude:SetVelocity(dmginfo:GetDamageForce()/58)
		
		undo.ReplaceEntity(self,TheDude)
		
		VJ.EmitSound(TheDude,{"vj_piv/gore/GutExplosion-1.wav","vj_piv/gore/GutExplosion-2.wav","vj_piv/gore/GutExplosion-3.wav"},70,math.random(100,100))
		local bloodspray = EffectData()
		bloodspray:SetOrigin(TheDude:GetPos())
		bloodspray:SetScale(10)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(0)
		util.Effect("bloodspray",bloodspray)
		util.Effect("bloodspray",bloodspray)

		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(TheDude:GetPos())
		bloodeffect:SetColor(VJ.Color2Byte(Color(127,0,0,255)))
		bloodeffect:SetScale(125)
		util.Effect("VJ_Blood1",bloodeffect)
		
		if self:IsOnFire()then 
			TheDude:Ignite(math.random(5,20))
		end
	end
end