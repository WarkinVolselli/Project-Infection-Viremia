AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/hl2/citizens/male_01.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want

ENT.SoundTbl_Idle = {
	"vj_piv/nmr_zomb2/idle1.wav",
	"vj_piv/nmr_zomb2/idle2.wav",
	"vj_piv/nmr_zomb2/idle3.wav",
	"vj_piv/nmr_zomb2/idle4.wav",
	"vj_piv/nmr_zomb2/idle5.wav",
	"vj_piv/nmr_zomb2/idle6.wav",
	"vj_piv/nmr_zomb2/idle7.wav",
	"vj_piv/nmr_zomb2/idle8.wav",
	"vj_piv/nmr_zomb2/idle9.wav",
	"vj_piv/nmr_zomb2/idle10.wav",
	"vj_piv/nmr_zomb2/idle11.wav",
	"vj_piv/nmr_zomb2/idle12.wav",
	"vj_piv/nmr_zomb2/idle13.wav",
	"vj_piv/nmr_zomb2/idle14.wav",
	"vj_piv/nmr_zomb2/idle15.wav"
}
ENT.SoundTbl_Alert = {
	"vj_piv/nmr_zomb2/alert_sham_m_01.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_02.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_03.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_04.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_05.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_06.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_07.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_08.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_09.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_10.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_11.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_12.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_13.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_14.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_15.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_16.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_17.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_18.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_19.wav",
	"vj_piv/nmr_zomb2/alert_sham_m_20.wav",	
	"vj_piv/nmr_zomb2/alert_sham_m_21.wav"
}
ENT.SoundTbl_CombatIdle = {
	"vj_piv/nmr_zomb2/pursuit_sham_m_01.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_02.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_03.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_04.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_05.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_06.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_07.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_08.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_09.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_10.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_11.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_12.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_13.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_14.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_15.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_16.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_17.wav",
	"vj_piv/nmr_zomb2/pursuit_sham_m_18.wav"
}
ENT.SoundTbl_BeforeMeleeAttack = {
	"vj_piv/nmr_zomb1/attack_sham_m_01.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_02.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_03.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_04.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_05.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_06.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_07.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_08.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_09.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_10.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_11.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_12.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_13.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_14.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_15.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_16.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_17.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_18.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_19.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_20.wav",	
	"vj_piv/nmr_zomb1/attack_sham_m_21.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_22.wav"	
}
ENT.SoundTbl_LeapAttackJump = {
	"vj_piv/nmr_zomb1/attack_sham_m_01.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_02.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_03.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_04.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_05.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_06.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_07.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_08.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_09.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_10.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_11.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_12.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_13.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_14.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_15.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_16.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_17.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_18.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_19.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_20.wav",	
	"vj_piv/nmr_zomb1/attack_sham_m_21.wav",
	"vj_piv/nmr_zomb1/attack_sham_m_22.wav"
}
ENT.SoundTbl_Pain = {
	"vj_piv/nmr_zomb2/pain01.wav",
	"vj_piv/nmr_zomb2/pain02.wav",
	"vj_piv/nmr_zomb2/pain03.wav",
	"vj_piv/nmr_zomb2/pain04.wav",
	"vj_piv/nmr_zomb2/pain05.wav"
}
ENT.SoundTbl_Death = {
	"vj_piv/nmr_zomb2/die01.wav",
	"vj_piv/nmr_zomb2/die02.wav",
	"vj_piv/nmr_zomb2/die03.wav",
	"vj_piv/nmr_zomb2/die04.wav",
	"vj_piv/nmr_zomb2/die05.wav"
}

/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/