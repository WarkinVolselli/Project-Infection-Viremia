/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "[VJ] Project Infection: Viremia"
local AddonName = "[VJ] Project Infection: Viremia"
local AddonType = "NPC"
local AutorunFile = "autorun/vj_piv_autorun.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')
	
	/* -- Comment box start
	NOTE: The following code is commented out so the game doesn't run it! When copying one of the options below, make sure to put it outside of the comment box!
	
	VJ.AddNPC("Dummy SNPC","npc_vj_dum_dummy",vCat) -- Adds a NPC to the spawnmenu
		-- Parameters:
			-- First is the name, second is the class name
			-- Third is the category that it should be in
			-- Fourth is optional, which is a boolean that defines whether or not it's an admin-only entity
	VJ.AddNPC_HUMAN("Dummy Human SNPC","npc_vj_dum_dummy",{"weapon_vj_dummy"},vCat) -- Adds a NPC to the spawnmenu but with a list of weapons it spawns with
		-- Parameters:
			-- First is the name, second is the class name
			-- Third is a table of weapon, the base will pick a random one from the table and give it to the SNPC when "Default Weapon" is selected
			-- Fourth is the category that it should be in
			-- Fifth is optional, which is a boolean that defines whether or not it's an admin-only entity
	VJ.AddWeapon("Dummy Weapon","weapon_vj_dummy",false,vCat) -- Adds a weapon to the spawnmenu
		-- Parameters:
			-- First is the name, second is the class name
			-- Third is a boolean that defines whether or not it's an admin-only entity
			-- And the last parameter is the category that it should be in
	VJ.AddNPCWeapon("VJ_Dummy", "weapon_vj_dummy") -- Adds a weapon to the NPC weapon list
		-- Parameters:
			-- First is the name, second is the class name
	VJ.AddEntity("Dummy Kit","sent_vj_dummykit","Author Name",false,0,true,vCat) -- Adds an entity to the spawnmenu
		-- Parameters: 
			-- First is the name, second is the class name and the third is its class name	
			-- Fourth is a boolean that defines whether or not it's an admin-only entity
			-- Fifth is an integer that defines the offset of the entity (When it spawns)
			-- Sixth is a boolean that defines whether or not it should drop to the floor when it spawns
			-- And the last parameter is the category that it should be in

	-- Particles --
	VJ.AddParticle("particles/example_particle.pcf",{
		"example_particle_name1",
		"example_particle_name2",
	})
	
	-- Precache Models --
	util.PrecacheModel("models/example_model.mdl")
	
	-- ConVars --
	VJ.AddConVar("vj_dum_dummy_h",100) -- Example 1
	VJ.AddConVar("vj_dum_dummy_d",20) -- Example 2
	
	*/  -- Comment box end
	
	-- Precache Models --
	util.PrecacheModel("models/vj_piv/hl2/charple.mdl")
	util.PrecacheModel("models/vj_piv/hl2/corpse1.mdl")

	local vCat = "Project Infection: Viremia"

	VJ.AddNPC("Walker Base","npc_vj_piv_walker_base",vCat)
	VJ.AddNPC("Runner Base","npc_vj_piv_runner_base",vCat)
	
	local vCat = "Project Infection: Viremia - Citizens"
	
	VJ.AddNPC("Civilian Walker (Female)","npc_vj_piv_walker_civ_f",vCat)
	VJ.AddNPC("Civilian Walker (Male)","npc_vj_piv_walker_civ_m",vCat)
	VJ.AddNPC("Civilian Runner (Female)","npc_vj_piv_runner_civ_f",vCat)
	VJ.AddNPC("Civilian Runner (Male)","npc_vj_piv_runner_civ_m",vCat)
	
	VJ.AddNPC("Resistance Walker (Female)","npc_vj_piv_walker_reb_f",vCat)
	VJ.AddNPC("Resistance Walker (Male)","npc_vj_piv_walker_reb_m",vCat)
	VJ.AddNPC("Resistance Runner (Female)","npc_vj_piv_runner_reb_f",vCat)
	VJ.AddNPC("Resistance Runner (Male)","npc_vj_piv_runner_reb_m",vCat)
	
	VJ.AddNPC("Corpse Walker","npc_vj_piv_walker_corpse",vCat)
	VJ.AddNPC("Corpse Runner","npc_vj_piv_runner_corpse",vCat)
	VJ.AddNPC("Charple Walker","npc_vj_piv_walker_charple",vCat)
	VJ.AddNPC("Charple Runner","npc_vj_piv_runner_charple",vCat)
	
	VJ.AddNPC("Fat Walker (Male)","npc_vj_piv_fat_walker_m",vCat)
	VJ.AddNPC("Fat Runner (Male)","npc_vj_piv_fat_runner_m",vCat)

	local vCat = "Project Infection: Viremia - Combine"
	
	VJ.AddNPC("Civil Protection Walker","npc_vj_piv_walker_metropolice",vCat)
	VJ.AddNPC("Civil Protection Runner","npc_vj_piv_runner_metropolice",vCat)
	
	VJ.AddNPC("Overwatch Soldier Walker","npc_vj_piv_walker_combine_s",vCat)
	VJ.AddNPC("Overwatch Soldier Runner","npc_vj_piv_runner_combine_s",vCat)
	
	VJ.AddNPC("Overwatch Prisonguard Walker","npc_vj_piv_walker_combine_p",vCat)
	VJ.AddNPC("Overwatch Prisonguard Runner","npc_vj_piv_runner_combine_p",vCat)

	VJ.AddNPC("Overwatch Elite Walker","npc_vj_piv_walker_combine_e",vCat)
	VJ.AddNPC("Overwatch Elite Runner","npc_vj_piv_runner_combine_e",vCat)
	
	local vCat = "Project Infection: Viremia - Military"
	
	VJ.AddNPC("Military Walker","npc_vj_piv_walker_mil",vCat)
	VJ.AddNPC("Military Runner","npc_vj_piv_runner_mil",vCat)
	
	VJ.AddNPC("Military Riot Walker","npc_vj_piv_walker_mil_police",vCat)
	VJ.AddNPC("Military Riot Runner","npc_vj_piv_runner_mil_police",vCat)
	
	VJ.AddNPC("Ghillie Walker","npc_vj_piv_walker_mil_ghillie",vCat)
	VJ.AddNPC("Ghillie Runner","npc_vj_piv_runner_mil_ghillie",vCat)

	VJ.AddNPC("Hazmat Walker","npc_vj_piv_walker_hazmat",vCat)
	VJ.AddNPC("Hazmat Runner","npc_vj_piv_runner_hazmat",vCat)
	
	local vCat = "Project Infection: Viremia - Specials"

	VJ.AddNPC("Bruiser","npc_vj_piv_bruiser",vCat)
	VJ.AddNPC("Slammer","npc_vj_piv_slammer",vCat)
	
	VJ.AddNPC("Exploder","npc_vj_piv_exploder",vCat)
	
	VJ.AddNPC("Stalker","npc_vj_piv_stalker",vCat)
	VJ.AddNPC("Creep","npc_vj_piv_creep",vCat)

	VJ.AddNPC("Spitter","npc_vj_piv_spitter",vCat)
	VJ.AddNPC("Spewer","npc_vj_piv_spewer",vCat)
	VJ.AddNPC("Shocker","npc_vj_piv_shocker",vCat)
	VJ.AddNPC("Remordeo","npc_vj_piv_remordeo",vCat)
	VJ.AddNPC("Blood Bomber","npc_vj_piv_blood_bomber",vCat)

	VJ.AddNPC("Cremator","npc_vj_piv_cremator",vCat)
	VJ.AddNPC("Stoker","npc_vj_piv_stoker",vCat)

	VJ.AddNPC("Thug (Male)","npc_vj_piv_brawler",vCat)
	VJ.AddNPC("Thug (Female)","npc_vj_piv_brawler_f",vCat)
	VJ.AddNPC("Demon","npc_vj_piv_brawler_boss",vCat)
	
	VJ.AddNPC("Grenadier","npc_vj_piv_grenadier",vCat)
	VJ.AddNPC("Panzer","npc_vj_piv_panzer",vCat)
	VJ.AddNPC("Megapanzer","npc_vj_piv_panzer_boss",vCat)

	VJ.AddNPC("Sickler","npc_vj_piv_sickler",vCat)
	
	VJ.AddNPC("Shambler (Male)","npc_vj_piv_shambler",vCat)
	VJ.AddNPC("Revenant (Male)","npc_vj_piv_revenant",vCat)
	VJ.AddNPC("Shambler (Female)","npc_vj_piv_shambler_f",vCat)
	VJ.AddNPC("Revenant (Female)","npc_vj_piv_revenant_f",vCat)
	VJ.AddNPC("Husk (Male)","npc_vj_piv_husk",vCat)
	VJ.AddNPC("Husk (Female)","npc_vj_piv_husk_f",vCat)
	VJ.AddNPC("Shikari","npc_vj_piv_shikari",vCat)
	VJ.AddNPC("Virulent","npc_vj_piv_virulent",vCat)
	VJ.AddNPC("Phorid","npc_vj_piv_phorid",vCat)

	VJ.AddNPC("Tank","npc_vj_piv_tank",vCat)

	VJ.AddNPC("Drowned","npc_vj_piv_drowned",vCat)
	VJ.AddNPC("Drowned (Haimatsu)","npc_vj_piv_drowned_suit",vCat)
	
	local vCat = "Project Infection: Viremia - Spawners"

	VJ.AddNPC("Random Zombie","sent_vj_piv_random_zombie",vCat)
	VJ.AddNPC("Random Walker","sent_vj_piv_random_walker",vCat)
	VJ.AddNPC("Random Runner","sent_vj_piv_random_runner",vCat)
	
	VJ.AddNPC("Random Zombie Spawner","sent_vj_piv_random_zombie_spawner",vCat)
	VJ.AddNPC("Random Walker Spawner","sent_vj_piv_random_walker_spawner",vCat)
	VJ.AddNPC("Random Runner Spawner","sent_vj_piv_random_runner_spawner",vCat)
	
	VJ.AddNPC("Random Special","sent_vj_piv_random_special",vCat)
	VJ.AddNPC("Random Special Spawner","sent_vj_piv_random_special_spawner",vCat)
	
	VJ.AddNPC("Husk Spawner","sent_vj_piv_undead_spawner",vCat)	
	VJ.AddNPC("Husk Spawner (Corpses)","sent_vj_piv_undead_spawner_corpses",vCat)
	VJ.AddNPC("Husk Spawner Multi (Corpses)","sent_vj_piv_undead_spawner_multi_corpses",vCat)
	
  --== ConVars ==--

	-- general --

	VJ.AddConVar("vj_piv_reducedparticles", 0, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_reducedlights", 0, {FCVAR_ARCHIVE})	
	VJ.AddConVar("vj_piv_infection", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_infection_type", 0, {FCVAR_ARCHIVE})	
	VJ.AddConVar("vj_piv_jumping", 2, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_climbing", 0, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_cripple", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_firerunners", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_firerunners_chance", 4, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_headshot_damage", 1, {FCVAR_ARCHIVE})	
	VJ.AddConVar("vj_piv_headshot_damage_mult", 2, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_spawnanim", 0, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_deathanim", 1, {FCVAR_ARCHIVE}) 
	VJ.AddConVar("vj_piv_deathanim_chance", 4, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_resting", 0, {FCVAR_ARCHIVE}) 
	VJ.AddConVar("vj_piv_alt_idle_walk", 1, {FCVAR_ARCHIVE}) 
	VJ.AddConVar("vj_piv_alt_runner_anims", 1, {FCVAR_ARCHIVE}) 
	VJ.AddConVar("vj_piv_alert_anim", 1, {FCVAR_ARCHIVE}) 
	VJ.AddConVar("vj_piv_alert_anim_chance", 4, {FCVAR_ARCHIVE}) 
	VJ.AddConVar("vj_piv_lights", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_rebirth", 0, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_rebirthall", 0, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_door_breaking", 1, {FCVAR_ARCHIVE})
	
	VJ.AddConVar("vj_piv_aggressive_runner_attacks", 1, {FCVAR_ARCHIVE}) 
	
	-- weapons
	
	VJ.AddConVar("vj_piv_weapons", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_weapons_chance", 5, {FCVAR_ARCHIVE})
	
	VJ.AddConVar("vj_piv_weapons_dropping", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_weapons_dropping_stumble", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_weapons_dropping_chance", 3, {FCVAR_ARCHIVE})
	
	VJ.AddConVar("vj_piv_throwing", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_throwing_chance", 10, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_throwing_min", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_throwing_max", 3, {FCVAR_ARCHIVE})
	
	-- subclass 
	
	VJ.AddConVar("vj_piv_subclasses", 1, {FCVAR_ARCHIVE})
	
	VJ.AddConVar("vj_piv_shambler_chance", 8, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_jogger_chance", 5, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_brute_chance", 10, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_biter_chance", 7, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_super_sprinter_chance", 5, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_rusher_chance", 8, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_leaper_chance", 10, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_crawler_chance", 12, {FCVAR_ARCHIVE})

	VJ.AddConVar("vj_piv_advanced_mutations", 1, {FCVAR_ARCHIVE})

	VJ.AddConVar("vj_piv_blazing_chance", 10, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_electra_chance", 10, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_toxic_chance", 10, {FCVAR_ARCHIVE})
	
	-- models/skins -- 
	
	VJ.AddConVar("vj_piv_extramodels", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_extraclothes", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_hl2skins", 0, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_militaryskin", 0, {FCVAR_ARCHIVE})
	
	-- sounds --

	VJ.AddConVar("vj_piv_walk_voice", 0, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_run_voice", 0, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_giant_voice", 0, {FCVAR_ARCHIVE})
	
    -- specific npcs --
	
	-- military 
	
	VJ.AddConVar("vj_piv_mil_flakarmor", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_mil_flakarmor_chance", 4, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_mil_gasmask", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_mil_gasmask_chance", 3, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_mil_shield", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_mil_shield_chance", 5, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_mil_ghillie_stealth", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_mil_ghillie_stealth_chance", 3, {FCVAR_ARCHIVE})
	
	-- heavy
	
	VJ.AddConVar("vj_piv_bruiser_charge", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_tank_charge", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_tank_run", 0, {FCVAR_ARCHIVE})
	
	-- husk strain
	
	VJ.AddConVar("vj_piv_husk_run", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_husk_explode", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_husk_explode_chance", 4, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_husk_headless", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_husk_headless_chance", 4, {FCVAR_ARCHIVE})

	VJ.AddConVar("vj_piv_virulent_run", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_virulent_explode", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_virulent_explode_chance", 4, {FCVAR_ARCHIVE})
	
	VJ.AddConVar("vj_piv_shambler_revive", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_shambler_revive_chance", 4, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_shambler_revive_revenant", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("vj_piv_shambler_revive_revenant_chance", 4, {FCVAR_ARCHIVE})
	
	if (CLIENT) then
		local function VJ_PIV(Panel)
			if !game.SinglePlayer() then
			if !LocalPlayer():IsAdmin() or !LocalPlayer():IsSuperAdmin() then
				Panel:AddControl( "Label", {Text = "You are not an admin!"})
				Panel:ControlHelp("Note: Only admins can change these settings!")
			return
		end
	end
		Panel:AddControl( "Label", {Text = "Note: Only admins can change these settings!"})
		Panel:AddControl( "Label", {Text = "Please respawn any existing zombies after changing things in here!"})
	local vj_resetbutton = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
		vj_resetbutton.Options["#vjbase.menugeneral.default"] = { 
		
			vj_piv_reducedparticles = "0",
			vj_piv_reducedlights = "0",
			
			vj_piv_infection = "1",
			vj_piv_infection_type = "0",
			
			vj_piv_jumping = "2",

			vj_piv_climbing = "0",
		
			vj_piv_cripple = "1",
			
			vj_piv_firerunners = "1",
			vj_piv_firerunners_chance = "4",
			
			vj_piv_headshot_damage = "1",
			vj_piv_headshot_damage_mult = "2",
			
			vj_piv_spawnanim = "0",
			vj_piv_deathanim = "1",
			vj_piv_deathanim_chance = "4",
			
			vj_piv_alt_idle_walk = "1",
			vj_piv_resting = "0",
			vj_piv_alt_runner_anims = "1",
			
			vj_piv_alert_anim = "1",
			vj_piv_alert_anim_chance = "4",
		
			vj_piv_aggressive_runner_attacks = "1",
			
			vj_piv_lights = "1",
			
			vj_piv_rebirth = "0",
			vj_piv_rebirthall = "0",
			
			vj_piv_weapons = "1",
			vj_piv_weapons_chance = "5",
			
			vj_piv_door_breaking = "1",
			
			vj_piv_subclasses = "1",
			vj_piv_advanced_mutations = "1",
			
			vj_piv_weapons_dropping = "1",
			vj_piv_weapons_dropping_stumble = "1",
			vj_piv_weapons_dropping_chance = "3",
			
			vj_piv_throwing = "1",
			vj_piv_throwing_chance = "10",
			vj_piv_throwing_min = "1",
			vj_piv_throwing_max = "3",			

			vj_piv_shambler_chance = "8", 
			vj_piv_jogger_chance = "5",
			vj_piv_biter_chance = "7",
			vj_piv_brute_chance = "10",
			vj_piv_super_sprinter_chance = "5",
			vj_piv_rusher_chance = "8",
			vj_piv_leaper_chance = "10",
			vj_piv_crawler_chance = "12",
			
			vj_piv_blazing_chance = "10",
			vj_piv_electra_chance = "10",
			vj_piv_toxic_chance = "10",

			vj_piv_extramodels = "1",	
			vj_piv_extraclothes = "1",
			vj_piv_hl2skins = "0",
			vj_piv_militaryskin = "0",

			vj_piv_walk_voice = "0",
			vj_piv_run_voice = "0",
			vj_piv_giant_voice = "0",
			
			vj_piv_mil_flakarmor = "1",
			vj_piv_mil_flakarmor_chance = "4",
			vj_piv_mil_gasmask = "1",
			vj_piv_mil_gasmask_chance = "3",
			vj_piv_mil_shield = "1",
			vj_piv_mil_shield_chance = "5",
			vj_piv_mil_ghillie_stealth = "1",
			vj_piv_mil_ghillie_stealth_chance = "3",
	
			vj_piv_bruiser_charge = "1",
			vj_piv_tank_charge = "1",
			vj_piv_tank_run = "0",
						
			vj_piv_husk_run = "1",
			vj_piv_husk_explode = "1",
			vj_piv_husk_explode_chance = "4",
			vj_piv_husk_headless = "1",
			vj_piv_husk_headless_chance = "4",
			
			vj_piv_virulent_run = "1",
			vj_piv_virulent_explode = "1",
			vj_piv_virulent_explode_chance = "4",
			
			vj_piv_shambler_revive = "1",
			vj_piv_shambler_revive_chance = "4",
			vj_piv_shambler_revive_revenant = "1",
			vj_piv_shambler_revive_revenant_chance = "4",
		}

	-- general options --
	
	Panel:AddControl("Checkbox", {Label = "Reduced Particles? [PERFORMANCE]", Command = "vj_piv_reducedparticles"})
	Panel:ControlHelp("Reduces the amount of particles used by some NPCs.")
	
	Panel:AddControl("Checkbox", {Label = "Reduced Lights? [PERFORMANCE]", Command = "vj_piv_reducedlights"})
	Panel:ControlHelp("Reduces the amount of lights used by some NPCs.")
	
	Panel:AddControl("Checkbox", {Label = "Enable Infection?", Command = "vj_piv_infection"})
	Panel:ControlHelp("When enabled, players and NPCs will turn into a zombie when killed by one. Only works on ValveBiped models.")
	
	Panel:AddControl("Checkbox", {Label = "Enable Infection By Type?", Command = "vj_piv_infection_type"})
	Panel:ControlHelp("When enabled, infected players/NPCs will turn into a different strain depending on what zombie kills them.")


	local combobox_jumping = {Options = {}, CVars = {}, Label = "Enable Jumping?", MenuButton = "0"}
	combobox_jumping.Options["Disabled"] = {vj_piv_jumping = 0}
	combobox_jumping.Options["Runners only"] = {vj_piv_jumping = 1}
	combobox_jumping.Options["All zombies"] = {vj_piv_jumping = 2}
	Panel:AddControl("ComboBox", combobox_jumping)
	Panel:ControlHelp("Makes it so zombies can jump.")

	local combobox_climbing = {Options = {}, CVars = {}, Label = "Enable Climbing? [EXPERIMENTAL]", MenuButton = "0"}
	combobox_climbing.Options["Disabled"] = {vj_piv_climbing = 0}
	combobox_climbing.Options["Runners only"] = {vj_piv_climbing = 1}
	combobox_climbing.Options["All zombies"] = {vj_piv_climbing = 2}
	Panel:AddControl("ComboBox", combobox_climbing)
	Panel:ControlHelp("Makes it so zombies can climb over props and other things. (Disabled by default due to bugs.)")

	Panel:AddControl("Checkbox", {Label = "Enable Crippling?", Command = "vj_piv_cripple"})
	Panel:ControlHelp("When enabled, zombies can be crippled by taking damage to the legs.")

	Panel:AddControl("Checkbox", {Label = "Enable Spawn Animations?", Command = "vj_piv_spawnanim"})
	Panel:ControlHelp("When enabled, zombies will play a 'digout' animation when spawned on a soft surface such as dirt.")

	Panel:AddControl("Checkbox", {Label = "Enable Door Breaking?", Command = "vj_piv_door_breaking"})
	Panel:ControlHelp("When enabled, zombies will be able to attack and break down doors.")
	
	Panel:AddControl("Checkbox", {Label = "Enable Fire Runners?", Command = "vj_piv_firerunners"})
	Panel:ControlHelp("When enabled, Walkers may sometimes start running when set on fire.")
	Panel:AddControl("Slider", {Label = "Fire Runner Chance", Command = "vj_piv_firerunners_chance", Min = 1, Max = 100})

	Panel:AddControl("Checkbox", {Label = "Enable Death Animations?", Command = "vj_piv_deathanim"})
	Panel:ControlHelp("When enabled, zombies will sometimes play death animations based on how they were killed.")
	Panel:AddControl("Slider", {Label = "Death Animation Chance", Command = "vj_piv_deathanim_chance", Min = 1, Max = 100})
	
	Panel:AddControl("Checkbox", {Label = "Enable Alert Animations?", Command = "vj_piv_alert_anim"})
	Panel:ControlHelp("When enabled, zombies will sometimes play 'taunt' animations when alerted.")
	Panel:AddControl("Slider", {Label = "Alert Animation Chance", Command = "vj_piv_alert_anim_chance", Min = 1, Max = 100})
	
	Panel:AddControl("Checkbox", {Label = "Enable Alternate Idle Walk?", Command = "vj_piv_alt_idle_walk"})
	Panel:ControlHelp("When enabled, zombies will have a more passive walk animation when idle.")
	Panel:AddControl("Checkbox", {Label = "Enable Alternate Runner Animations?", Command = "vj_piv_alt_runner_anims"})
	Panel:ControlHelp("When enabled, Runners will use more aggressive walking and idle animations.")
	Panel:AddControl("Checkbox", {Label = "Enable Resting? [EXPERIMENTAL]", Command = "vj_piv_resting"})
	Panel:ControlHelp("When enabled, zombies will sometimes sit or lay down when idle. (Disabled by default due to bug.)")

	Panel:AddControl("Checkbox", {Label = "Enable Headshot Damage Multiplier?", Command = "vj_piv_headshot_damage"})
	Panel:ControlHelp("When enabled, zombies will take increased damage from headshots. (Certain enemies are exempt.)	")
	Panel:AddControl("Slider", {Label = "Headshot Damage Multiplier", Command = "vj_piv_headshot_damage_mult", Min = 1, Max = 100})
	
	Panel:AddControl("Checkbox", {Label = "Enable Boss Eyeglow?", Command = "vj_piv_lights"})
	Panel:ControlHelp("When enabled, bosses will have glowing eyes based on strain.")

	Panel:AddControl("Checkbox", {Label = "Enable Zombie Rebirth? [EXPERIMENTAL]", Command = "vj_piv_rebirth"})
	Panel:ControlHelp("When enabled, player controlled zombies will be able to mutate into a stronger version. (Disabled by default due to bugs.)")
	Panel:AddControl("Checkbox", {Label = "All Zombies spawned Rebirthed? [EXPERIMENTAL]", Command = "vj_piv_rebirthall"})
	Panel:ControlHelp("When enabled, all zombies spawned will be rebirthed. (Requires Enable Zombie Rebirth.)")

	Panel:AddControl("Checkbox", {Label = "Enable Zombie Weapons?", Command = "vj_piv_weapons"})
	Panel:ControlHelp("When enabled, zombies can sometimes spawn with melee weapons.")
	Panel:AddControl("Slider", {Label = "Weapon Chance", Command = "vj_piv_weapons_chance", Min = 1, Max = 100})
	Panel:AddControl("Checkbox", {Label = "Enable Weapon Dropping?", Command = "vj_piv_weapons_dropping"})
	Panel:ControlHelp("When enabled, zombies will drop their weapons when killed or crippled.")
	Panel:AddControl("Checkbox", {Label = "Zombies Drop Weapons on Stumble?", Command = "vj_piv_weapons_dropping_stumble"})
	Panel:ControlHelp("When enabled, zombies will sometimes drop their weapons when stumbling or etc. (Requires Enable Weapon Dropping,.)")
	Panel:AddControl("Slider", {Label = "Drop Weapon On Stumble Chance", Command = "vj_piv_weapons_dropping_chance", Min = 1, Max = 100})
	
	Panel:AddControl("Checkbox", {Label = "Enable Thrower Zombies?", Command = "vj_piv_throwing"})
	Panel:ControlHelp("When enabled, zombies can sometimes spawn with throwing items.")
	Panel:AddControl("Slider", {Label = "Thrower Chance", Command = "vj_piv_throwing_chance", Min = 1, Max = 100})
	Panel:AddControl("Slider", {Label = "Min Throwing Items", Command = "vj_piv_throwing_min", Min = 1, Max = 100})
	Panel:AddControl("Slider", {Label = "Max Throwing Items", Command = "vj_piv_throwing_max", Min = 1, Max = 100})

	Panel:AddControl("Checkbox", {Label = "Enable Subclasses?", Command = "vj_piv_subclasses"})
	Panel:ControlHelp("When enabled, common zombies will sometimes spawn as stronger variants.")

	Panel:AddControl("Slider", {Label = "Crawler Chance", Command = "vj_piv_crawler_chance", Min = 1, Max = 100})
	Panel:AddControl("Slider", {Label = "Shambler Chance", Command = "vj_piv_shambler_chance", Min = 1, Max = 100})
	Panel:AddControl("Slider", {Label = "Jogger Chance", Command = "vj_piv_jogger_chance", Min = 1, Max = 100})
	Panel:AddControl("Slider", {Label = "Biter Chance", Command = "vj_piv_biter_chance", Min = 1, Max = 100})
	Panel:AddControl("Slider", {Label = "Brute Chance", Command = "vj_piv_brute_chance", Min = 1, Max = 100})
	Panel:AddControl("Slider", {Label = "Super Sprinter Chance", Command = "vj_piv_super_sprinter_chance", Min = 1, Max = 100})
	Panel:AddControl("Slider", {Label = "Rusher Chance", Command = "vj_piv_rusher_chance", Min = 1, Max = 100})
	Panel:AddControl("Slider", {Label = "Leaper Chance", Command = "vj_piv_leaper_chance", Min = 1, Max = 100})

	Panel:AddControl("Checkbox", {Label = "Enable Advanced Mutations?", Command = "vj_piv_advanced_mutations"})
	Panel:ControlHelp("When enabled, certain specials will sometimes spawn as stronger variants with elemental effects. (Requires Enable Subclasses.)")
	
	Panel:AddControl("Slider", {Label = "Blazing Mutation Chance", Command = "vj_piv_blazing_chance", Min = 1, Max = 100})
	Panel:AddControl("Slider", {Label = "Electra Mutation Chance", Command = "vj_piv_electra_chance", Min = 1, Max = 100})
	Panel:AddControl("Slider", {Label = "Toxic Mutation Chance", Command = "vj_piv_toxic_chance", Min = 1, Max = 100})

	Panel:AddControl("Checkbox", {Label = "HL2 Skins Only?", Command = "vj_piv_hl2skins"})
	Panel:ControlHelp("When enabled, Citizen zombies will only use HL2 skins.")
	Panel:AddControl("Checkbox", {Label = "Enable Extra Citizen Models?", Command = "vj_piv_extramodels"})
	Panel:ControlHelp("When enabled, Citizen zombies will have more models instead of just the default ones.")
	--Panel:AddControl("Checkbox", {Label = "Enable Extra Citizen Clothes?", Command = "vj_piv_extraclothes"})
	
	-- walker voice
	
	local combobox_walkervoice = {Options = {}, CVars = {}, Label = "Walker Voice", MenuButton = "0"}
	combobox_walkervoice.Options["No More Room In Hell"] = {vj_piv_walk_voice = 0}
	combobox_walkervoice.Options["Dying Light"] = {vj_piv_walk_voice = 1}
	combobox_walkervoice.Options["Left 4 Dead 2"] = {vj_piv_walk_voice = 2}
	combobox_walkervoice.Options["Contagion"] = {vj_piv_walk_voice = 3}
	combobox_walkervoice.Options["Random"] = {vj_piv_walk_voice = 4}
	Panel:AddControl("ComboBox", combobox_walkervoice)
	Panel:ControlHelp("Changes the sounds of Walkers.")
	
	-- runner voice
	
	local combobox_runnervoice = {Options = {}, CVars = {}, Label = "Runner Voice", MenuButton = "0"}
	combobox_runnervoice.Options["No More Room In Hell"] = {vj_piv_run_voice = 0}
	combobox_runnervoice.Options["Dying Light"] = {vj_piv_run_voice = 1}
	combobox_runnervoice.Options["Left 4 Dead 2"] = {vj_piv_run_voice = 2}
	combobox_runnervoice.Options["Contagion"] = {vj_piv_run_voice = 3}
	combobox_runnervoice.Options["Random"] = {vj_piv_run_voice = 4}
	Panel:AddControl("ComboBox", combobox_runnervoice)
	Panel:ControlHelp("Changes the sounds of Runners.")
	
	-- giant voice
--[[	
	local combobox_giantvoice = {Options = {}, CVars = {}, Label = "Giant Voice", MenuButton = "0"}
	combobox_giantvoice.Options["Dying Light Demolisher"] = {vj_piv_giant_voice = 0}
	combobox_giantvoice.Options["Left 4 Dead 2 Tank"] = {vj_piv_giant_voice = 1}
	combobox_giantvoice.Options["Left 4 Dead 2 Charger"] = {vj_piv_giant_voice = 2}
	combobox_giantvoice.Options["Random"] = {vj_piv_giant_voice = 3}
	Panel:AddControl("ComboBox", combobox_giantvoice)
--]]

	-- specific zombie options
	
	-- military 
	
	-- military skin
	
	local combobox_militaryskin = {Options = {}, CVars = {}, Label = "Military Skin", MenuButton = "0"}
	combobox_militaryskin.Options["National Guard"] = {vj_piv_militaryskin = 0}
	combobox_militaryskin.Options["Woodland"] = {vj_piv_militaryskin = 1}
	combobox_militaryskin.Options["Desert"] = {vj_piv_militaryskin = 2}
	combobox_militaryskin.Options["Snow"] = {vj_piv_militaryskin = 3}
	combobox_militaryskin.Options["Random"] = {vj_piv_militaryskin = 4}
	Panel:AddControl("ComboBox", combobox_militaryskin)
	Panel:ControlHelp("Changes the skin of Military zombies.")

	Panel:AddControl("Checkbox", {Label = "Military Zombies Can Have Flak Armor?", Command = "vj_piv_mil_flakarmor"})
	Panel:ControlHelp("When enabled, Military zombies can spawn with flak armor that lowers bullet and explosive damage.")
	Panel:AddControl("Slider", {Label = "Flak Armor Chance", Command = "vj_piv_mil_flakarmor_chance", Min = 1, Max = 100})
	
	Panel:AddControl("Checkbox", {Label = "Military Zombies Can Have A Gasmask?", Command = "vj_piv_mil_gasmask"})
	Panel:ControlHelp("When enabled, Military zombies can spawn with gasmasks that give them chemical and radiation immunity.")
	Panel:AddControl("Slider", {Label = "Gasmask Chance", Command = "vj_piv_mil_gasmask_chance", Min = 1, Max = 100})
	
	Panel:AddControl("Checkbox", {Label = "Riot Soldier Zombies Can Have A Shield?", Command = "vj_piv_mil_shield"})
	Panel:ControlHelp("When enabled, Riot Soldier zombies can spawn with a bulletproof shield.")
	Panel:AddControl("Slider", {Label = "Shield Chance", Command = "vj_piv_mil_shield_chance", Min = 1, Max = 100})
	
	Panel:AddControl("Checkbox", {Label = "Ghillie Zombies Can Be Stealthy?", Command = "vj_piv_mil_ghillie_stealth"})
	Panel:ControlHelp("When enabled, Ghillie zombies can go silent and crawl.")
	Panel:AddControl("Slider", {Label = "Ghille Stealth Chance", Command = "vj_piv_mil_ghillie_stealth_chance", Min = 1, Max = 100})
	
	-- husks
	
	Panel:AddControl("Checkbox", {Label = "Shamblers Can Revive?", Command = "vj_piv_shambler_revive"})
	Panel:ControlHelp("When enabled, Shamblers will sometimes revive a few seconds after death.")
	Panel:AddControl("Slider", {Label = "Shambler Revive Chance", Command = "vj_piv_shambler_revive_chance", Min = 1, Max = 100})
	Panel:AddControl("Checkbox", {Label = "Shamblers Can Revive As Revenants?", Command = "vj_piv_shambler_revive_revenant"})
	Panel:ControlHelp("When enabled, Shamblers will sometimes mutate into a Revenant when reviving.")
	Panel:AddControl("Slider", {Label = "Shambler Revive As Revenant Chance", Command = "vj_piv_shambler_revive_revenant_chance", Min = 1, Max = 100})

	Panel:AddControl("Checkbox", {Label = "Husks Can Run?", Command = "vj_piv_husk_run"})
	Panel:ControlHelp("When enabled, Husks will sometimes charge for a few seconds.")
	
	Panel:AddControl("Checkbox", {Label = "Husks Can Explode?", Command = "vj_piv_husk_explode"})
	Panel:ControlHelp("When enabled, Husks will sometimes explode on death.")
	Panel:AddControl("Slider", {Label = "Husk Explosion Chance", Command = "vj_piv_husk_explode_chance", Min = 1, Max = 100})
	
	Panel:AddControl("Checkbox", {Label = "Enable Headless Husk Variant?", Command = "vj_piv_husk_headless"})
	Panel:ControlHelp("When enabled, Husks will sometimes spawn as a headless variant, unable to be headshot.")
	Panel:AddControl("Slider", {Label = "Headless Husk Variant Chance", Command = "vj_piv_husk_headless_chance", Min = 1, Max = 100})
	
	Panel:AddControl("Checkbox", {Label = "Virulents Can Run?", Command = "vj_piv_virulent_run"})
	Panel:ControlHelp("When enabled, Virulents will sometimes charge for a few seconds.")
	
	Panel:AddControl("Checkbox", {Label = "Virulents Can Explode?", Command = "vj_piv_virulent_explode"})
	Panel:ControlHelp("When enabled, Virulents will sometimes explode on death.")
	Panel:AddControl("Slider", {Label = "Virulent Explosion Chance", Command = "vj_piv_virulent_explode_chance", Min = 1, Max = 100})

	end

	function VJ_AddToMenu_PIV(Panel)
		spawnmenu.AddToolMenuOption("DrVrej","SNPC Configures","Project Infection: Viremia","Project Infection: Viremia","","", VJ_PIV, {} )
	end
		hook.Add("PopulateToolMenu","VJ_AddToMenu_PIV", VJ_AddToMenu_PIV )
	end
-------------------------------------------------------------------------------------------------------------------------
	local NPC = FindMetaTable("NPC")
	local ENT = FindMetaTable("Entity")
	local Phys = FindMetaTable("PhysObj")
	
	function ENT:AdjustBones(tbl,alter)
		local ang = false
		if type(alter) == "Angle" then
			ang = true
		end
		for _,v in pairs(tbl) do
			local boneid = self:LookupBone(v)
			if boneid && boneid > 0 then
				if ang == false then
					self:ManipulateBonePosition(boneid,alter)
				else
					self:ManipulateBoneAngles(boneid,alter)
				end
			end
		end
	end

hook.Add("OnNPCKilled","PIV_Infection_NPC",function(victim,inflictor,attacker)
      if attacker.PIV_Infection == true && victim:LookupBone("ValveBiped.Bip01_Pelvis") && GetConVar("vj_piv_infection"):GetInt() == 1 then
      local zombie = ents.Create("npc_vj_piv_runner_inf")
	  local oldModel = victim:GetModel()
	  local oldSkin = victim:GetSkin()
	  local oldColor = victim:GetColor()
	  local oldMaterial = victim:GetMaterial()	  
	  local bg = {}
	  for i = 0,18 do
		bg[i] = victim:GetBodygroup(i)
end	  
        if attacker.PIV_Infection_IsWalker == true && GetConVar("vj_piv_infection_type"):GetInt() == 1 then
                    zombie = ents.Create("npc_vj_piv_walker_inf")		
	elseif attacker.PIV_Infection_IsDrowned == true then
                    zombie = ents.Create("npc_vj_piv_drowned_inf")

end
			zombie:SetMaterial("hud/killicons/default")
            zombie:SetPos(victim:GetPos())
            zombie:SetAngles(victim:GetAngles())
            zombie:Spawn()
			zombie:Activate()
            //zombie:SetParent(zombie)
            zombie:Spawn()
            zombie:VJ_PIV_CreateBoneMerge(zombie,oldModel,oldSkin,bg)
		
           if victim.IsVJBaseSNPC == true then
                victim.HasDeathRagdoll = false
                victim.HasDeathAnimation = false				
end								
		   if victim:IsNPC() then
				victim:Remove()				
        end						
    end			
end)				

hook.Add("PlayerDeath","PIV_Infection_Player",function(victim,inflictor,attacker)
      if attacker.PIV_Infection == true && victim:LookupBone("ValveBiped.Bip01_Pelvis") && GetConVar("vj_piv_infection"):GetInt() == 1 then
      local zombie = ents.Create("npc_vj_piv_runner_inf")
	  local bonemerge = ents.Create("vj_piv_infection")
	  local oldModel = victim:GetModel()
	  local oldSkin = victim:GetSkin()
	  local oldColor = victim:GetColor()
	  local oldMaterial = victim:GetMaterial()		  
	  local oldPlayerColor = victim:GetPlayerColor() 	  
	  local bg = {}
	  for i = 0,18 do
		bg[i] = victim:GetBodygroup(i)
end	 	  
    if attacker.PIV_Infection_IsWalker == true && GetConVar("vj_piv_infection_type"):GetInt() == 1  == true then
                    zombie = ents.Create("npc_vj_piv_walker_inf")		
	elseif attacker.PIV_Infection_IsDrowned == true then
                    zombie = ents.Create("npc_vj_piv_drowned_inf")
	end
			zombie:SetMaterial("hud/killicons/default")
            zombie:SetPos(victim:GetPos())
            zombie:SetAngles(victim:GetAngles())
            zombie:Spawn()
			zombie:Activate()
            //zombie:SetParent(zombie)
            zombie:Spawn()

			local creator = NULL
			if zombie:IsNPC() then
				creator = IsValid(zombie:GetCreator()) && zombie:GetCreator()
				zombie:SetCollisionBounds(Vector(13,13,72),Vector(-13,-13,0))
end
			local body = ents.Create("vj_piv_infection")
			body:SetModel(oldModel)
			body:SetPos(zombie:GetPos())
			body:SetAngles(zombie:GetAngles())
			body.VJ_Owner = zombie
			body:Spawn()
			body:SetParent(zombie)
			body:SetSkin(oldSkin)
			body:SetColor(oldColor)
			body:SetPlayerColor(oldPlayerColor)
			body:SetMaterial(oldMaterial)		
			if bg then
				for i = 0,18 do
				--	body:SetBodygroup(i,bg[i])			
    end			
end
			zombie.Bonemerge = body
			zombie.BonemergeModel = oldModel	
			
         if victim:IsPlayer() then
				if IsValid(victim:GetRagdollEntity()) then
					victim:GetRagdollEntity():Remove()
                end				
           end 
      end	
end)
		function ENT:VJ_PIV_CreateBoneMerge(targEnt,oldModel,oldSkin,bg)
			local creator = NULL
			if targEnt:IsNPC() then
				creator = IsValid(targEnt:GetCreator()) && targEnt:GetCreator()
				targEnt:SetCollisionBounds(Vector(13,13,72),Vector(-13,-13,0))
end
			local body = ents.Create("vj_piv_infection")
			body:SetModel(oldModel)
			body:SetPos(targEnt:GetPos())
			body:SetAngles(targEnt:GetAngles())
			body.VJ_Owner = targEnt
			body:Spawn()
			body:SetParent(targEnt)
			body:SetSkin(oldSkin)
			body:SetColor(oldColor)
			body:SetMaterial(oldMaterial)		
			if bg then
				for i = 0,18 do
				--	body:SetBodygroup(i,bg[i])
    end			
end
			targEnt.Bonemerge = body
			targEnt.BonemergeModel = oldModel						
end

-------------------------------------------------------------------------------------------------------------------------
VJ_PIV_NODEPOS = {}
	hook.Add("EntityRemoved","VJ_PIV_AddNodes",function(ent)
		if ent:GetClass() == "info_node" then
			table.insert(VJ_PIV_NODEPOS,ent:GetPos())	
	end
end)

-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
	AddCSLuaFile(AutorunFile)
	VJ.AddAddonProperty(AddonName,AddonType)
else
	if (CLIENT) then
		chat.AddText(Color(0,200,200),PublicAddonName,
		Color(0,255,0)," was unable to install, you are missing ",
		Color(255,100,0),"VJ Base!")
	end
	timer.Simple(1,function()
		if not VJF then
			if (CLIENT) then
				VJF = vgui.Create("DFrame")
				VJF:SetTitle("ERROR!")
				VJF:SetSize(790,560)
				VJF:SetPos((ScrW()-VJF:GetWide())/2,(ScrH()-VJF:GetTall())/2)
				VJF:MakePopup()
				VJF.Paint = function()
					draw.RoundedBox(8,0,0,VJF:GetWide(),VJF:GetTall(),Color(200,0,0,150))
				end
				
				local VJURL = vgui.Create("DHTML",VJF)
				VJURL:SetPos(VJF:GetWide()*0.005, VJF:GetTall()*0.03)
				VJURL:Dock(FILL)
				VJURL:SetAllowLua(true)
				VJURL:OpenURL("https://sites.google.com/site/vrejgaming/vjbasemissing")
			elseif (SERVER) then
				timer.Create("VJBASEMissing",5,0,function() print("VJ Base is Missing! Download it from the workshop!") end)
			end
		end
	end)
end