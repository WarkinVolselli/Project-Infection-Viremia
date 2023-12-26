AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/hl2/combine/Combine_Super_Soldier.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()

	self.NextSoundTime_Breath = VJ_Set(15,60)
	
	if GetConVar("vj_piv_lights"):GetInt() == 1 then 

		self.Light2 = ents.Create("light_dynamic")
		self.Light2:SetKeyValue("brightness", "2")
		self.Light2:SetKeyValue("distance", "50")
		self.Light2:SetLocalPos(self:GetPos())
		self.Light2:SetLocalAngles(self:GetAngles())
		self.Light2:Fire("Color", "255 0 0 255")
		self.Light2:SetParent(self)
		self.Light2:Spawn()
		self.Light2:Activate()
		self.Light2:Fire("SetParentAttachment","eyes")
		self.Light2:Fire("TurnOn", "", 0)
		self:DeleteOnRemove(self.Light2)
		
        self.EyeGlow = ents.Create("env_sprite")
        self.EyeGlow:SetKeyValue("model","sprites/glow1.vmt")
        self.EyeGlow:SetKeyValue("scale","0.25")
        self.EyeGlow:SetKeyValue("rendermode","5")
        self.EyeGlow:SetKeyValue("rendercolor","255 0 0 255")
        self.EyeGlow:SetKeyValue("spawnflags","1") 
        self.EyeGlow:SetParent(self)
        self.EyeGlow:Fire("SetParentAttachment","eyes",0)
        self.EyeGlow:Spawn()
        self.EyeGlow:Activate()
        self:DeleteOnRemove(self.EyeGlow)

	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.StartHealth = self.StartHealth * 1.5
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/