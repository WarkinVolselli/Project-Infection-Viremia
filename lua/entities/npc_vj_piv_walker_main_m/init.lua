include("entities/npc_vj_piv_base/init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
--------------------
function ENT:Zombie_CustomOnPreInitialize()
	if self:GetClass() == "npc_vj_piv_walker_main_f" || self:GetClass() == "npc_vj_piv_runner_main_f" then
		self.PIV_Gender = 2
		if math.random(1,2) == 1 then
			self.Model = {"models/vj_piv/hl2/main/alyx.mdl"}
			self.PIV_Type = 9 -- Alyx Vance
		else
			self.Model = {"models/vj_piv/hl2/main/mossman.mdl","models/vj_piv/hl2/main/mossman_ep1.mdl"}	
			self.PIV_Type = 10 -- Judith Mossman
		end
	else
		local Type = math.random(1,8)
		if Type == 1 then
			self.Model = {"models/vj_piv/hl2/main/barney.mdl"}
			self.PIV_Type = 1 -- Barney Calhoun
		elseif Type == 2 then
			self.Model = {"models/vj_piv/hl2/main/breen.mdl"}	
			self.PIV_Type = 2 -- Dr. Wallace Breen
		elseif Type == 3 then
			self.Model = {"models/vj_piv/hl2/main/eli.mdl"}
			self.PIV_Type = 3 -- Eli Vance
		elseif Type == 4 then
			self.Model = {"models/vj_piv/hl2/main/gman.mdl"}
			self.PIV_Type = 4 -- G-Man
		elseif Type == 5 then
			self.Model = {"models/vj_piv/hl2/main/kleiner.mdl"}
			self.PIV_Type = 5 -- Dr. Isaac Kleiner
		elseif Type == 6 then
			self.Model = {"models/vj_piv/hl2/main/magnusson.mdl"}
			self.PIV_Type = 6 -- Dr. Magnusson
		elseif Type == 7 then
			self.Model = {"models/vj_piv/hl2/main/monk.mdl"}
			self.PIV_Type = 7 -- Father Grigori
		elseif Type == 8 then
			self.Model = {"models/vj_piv/hl2/main/odessa.mdl"}
			self.PIV_Type = 8 -- Colonel Odessa Cubbage
		end
	end
	if self:GetClass() == "npc_vj_piv_runner_main_m" || self:GetClass() == "npc_vj_piv_runner_main_f" then
		self.PIV_IsRunner = true
		self.PIV_Infection_IsWalker = false
	end
end
--------------------
function ENT:Zombie_CustomOnInitialize()
	if self.PIV_Type == 1 then -- Give Barney metrocop footsteps
		self.PIV_IsMetropolice = true
	end
	if self.PIV_Type == 1 || self.PIV_Type == 3 || self.PIV_Type == 9 then
		-- Apply this if the model used is Barney, Eli, or Alyx
		self:SetSkin(math.random(0,1))
	end
end
--------------------