AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/shambler/shambler_male.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 200
ENT.IsRevived = false
ENT.CanRevive = true
ENT.ReviveRevenant = false

ENT.AnimTbl_Walk = {ACT_WALK_RELAXED}
ENT.AnimTbl_Run = {ACT_WALK_RELAXED}

ENT.PIV_LegHP = 100 

ENT.SoundTbl_Idle = {"vj_piv/shambler/idle_1.mp3","vj_piv/shambler/idle_2.mp3","vj_piv/shambler/idle_3.mp3","vj_piv/shambler/idle_4.mp3"}
ENT.SoundTbl_Alert = {"vj_piv/shambler/alert_1.mp3","vj_piv/shambler/alert_2.mp3","vj_piv/shambler/alert_3.mp3","vj_piv/shambler/alert_4.mp3"}
ENT.SoundTbl_CombatIdle = {"vj_piv/shambler/alert_1.mp3","vj_piv/shambler/alert_2.mp3","vj_piv/shambler/alert_3.mp3","vj_piv/shambler/alert_4.mp3","vj_piv/shambler/idle_1.mp3","vj_piv/shambler/idle_2.mp3","vj_piv/shambler/idle_3.mp3","vj_piv/shambler/idle_4.mp3"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/shambler/attack_1.mp3","vj_piv/shambler/attack_2.mp3","vj_piv/shambler/attack_3.mp3","vj_piv/shambler/attack_4.mp3","vj_piv/shambler/attack_5.mp3","vj_piv/shambler/attack_6.mp3"}
ENT.SoundTbl_Pain = {"vj_piv/shambler/attack_1.mp3","vj_piv/shambler/attack_2.mp3","vj_piv/shambler/attack_3.mp3","vj_piv/shambler/attack_4.mp3","vj_piv/shambler/attack_5.mp3","vj_piv/shambler/attack_6.mp3"}
ENT.SoundTbl_Death = {"vj_piv/shambler/death_1.mp3","vj_piv/shambler/death_2.mp3","vj_piv/shambler/death_3.mp3","vj_piv/shambler/death_4.mp3","vj_piv/shambler/death_5.mp3"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,3))
	self:SetBodygroup(2,math.random(0,1))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD && GetConVar("vj_piv_headshot_damage"):GetInt() == 1 then
		dmginfo:ScaleDamage(GetConVarNumber("vj_piv_headshot_damage_mult"))
	else
		dmginfo:ScaleDamage(0.75)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,GetCorpse)
	if GetConVar("vj_piv_shambler_revive"):GetInt() == 1 && math.random(1,GetConVar("vj_piv_shambler_revive_chance"):GetInt()) == 1 && self.CanRevive == true then
	if self:GetClass() == "npc_vj_piv_shambler" && IsValid(GetCorpse) then
	
	local mutatesounds = {
		"vj_piv/mutate_1.wav",
		"vj_piv/mutate_2.wav",
		"vj_piv/mutate_3.wav",
	}
		 
		timer.Simple(math.random(5,10),function() if IsValid(GetCorpse) then

			local TheDude = ents.Create("npc_vj_piv_shambler")
			
			if GetConVar("vj_piv_shambler_revive_revenant"):GetInt() == 1 && math.random(1,GetConVar("vj_piv_shambler_revive_revenant_chance"):GetInt()) == 1 then
				TheDude = ents.Create("npc_vj_piv_revenant")
				TheDude.ReviveRevenant = true
			end
			
			TheDude:SetPos(GetCorpse:GetPos())
			TheDude:SetAngles(GetCorpse:GetAngles())
			TheDude:Spawn()
			TheDude:Activate()
			undo.ReplaceEntity(self,TheDude)
			
			TheDude:SetMaterial()
			TheDude:SetModel(GetCorpse:GetModel())
			TheDude:SetSkin(GetCorpse:GetSkin())
			TheDude:SetBodygroup(2,GetCorpse:GetBodygroup(2))
			
			if TheDude.ReviveRevenant == true then
				VJ_EmitSound(TheDude,mutatesounds,90,math.random(100,90))
				VJ_EmitSound(TheDude,{"vj_piv/gore/HeadshotDevestate3.wav","vj_piv/gore/HeadshotDevestate4.wav","vj_piv/gore/HeadshotDevestate5.wav"},70,math.random(100,100))
				local bloodspray = EffectData()
				bloodspray:SetOrigin(TheDude:GetPos())
				bloodspray:SetScale(10)
				bloodspray:SetFlags(3)
				bloodspray:SetColor(0)
				util.Effect("bloodspray",bloodspray)
				util.Effect("bloodspray",bloodspray)

				local bloodeffect = EffectData()
				bloodeffect:SetOrigin(TheDude:GetPos())
				bloodeffect:SetColor(VJ_Color2Byte(Color(127,0,0,255)))
				bloodeffect:SetScale(125)
				util.Effect("VJ_Blood1",bloodeffect)
			end
			
			if math.random(1,4) == 1 then
			TheDude.CanRevive = true
			else
			TheDude.CanRevive = false
			end
			TheDude.IsRevived = true
			
			TheDude:SetPos(TheDude:GetPos() + TheDude:GetUp()*-6)
			local rise = VJ_PICK({"vjseq_slumprise_a","vjseq_slumprise_a2","vjseq_slumprise_a_attack","vjseq_slumprise_b","vjseq_infectionrise","vjseq_lying_to_standing_alert","vjseq_lying_to_standing_alert03c","vjseq_lying_to_standing_alert03d"})
		    TheDude:VJ_ACT_PLAYACTIVITY(rise,true,VJ_GetSequenceDuration(self,tbl),false)
					
			if IsValid(GetCorpse) then
				GetCorpse:Remove()
			end

				
		end end)
		
    end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PIV_CustomMutate()
self.AnimTbl_Walk = {ACT_WALK}
self.AnimTbl_Run = {ACT_RUN}

self.StartHealth = self.StartHealth *2
self:SetHealth(self.StartHealth)
		
local mymaxhealth = self:Health()
self:SetMaxHealth(mymaxhealth)

self.PIV_LegHP = self.PIV_LegHP *2

if GetConVar("vj_piv_lights"):GetInt() == 1 then 

self.Light2 = ents.Create("light_dynamic")
self.Light2:SetKeyValue("brightness", "7")
self.Light2:SetKeyValue("distance", "50")
self.Light2:SetLocalPos(self:GetPos())
self.Light2:SetLocalAngles(self:GetAngles())
self.Light2:Fire("Color", "216 255 0 255")
self.Light2:SetParent(self)
self.Light2:Spawn()
self.Light2:Activate()
self.Light2:Fire("SetParentAttachment","eyes")
self.Light2:Fire("TurnOn", "", 0)
self:DeleteOnRemove(self.Light2)

end

end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/