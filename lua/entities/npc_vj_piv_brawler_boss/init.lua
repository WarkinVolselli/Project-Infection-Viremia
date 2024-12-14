include("entities/npc_vj_piv_brawler/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnThink_AIEnabled()
	if !IsValid(self:GetEnemy()) then
		self.AnimTbl_Walk = {ACT_WALK}
		self.AnimTbl_Run = {ACT_RUN}
	else
		if self:GetPos():Distance(self:GetEnemy():GetPos()) < 200 then
			self.AnimTbl_Walk = {ACT_WALK}
			self.AnimTbl_Run = {ACT_WALK}
		else
			self.AnimTbl_Walk = {ACT_WALK}
			self.AnimTbl_Run = {ACT_RUN}
		end
	end
	
	-- Dodge System
    if self.VJ_IsBeingControlled == true or self.PIV_Crawler or self.PIV_Crippled or self.Flinching or self:GetSequence() == self:LookupSequence(ACT_BIG_FLINCH) or self.DeathAnimationCodeRan then return end
    if IsValid(self:GetEnemy()) == true && self.MeleeAttacking == false && self.VJ_IsBeingControlled == false && CurTime() > self.PIV_NextStrafeT && self:GetPos():Distance(self:GetEnemy():GetPos()) < 200 && self:GetPos():Distance(self:GetEnemy():GetPos()) > 50 then
        self:StopMoving()
        self:VJ_ACT_PLAYACTIVITY({"vjseq_sway_b","vjseq_sway_f","vjseq_sway_l","vjseq_sway_r"}, true, false, false)
		VJ.EmitSound(self,"vj_piv/Miss"..math.random(1,5)..".wav",70,100)
		util.ScreenShake(self:GetPos(), 100, 200, 1, 1000)
        self.PIV_NextRunT = CurTime() + 2
        self.PIV_NextStrafeT = CurTime() + math.random(3,6)
	end

	if IsValid(self:GetEnemy()) && self.PIV_SpawnCoolDownT < CurTime() && self.VJ_IsBeingControlled == false && GetConVar("vj_piv_boss_summon"):GetInt() == 1 then

		self:PIV_SummonHelp_Spawn()
		
		self:VJ_ACT_PLAYACTIVITY("vjseq_nz_taunt_5",true,false,false)

		self.PIV_SpawnCoolDownT = CurTime() + 10

	end

end
--------------------
function ENT:PIV_SummonHelp_Spawn()
	if !IsValid(self.ThugHelp1) then
		self.ThugHelp1 = self:PIV_SummonHelp()
		return 15
	elseif !IsValid(self.ThugHelp2) then
		self.ThugHelp2 = self:PIV_SummonHelp()
		return 15
	elseif !IsValid(self.ThugHelp3) then
		self.ThugHelp3 = self:PIV_SummonHelp()
		return 15
	elseif !IsValid(self.ThugHelp4) then
		self.ThugHelp4 = self:PIV_SummonHelp()
		return 15
	end
	return 15
end
--------------------
function ENT:PIV_SummonHelp()
    
	if math.random(1,3) == 1 then
		self.ThugMinion = "npc_vj_piv_brawler_f"
	else
		self.ThugMinion = "npc_vj_piv_brawler"
    end
	
	local tr = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() + self:GetForward() * math.Rand(-2000, 2000) + self:GetRight() * math.Rand(-2000, 2000) + self:GetUp() * 50,
		filter = {self},
		mask = MASK_ALL,
	})

	local spawnpos = tr.HitPos + tr.HitNormal*300

	local ally = ents.Create(self.ThugMinion)

	ally:SetPos(spawnpos)
	ally:SetAngles(self:GetAngles())
	ally:Spawn()
	ally:Activate()
	ally:ForceDig()
	ally.VJ_NPC_Class = self.VJ_NPC_Class
	return ally
end
--------------------
function ENT:MeleeAttackKnockbackVelocity(hitEnt)
	return self:GetForward()*math.random(180, 220) + self:GetUp()*math.random(90,120)
end
--------------------