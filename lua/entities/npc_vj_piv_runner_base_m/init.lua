AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/hl2/citizens/male_01.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want

ENT.SoundTbl_Idle = {
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-01.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-02.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-03.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-04.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-05.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-06.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-07.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-08.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-09.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-idle-10.wav"
}
ENT.SoundTbl_Alert = {
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-01.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-02.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-03.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-04.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-05.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-06.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-07.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-08.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-09.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-10.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-11.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-12.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-13.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-14.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-alert-15.wav"
}
ENT.SoundTbl_CombatIdle = {
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-01.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-02.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-03.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-04.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-05.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-06.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-07.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-08.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-09.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-10.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-11.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-12.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pursuit-13.wav"	
}
ENT.SoundTbl_BeforeMeleeAttack = {
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack01.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack02.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack03.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack04.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack05.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack06.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack07.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack08.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack09.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack10.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack11.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack12.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack13.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack14.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack15.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack16.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack17.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack18.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack19.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-attack20.wav"	
}
ENT.SoundTbl_Pain = {
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain01.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain02.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain03.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain04.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain05.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain06.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain07.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain08.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain09.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain10.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain11.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain12.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain13.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain14.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain15.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain16.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain17.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-pain18.wav"
}
ENT.SoundTbl_Death = {
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-01.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-02.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-03.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-04.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-05.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-06.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-07.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-08.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-09.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-10.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-11.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-12.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-13.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-14.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-15.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-16.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-17.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-18.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-19.wav",
	"vj_piv/nmr_zomb_runner_male/zomb_runner_male1-death-20.wav"
}

/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/