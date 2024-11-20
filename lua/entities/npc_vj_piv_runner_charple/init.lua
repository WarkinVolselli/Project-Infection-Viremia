include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
ENT.Model = {"models/vj_piv/hl2/charple.mdl"}
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.GeneralSoundPitch1 = 80
	self.GeneralSoundPitch2 = 90
	self.MeleeAttackSoundPitch = VJ.SET(90, 100)
	self.PIV_IsRunner = true
	self.PIV_Infection_IsWalker = false
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	self:SetSkin(math.random(0,5))
end
--------------------
function ENT:Zombie_CustomOnTakeDamage(dmginfo,hitgroup,status)
	-- take a little less damage from fire
	if
		dmginfo:IsDamageType(DMG_BURN) or
		dmginfo:IsDamageType(DMG_SLOWBURN) or
		(
			self:IsOnFire() &&
			IsValid(dmgInflictor) &&
			IsValid(dmgAttacker) &&
			dmgInflictor:GetClass() == "entityflame" &&
			dmgAttacker:GetClass() == "entityflame"
		)
	then
		dmginfo:ScaleDamage(0.80)
	end
end