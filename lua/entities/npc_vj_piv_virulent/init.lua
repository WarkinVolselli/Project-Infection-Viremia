AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_piv/specials/virulent/Poison.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 400

ENT.PIV_Infection = true
ENT.PIV_Infection_IsWalker = true

ENT.PIV_IsSpecial = true

ENT.PIV_Virulent_Explode = false

ENT.BloodColor = "Yellow" -- The blood type, this will determine what it should use (decal, particle, etc.)

ENT.AnimTbl_MeleeAttack = {"vjges_melee_01"} -- Melee Attack Animations
ENT.MeleeAttackDistance = 32 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 60 -- How far does the damage go?
ENT.MeleeAttackDamage = math.random(20,25)

ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeUseAttachmentForPos = true -- Should the projectile spawn on a attachment?
ENT.RangeUseAttachmentForPosID = "Blood_Right" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true
ENT.AnimTbl_RangeAttack = {"vjges_throw","vjges_throw","vjges_throw"} -- Range Attack Animations
ENT.RangeAttackAnimationStopMovement = false -- Should it stop moving when performing a range attack?
ENT.RangeAttackEntityToSpawn = "obj_vj_piv_flesh" -- The entity that is spawned when range attacking
ENT.RangeDistance = 600 -- This is how far away it can shoot
ENT.RangeToMeleeDistance = 200 -- How close does it have to be until it uses melee?
ENT.TimeUntilRangeAttackProjectileRelease = 1 -- How much time until the projectile code is ran?
ENT.NextRangeAttackTime = 5
ENT.NextRangeAttackTime_DoRand = 10
ENT.RangeAttackExtraTimers = {1.05, 1.1, 1.15, 1.2} -- Extra range attack timers | it will run the projectile code after the given amount of seconds
ENT.Immune_AcidPoisonRadiation = true -- Makes the SNPC not get damage from Acid, posion, radiation
	-- ====== Flinching Code ====== --
ENT.CanFlinch = 1 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.FlinchChance = 4
ENT.HitGroupFlinching_Values = {
	{HitGroup={HITGROUP_CHEST}, Animation={"vjges_flinchc"}},
	{HitGroup={HITGROUP_RIGHTARM}, Animation={"vjges_flinchl"}},
	{HitGroup={HITGROUP_RIGHTLEG}, Animation={"vjseq_flinchr"}}
}

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Idle = {"vj_piv/virulent/bloat_idle1.ogg","vj_piv/virulent/bloat_idle2.ogg","vj_piv/virulent/bloat_idle8.ogg","vj_piv/virulent/bloat_idle10.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_01.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_02.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_03.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_04.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_05.ogg"}
ENT.SoundTbl_Alert = {"vj_piv/virulent/bloat_alert_01.wav","vj_piv/virulent/bloat_alert_02.wav","vj_piv/virulent/bloat_alert_03.wav","vj_piv/virulent/bloat_alert_04.wav","vj_piv/virulent/bloat_alert_05.wav"}
ENT.SoundTbl_CombatIdle = {"vj_piv/virulent/bloat_alert_01.wav","vj_piv/virulent/bloat_alert_02.wav","vj_piv/virulent/bloat_alert_03.wav","vj_piv/virulent/bloat_alert_04.wav","vj_piv/virulent/bloat_alert_05.wav","vj_piv/husk/zed_clot_alpha_vox_chuff_01.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_02.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_03.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_04.ogg","vj_piv/husk/zed_clot_alpha_vox_chuff_05.ogg"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_piv/virulent/zed_bloater_vox_aggro_01_rev1.ogg","vj_piv/husk/zed_clot_alpha_vox_grab_02.ogg","vj_piv/husk/zed_clot_alpha_vox_grab_03.ogg"}
ENT.SoundTbl_Pain = {"vj_piv/virulent/bloat_vox_pain_01_rev1.ogg","vj_piv/virulent/bloat_vox_pain_02_rev1.ogg","vj_piv/virulent/bloat_vox_pain_04_rev1.ogg","vj_piv/virulent/bloat_vox_pain_06_rev1.ogg","vj_piv/virulent/bloat_vox_pain_08_rev1.ogg","vj_piv/virulent/bloat_vox_pain_09_rev1.ogg"}
ENT.SoundTbl_Death = {"vj_piv/husk/zed_clotalpha_vox_roar_med_01.ogg","vj_piv/husk/zed_clotalpha_vox_roar_med_02.ogg","vj_piv/husk/zed_clotalpha_vox_roar_med_03.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_med_01.ogg","vj_piv/husk/zed_clot_alpha_vox_taunt_med_02.ogg"}
ENT.SoundTbl_BeforeRangeAttack = {"vj_piv/virulent/bloat_vox_puke_long_01.ogg","vj_piv/virulent/bloat_vox_puke_med_01.ogg","vj_piv/virulent/bloat_puke_01.wav"}
ENT.SoundTbl_RangeAttack = {"physics/body/body_medium_break2.wav","physics/body/body_medium_break3.wav","physics/body/body_medium_break4.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(TheProjectile)
	return self:CalculateProjectile("Curve",self:GetPos() +self:GetUp() *self.RangeAttackPos_Up +self:GetForward() *self.RangeAttackPos_Forward, self:GetEnemy():GetPos() +self:GetEnemy():OBBCenter() +self:GetEnemy():GetRight() *math.Rand(0,60) +self:GetEnemy():GetForward() *math.Rand(-50,50) +self:GetEnemy():GetUp() *math.Rand(-50,50), 600)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnInitialize()

	self:SetSkin(math.random(0,3))
	
	self:SetCollisionBounds(Vector(22,22,60), Vector(-22,-22,0))
	
	local type = math.random(1,2)
	
	if type == 1 then
	self.AnimTbl_Idle = {ACT_IDLE}
	self.AnimTbl_Walk = {ACT_WALK}
	self.AnimTbl_Run = {ACT_WALK}
	self.PIV_MovementAnims = 1
	elseif type == 2 then
	self.AnimTbl_Run = {ACT_WALK_STIMULATED}
	self.PIV_MovementAnims = 2
	end
	
	if self.PIV_Mutated == true then
	self.AnimTbl_Run = {ACT_RUN}
	end
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnPreInitialize()
	if GetConVar("vj_piv_virulent_explode"):GetInt() == 1 && math.random(1,GetConVar("vj_piv_virulent_explode_chance"):GetInt()) == 1 then
		self.PIV_Virulent_Explode = true
		self.HasDeathAnimation = true
		self.HasDeathRagdoll = false
		self.DeathAnimationChance = 1
		self.AnimTbl_Death = {"vjseq_releasecrab"}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)

	if self:IsMoving()	then
	
		self.MeleeAttackAnimationAllowOtherTasks = true
		
		self.AnimTbl_MeleeAttack = {"vjges_melee_01","vjges_melee_02","vjges_melee_03"}
		self.MeleeAttackDistance = 32 
		self.MeleeAttackDamageDistance = 60 
		self.MeleeAttackDamage = math.random(20,25)
		self.SoundTbl_MeleeAttack = {"vj_piv/husk/zombie_slice_1.wav","vj_piv/husk/zombie_slice_2.wav","vj_piv/husk/zombie_slice_3.wav","vj_piv/husk/zombie_slice_4.wav","vj_piv/husk/zombie_slice_5.wav","vj_piv/husk/zombie_slice_6.wav"}
		
	else
	
		self.MeleeAttackAnimationAllowOtherTasks = false
		
		self.AnimTbl_MeleeAttack = {"vjseq_melee_01_standing","vjseq_melee_02_standing","vjseq_melee_03_standing"}
		self.MeleeAttackDistance = 32 
		self.MeleeAttackDamageDistance = 60 
		self.MeleeAttackDamage = math.random(20,25)
		self.SoundTbl_MeleeAttack = {"vj_piv/husk/zombie_slice_1.wav","vj_piv/husk/zombie_slice_2.wav","vj_piv/husk/zombie_slice_3.wav","vj_piv/husk/zombie_slice_4.wav","vj_piv/husk/zombie_slice_5.wav","vj_piv/husk/zombie_slice_6.wav"}
		
	end
		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnThink_AIEnabled()

    if
		GetConVar("vj_piv_virulent_run"):GetInt() == 1 &&
        self.NextRunT < CurTime() &&
        !self.Running &&
        self:GetEnemy() != nil &&
        !self.LNR_Crippled &&
        !self.Dead &&
        !self:IsBusy() &&
		self.PIV_Mutated == false
		
    then

        VJ_EmitSound(self,self.SoundTbl_Charge,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))

        self.Running = true
        self.RunT = CurTime() + math.random(5,10)

        self.AnimTbl_Run = {ACT_RUN}

    end

    if
        self.Running &&
        self.RunT < CurTime() &&
        !self.Dead &&
        !self.PIV_Crippled && 
		self.PIV_Mutated == false
    then

        self.Running = false
        self.NextRunT = CurTime() + math.random(6,12)
	    VJ_EmitSound(self,self.SoundTbl_Pain,self.AlertSoundLevel,self:VJ_DecideSoundPitch(self.BeforeMeleeAttackSoundPitch.a,self.BeforeMeleeAttackSoundPitch.b))
		
		if self.PIV_MovementAnims == 1 then
			self.AnimTbl_Run = {ACT_WALK}
		elseif self.PIV_MovementAnims == 2 then
			self.AnimTbl_Run = {ACT_WALK_STIMULATED}
		end

    end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if hitgroup == HITGROUP_HEAD && GetConVar("vj_piv_headshot_damage"):GetInt() == 1 then
		dmginfo:ScaleDamage(GetConVarNumber("vj_piv_headshot_damage_mult"))
	else
		dmginfo:ScaleDamage(0.9)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
	if dmginfo:GetDamage() > 49 or dmginfo:GetDamageForce():Length() > 10000 then
		if self.PIV_NextShoveT < CurTime() then
			self:VJ_ACT_PLAYACTIVITY("vjges_throwwarning",true,false,false)
			self.PIV_NextShoveT = CurTime() + math.random(5,8)
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
self.Light2:SetKeyValue("brightness", "2")
self.Light2:SetKeyValue("distance", "50")
self.Light2:SetLocalPos(self:GetPos())
self.Light2:SetLocalAngles(self:GetAngles())
self.Light2:Fire("Color", "255 93 0 255")
self.Light2:SetParent(self)
self.Light2:Spawn()
self.Light2:Activate()
self.Light2:Fire("SetParentAttachment","eyes")
self.Light2:Fire("TurnOn", "", 0)
self:DeleteOnRemove(self.Light2)

end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CustomOnAlert()
    self.NextRunT = CurTime() + math.random(2,8)
	if GetConVar("vj_piv_alert_anim"):GetInt() == 1 && self.PIV_Crippled == false && self.PIV_FuckingCrawlingLittleCunt == false && self.PIV_Resting == 0 && self:GetSequence() != self:LookupSequence(ACT_OPEN_DOOR) then
		if math.random(1,GetConVar("vj_piv_alert_anim_chance"):GetInt()) == 1 then
			self:VJ_ACT_PLAYACTIVITY("vjges_throwwarning",false,false,true)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnKilled(dmginfo,hitgroup)
   	if self.PIV_Virulent_Explode == true then
		util.VJ_SphereDamage(self,self,self:GetPos(),150,math.random(0,0),DMG_BLAST,true,true,{Force=20})
		for k,v in ipairs(ents.FindInSphere(self:GetPos(),150)) do
			v:TakeDamage(math.random(30,40))
		end
		util.ScreenShake(self:GetPos(),44,600,1.5,2000)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
	if self.PIV_Virulent_Explode == true then
		VJ_EmitSound(self,{"vj_piv/gore/PreExplode1.wav","vj_piv/gore/PreExplode2.wav","vj_piv/gore/PreExplode3.wav"},75,math.random(100,100))
	timer.Simple(0.25,function() if IsValid(self) then
		VJ_EmitSound(self,{"vj_piv/gore/HeadshotDevestate3.wav","vj_piv/gore/HeadshotDevestate4.wav","vj_piv/gore/HeadshotDevestate5.wav"},75,math.random(100,100))
	timer.Simple(0.70,function() if IsValid(self) then
		VJ_EmitSound(self,{"vj_piv/gore/Explode1.wav","vj_piv/gore/Explode2.wav","vj_piv/gore/Explode3.wav"},100,math.random(100,100))
        local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetPos()+ self:GetUp()*80)
		bloodeffect:SetColor(VJ_Color2Byte(Color(155,137,59,255)))
		bloodeffect:SetScale(250)
		util.Effect("VJ_Blood1",bloodeffect)
		
		local bloodspray = EffectData()
			bloodspray:SetOrigin(self:GetPos() +self:OBBCenter())
			bloodspray:SetColor(VJ_Color2Byte(Color(155,137,59,255)))
			bloodspray:SetScale(1)
			bloodspray:SetFlags(3)
			bloodspray:SetColor(1)
			util.Effect("bloodspray",bloodspray)
			util.Effect("bloodspray",bloodspray)
			

			
		
		self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,400)})
		self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,400)})
		self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,200)})
		self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,200)})
		self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,500)})
		self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,500)})
		self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,500)})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Small",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Big",{Pos=self:LocalToWorld(Vector(0,0,35))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Big",{Pos=self:LocalToWorld(Vector(0,0,35))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Big",{Pos=self:LocalToWorld(Vector(0,0,35))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Big",{Pos=self:LocalToWorld(Vector(0,0,40))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Big",{Pos=self:LocalToWorld(Vector(0,0,40))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Big",{Pos=self:LocalToWorld(Vector(0,0,40))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Big",{Pos=self:LocalToWorld(Vector(0,0,35))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Big",{Pos=self:LocalToWorld(Vector(0,0,30))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Big",{Pos=self:LocalToWorld(Vector(0,0,40))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Big",{Pos=self:LocalToWorld(Vector(0,0,40))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Big",{Pos=self:LocalToWorld(Vector(0,0,35))})
		self:CreateGibEntity("obj_vj_gib","UseAlien_Big",{Pos=self:LocalToWorld(Vector(0,0,30))})
		
        for i=1,math.random(1,50) do
            local carproj = ents.Create("obj_vj_piv_flesh")
            carproj:SetPos(self:LocalToWorld(Vector(0,0,0)))
            carproj:SetAngles(Angle(math.random(0,360),math.random(0,360),math.random(0,360)))
            carproj:SetOwner(self)
            carproj:Spawn()
            carproj:Activate()
            local phys = carproj:GetPhysicsObject()
            if IsValid(phys) then
                phys:SetVelocity(Vector(math.Rand(-100,100),math.Rand(-100,100),math.Rand(200,400)) *2 +self:GetUp()*math.Rand(25,50))
            end
        end
	
end
end)
end
end)
end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	if self.PIV_Virulent_Explode then 
		self.AnimTbl_Death = {
			"vjseq_releasecrab"
		}
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/