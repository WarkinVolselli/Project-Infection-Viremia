AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/shambler/shambler_female.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want

ENT.ShamblerEntity = "npc_vj_piv_shambler_f"
ENT.RevenantEntity = "npc_vj_piv_revenant_f"

ENT.IdleSoundPitch = VJ.SET(120, 120)
ENT.CombatIdleSoundPitch = VJ.SET(120, 120)
ENT.AlertSoundPitch = VJ.SET(120, 120)
ENT.CallForHelpSoundPitch = VJ.SET(120, 120)
ENT.BeforeMeleeAttackSoundPitch = VJ.SET(120, 120)
ENT.PainSoundPitch = VJ.SET(120, 120)
ENT.DeathSoundPitch = VJ.SET(120, 120)

/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/