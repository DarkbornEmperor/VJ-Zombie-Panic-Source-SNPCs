------------------ Addon Information ------------------
local AddonName = "Zombie Panic! Source SNPCs"
local AddonType = "NPC"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
    include("autorun/vj_controls.lua")

    VJ.AddCategoryInfo("Zombie Panic! Source", {Icon = "zps/icons/zps.png"})

    local spawnCategory = "Zombie Panic! Source"

    -- Survivors --
    VJ.AddNPC("Eugene","npc_vj_zps_eugene",spawnCategory)
    VJ.AddNPC("Marcus","npc_vj_zps_marcus",spawnCategory)
    VJ.AddNPC("Jessica","npc_vj_zps_jessica",spawnCategory)
    VJ.AddNPC("Paul","npc_vj_zps_paul",spawnCategory)
    VJ.AddNPC("Lea","npc_vj_zps_lea",spawnCategory)
    VJ.AddNPC("Vanessa","npc_vj_zps_vanessa",spawnCategory)
    VJ.AddNPC("Pedro","npc_vj_zps_pedro",spawnCategory)
    VJ.AddNPC("Larry","npc_vj_zps_larry",spawnCategory) -- Unreleased character currently

    -- Spawners & Random --
    VJ.AddNPC("Survivor (Random)","sent_vj_zps_sur",spawnCategory)
    VJ.AddNPC("Survivor Spawner (Random)","sent_vj_zps_sur_sp",spawnCategory)
    VJ.AddNPC("Survivor Spawner (Single)","sent_vj_zps_sur_sinsp",spawnCategory)

    -- Zombies --
    VJ.AddNPC("Carrier Zombie","npc_vj_zps_zcarrier",spawnCategory)
    VJ.AddNPC("Eugene (Zombie)","npc_vj_zps_zeugene",spawnCategory)
    VJ.AddNPC("Marcus (Zombie)","npc_vj_zps_zmarcus",spawnCategory)
    VJ.AddNPC("Jessica (Zombie)","npc_vj_zps_zjessica",spawnCategory)
    VJ.AddNPC("Paul (Zombie)","npc_vj_zps_zpaul",spawnCategory)
    VJ.AddNPC("Lea (Zombie)","npc_vj_zps_zlea",spawnCategory)
    VJ.AddNPC("Vanessa (Zombie)","npc_vj_zps_zvanessa",spawnCategory)
    VJ.AddNPC("Pedro (Zombie)","npc_vj_zps_zpedro",spawnCategory)
    VJ.AddNPC("Larry (Zombie)","npc_vj_zps_zlarry",spawnCategory) -- Unreleased character currently

    -- Spawners and Random
    VJ.AddNPC("Zombie (Random)","sent_vj_zps_zom",spawnCategory)
    VJ.AddNPC("Zombie Spawner (Random) ","sent_vj_zps_zom_sp",spawnCategory)
    VJ.AddNPC("Zombie Spawner (Single)","sent_vj_zps_zom_sinsp",spawnCategory)
    VJ.AddNPC("Zombie Map Spawner","sent_vj_zps_mapspawner",spawnCategory)

    -- Weapons --
    VJ.AddNPCWeapon("VJ_ZPS_AK-47", "weapon_vj_zps_ak47",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_MP5", "weapon_vj_zps_mp5",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_M4", "weapon_vj_zps_m4",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Shorty", "weapon_vj_zps_shorty",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Winchester", "weapon_vj_zps_winchester",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Remington_870", "weapon_vj_zps_rem870",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Glock-17", "weapon_vj_zps_glock17",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Glock-18C", "weapon_vj_zps_glock18c",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_PPK", "weapon_vj_zps_ppk",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_USP", "weapon_vj_zps_usp",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Revolver", "weapon_vj_zps_revolver",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_HE_Grenade", "weapon_vj_zps_grenade",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_IED", "weapon_vj_zps_ied",spawnCategory)

    -- Melee Weapons --
    VJ.AddNPCWeapon("VJ_ZPS_Baguette", "weapon_vj_zps_baguette",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Bat_Aluminum", "weapon_vj_zps_bat_alum",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Sledgehammer", "weapon_vj_zps_sledgehammer",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Bat_Wood", "weapon_vj_zps_bat_wood",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Broom", "weapon_vj_zps_broom",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Chair", "weapon_vj_zps_chair",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Club", "weapon_vj_zps_club",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Hammer", "weapon_vj_zps_hammer",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Hammer_Barricade", "weapon_vj_zps_hammer_bar",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Keyboard", "weapon_vj_zps_keyboard",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Machete", "weapon_vj_zps_machete",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Frying_Pan", "weapon_vj_zps_pan",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Pipe", "weapon_vj_zps_pipe",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Pipe_Wrench", "weapon_vj_zps_pipewrench",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Plank", "weapon_vj_zps_plank",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Tennis_Racket", "weapon_vj_zps_racket",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Shovel", "weapon_vj_zps_shovel",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Wrench", "weapon_vj_zps_wrench",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Pot", "weapon_vj_zps_pot",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Tire_Iron", "weapon_vj_zps_tireiron",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Axe", "weapon_vj_zps_axe",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Spanner", "weapon_vj_zps_spanner",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Cleaver", "weapon_vj_zps_cleaver",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Crowbar", "weapon_vj_zps_crowbar",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Fists", "weapon_vj_zps_fists",spawnCategory)

    VJ_ZPS_WEAPONS = {
        "weapon_vj_zps_ak47",
        "weapon_vj_zps_m4",
        "weapon_vj_zps_shorty",
        "weapon_vj_zps_winchester",
        "weapon_vj_zps_rem870",
        "weapon_vj_zps_mp5",
        "weapon_vj_zps_glock18c",
        "weapon_vj_zps_revolver",
        "weapon_vj_zps_usp",
        "weapon_vj_zps_ppk",
        "weapon_vj_zps_glock17",
        "weapon_vj_zps_grenade",
        "weapon_vj_zps_ied"
    }
    VJ_ZPS_MELEEWEAPONS = {
        "weapon_vj_zps_baguette",
        "weapon_vj_zps_bat_alum",
        "weapon_vj_zps_sledgehammer",
        "weapon_vj_zps_bat_wood",
        "weapon_vj_zps_broom",
        "weapon_vj_zps_chair",
        "weapon_vj_zps_club",
        "weapon_vj_zps_hammer",
        "weapon_vj_zps_hammer_bar",
        "weapon_vj_zps_keyboard",
        "weapon_vj_zps_machete",
        "weapon_vj_zps_pan",
        "weapon_vj_zps_pipe",
        "weapon_vj_zps_pipewrench",
        "weapon_vj_zps_plank",
        "weapon_vj_zps_racket",
        "weapon_vj_zps_shovel",
        "weapon_vj_zps_wrench",
        "weapon_vj_zps_pot",
        "weapon_vj_zps_tireiron",
        "weapon_vj_zps_axe",
        "weapon_vj_zps_spanner",
        "weapon_vj_zps_cleaver",
        "weapon_vj_zps_crowbar",
        "weapon_vj_zps_fists"
    }

    -- Particles --
    VJ.AddParticle("particles/vj_zps_blood_impact.pcf", {
    "vj_zps_blood_explode_01",
    "vj_zps_blood_gib_trail",
    "vj_zps_blood_headshot",
    "vj_zps_blood_impact_red_01",
})
    VJ.AddParticle("particles/vj_zps_grenade_fx.pcf", {
    "vj_zps_grenade_explosion_01",
})
    VJ.AddParticle("particles/vj_zps_ied.pcf", {
    "vj_zps_IED",
})
    VJ.AddParticle("particles/vj_zps_weaponparticles.pcf", {
    "vj_zps_muzzle",
})
    -- Precache Models --
    /*util.PrecacheModel("models/darkborn/zps/survivors/eugene.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors/jessica.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors/lea.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors/marcus.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors/paul.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors/pedro.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors/vanessa.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors_old/eugene.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors_old/jessica.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors_old/lea.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors_old/marcus.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors_old/paul.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors_old/pedro.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors_old/vanessa.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors/larry.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors/pms/eugene.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors/pms/jessica.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors/pms/larry.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors/pms/lea.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors/pms/marcus.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors/pms/paul.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors/pms/pedro.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors/pms/vanessa.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors_old/pms/eugene.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors_old/pms/jessica.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors_old/pms/larry.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors_old/pms/lea.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors_old/pms/marcus.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors_old/pms/paul.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors_old/pms/pedro.mdl")
    util.PrecacheModel("models/darkborn/zps/survivors_old/pms/vanessa.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies/carrier.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies/eugene.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies/jessica.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies/larry.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies/lea.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies/marcus.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies/paul.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies/pedro.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies/vanessa.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies_old/carrier.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies_old/eugene.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies_old/jessica.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies_old/larry.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies_old/lea.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies_old/marcus.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies_old/paul.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies_old/pedro.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies_old/vanessa.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies/pms/carrier.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies/pms/eugene_zombie.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies/pms/jessica_zombie.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies/pms/larry_zombie.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies/pms/lea_zombie.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies/pms/marcus_zombie.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies/pms/paul_zombie.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies/pms/pedro_zombie.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies/pms/vanessa_zombie.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies_old/pms/carrier.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies_old/pms/eugene_zombie.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies_old/pms/jessica_zombie.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies_old/pms/larry_zombie.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies_old/pms/lea_zombie.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies_old/pms/marcus_zombie.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies_old/pms/paul_zombie.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies_old/pms/pedro_zombie.mdl")
    util.PrecacheModel("models/darkborn/zps/zombies_old/pms/vanessa_zombie.mdl")
    util.PrecacheModel("models/darkborn/zps/breen.mdl")
    util.PrecacheModel("models/darkborn/zps/breen_ply.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/arms/c_carrier.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/arms/c_jessica.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/arms/c_lea.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/arms/c_marcus.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/arms/c_paul.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/arms/c_pedro.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/arms/c_vanessa.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_870.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_ak47.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_axe.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_baguette.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_barricade.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_baseballbat_aluminum.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_baseballbat_wood.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_broom.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_chair.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_crowbar.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_fryingpan.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_glock.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_glock18c.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_golf.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_grenade.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_grenade_thrown.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_hammer.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_inoculator.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_keyboard.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_m4.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_machete.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_meatcleaver.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_mp5.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_pipe.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_pipe_wrench.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_plank.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_pot.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_ppk.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_racket.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_revolver.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_shovel.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_sledgehammer.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_spanner.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_supershorty.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_tireiron.mdl")
    util.PrecacheModel("models/darkborn/zps/weapons/w_usp.mdl")*/
    util.PrecacheModel("models/darkborn/zps/gibs/gib_arm_l.mdl")
    util.PrecacheModel("models/darkborn/zps/gibs/gib_arm_r.mdl")
    util.PrecacheModel("models/darkborn/zps/gibs/gib_head.mdl")
    util.PrecacheModel("models/darkborn/zps/gibs/gib_leg_l.mdl")
    util.PrecacheModel("models/darkborn/zps/gibs/gib_leg_r.mdl")
    util.PrecacheModel("models/darkborn/zps/gibs/gib_meatclump01.mdl")
    util.PrecacheModel("models/darkborn/zps/gibs/gib_meatclump02.mdl")
    util.PrecacheModel("models/darkborn/zps/gibs/gib_meatclump03.mdl")
    util.PrecacheModel("models/darkborn/zps/gibs/gib_meatclump_tiny01.mdl")
    util.PrecacheModel("models/darkborn/zps/gibs/gib_meatclump_tiny02.mdl")
    util.PrecacheModel("models/darkborn/zps/gibs/gib_meatclump_tiny03.mdl")
    util.PrecacheModel("models/darkborn/zps/gibs/gib_pelvis.mdl")
    util.PrecacheModel("models/darkborn/zps/gibs/gib_ribs.mdl")

    -- ConVars --
    VJ.AddClientConVar("VJ_ZPS_BloodDecals", 1, "Create Blood Decals On Bonemerged Zombies")
    VJ.AddClientConVar("VJ_ZPS_ZombieOverlay", 1, "Screen Overlay When Controlling Zombies")
    VJ.AddConVar("VJ_ZPS_Infection", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_InfectionEffects", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_PlayerZombie", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_Crouch", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_Jump", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_ReloadCover", 0, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_ReloadRun", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_BreakDoors", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_BreakDoors_Func", 0, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_Alert", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_HeadGib", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_Gib", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_Hardcore", 0, {FCVAR_ARCHIVE})
    //VJ.AddConVar("VJ_ZPS_Flashlight", 0, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_Melee", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_WeaponSwitch", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_OldModels", 0, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_ZombieModels", 0, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_InfectionChance", 10, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_CarrierInfectionChance", 5, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_InfectionTime1", 30, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_InfectionTime2", 60, {FCVAR_ARCHIVE})

    -- Map Spawner ConVars --
    VJ.AddClientConVar("VJ_ZPS_MapSpawner_Music", 1, "Music For Map Spawner")
    VJ.AddClientConVar("VJ_ZPS_MapSpawner_Ambient", 1, "Ambience For Map Spawner")
    VJ.AddClientConVar("VJ_ZPS_MapSpawner_MusicVolume", 50, "Adjust Music Volume For Map Spawner")
    VJ.AddClientConVar("VJ_ZPS_MapSpawner_AmbienceVolume", 30, "Adjust Ambience Volume For Map Spawner")
    VJ.AddConVar("VJ_ZPS_MapSpawner_Enabled", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_MapSpawner_MaxZom", 80, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_MapSpawner_HordeCount", 35, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_MapSpawner_SpawnMax", 2000, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_MapSpawner_SpawnMin", 650, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_MapSpawner_HordeChance", 100, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_MapSpawner_HordeCooldownMin", 120, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_MapSpawner_HordeCooldownMax", 180, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_MapSpawner_DelayMin", 0.85, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_ZPS_MapSpawner_DelayMax", 3, {FCVAR_ARCHIVE})

      if CLIENT then
         hook.Add("PopulateToolMenu", "VJ_ADDTOMENU_ZPS", function()
         spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "ZPS (Main)", "ZPS (Main)", "", "", function(Panel)
            local vj_zpsreset_cs = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
            vj_zpsreset_cs.Options["#vjbase.menugeneral.default"] = {
                VJ_ZPS_ZombieOverlay = "1",
                VJ_ZPS_BloodDecals = "1",
}
                Panel:AddControl("ComboBox", vj_zpsreset_cs)
                Panel:AddControl("Label", {Text = "Client-Side Options:"})
                Panel:AddControl("Checkbox", {Label ="Enable Screen Overlay When Controlling Zombies?", Command ="VJ_ZPS_ZombieOverlay"})
                Panel:AddControl("Checkbox", {Label ="Enable Blood Decals For Infected Players/NPCs?", Command ="VJ_ZPS_BloodDecals"})
            if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
                Panel:AddControl("Label", {Text = "#vjbase.menu.general.admin.not"})
                Panel:AddControl("Label", {Text = "#vjbase.menu.general.admin.only"})
    return
end
            Panel:AddControl("Label", {Text = "#vjbase.menu.general.admin.only"})
            local vj_zpsreset = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
            vj_zpsreset.Options["#vjbase.menugeneral.default"] = {
                VJ_ZPS_Infection = "1",
                VJ_ZPS_InfectionEffects = "1",
                VJ_ZPS_PlayerZombie = "1",
                VJ_ZPS_Crouch = "1",
                VJ_ZPS_Jump = "1",
                VJ_ZPS_ReloadCover = "0",
                VJ_ZPS_ReloadRun = "1",
                VJ_ZPS_BreakDoors = "1",
                VJ_ZPS_BreakDoors_Func = "0",
                VJ_ZPS_Alert = "1",
                VJ_ZPS_HeadGib = "1",
                VJ_ZPS_Gib = "1",
                VJ_ZPS_Hardcore = "0",
                VJ_ZPS_Melee = "1",
                VJ_ZPS_WeaponSwitch = "1",
                VJ_ZPS_OldModels = "0",
                VJ_ZPS_ZombieModels = "0",
                VJ_ZPS_InfectionChance = "10",
                VJ_ZPS_CarrierInfectionChance = "5",
                VJ_ZPS_InfectionTime1 = "30",
                VJ_ZPS_InfectionTime2 = "60",
}
            Panel:AddControl("ComboBox", vj_zpsreset)
            Panel:ControlHelp("Note: Only future spawned SNPCs will be affected.")
            Panel:AddControl("Label", {Text = "General Options:"})
            Panel:AddControl("Checkbox", {Label ="Enable Head Gibbing?", Command ="VJ_ZPS_HeadGib"})
            Panel:AddControl("Checkbox", {Label ="Enable Gibbing?", Command ="VJ_ZPS_Gib"})
            Panel:AddControl("Checkbox", {Label ="Enable Jumping?", Command ="VJ_ZPS_Jump"})
            Panel:AddControl("Checkbox", {Label ="Enable Legacy Models?", Command ="VJ_ZPS_OldModels"})
            Panel:AddControl("Label", {Text = "Survivor Options:"})
            //Panel:AddControl("Checkbox", {Label ="Enable Survivors Having Flashlights?", Command ="VJ_ZPS_Flashlight"})
            Panel:AddControl("Checkbox", {Label ="Enable Survivors Having Melee Attack?", Command ="VJ_ZPS_Melee"})
            Panel:AddControl("Checkbox", {Label ="Enable Survivors Switching Weapons?", Command ="VJ_ZPS_WeaponSwitch"})
            Panel:AddControl("Checkbox", {Label ="Enable Survivors Finding Cover To Reload?", Command ="VJ_ZPS_ReloadCover"})
            Panel:AddControl("Checkbox", {Label ="Enable Survivors Moving While Reloading?", Command ="VJ_ZPS_ReloadRun"})
            Panel:ControlHelp("Note: You must disable the Reload Cover option to have this work.")
            Panel:AddControl("Checkbox", {Label ="Enable Survivors Using Zombie Models From Infection?", Command ="VJ_ZPS_ZombieModels"})
            Panel:ControlHelp("Ex: ZPS Survivors will use their Zombie versions instead of bonemerge when turned.")
            Panel:AddControl("Label", {Text = "Zombie Options:"})
            Panel:AddControl("Checkbox", {Label ="Enable Infection System?", Command ="VJ_ZPS_Infection"})
            Panel:AddControl("Checkbox", {Label ="Enable Infection Sounds & Effects?", Command ="VJ_ZPS_InfectionEffects"})
            Panel:ControlHelp("Note: Only ValveBiped models will be affected.")
            Panel:AddControl("Checkbox", {Label ="Enable Player-Controlled Zombies Upon Turning?", Command ="VJ_ZPS_PlayerZombie"})
            Panel:AddControl("Checkbox", {Label ="Enable Zombies Crouching?", Command ="VJ_ZPS_Crouch"})
            Panel:AddControl("Checkbox", {Label ="Enable Zombies Breaking Doors?", Command ="VJ_ZPS_BreakDoors"})
            Panel:AddControl("Checkbox", {Label ="Enable Zombies Breaking Entities Classified As 'func_door_rotating?'", Command ="VJ_ZPS_BreakDoors_Func"})
            Panel:AddControl("Checkbox", {Label ="Enable Zombies Alerting Each Other?", Command ="VJ_ZPS_Alert"})
            Panel:AddControl("Checkbox", {Label ="Enable Hardcore Mode?", Command ="VJ_ZPS_Hardcore"})
            Panel:AddControl("Label", {Text = "Modifiers:"})
            Panel:AddControl("Slider", {Label ="Infection Chance",Command ="VJ_ZPS_InfectionChance", Min = "1", Max = "100"})
            Panel:AddControl("Slider", {Label ="Carrier Infection Chance",Command ="VJ_ZPS_CarrierInfectionChance", Min = "1", Max = "100"})
            Panel:ControlHelp("Chance to be infected by a Zombie.")
            Panel:AddControl("Slider", {Label ="Infection Time Rand #1",Command ="VJ_ZPS_InfectionTime1", Min = "5", Max = "120"})
            Panel:AddControl("Slider", {Label ="Infection Time Rand #2",Command ="VJ_ZPS_InfectionTime2", Min = "5", Max = "120"})
            Panel:ControlHelp("Time until succumbing to infection.")
            Panel:ControlHelp("Note: Rand #2 must be higher than Rand #1")
end)
         spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "ZPS (Map Spawner)", "ZPS (Map Spawner)", "", "", function(Panel)
            local vj_zpsreset_mapspawner_cs = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
            vj_zpsreset_mapspawner_cs.Options["#vjbase.menugeneral.default"] = {
                VJ_ZPS_MapSpawner_Music = "1",
                VJ_ZPS_MapSpawner_Ambient = "1",
                VJ_ZPS_MapSpawner_MusicVolume = "50",
                VJ_ZPS_MapSpawner_AmbienceVolume = "30",
}
                Panel:AddControl("ComboBox", vj_zpsreset_mapspawner_cs)
                Panel:AddControl("Label", {Text = "Client-Side Options:"})
                Panel:AddControl("Checkbox", {Label ="Enable Music?", Command ="VJ_ZPS_MapSpawner_Music"})
                Panel:AddControl("Checkbox", {Label ="Enable Ambience?", Command ="VJ_ZPS_MapSpawner_Ambient"})
                Panel:AddControl("Slider", {Label = "Music Volume", Command = "VJ_ZPS_MapSpawner_MusicVolume", Type = "Float", Min = "10", Max = "100"})
                Panel:AddControl("Slider", {Label = "Ambience Volume", Command = "VJ_ZPS_MapSpawner_AmbienceVolume", Type = "Float", Min = "10", Max = "100"})
            if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
                Panel:AddControl("Label", {Text = "#vjbase.menu.general.admin.not"})
                Panel:AddControl("Label", {Text = "#vjbase.menu.general.admin.only"})
    return
end
            Panel:AddControl("Label", {Text = "#vjbase.menu.general.admin.only"})
            local vj_zpsreset_mapspawner = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
            vj_zpsreset_mapspawner.Options["#vjbase.menugeneral.default"] = {
                VJ_ZPS_MapSpawner_Enabled = "1",
                VJ_ZPS_MapSpawner_MaxZom = "80",
                VJ_ZPS_MapSpawner_HordeCount = "35",
                VJ_ZPS_MapSpawner_SpawnMax = "2000",
                VJ_ZPS_MapSpawner_SpawnMin = "650",
                VJ_ZPS_MapSpawner_HordeChance = "100",
                VJ_ZPS_MapSpawner_HordeCooldownMin = "120",
                VJ_ZPS_MapSpawner_HordeCooldownMax = "180",
                VJ_ZPS_MapSpawner_DelayMin = "0.85",
                VJ_ZPS_MapSpawner_DelayMax = "3",
}
            Panel:AddControl("ComboBox", vj_zpsreset_mapspawner)
            Panel:AddControl("Label", {Text = "Options:"})
            Panel:AddControl("Checkbox", {Label = "Enable Map Spawner processing?", Command = "VJ_ZPS_MapSpawner_Enabled"})
            Panel:AddControl("Label", {Text = "Modifiers:"})
            Panel:AddControl("Slider", {Label = "Max Zombies", Command = "VJ_ZPS_MapSpawner_MaxZom", Type = "Float", Min = "5", Max = "400"})
            Panel:AddControl("Slider", {Label = "Min Distance they can spawn from players", Command = "VJ_ZPS_MapSpawner_SpawnMin", Type = "Float", Min = "150", Max = "30000"})
            Panel:AddControl("Slider", {Label = "Max Distance they can spawn from players", Command = "VJ_ZPS_MapSpawner_SpawnMax", Type = "Float", Min = "150", Max = "30000"})
            Panel:AddControl("Slider", {Label = "Min time between spawns", Command = "VJ_ZPS_MapSpawner_DelayMin", Type = "Float", Min = "0.1", Max = "15"})
            Panel:AddControl("Slider", {Label = "Max time between spawns", Command = "VJ_ZPS_MapSpawner_DelayMax", Type = "Float", Min = "0.2", Max = "15"})
            Panel:AddControl("Slider", {Label = "Max Zombie horde", Command = "VJ_ZPS_MapSpawner_HordeCount", Type = "Float", Min = "5", Max = "400"})
            Panel:AddControl("Slider", {Label = "Chance that a horde will appear", Command = "VJ_ZPS_MapSpawner_HordeChance", Type = "Float", Min = "1", Max = "500"})
            Panel:AddControl("Slider", {Label = "Min cooldown time for horde spawns", Command = "VJ_ZPS_MapSpawner_HordeCooldownMin", Type = "Float", Min = "1", Max = "800"})
            Panel:AddControl("Slider", {Label = "Max cooldown time for horde spawns", Command = "VJ_ZPS_MapSpawner_HordeCooldownMax", Type = "Float", Min = "1", Max = "800"})
        end)
    end)
end
    VJ_ZPS_NODEPOS = {}
    hook.Add("EntityRemoved","VJ_ZPS_AddNodes",function(ent)
        if ent:GetClass() == "info_node" then
            table.insert(VJ_ZPS_NODEPOS,ent:GetPos())
    end
end)

 if CLIENT then
    net.Receive("VJ_ZPS_Zombie_HUD",function(len,pl)
        local delete = net.ReadBool()
        local ply = net.ReadEntity()
        if !IsValid(ply) or GetConVar("VJ_ZPS_ZombieOverlay"):GetInt() == 0 then delete = true end
        hook.Add("RenderScreenspaceEffects","VJ_ZPS_ZombieHUD_Overlay",function()
           local threshold = 0.30
           DrawMaterialOverlay("zps/overlay/zombovision",threshold)
end)
        if delete then hook.Remove("RenderScreenspaceEffects","VJ_ZPS_ZombieHUD_Overlay") end

        hook.Add("PreDrawHalos","VJ_ZPS_ZombieHUD_Halo",function()
        if IsValid(ent) then return end
            //local tbInf = {}
            local tbEne = {}
            local tbFri = {}
            local tbCar = {}
            //local colInf = Color(33,255,0,255)
            local colEne = Color(255,0,0)
            local colFri = Color(0,127,31,255)
            local colCar = Color(255,191,0,255)
            for _,v in pairs(ents.GetAll()) do
            local classType = v:GetClass()
            if (v:IsNPC() && classType != "obj_vj_bullseye" or v:IsPlayer()) && !v:IsFlagSet(FL_NOTARGET) then
            if string.find(classType,"npc_vj_zps_z") && classType != "npc_vj_zps_zcarrier" then
                table.insert(tbFri,v)
                elseif classType == "npc_vj_zps_zcarrier" then
                table.insert(tbCar,v)
                /*elseif v.ZPS_InfectedVictim then
                table.insert(tbInf,v)*/
            else
                table.insert(tbEne,v)
        end
    end
end
        //halo.Add(tbInf,colInf,4,4,3,true,true)
        halo.Add(tbEne,colEne,4,4,3,true,true)
        halo.Add(tbFri,colFri,4,4,3,true,true)
        halo.Add(tbCar,colCar,4,4,3,true,true)
end)
        if delete then hook.Remove("PreDrawHalos","VJ_ZPS_ZombieHUD_Halo") end
end)
    net.Receive("VJ_ZPS_InfectionScreenEffect",function()
    local ply = net.ReadEntity()
    local color = Color(75, 0, 0, 255)
    ply.VJ_ZPS_InfectionEffect_Time = CurTime() +0.1
    hook.Add("RenderScreenspaceEffects","VJ_ZPS_InfectionEffect" .. ply:EntIndex(),function()
        if !IsValid(ply) or IsValid(ply) && (CurTime() > ply.VJ_ZPS_InfectionEffect_Time) then hook.Remove("RenderScreenspaceEffects","VJ_ZPS_InfectionEffect" .. ply:EntIndex()) return end
            ply:ScreenFade(SCREENFADE.IN, color, 0.5, 0)
        end)
    end)
end

    local NPC = FindMetaTable("NPC")
    local ENT = FindMetaTable("Entity")
    local Phys = FindMetaTable("PhysObj")

 if SERVER then
    util.AddNetworkString("VJ_ZPS_Zombie_HUD")
    util.AddNetworkString("VJ_ZPS_InfectionScreenEffect")

    hook.Add("PlayerSpawn","VJ_ZPS_InfectionCheck",function(ply)
    if ply.ZPS_InfectedVictim then
        ply.ZPS_InfectedVictim = false
    end
end)

    hook.Add("OnNPCKilled","VJ_ZPS_Infection_NPC",function(victim,inflictor,attacker)
    VJ_ZPS_Infect(victim,inflictor,attacker,false)
end)
    hook.Add("PlayerDeath","VJ_ZPS_Infection_Player",function(victim,inflictor,attacker)
    VJ_ZPS_Infect(victim,inflictor,attacker,true)
end)
---------------------------------------------------------------------------------------------------------------------------------------------
function VJ_ZPS_InfectionApply(victim,zombie)
 if victim.LNR_InfectedVictim or victim.GOTDR_InfectedVictim or victim.NMRIHR_InfectedVictim or victim.CNCR_InfectedVictim or victim:IsNextBot() then return end
 if GetConVar("VJ_ZPS_Infection"):GetInt() == 0 or victim.IsZPSZombie or (victim.VJ_NPC_Class && table.HasValue(victim.VJ_NPC_Class,"CLASS_ZOMBIE")) or (victim.IsVJBaseSNPC && victim.Dead or victim.DeathAnimationCodeRan or victim.GodMode) or (victim:LookupBone("ValveBiped.Bip01_Pelvis") == nil) then return end
 local victimModel = victim:GetModel()
 victim.ZPS_NextCoughT = CurTime() + math.random(1,30)
 if GetConVar("VJ_ZPS_InfectionEffects"):GetInt() == 1 then
    hook.Add("Think","VJ_ZPS_VictimCough",function()
    if !IsValid(victim) or !victim.ZPS_InfectedVictim or (victim:IsPlayer() && !victim:Alive()) or (victim:IsPlayer() && victim.VJTag_IsControllingNPC) or (victim.IsVJBaseSNPC && victim.Dead or victim.DeathAnimationCodeRan) then hook.Remove("Think","VJ_ZPS_VictimCough") return end
    if !victim.IsZPSSurvivor && CurTime() > victim.ZPS_NextCoughT then
    if string.find(victimModel,"female") or string.find(victimModel,"alyx") or string.find(victimModel,"mossman") or string.find(victimModel,"chell") then
       VJ.CreateSound(victim,"ambient/voices/cough"..math.random(1,4)..".wav",75,120)
    else
       VJ.CreateSound(victim,"ambient/voices/cough"..math.random(1,4)..".wav",75,100)
end
    if victim:IsPlayer() then
        net.Start("VJ_ZPS_InfectionScreenEffect")
            net.WriteEntity(victim)
        net.Send(victim)
end
            victim.ZPS_NextCoughT = CurTime() + math.random(1,30)
        end
    end)
end
 local deaths
 if victim:IsPlayer() then
    deaths = victim:Deaths()
end
    timer.Simple(math.random(GetConVar("VJ_ZPS_InfectionTime1"):GetInt(),GetConVar("VJ_ZPS_InfectionTime2"):GetInt()),function()
    if IsValid(victim) && victim.ZPS_InfectedVictim then
    if (victim:IsPlayer() && !victim:Alive()) or (victim:IsPlayer() && victim:Deaths() > deaths) or (victim:IsPlayer() && victim.VJTag_IsControllingNPC) or (victim:IsPlayer() && GetConVar("sbox_godmode"):GetInt() == 1) or (victim.IsVJBaseSNPC && victim.Dead or victim.DeathAnimationCodeRan or victim.GodMode) then victim.ZPS_InfectedVictim = false return end
    if victim:IsPlayer() && GetConVar("VJ_ZPS_PlayerZombie"):GetInt() == 0 then
        victim:Kill()
        VJ_ZPS_CreateZombie(victim,victim)
end
    if victim:IsPlayer() && GetConVar("VJ_ZPS_PlayerZombie"):GetInt() == 1 then
        VJ_ZPS_SetPlayerZombie(victim,victim)
end
    if victim:IsNPC() then
       VJ_ZPS_CreateZombie(victim,victim)
end
    if GetConVar("VJ_ZPS_InfectionEffects"):GetInt() == 1 && !victim.IsZPSSurvivor then
    if string.find(victimModel,"female") or string.find(victimModel,"alyx") or string.find(victimModel,"mossman") or string.find(victimModel,"chell") then
       VJ.CreateSound(victim,"ambient/voices/citizen_beaten"..math.random(1,5)..".wav",75,120)
    else
       VJ.CreateSound(victim,"ambient/voices/citizen_beaten"..math.random(1,5)..".wav",75,100)
end
       VJ.CreateSound(victim,{"darkborn/zps/zombies/z_vision/activate.wav","darkborn/zps/zombies/z_vision/deactivate.wav"},75,100)
       VJ.CreateSound(victim,"darkborn/zps/infection/jolt-0"..math.random(1,4)..".wav",75,100)
end
    if GetConVar("VJ_ZPS_InfectionEffects"):GetInt() == 1 && victim.IsZPSSurvivor then
       VJ.CreateSound(victim,{"darkborn/zps/zombies/z_vision/activate.wav","darkborn/zps/zombies/z_vision/deactivate.wav"},75,100)
       VJ.CreateSound(victim,"darkborn/zps/infection/jolt-0"..math.random(1,4)..".wav",75,100)
end
        end
    end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function VJ_ZPS_Infect(victim,inflictor,attacker,isPlayer)
if !victim.ZPS_InfectedVictim or GetConVar("VJ_ZPS_Infection"):GetInt() == 0 or (victim:LookupBone("ValveBiped.Bip01_Pelvis") == nil) or victim:IsNextBot() then return end
    if !isPlayer then
        if inflictor.ZPS_VirusInfection then
          if inflictor == attacker && victim != inflictor then
            if victim.ZPS_VictimIsInfected then return end
               victim.ZPS_VictimIsInfected = true
                VJ_ZPS_CreateZombie(victim,inflictor)
    end
end
     else
        if inflictor.ZPS_VirusInfection then
            if inflictor == attacker && victim != inflictor then
                VJ_ZPS_CreateZombie(victim,inflictor)
            end
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function VJ_ZPS_SetPlayerZombie(victim,inflictor,attacker)
   if !victim.ZPS_InfectedVictim or GetConVar("VJ_ZPS_Infection"):GetInt() == 0 or GetConVar("VJ_ZPS_PlayerZombie"):GetInt() == 0 or GetConVar("sbox_godmode"):GetInt() == 1 or victim.VJTag_IsControllingNPC or (victim:LookupBone("ValveBiped.Bip01_Pelvis") == nil) then return end
      local zombie = NULL
      local oldModel = victim:GetModel()
      local oldSkin = victim:GetSkin()
      local oldMaterial = victim:GetMaterial()
      local oldColor = victim:GetColor()
      local oldPlayerColor = victim:GetPlayerColor()
     if victim.ZPS_InfectedVictim && GetConVar("VJ_ZPS_Hardcore"):GetInt() == 0 then
        zombie = ents.Create("npc_vj_zps_zinf_ply")
        zombie:SetPos(victim:GetPos())
        zombie:SetAngles(victim:GetAngles())
        zombie.GodMode = true
        zombie:Spawn()
        zombie:VJ_ZPS_CreateBoneMerge(zombie,oldModel,oldSkin,oldColor,oldMaterial,oldPlayerColor,victim)
    if oldModel == "models/darkborn/zps/survivors/pms/eugene.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/eugene.mdl" then
            zombie:ZombieVoice_Eugene()
    elseif oldModel == "models/darkborn/zps/survivors/pms/jessica.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/jessica.mdl" then
            zombie:ZombieVoice_Jessica()
    elseif oldModel == "models/darkborn/zps/survivors/pms/larry.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/larry.mdl" then
            zombie:ZombieVoice_Larry()
    elseif oldModel == "models/darkborn/zps/survivors/pms/lea.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/lea.mdl" then
            zombie:ZombieVoice_Lea()
    elseif oldModel == "models/darkborn/zps/survivors/pms/marcus.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/marcus.mdl" then
            zombie:ZombieVoice_Marcus()
    elseif oldModel == "models/darkborn/zps/survivors/pms/paul.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/paul.mdl" then
            zombie:ZombieVoice_Paul()
    elseif oldModel == "models/darkborn/zps/survivors/pms/pedro.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/pedro.mdl" then
            zombie:ZombieVoice_Pedro()
    elseif oldModel == "models/darkborn/zps/survivors/pms/vanessa.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/vanessa.mdl" then
            zombie:ZombieVoice_Vanessa()
    end
end
     if victim.ZPS_InfectedVictim && GetConVar("VJ_ZPS_Hardcore"):GetInt() == 1 then
        zombie = ents.Create("npc_vj_zps_zcarrier")
        zombie:SetPos(victim:GetPos())
        zombie:SetAngles(victim:GetAngles())
        zombie.GodMode = true
        zombie:Spawn()
end
     if !IsValid(SpawnControllerObject) then
        local SpawnControllerObject = ents.Create("obj_vj_npccontroller")
        SpawnControllerObject.VJCE_Player = victim
        SpawnControllerObject:SetControlledNPC(zombie)
        SpawnControllerObject:Spawn()
        SpawnControllerObject:StartControlling()
end
    if zombie.IsVJBaseSNPC && zombie.CurrentPossibleEnemies == nil then -- This fixes an error that would pop up if an SNPC or entity infected more than one enemy at a time
        zombie.CurrentPossibleEnemies = {}
end
    timer.Simple(1,function() if IsValid(zombie) then
        zombie.GodMode = false
    end
end)
    if string.find(oldModel,"female") or string.find(oldModel,"alyx") or string.find(oldModel,"mossman") or string.find(oldModel,"chell") then
        zombie:ZombieVoice_InfectedFemale()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function VJ_ZPS_CreateZombie(victim,inflictor)
     local findPos = victim:GetPos()
     local findMDL = victim:GetModel()
     timer.Simple(0.01,function()
        for _,v in pairs(ents.FindInSphere(findPos,75)) do
          if GetConVar("ai_serverragdolls"):GetInt() == 1 && v:GetClass() == "prop_ragdoll" && v:GetModel() == findMDL && !v.IsVJBaseCorpse then
            v:Remove()
        end
    end
end)
      local zombie = NULL
      //local sndTbl = nil
      local survName = victim:GetClass()
      local oldModel = victim:GetModel()
      local oldSkin = victim:GetSkin()
      local oldMaterial = victim:GetMaterial()
      local oldColor = victim:GetColor()
   if victim.GetPlayerColor && victim:GetPlayerColor() then
      oldPlayerColor = victim:GetPlayerColor()
   else
      oldPlayerColor = false
end
    /*local DefaultFootSteps = {"npc/metropolice/gear1.wav","npc/metropolice/gear2.wav","npc/metropolice/gear3.wav","npc/metropolice/gear4.wav","npc/metropolice/gear5.wav","npc/metropolice/gear6.wav"}
    if victim.SoundTbl_FootStep && #victim.SoundTbl_FootStep > 0 && !victim.IsZPSSurvivor && GetConVar("VJ_ZPS_Hardcore"):GetInt() == 0 then
        sndTbl = victim.SoundTbl_FootStep
    else
    if victim.IsVJBaseSNPC_Human && !VJ.PICK(victim.SoundTbl_FootStep) && !victim.IsZPSSurvivor && GetConVar("VJ_ZPS_Hardcore"):GetInt() == 0 then
        sndTbl = DefaultFootSteps
    end
end*/
    if (victim:IsNPC() or victim:IsPlayer()) && victim.ZPS_InfectedVictim then
    if !victim.IsZPSSurvivor && GetConVar("VJ_ZPS_Hardcore"):GetInt() == 0 then
            zombie = ents.Create("npc_vj_zps_zinf")
            zombie:SetPos(victim:GetPos())
            zombie:SetAngles(victim:GetAngles())
            zombie.GodMode = true
            zombie:Spawn()
            undo.ReplaceEntity(victim,zombie)
            zombie:VJ_ZPS_CreateBoneMerge(zombie,oldModel,oldSkin,oldColor,oldMaterial,oldPlayerColor,victim)
    if oldModel == "models/darkborn/zps/survivors/pms/eugene.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/eugene.mdl" then
            zombie:ZombieVoice_Eugene()
    elseif oldModel == "models/darkborn/zps/survivors/pms/jessica.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/jessica.mdl" then
            zombie:ZombieVoice_Jessica()
    elseif oldModel == "models/darkborn/zps/survivors/pms/larry.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/larry.mdl" then
            zombie:ZombieVoice_Larry()
    elseif oldModel == "models/darkborn/zps/survivors/pms/lea.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/lea.mdl" then
            zombie:ZombieVoice_Lea()
    elseif oldModel == "models/darkborn/zps/survivors/pms/marcus.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/marcus.mdl" then
            zombie:ZombieVoice_Marcus()
    elseif oldModel == "models/darkborn/zps/survivors/pms/paul.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/paul.mdl" then
            zombie:ZombieVoice_Paul()
    elseif oldModel == "models/darkborn/zps/survivors/pms/pedro.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/pedro.mdl" then
            zombie:ZombieVoice_Pedro()
    elseif oldModel == "models/darkborn/zps/survivors/pms/vanessa.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/vanessa.mdl" then
            zombie:ZombieVoice_Vanessa()
    end
end
    if victim.IsZPSSurvivor && GetConVar("VJ_ZPS_ZombieModels"):GetInt() == 0 && GetConVar("VJ_ZPS_Hardcore"):GetInt() == 0 then
            zombie = ents.Create("npc_vj_zps_zinf")
            zombie:SetPos(victim:GetPos())
            zombie:SetAngles(victim:GetAngles())
            zombie.GodMode = true
            zombie:Spawn()
            undo.ReplaceEntity(victim,zombie)
            zombie:VJ_ZPS_CreateBoneMerge(zombie,oldModel,oldSkin,oldColor,oldMaterial,oldPlayerColor,victim)
    if survName == "npc_vj_zps_eugene" then
            zombie:ZombieVoice_Eugene()
    elseif survName == "npc_vj_zps_jessica" then
            zombie:ZombieVoice_Jessica()
    elseif survName == "npc_vj_zps_larry" then
            zombie:ZombieVoice_Larry()
    elseif survName == "npc_vj_zps_lea" then
            zombie:ZombieVoice_Lea()
    elseif survName == "npc_vj_zps_marcus" then
            zombie:ZombieVoice_Marcus()
    elseif survName == "npc_vj_zps_paul" then
            zombie:ZombieVoice_Paul()
    elseif survName == "npc_vj_zps_pedro" then
            zombie:ZombieVoice_Pedro()
    elseif survName == "npc_vj_zps_vanessa" then
            zombie:ZombieVoice_Vanessa()
    end
end
    if GetConVar("VJ_ZPS_Hardcore"):GetInt() == 1 then
            zombie = ents.Create("npc_vj_zps_zcarrier")
            zombie:SetPos(victim:GetPos())
            zombie:SetAngles(victim:GetAngles())
            zombie.GodMode = true
            zombie:Spawn()
            undo.ReplaceEntity(victim,zombie)
end
    if victim.IsZPSSurvivor && GetConVar("VJ_ZPS_ZombieModels"):GetInt() == 1 && GetConVar("VJ_ZPS_Hardcore"):GetInt() == 0 then
    if survName == "npc_vj_zps_eugene" then
            zombie = ents.Create("npc_vj_zps_zeugene")
    elseif survName == "npc_vj_zps_jessica" then
            zombie = ents.Create("npc_vj_zps_zjessica")
    elseif survName == "npc_vj_zps_larry" then
            zombie = ents.Create("npc_vj_zps_zlarry")
    elseif survName == "npc_vj_zps_lea" then
            zombie = ents.Create("npc_vj_zps_zlea")
    elseif survName == "npc_vj_zps_marcus" then
            zombie = ents.Create("npc_vj_zps_zmarcus")
    elseif survName == "npc_vj_zps_paul" then
            zombie = ents.Create("npc_vj_zps_zpaul")
    elseif survName == "npc_vj_zps_pedro" then
            zombie = ents.Create("npc_vj_zps_zpedro")
    elseif survName == "npc_vj_zps_vanessa" then
            zombie = ents.Create("npc_vj_zps_zvanessa")
end
            zombie:SetPos(victim:GetPos())
            zombie:SetAngles(victim:GetAngles())
            zombie.GodMode = true
            zombie:Spawn()
            undo.ReplaceEntity(victim,zombie)
    end
end
    timer.Simple(1,function() if IsValid(zombie) then
        zombie.GodMode = false
    end
end)
    /*if sndTbl then
        zombie.SoundTbl_FootStep = sndTbl
end*/
    if zombie.IsVJBaseSNPC && zombie.CurrentPossibleEnemies == nil then -- This fixes an error that would pop up if an SNPC or entity infected more than one enemy at a time
        zombie.CurrentPossibleEnemies = {}
end
    if string.find(oldModel,"female") or string.find(oldModel,"alyx") or string.find(oldModel,"mossman") or string.find(oldModel,"chell") then
        zombie:ZombieVoice_InfectedFemale()
end
     if victim.IsVJBaseSNPC then
        victim.HasDeathCorpse = false
        victim.HasDeathAnimation = false
end
     if victim:IsPlayer() then
        if IsValid(victim:GetRagdollEntity()) then
           SafeRemoveEntity(victim:GetRagdollEntity())
    end
end
     if victim:IsNPC() then
        SafeRemoveEntity(victim)
end
        if IsValid(victim:GetActiveWeapon()) then
           SafeRemoveEntity(victim:GetActiveWeapon())
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:VJ_ZPS_CreateBoneMerge(zombieEnt,oldModel,oldSkin,oldColor,oldMaterial,oldPlayerColor,bgEnt)
     local creator = NULL
     if zombieEnt:IsNPC() then
        creator = IsValid(zombieEnt:GetCreator()) && zombieEnt:GetCreator()
        zombieEnt:SetCollisionBounds(zombieEnt:GetCollisionBounds())
end
        local body = ents.Create("vj_zps_infection")
        body:SetModel(oldModel)
        body:SetPos(zombieEnt:GetPos())
        body:SetAngles(zombieEnt:GetAngles())
        body.VJ_Owner = zombieEnt
        body:Spawn()
        body:SetParent(zombieEnt)
     if string.find(body:GetModel(),"models/darkborn/zps/survivors/") or string.find(body:GetModel(),"models/darkborn/zps/survivors_old/") or string.find(body:GetModel(),"models/darkborn/zps/survivors/pms/") or string.find(body:GetModel(),"models/darkborn/zps/survivors_old/pms/") then
        body:SetSkin(1)
     else
        body:SetSkin(oldSkin)
end
        body:SetColor(oldColor)
        body:SetMaterial(oldMaterial)
        if oldPlayerColor != false then body:SetPlayerColor(oldPlayerColor) else body:SetPlayerColor(Color(61,87,105):ToVector()) end
        if IsValid(bgEnt) then
        for i = 0, body:GetNumBodyGroups() -1 do
        body:SetBodygroup(i,bgEnt:GetBodygroup(i))
    end
end
    zombieEnt.Bonemerge = body
end
-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
    AddCSLuaFile()
    VJ.AddAddonProperty(AddonName,AddonType)
else
    if CLIENT then
        chat.AddText(Color(0, 200, 200), AddonName,
        Color(0, 255, 0), " was unable to install, you are missing ",
        Color(255, 100, 0), "VJ Base!")
    end

    timer.Simple(1, function()
        if not VJBASE_ERROR_MISSING then
            VJBASE_ERROR_MISSING = true
            if CLIENT then
                // Get rid of old error messages from addons running on older code...
                if VJF && type(VJF) == "Panel" then
                    VJF:Close()
                end
                VJF = true

                local frame = vgui.Create("DFrame")
                frame:SetSize(600, 160)
                frame:SetPos((ScrW() - frame:GetWide()) / 2, (ScrH() - frame:GetTall()) / 2)
                frame:SetTitle("Error: VJ Base is missing!")
                frame:SetBackgroundBlur(true)
                frame:MakePopup()

                local labelTitle = vgui.Create("DLabel", frame)
                labelTitle:SetPos(250, 30)
                labelTitle:SetText("VJ BASE IS MISSING!")
                labelTitle:SetTextColor(Color(255,128,128))
                labelTitle:SizeToContents()

                local label1 = vgui.Create("DLabel", frame)
                label1:SetPos(170, 50)
                label1:SetText("Garry's Mod was unable to find VJ Base in your files!")
                label1:SizeToContents()

                local label2 = vgui.Create("DLabel", frame)
                label2:SetPos(10, 70)
                label2:SetText("You have an addon installed that requires VJ Base but VJ Base is missing. To install VJ Base, click on the link below. Once\n                                                   installed, make sure it is enabled and then restart your game.")
                label2:SizeToContents()

                local link = vgui.Create("DLabelURL", frame)
                link:SetSize(300, 20)
                link:SetPos(195, 100)
                link:SetText("VJ_Base_Download_Link_(Steam_Workshop)")
                link:SetURL("https://steamcommunity.com/sharedfiles/filedetails/?id=131759821")

                local buttonClose = vgui.Create("DButton", frame)
                buttonClose:SetText("CLOSE")
                buttonClose:SetPos(260, 120)
                buttonClose:SetSize(80, 35)
                buttonClose.DoClick = function()
                    frame:Close()
                end
            elseif (SERVER) then
                VJF = true
                timer.Remove("VJBASEMissing")
                timer.Create("VJBASE_ERROR_CONFLICT", 5, 0, function()
                    print("VJ Base is missing! Download it from the Steam Workshop! Link: https://steamcommunity.com/sharedfiles/filedetails/?id=131759821")
                end)
            end
        end
    end)
end