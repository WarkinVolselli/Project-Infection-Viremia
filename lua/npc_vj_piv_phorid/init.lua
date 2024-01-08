AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/phorid/phorid.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 3000
ENT.VJ_IsHugeMonster = true

ENT.PIV_IsBoss = true

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
ENT.SoundTrackVolume = 0.5
ENT.ExtraMeleeAttackSoundLevel = 75
ENT.MeleeAttackSoundLevel = 80
ENT.PainSoundLevel = 80
ENT.BeforeMeleeAttackSoundLevel = 80
ENT.DeathSoundLevel = 85

ENT.SoundTbl_SoundTrack = {"vj_piv/music/re2_looming_dread.mp3"}
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
	
if GetConVar("vj_piv_lights"):GetInt() == 1 then 

self.Light2 = ents.Create("light_dynamic")
self.Light2:SetKeyValue("brightness", "2")
self.Light2:SetKeyValue("distance", "75")
self.Light2:SetLocalPos(self:GetPos())
self.Light2:SetLocalAngles(self:GetAngles())
self.Light2:Fire("Color", "255 93 0 255")
self.Light2:SetParent(self)
self.Light2:Spawn()
self.Light2:Activate()
self.Light2:Fire("SetParentAttachment","eyes")
self.Light2:Fire("TurnOn", "", 0)
self:DeleteOnRemove(self.Light2)

end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnPreInitialize()

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

        self.AnimTbl_Run = {ACT_RUN}
		
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

        self.AnimTbl_Run = {ACT_WALK}
	
	    self.SoundTbl_CombatIdle = {"vj_piv/phorid/brut_vx_idle_01_nr_00.wav","vj_piv/phorid/brut_vx_idle_01_nr_01.wav","vj_piv/phorid/brut_vx_idle_01_nr_02.wav","vj_piv/phorid/brut_vx_idle_01_nr_03.wav","vj_piv/phorid/brut_vx_idle_01_nr_04.wav","vj_piv/phorid/brut_vx_idle_01_nr_05.wav","vj_piv/phorid/brut_vx_idle_01_nr_06.wav","vj_piv/phorid/brut_vx_idle_01_nr_07.wav","vj_piv/phorid/brut_vx_idle_01_nr_08.wav"}

    end
	
	if IsValid(self:GetEnemy()) then
		if self:GetPos():Distance(self:GetEnemy():GetPos()) >= 90 && self.PIV_NextLongAttackT < CurTime() then
			self.PIV_LongAttack = true
		else
			self.PIV_LongAttack = false
		end
	end
	
	if IsValid(self:GetEnemy()) && self.PIV_SpawnCoolDownT < CurTime() && self.VJ_IsBeingControlled == false && GetConVar("vj_piv_boss_summon"):GetInt() == 1 then

	    self.PIV_SpawnCoolDownT = CurTime() + 10
		self:PIV_SummonHelp()
		self:VJ_ACT_PLAYACTIVITY("vjseq_summon",true,false,false)
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
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)
	if self.PIV_LongAttack == true then
		self.MeleeAttackDamage = math.random(25,30)
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackDistance = 100
		self.MeleeAttackDamageDistance = 180
		self.HasExtraMeleeAttackSounds = true
		self.SoundTbl_MeleeAttack = {"vj_piv/phorid/brut_punch_01_r_00.wav","vj_piv/phorid/brut_punch_01_r_01.wav"}
		self.SoundTbl_MeleeAttackExtra = {"vj_piv/gore/HeadshotDevestate3.wav","vj_piv/gore/HeadshotDevestate4.wav","vj_piv/gore/HeadshotDevestate5.wav"}
		self.SoundTbl_MeleeAttackMiss = {"vj_piv/Miss1.wav","vj_piv/Miss2.wav","vj_piv/Miss3.wav","vj_piv/Miss4.wav","vj_piv/Miss4.wav"}	
				
		self.AnimTbl_MeleeAttack = {
			"vjseq_attack1_long",
		}
	else
		self.MeleeAttackDamage = math.random(25,30)
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackDistance = 70
		self.MeleeAttackDamageDistance = 140
		self.HasExtraMeleeAttackSounds = true
		self.SoundTbl_MeleeAttack = {"vj_piv/phorid/brut_punch_01_r_00.wav","vj_piv/phorid/brut_punch_01_r_01.wav"}
		self.SoundTbl_MeleeAttackExtra = {"vj_piv/gore/HeadshotDevestate3.wav","vj_piv/gore/HeadshotDevestate4.wav","vj_piv/gore/HeadshotDevestate5.wav"}
		self.SoundTbl_MeleeAttackMiss = {"vj_piv/Miss1.wav","vj_piv/Miss2.wav","vj_piv/Miss3.wav","vj_piv/Miss4.wav","vj_piv/Miss4.wav"}	
				
		self.AnimTbl_MeleeAttack = {
			"vjseq_attack1",
			"vjseq_attack2",
		}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterStartTimer(seed)
	if self.PIV_LongAttack == true then 
		VJ_EmitSound(self, "vj_piv/phorid/armstretch.wav", 75, math.random(95,100))
		self.PIV_NextLongAttackT = CurTime() + math.random(5,10)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	dmginfo:ScaleDamage(0.9)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
	if self.CanDoTheFunny == false then return end

	if dmginfo:IsBulletDamage() or dmginfo:IsDamageType(DMG_BUCKSHOT) or dmginfo:IsDamageType(DMG_SNIPER) then
		if hitgroup == HITGROUP_HEAD or hitgroup == HITGROUP_CHEST or hitgroup == HITGROUP_STOMACH then
			if self.PIVNextStumbleT < CurTime() then
				if dmginfo:GetDamage() > 60 or dmginfo:GetDamageForce():Length() > 10000 then
					if math.random (1,2) == 1 then
						local flinch = VJ_PICK({"vjseq_flinch","vjseq_flinch2"})
						self:VJ_ACT_PLAYACTIVITY(flinch,true,false,false)
						self.PIVNextStumbleT = CurTime() + 5
					end
				end
			end
		end
	end

	if dmginfo:IsDamageType(DMG_CLUB) or dmginfo:IsDamageType(DMG_SLASH) or dmginfo:IsDamageType(DMG_GENERIC) then
		if dmginfo:GetDamage() > 40 or dmginfo:GetDamageForce():Length() > 10000 then
			if self.PIV_NextShoveT < CurTime() then
				local flinch = VJ_PICK({"vjseq_flinch","vjseq_flinch2"})
				self:VJ_ACT_PLAYACTIVITY(flinch,true,false,false)
				self.PIV_NextShoveT = CurTime() + math.random(8,12)
			end
		end
    return !self.PIV_Crippled && !self.PIV_FuckingCrawlingLittleCunt  && self:GetSequence() != self:LookupSequence(ACT_BIG_FLINCH) && self:GetSequence() != self:LookupSequence(ACT_SMALL_FLINCH)
	end

	if dmginfo:IsExplosionDamage() then
		if self.NextSplodeStumbleT < CurTime() then
			local flinch = VJ_PICK({"vjseq_flinch","vjseq_flinch2"})
			self:VJ_ACT_PLAYACTIVITY(flinch,true,false,false)
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