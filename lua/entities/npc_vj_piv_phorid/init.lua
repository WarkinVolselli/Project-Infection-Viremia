AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/phorid/phorid.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 3000
ENT.PIV_IsHugeZombie = true
ENT.PIV_HasArmor = true
ENT.PIV_IsBoss = true

ENT.PIV_Jogger = true

ENT.HullType = HULL_MEDIUM 

ENT.MeleeAttackDistance = 70
ENT.MeleeAttackDamageDistance = 140
ENT.MeleeAttackDamage = math.random(25,30)

ENT.NextRunT = 0
ENT.Running = false
ENT.RunT = 0

ENT.PIV_NextLongAttackT = 0
ENT.PIV_LongAttack = false
 
ENT.PIV_SpawnCoolDownT = 0

ENT.PIV_LegHP = 10000

ENT.HasSoundTrack = true
ENT.HasExtraMeleeAttackSounds = true
ENT.SoundTrackVolume = 0.75
ENT.ExtraMeleeAttackSoundLevel = 75
ENT.MeleeAttackSoundLevel = 80
ENT.PainSoundLevel = 80
ENT.BeforeMeleeAttackSoundLevel = 80
ENT.DeathSoundLevel = 85
 
ENT.SoundTbl_SoundTrack = {"vj_piv/music/phorid.mp3"}
ENT.SoundTbl_Idle = {"vj_piv/phorid/brut_vx_idle_01_nr_00.wav","vj_piv/phorid/brut_vx_idle_01_nr_01.wav","vj_piv/phorid/brut_vx_idle_01_nr_02.wav","vj_piv/phorid/brut_vx_idle_01_nr_03.wav","vj_piv/phorid/brut_vx_idle_01_nr_04.wav","vj_piv/phorid/brut_vx_idle_01_nr_05.wav","vj_piv/phorid/brut_vx_idle_01_nr_06.wav","vj_piv/phorid/brut_vx_idle_01_nr_07.wav","vj_piv/phorid/brut_vx_idle_01_nr_08.wav"}
ENT.SoundTbl_Alert = {"vj_piv/phorid/brute_roar_01.wav","vj_piv/phorid/brute_roar_02.wav","vj_piv/phorid/brute_roar_03.wav","vj_piv/phorid/brute_roar_04.wav"}
ENT.SoundTbl_CombatIdle = {"vj_piv/phorid/brut_vx_idle_01_nr_00.wav","vj_piv/phorid/brut_vx_idle_01_nr_01.wav","vj_piv/phorid/brut_vx_idle_01_nr_02.wav","vj_piv/phorid/brut_vx_idle_01_nr_03.wav","vj_piv/phorid/brut_vx_idle_01_nr_04.wav","vj_piv/phorid/brut_vx_idle_01_nr_05.wav","vj_piv/phorid/brut_vx_idle_01_nr_06.wav","vj_piv/phorid/brut_vx_idle_01_nr_07.wav","vj_piv/phorid/brut_vx_idle_01_nr_08.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/phorid/brute_attack_01.wav","vj_piv/phorid/brute_attack_02.wav","vj_piv/phorid/brute_attack_03.wav","vj_piv/phorid/brute_attack_04.wav"}
ENT.SoundTbl_Pain = {"vj_piv/phorid/brut_vx_hit_react_01_nr_00.wav","vj_piv/phorid/brut_vx_hit_react_01_nr_01.wav","vj_piv/phorid/brut_vx_hit_react_01_nr_02.wav"}
ENT.SoundTbl_Death = {"vj_piv/phorid/brut_vx_death_01_nr_00.wav","vj_piv/phorid/brut_vx_death_01_nr_01.wav"}
ENT.SoundTbl_Charge = {"vj_piv/phorid/brut_vx_death_01_nr_00.wav","vj_piv/phorid/brut_vx_death_01_nr_01.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
    self.NextRunT = CurTime() + math.random(2,6)
	self.PIV_SpawnCoolDownT = CurTime() + 10
--[[	
	if GetConVar("vj_piv_lights"):GetInt() == 1 then 

		self.Light2 = ents.Create("light_dynamic")
		self.Light2:SetKeyValue("brightness", "1")
		self.Light2:SetKeyValue("distance", "125")
		self.Light2:SetLocalPos(self:GetPos())
		self.Light2:SetLocalAngles(self:GetAngles())
		self.Light2:Fire("Color", "255 75 0 255")
		self.Light2:SetParent(self)
		self.Light2:Spawn()
		self.Light2:Activate()
		self.Light2:Fire("SetParentAttachment","eyes")
		self.Light2:Fire("TurnOn", "", 0)
		self:DeleteOnRemove(self.Light2)

	end
--]]
	self:SetModelScale(1.3)

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()

    if
        self.NextRunT < CurTime() &&
        !self.Running &&
        self:GetEnemy() != nil &&
        !self.PIV_Crippled &&
        !self.Dead &&
        !self:IsBusy() &&
		self.VJ_IsBeingControlled == false
    then

        VJ_EmitSound(self,self.SoundTbl_Charge,self.DeathSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))

        self.Running = true
        self.RunT = CurTime() + math.random(5,10)
		self.PIV_Jogger = false
		self.SoundTbl_CombatIdle = {"vj_piv/phorid/brut_vx_chomp_01_nr_01.wav","vj_piv/phorid/brut_vx_chomp_01_nr_02.wav","vj_piv/phorid/brut_vx_chomp_01_nr_03.wav"}

    end

    if
        self.Running &&
        self.RunT < CurTime() &&
        !self.Dead &&
        !self.PIV_Crippled &&  
		self.VJ_IsBeingControlled == false
    then

        self.Running = false
        self.NextRunT = CurTime() + math.random(6,12)
		self.PIV_Jogger = true
	    self.SoundTbl_CombatIdle = {"vj_piv/phorid/brut_vx_idle_01_nr_00.wav","vj_piv/phorid/brut_vx_idle_01_nr_01.wav","vj_piv/phorid/brut_vx_idle_01_nr_02.wav","vj_piv/phorid/brut_vx_idle_01_nr_03.wav","vj_piv/phorid/brut_vx_idle_01_nr_04.wav","vj_piv/phorid/brut_vx_idle_01_nr_05.wav","vj_piv/phorid/brut_vx_idle_01_nr_06.wav","vj_piv/phorid/brut_vx_idle_01_nr_07.wav","vj_piv/phorid/brut_vx_idle_01_nr_08.wav"}
  
		if self:IsMoving() && self:GetSequence() == self:LookupSequence(ACT_RUN_AIM) then
			local stop = VJ.PICK({"vjseq_running_to_standing","vjseq_running_to_standing_02","vjseq_shove_forward_01"})
			self:VJ_ACT_PLAYACTIVITY(stop,true,VJ.AnimDuration(self,tbl),false)
			VJ.EmitSound(self,self.SoundTbl_Pain,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
		end
	end
	
	if IsValid(self:GetEnemy()) && self.PIV_SpawnCoolDownT < CurTime() && self.VJ_IsBeingControlled == false && GetConVar("vj_piv_boss_summon"):GetInt() == 1 then

	    self.PIV_SpawnCoolDownT = CurTime() + 10
		self:PIV_SummonHelp()
		self:VJ_ACT_PLAYACTIVITY("vjseq_stand_threaten_0",true,false,false)
		VJ_EmitSound(self,self.SoundTbl_Alert,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.AlertSoundPitch.a,self.AlertSoundPitch.b))

	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PIV_SummonHelp_Spawn()
	if !IsValid(self.PhoridHelp1) then
		self.PhoridHelp1 = self:PIV_SummonHelp()
		return 15
	elseif !IsValid(self.PhoridHelp2) then
		self.PhoridHelp2 = self:PIV_SummonHelp()
		return 15
	elseif !IsValid(self.PhoridHelp3) then
		self.PhoridHelp3 = self:PIV_SummonHelp()
		return 15
	elseif !IsValid(self.PhoridHelp4) then
		self.PhoridHelp4 = self:PIV_SummonHelp()
		return 15
	end
	return 15
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PIV_SummonHelp()
    
	if math.random(1,9) == 1 then
	self.PhoridMinion = "npc_vj_piv_shambler"
	elseif math.random(1,9) == 2 then
	self.PhoridMinion = "npc_vj_piv_shambler_f"
	elseif math.random(1,9) == 3 then
	self.PhoridMinion = "npc_vj_piv_husk"
	elseif math.random(1,9) == 4 then
	self.PhoridMinion = "npc_vj_piv_husk_f"
	elseif math.random(1,9) == 5 then
	self.PhoridMinion = "npc_vj_piv_revenant"
	elseif math.random(1,9) == 6 then
	self.PhoridMinion = "npc_vj_piv_revenant_f"
	elseif math.random(1,9) == 7 then
	self.PhoridMinion = "npc_vj_piv_shikari"
	elseif math.random(1,9) == 8 then
	self.PhoridMinion = "npc_vj_piv_virulent"
	elseif math.random(1,9) == 9 then
	self.PhoridMinion = "npc_vj_piv_blood_bomber"
    end
	
	local tr = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() + self:GetForward() * math.Rand(-2000, 2000) + self:GetRight() * math.Rand(-2000, 2000) + self:GetUp() * 50,
		filter = {self},
		mask = MASK_ALL,
	})
	local spawnpos = tr.HitPos + tr.HitNormal*300
	local ally = ents.Create(self.PhoridMinion)
	ally:SetPos(spawnpos)
	ally:SetAngles(self:GetAngles())
	ally:Spawn()
	ally:Activate()
	ally:ForceDig()
	ally.VJ_NPC_Class = self.VJ_NPC_Class
	return ally
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD && GetConVar("vj_piv_headshot_damage"):GetInt() == 1 then
		dmginfo:ScaleDamage(GetConVarNumber("vj_piv_headshot_damage_mult"))
	elseif hitgroup != HITGROUP_HEAD && (dmginfo:IsBulletDamage()) then
		local attacker = dmginfo:GetAttacker()
		self.DamageSpark1 = ents.Create("env_spark")
		self.DamageSpark1:SetKeyValue("Magnitude","1")
		self.DamageSpark1:SetKeyValue("Spark Trail Length","1")
		self.DamageSpark1:SetPos(dmginfo:GetDamagePosition())
		self.DamageSpark1:SetAngles(self:GetAngles())
		//self.DamageSpark1:Fire("LightColor", "255 255 255")
		self.DamageSpark1:SetParent(self)
		self.DamageSpark1:Spawn()
		self.DamageSpark1:Activate()
		self.DamageSpark1:Fire("StartSpark", "", 0)
		self.DamageSpark1:Fire("StopSpark", "", 0.001)
		self:DeleteOnRemove(self.DamageSpark1)
		if self.HasSounds == true && self.HasImpactSounds == true then VJ.EmitSound(self,"vj_impact_metal/bullet_metal/metalsolid"..math.random(1,10)..".wav",70) end
		dmginfo:ScaleDamage(0.50)
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