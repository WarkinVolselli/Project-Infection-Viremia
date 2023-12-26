AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/drowned/drowned_haimatsu.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 200

ENT.PIV_Infection_IsDrowned = true

ENT.SoundTbl_Idle = {"vj_piv/drowned/suit/deepsea_suit_idle_001.wav","vj_piv/drowned/suit/deepsea_suit_idle_002.wav","vj_piv/drowned/suit/deepsea_suit_idle_003.wav","vj_piv/drowned/suit/deepsea_suit_idle_004.wav","vj_piv/drowned/suit/deepsea_suit_idle_005.wav","vj_piv/drowned/suit/deepsea_suit_idle_006.wav","vj_piv/drowned/suit/deepsea_suit_idle_007.wav","vj_piv/drowned/suit/deepsea_suit_idle_008.wav","vj_piv/drowned/suit/deepsea_suit_idle_009.wav","vj_piv/drowned/suit/deepsea_suit_idle_010.wav","vj_piv/drowned/suit/deepsea_suit_idle_011.wav","vj_piv/drowned/suit/deepsea_suit_idle_012.wav","vj_piv/drowned/suit/deepsea_suit_idle_013.wav"}
ENT.SoundTbl_Alert = {"vj_piv/drowned/suit/deepsea_suit_hears_something_001.wav","vj_piv/drowned/suit/deepsea_suit_hears_something_002.wav","vj_piv/drowned/suit/deepsea_suit_hears_something_003.wav","vj_piv/drowned/suit/deepsea_suit_hears_something_004.wav","vj_piv/drowned/suit/deepsea_suit_hears_something_005.wav","vj_piv/drowned/suit/deepsea_suit_hears_something_006.wav","vj_piv/drowned/suit/deepsea_suit_hears_something_007.wav","vj_piv/drowned/suit/deepsea_suit_hears_something_008.wav","vj_piv/drowned/suit/deepsea_suit_hears_something_009.wav"}
ENT.SoundTbl_CombatIdle = {"vj_piv/drowned/suit/deepsea_suit_search_001.wav","vj_piv/drowned/suit/deepsea_suit_search_002.wav","vj_piv/drowned/suit/deepsea_suit_search_003.wav","vj_piv/drowned/suit/deepsea_suit_search_004.wav","vj_piv/drowned/suit/deepsea_suit_search_005.wav","vj_piv/drowned/suit/deepsea_suit_search_006.wav","vj_piv/drowned/suit/deepsea_suit_search_007.wav","vj_piv/drowned/suit/deepsea_suit_search_008.wav","vj_piv/drowned/suit/deepsea_suit_search_009.wav","vj_piv/drowned/suit/deepsea_suit_search_010.wav","vj_piv/drowned/suit/deepsea_suit_search_011.wav"}
ENT.SoundTbl_Pain = {"vj_piv/drowned/suit/deepsea_suit_hunt_001.wav","vj_piv/drowned/suit/deepsea_suit_hunt_002.wav","vj_piv/drowned/suit/deepsea_suit_hunt_003.wav","vj_piv/drowned/suit/deepsea_suit_hunt_004.wav","vj_piv/drowned/suit/deepsea_suit_hunt_005.wav"}
ENT.SoundTbl_Death = {"vj_piv/drowned/suit/deepsea_suit_hears_something_001.wav","vj_piv/drowned/suit/deepsea_suit_hears_something_002.wav","vj_piv/drowned/suit/deepsea_suit_hears_something_003.wav","vj_piv/drowned/suit/deepsea_suit_hears_something_004.wav","vj_piv/drowned/suit/deepsea_suit_hears_something_005.wav","vj_piv/drowned/suit/deepsea_suit_hears_something_006.wav","vj_piv/drowned/suit/deepsea_suit_hears_something_007.wav","vj_piv/drowned/suit/deepsea_suit_hears_something_008.wav","vj_piv/drowned/suit/deepsea_suit_hears_something_009.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/drowned/suit/deepsea_suit_hunt_001.wav","vj_piv/drowned/suit/deepsea_suit_hunt_002.wav","vj_piv/drowned/suit/deepsea_suit_hunt_003.wav","vj_piv/drowned/suit/deepsea_suit_hunt_004.wav","vj_piv/drowned/suit/deepsea_suit_hunt_005.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()
	if GetConVarNumber("vj_piv_reducedlights") == 1 then
		self.light = ents.Create("env_projectedtexture")
		self.light:SetLocalPos( self:GetPos() + Vector(0,0,0) )
		self.light:SetLocalAngles( self:GetAngles() + Angle(0,0,0) )
		self.light:SetKeyValue('lightcolor', "246 242 119")
		self.light:SetKeyValue('lightfov', '70')
		self.light:SetKeyValue('farz', '1000')
		self.light:SetKeyValue('nearz', '10')
		self.light:SetKeyValue('shadowquality', '0')
		self.light:Input( 'SpotlightTexture', NULL, NULL, "effects/flashlight/soft")
		self.light:SetOwner(self)
		self.light:SetParent(self)
		self.light:Spawn()
		self.light:Activate()
		self.light:Fire("setparentattachment", "eyes")
		self.light:DeleteOnRemove(self.light)
	else
		self.light1 = ents.Create("env_projectedtexture")
		self.light1:SetLocalPos( self:GetPos() + Vector(0,0,0) )
		self.light1:SetLocalAngles( self:GetAngles() + Angle(0,0,0) )
		self.light1:SetKeyValue('lightcolor', "246 242 119")
		self.light1:SetKeyValue('lightfov', '50')
		self.light1:SetKeyValue('farz', '1000')
		self.light1:SetKeyValue('nearz', '10')
		self.light1:SetKeyValue('shadowquality', '0')
		self.light1:Input( 'SpotlightTexture', NULL, NULL, "effects/flashlight/soft")
		self.light1:SetOwner(self)
		self.light1:SetParent(self)
		self.light1:Spawn()
		self.light1:Activate()
		self.light1:Fire("setparentattachment", "helmetglow1")
		self.light1:DeleteOnRemove(self.light1)
		self.light2 = ents.Create("env_projectedtexture")
		self.light2:SetLocalPos( self:GetPos() + Vector(0,0,0) )
		self.light2:SetLocalAngles( self:GetAngles() + Angle(0,0,0) )
		self.light2:SetKeyValue('lightcolor', "246 242 119")
		self.light2:SetKeyValue('lightfov', '50')
		self.light2:SetKeyValue('farz', '1000')
		self.light2:SetKeyValue('nearz', '10')
		self.light2:SetKeyValue('shadowquality', '0')
		self.light2:Input( 'SpotlightTexture', NULL, NULL, "effects/flashlight/soft")
		self.light2:SetOwner(self)
		self.light2:SetParent(self)
		self.light2:Spawn()
		self.light2:Activate()
		self.light2:Fire("setparentattachment", "helmetglow2")
		self.light2:DeleteOnRemove(self.light2)
	end
	
	if GetConVarNumber("vj_npc_noidleparticle") == 0 then
		local eyeglow1 = ents.Create("env_sprite")
		eyeglow1:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
		eyeglow1:SetKeyValue("scale","0.06")
		eyeglow1:SetKeyValue("rendermode","5")
		eyeglow1:SetKeyValue("rendercolor","246 242 119")
		eyeglow1:SetKeyValue("spawnflags","1")
		eyeglow1:SetParent(self)
		eyeglow1:Fire("SetParentAttachment","helmetglow1",0)
		eyeglow1:Spawn()
		eyeglow1:Activate()
		self:DeleteOnRemove(eyeglow1)    

		local eyeglow2 = ents.Create("env_sprite")
		eyeglow2:SetKeyValue("model","vj_base/sprites/vj_glow1.vmt")
		eyeglow2:SetKeyValue("scale","0.06")
		eyeglow2:SetKeyValue("rendermode","5")
		eyeglow2:SetKeyValue("rendercolor","246 242 119")
		eyeglow2:SetKeyValue("spawnflags","1")
		eyeglow2:SetParent(self)
		eyeglow2:Fire("SetParentAttachment","helmetglow2",0)
		eyeglow2:Spawn()
		eyeglow2:Activate()
		self:DeleteOnRemove(eyeglow2)  
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)

		if (dmginfo:IsBulletDamage()) then
			dmginfo:ScaleDamage(0.75)
			local attacker = dmginfo:GetAttacker()
			self.DamageSpark1 = ents.Create("env_spark")
			self.DamageSpark1:SetKeyValue("Magnitude","1")
			self.DamageSpark1:SetKeyValue("Spark Trail Length","1")
			self.DamageSpark1:SetPos(dmginfo:GetDamagePosition())
			self.DamageSpark1:SetAngles(self:GetAngles())
			self.DamageSpark1:SetParent(self)
			self.DamageSpark1:Spawn()
			self.DamageSpark1:Activate()
			self.DamageSpark1:Fire("StartSpark", "", 0)
			self.DamageSpark1:Fire("StopSpark", "", 0.001)
			self:DeleteOnRemove(self.DamageSpark1)
		end
		if self.HasSounds == true && self.HasImpactSounds == true then VJ_EmitSound(self,"vj_impact_metal/bullet_metal/metalsolid"..math.random(1,10)..".wav",70) 
	end	

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PIV_CustomMutate()
self.AnimTbl_Walk = {ACT_WALK}
self.AnimTbl_Run = {ACT_RUN_RELAXED}

self.StartHealth = self.StartHealth *2
self:SetHealth(self.StartHealth)
		
local mymaxhealth = self:Health()
self:SetMaxHealth(mymaxhealth)

self.PIV_LegHP = self.PIV_LegHP *2

if GetConVar("vj_piv_lights"):GetInt() == 1 then 

self.Light2 = ents.Create("light_dynamic")
self.Light2:SetKeyValue("brightness", "1")
self.Light2:SetKeyValue("distance", "50")
self.Light2:SetLocalPos(self:GetPos())
self.Light2:SetLocalAngles(self:GetAngles())
self.Light2:Fire("Color", "0 161 255 255")
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