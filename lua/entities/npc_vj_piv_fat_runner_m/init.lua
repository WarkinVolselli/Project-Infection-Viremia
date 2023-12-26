AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/fat/fat_male.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 150

ENT.SoundTbl_Idle = {"vj_piv/fat/idle_1.mp3","vj_piv/fat/idle_2.mp3","vj_piv/fat/idle_3.mp3","vj_piv/fat/idle_4.mp3","vj_piv/fat/idle_5.mp3","vj_piv/fat/idle_6.mp3","vj_piv/fat/idle_7.mp3","vj_piv/fat/idle_8.mp3"}
ENT.SoundTbl_CombatIdle = {"vj_piv/fat/cidle_1.mp3","vj_piv/fat/cidle_2.mp3","vj_piv/fat/cidle_3.mp3","vj_piv/fat/cidle_4.mp3","vj_piv/fat/cidle_5.mp3","vj_piv/fat/cidle_6.mp3","vj_piv/fat/cidle_7.mp3"}
ENT.SoundTbl_Alert = {"vj_piv/fat/alert_1.mp3","vj_piv/fat/alert_2.mp3","vj_piv/fat/alert_3.mp3","vj_piv/fat/alert_4.mp3","vj_piv/fat/alert_4.mp3","vj_piv/fat/alert_6.mp3","vj_piv/fat/alert_7.mp3","vj_piv/fat/alert_8.mp3","vj_piv/fat/alert_9.mp3","vj_piv/fat/alert_10.mp3"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/fat/alert_1.mp3","vj_piv/fat/alert_2.mp3","vj_piv/fat/alert_3.mp3","vj_piv/fat/alert_4.mp3","vj_piv/fat/alert_4.mp3","vj_piv/fat/alert_6.mp3","vj_piv/fat/alert_7.mp3","vj_piv/fat/alert_8.mp3","vj_piv/fat/alert_9.mp3","vj_piv/fat/alert_10.mp3"}
ENT.SoundTbl_Pain = {"vj_piv/fat/pain_1.mp3","vj_piv/fat/pain_2.mp3","vj_piv/fat/pain_3.mp3","vj_piv/fat/pain_4.mp3","vj_piv/fat/pain_5.mp3","vj_piv/fat/pain_6.mp3","vj_piv/fat/pain_7.mp3","vj_piv/fat/pain_8.mp3"}
ENT.SoundTbl_Death = {"vj_piv/fat/death_1.mp3","vj_piv/fat/death_2.mp3","vj_piv/fat/death_3.mp3","vj_piv/fat/death_4.mp3"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,11))
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/