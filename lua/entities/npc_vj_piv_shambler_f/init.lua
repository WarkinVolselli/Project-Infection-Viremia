AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/shambler/shambler_female.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want

ENT.IdleSoundPitch = VJ_Set(120, 120)
ENT.CombatIdleSoundPitch = VJ_Set(120, 120)
ENT.AlertSoundPitch = VJ_Set(120, 120)
ENT.CallForHelpSoundPitch = VJ_Set(120, 120)
ENT.BeforeMeleeAttackSoundPitch = VJ_Set(120, 120)
ENT.PainSoundPitch = VJ_Set(120, 120)
ENT.DeathSoundPitch = VJ_Set(120, 120)

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,GetCorpse)
	if GetConVar("vj_piv_shambler_revive"):GetInt() == 1 && math.random(1,GetConVar("vj_piv_shambler_revive_chance"):GetInt()) == 1 && self.CanRevive == true then
	if self:GetClass() == "npc_vj_piv_shambler_f" && IsValid(GetCorpse) then
	
	local mutatesounds = {
		"vj_piv/mutate_1.wav",
		"vj_piv/mutate_2.wav",
		"vj_piv/mutate_3.wav",
	}
		 
		timer.Simple(math.random(5,10),function() if IsValid(GetCorpse) then

			local TheDude = ents.Create("npc_vj_piv_shambler_f")
			
			if GetConVar("vj_piv_shambler_revive_revenant"):GetInt() == 1 && math.random(1,GetConVar("vj_piv_shambler_revive_revenant_chance"):GetInt()) == 1 then
				TheDude = ents.Create("npc_vj_piv_revenant_f")
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
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/