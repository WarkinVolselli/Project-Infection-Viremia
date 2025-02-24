include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	self.Model = {"models/vj_piv/hl2/charple.mdl"}
	self.StartHealth = 200

	self.PIV_IsSpecial = true
	self.PIV_HasSubclasses = false
	self.PIV_CanBeCrippled = false
	self.PIV_CanBeThrower = false

	self.Immune_Fire = true -- Immune to fire-type damages

	self.HasLeapAttack = false 
	self.LeapAttackDamage = math.random(15,20)
	self.LeapAttackDamageType = DMG_SLASH
	self.AnimTbl_LeapAttack = {ACT_LEAP} 
	self.LeapDistance = 300
	self.LeapToMeleeDistance = 150
	self.LeapAttackDamageDistance = 150
	self.TimeUntilLeapAttackDamage = 0.8
	self.TimeUntilLeapAttackVelocity = 0.1 
	self.NextLeapAttackTime = 8
	self.NextAnyAttackTime_Leap = 1
	self.LeapAttackVelocityForward = 100
	self.LeapAttackVelocityUp = 200
end
--------------------
function ENT:Zombie_GiveVoice()
	self.SoundTbl_Breath = {"ambient/fire/firebig.wav"}
	self.BreathSoundLevel = 60
	self.SoundTbl_Idle = {"vj_piv/stoker/idle_1.mp3","vj_piv/stoker/idle_2.mp3","vj_piv/stoker/idle_3.mp3","vj_piv/stoker/idle_4.mp3"}
	self.SoundTbl_BeforeMeleeAttack = {"vj_piv/stoker/attack_1.mp3","vj_piv/stoker/attack_2.mp3"}
	self.SoundTbl_Alert = {"vj_piv/stoker/attack_1.mp3","vj_piv/stoker/attack_2.mp3"}
	self.SoundTbl_Death = {"vj_piv/stoker/death.mp3"}

	self.SoundTbl_LeapAttackJump = {"vj_piv/stoker/attack_1.mp3","vj_piv/stoker/attack_2.mp3"}
	self.SoundTbl_LeapAttackDamage = {"ambient/fire/ignite.wav"}
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	self.HasBreathSound = false
	self:SetSkin(6)
end
--------------------
function ENT:Zombie_CustomOnTakeDamage_PreDamage(dmginfo,hitgroup)

	if self.Apeshit == false &&
		(
			dmginfo:IsBulletDamage() or
			dmginfo:IsExplosionDamage() or
			dmginfo:IsDamageType(DMG_BUCKSHOT) or
			dmginfo:IsDamageType(DMG_SHOCK) or
			dmginfo:IsDamageType(DMG_SLASH) or
			dmginfo:IsDamageType(DMG_BURN)
		)
	then

		self.Apeshit = true
		self.HasLeapAttack = true
		self.GodMode = true -- Immune to everything

		VJ.EmitSound(self,"vj_piv/stoker/rage_"..math.random(1,2)..".mp3",0,90)
		local tbl = VJ.PICK({"nz_sonic_attack_1"})
		self:VJ_ACT_PLAYACTIVITY(tbl,true,VJ.AnimDuration(self,tbl),false)
		
		self:DropTheFuckignWeaponGoddamn()
		
		timer.Simple(1.2,function() if IsValid(self) then
			self:SetSkin(8)
			self.DeathCorpseSkin = 7
			
			ParticleEffectAttach("fire_medium_03",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
			self.HasBreathSound = true
			
			self.Light1 = ents.Create("light_dynamic")
			self.Light1:SetKeyValue("brightness", "0.04")
			self.Light1:SetKeyValue("distance", "250")
			self.Light1:SetLocalPos(self:GetPos())
			self.Light1:SetLocalAngles(self:GetAngles())
			self.Light1:Fire("Color", "255 100 0 0")
			self.Light1:SetParent(self)
			self.Light1:Spawn()
			self.Light1:Activate()
			self.Light1:Fire("SetParentAttachment","chest")
			self.Light1:Fire("TurnOn", "", 0)
			self:DeleteOnRemove(self.Light1)
				
			ParticleEffectAttach("striderbuster_break_explode",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
			ParticleEffectAttach("striderbuster_break_explode",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
			effects.BeamRingPoint(self:GetPos(), 0.3, 2, 400, 16, 0, Color(255, 255, 255), {material="sprites/flame01", framerate=20})
			effects.BeamRingPoint(self:GetPos(), 0.3, 2, 200, 16, 0, Color(255, 255, 255), {material="sprites/flame01", framerate=20})
			
			VJ.EmitSound(self,"ambient/fire/ignite.wav",100,math.random(80,100))
			
			VJ.ApplyRadiusDamage(self, self, self:GetPos(), 200, 10, self.MeleeAttackDamageType, true, true, {DisableVisibilityCheck=true, Force=80})
			util.ScreenShake(self:GetPos(),50,600,2,1000)
			util.ScreenShake(self:GetPos(),50,600,2,1000)
	
		end
	end)

	timer.Simple(2.3,function() if IsValid(self) then
		self.GodMode = false -- Immune to everything
		end
	end)
		
	self.SoundTbl_Idle = {"vj_piv/stoker/attack_1.mp3","vj_piv/stoker/attack_2.mp3"}
	self.SoundTbl_Alert = {"vj_piv/stoker/rage_1.mp3","vj_piv/stoker/rage_2.mp3"}

	end   
	
	if self.Apeshit == true then
		dmginfo:ScaleDamage(0.5)
	end

end
--------------------
function ENT:CustomOnLeapAttack_AfterChecks(hitEnt, isProp)
    hitEnt:Ignite(math.random(2,4)) 
    return false
end
--------------------