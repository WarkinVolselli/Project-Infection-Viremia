include('shared.lua')

function ENT:Draw() end

function ENT:Initialize()
	self.IdleEffect = ParticleEmitter(self:GetPos())
end

function ENT:Think()
	local texture = "decals/yblood" .. math.random(6)
	local particle = self.IdleEffect:Add(texture,self:GetPos())
 	if particle then
 		particle:SetVelocity(VectorRand() *math.Rand(0,200))
 		particle:SetLifeTime(0)
 		particle:SetDieTime(math.Rand(0.2,0.6))
 		particle:SetStartAlpha(math.Rand(100,255))
 		particle:SetEndAlpha(0)
 		particle:SetStartSize(math.Rand(4,8))
 		particle:SetEndSize(math.Rand(4,8))
 		particle:SetRoll(math.Rand(0,360))
 		particle:SetAirResistance(400)
 		particle:SetGravity(Vector(0,0,-200))
 	end
end