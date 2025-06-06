/*--------------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
    VJ.AddPlugin("Zombie Panic! Source SNPCs", "NPC")

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
    VJ.AddNPCWeapon("VJ_ZPS_Snowball", "weapon_vj_zps_snowball",spawnCategory)
    VJ.AddNPCWeapon("VJ_ZPS_Tennis_Ball", "weapon_vj_zps_tennisball",spawnCategory)

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
        "weapon_vj_zps_ied",
        "weapon_vj_zps_snowball",
        "weapon_vj_zps_tennisball"
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

    -- Decals --
    game.AddDecal("VJ_ZPS_Snow",{"decals/vj_zps/decal_snowball_splat"})

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
    VJ.AddParticle("particles/vj_zps_impact_fx_new.pcf", {
    "vj_zps_impact_snowball",
})
    VJ.AddParticle("particles/vj_zps_weaponparticles.pcf", {
    "vj_zps_muzzle",
})

-- Weapon Sounds --
sound.Add({
    name = "VJ.ZPS_AK47.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = 140,
    pitch = {90,110},
    sound = "^darkborn/zps/weapons/firearms/ak-47/fire.wav"
})
sound.Add({
    name = "VJ.ZPS_Glock17.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = 140,
    pitch = {90,110},
    sound = "^darkborn/zps/weapons/firearms/glock/fire.wav"
})
sound.Add({
    name = "VJ.ZPS_Glock18c.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = 140,
    pitch = {90,110},
    sound = "^darkborn/zps/weapons/firearms/glock18c/fire.wav"
})
sound.Add({
    name = "VJ.ZPS_M4.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = 140,
    pitch = {90,110},
    sound = "^darkborn/zps/weapons/firearms/m4/fire.wav"
})
sound.Add({
    name = "VJ.ZPS_MP5.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = 140,
    pitch = {90,110},
    sound = "^darkborn/zps/weapons/firearms/mp5/fire.wav"
})
sound.Add({
    name = "VJ.ZPS_PPK.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = 140,
    pitch = {90,110},
    sound = "^darkborn/zps/weapons/firearms/ppk/fire.wav"
})
sound.Add({
    name = "VJ.ZPS_Remington870.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = 140,
    pitch = {90,110},
    sound = "^darkborn/zps/weapons/firearms/remington870/fire.wav"
})
sound.Add({
    name = "VJ.ZPS_Revolver.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = 140,
    pitch = {90,110},
    sound = "^darkborn/zps/weapons/firearms/magnum/fire.wav"
})
sound.Add({
    name = "VJ.ZPS_SuperShorty.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = 140,
    pitch = {90,110},
    sound = "^darkborn/zps/weapons/firearms/super_shorty/fire.wav"
})
sound.Add({
    name = "VJ.ZPS_USP.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = 140,
    pitch = {90,110},
    sound = "^darkborn/zps/weapons/firearms/usp/fire.wav"
})
sound.Add({
    name = "VJ.ZPS_Winchester.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = 140,
    pitch = {90,110},
    sound = "^darkborn/zps/weapons/firearms/doublebarrel_shotgun/fire.wav"
})
sound.Add({
    name = "VJ.ZPS_Winchester.Double",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = 140,
    pitch = {90,110},
    sound = "^darkborn/zps/weapons/firearms/doublebarrel_shotgun/fire_double.wav"
})
sound.Add({
    name = "VJ.ZPS_HEGrenade_Explosion",
    channel = CHAN_STATIC,
    volume = 1.0,
    level = 140,
    pitch = 100,
    sound = "^darkborn/zps/weapons/explosives/grenade/nade_blast.wav"
})
sound.Add({
    name = "VJ.ZPS_IED_Explosion",
    channel = CHAN_STATIC,
    volume = 1.0,
    level = 140,
    pitch = 100,
    sound = "^darkborn/zps/weapons/explosives/ied/ied_explode.wav"
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
    VJ.AddConVar("VJ_ZPS_SantaHat", 0, {FCVAR_ARCHIVE})
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
         spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "ZPS - General", "ZPS - General", "", "", function(panel)
            local vj_zpsreset_cs = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
            vj_zpsreset_cs.Options["#vjbase.menu.general.reset.everything"] = {
                VJ_ZPS_ZombieOverlay = "1",
                VJ_ZPS_BloodDecals = "1"
}
                panel:AddControl("ComboBox", vj_zpsreset_cs)
                panel:Help("Client-Side Options:")
                panel:CheckBox("Enable Screen Overlay When Controlling Zombies?","VJ_ZPS_ZombieOverlay")
                panel:CheckBox("Enable Blood Decals For Infected Players/NPCs?","VJ_ZPS_BloodDecals")
            if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
                panel:Help("#vjbase.menu.general.admin.not")
                panel:Help("#vjbase.menu.general.admin.only")
    return
end
            panel:Help("#vjbase.menu.general.admin.only")
            local vj_zpsreset = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
            vj_zpsreset.Options["#vjbase.menu.general.reset.everything"] = {
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
                VJ_ZPS_SantaHat = "0",
                VJ_ZPS_InfectionChance = "10",
                VJ_ZPS_CarrierInfectionChance = "5",
                VJ_ZPS_InfectionTime1 = "30",
                VJ_ZPS_InfectionTime2 = "60"
}
            panel:AddControl("ComboBox", vj_zpsreset)
            panel:ControlHelp("Note: Only future spawned SNPCs will be affected.")
            panel:Help("General Options:")
            panel:CheckBox("Enable Head Gibbing?","VJ_ZPS_HeadGib")
            panel:CheckBox("Enable Gibbing?","VJ_ZPS_Gib")
            panel:CheckBox("Enable Jumping?","VJ_ZPS_Jump")
            panel:CheckBox("Enable Legacy Models?","VJ_ZPS_OldModels")
            panel:Help("Survivor Options:")
            //panel:CheckBox("Enable Survivors Having Flashlights?","VJ_ZPS_Flashlight")
            panel:CheckBox("Enable Survivors Having Melee Attack?","VJ_ZPS_Melee")
            panel:CheckBox("Enable Survivors Switching Weapons?","VJ_ZPS_WeaponSwitch")
            panel:CheckBox("Enable Survivors Finding Cover To Reload?","VJ_ZPS_ReloadCover")
            panel:CheckBox("Enable Survivors Moving While Reloading?","VJ_ZPS_ReloadRun")
            panel:ControlHelp("Note: You must disable the Reload Cover option to have this work.")
            panel:CheckBox("Enable Survivors Using Zombie Models From Infection?","VJ_ZPS_ZombieModels")
            panel:ControlHelp("Ex: ZPS Survivors will use their Zombie versions instead of bonemerge when turned.")
            panel:Help("Zombie Options:")
            panel:CheckBox("Enable Infection System?","VJ_ZPS_Infection")
            panel:CheckBox("Enable Infection Sounds & Effects?","VJ_ZPS_InfectionEffects")
            panel:ControlHelp("Note: Only ValveBiped models will be affected.")
            panel:CheckBox("Enable Player-Controlled Zombies Upon Turning?","VJ_ZPS_PlayerZombie")
            panel:CheckBox("Enable Zombies Crouching?","VJ_ZPS_Crouch")
            panel:CheckBox("Enable Zombies Breaking Doors?","VJ_ZPS_BreakDoors")
            panel:CheckBox("Enable Zombies Breaking Entities Classified As 'func_door_rotating?'","VJ_ZPS_BreakDoors_Func")
            panel:CheckBox("Enable Zombies Alerting Each Other?","VJ_ZPS_Alert")
            panel:CheckBox("Enable Hardcore Mode?","VJ_ZPS_Hardcore")
            panel:CheckBox("Enable Santa Hat For Carrier?","VJ_ZPS_SantaHat")
            panel:Help("Modifiers:")
            panel:NumSlider("Infection Chance","VJ_ZPS_InfectionChance",1,100,0)
            panel:NumSlider("Carrier Infection Chance","VJ_ZPS_CarrierInfectionChance",1,100,0)
            panel:ControlHelp("Chance to be infected by a Zombie.")
            panel:NumSlider("Infection Time Rand #1","VJ_ZPS_InfectionTime1",5,120,0)
            panel:NumSlider("Infection Time Rand #2","VJ_ZPS_InfectionTime2",5,120,0)
            panel:ControlHelp("Time until succumbing to infection.")
            panel:ControlHelp("Note: Rand #2 must be higher than Rand #1")
end)
         spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "ZPS - Map Spawner", "ZPS - Map Spawner", "", "", function(panel)
            local vj_zpsreset_mapspawner_cs = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
            vj_zpsreset_mapspawner_cs.Options["#vjbase.menu.general.reset.everything"] = {
                VJ_ZPS_MapSpawner_Music = "1",
                VJ_ZPS_MapSpawner_Ambient = "1",
                VJ_ZPS_MapSpawner_MusicVolume = "50",
                VJ_ZPS_MapSpawner_AmbienceVolume = "30"
}
                panel:AddControl("ComboBox", vj_zpsreset_mapspawner_cs)
                panel:Help("Client-Side Options:")
                panel:CheckBox("Enable Music?","VJ_ZPS_MapSpawner_Music")
                panel:CheckBox("Enable Ambience?","VJ_ZPS_MapSpawner_Ambient")
                panel:NumSlider("Music Volume","VJ_ZPS_MapSpawner_MusicVolume",10,100,2)
                panel:NumSlider("Ambience Volume","VJ_ZPS_MapSpawner_AmbienceVolume",10,100,2)
            if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
                panel:Help("#vjbase.menu.general.admin.not")
                panel:Help("#vjbase.menu.general.admin.only")
    return
end
            panel:Help("#vjbase.menu.general.admin.only")
            local vj_zpsreset_mapspawner = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
            vj_zpsreset_mapspawner.Options["#vjbase.menu.general.reset.everything"] = {
                VJ_ZPS_MapSpawner_Enabled = "1",
                VJ_ZPS_MapSpawner_MaxZom = "80",
                VJ_ZPS_MapSpawner_HordeCount = "35",
                VJ_ZPS_MapSpawner_SpawnMax = "2000",
                VJ_ZPS_MapSpawner_SpawnMin = "650",
                VJ_ZPS_MapSpawner_HordeChance = "100",
                VJ_ZPS_MapSpawner_HordeCooldownMin = "120",
                VJ_ZPS_MapSpawner_HordeCooldownMax = "180",
                VJ_ZPS_MapSpawner_DelayMin = "0.85",
                VJ_ZPS_MapSpawner_DelayMax = "3"
}
            panel:AddControl("ComboBox", vj_zpsreset_mapspawner)
            panel:Help("Options:")
            panel:CheckBox("Enable Map Spawner processing?","VJ_ZPS_MapSpawner_Enabled")
            panel:Help("Modifiers:")
            panel:NumSlider("Max Zombies","VJ_ZPS_MapSpawner_MaxZom",5,400,2)
            panel:NumSlider("Min Distance they can spawn from players","VJ_ZPS_MapSpawner_SpawnMin",150,30000,2)
            panel:NumSlider("Max Distance they can spawn from players","VJ_ZPS_MapSpawner_SpawnMax",150,30000,2)
            panel:NumSlider("Min time between spawns","VJ_ZPS_MapSpawner_DelayMin",0.1,15,2)
            panel:NumSlider("Max time between spawns","VJ_ZPS_MapSpawner_DelayMax",0.2,15,2)
            panel:NumSlider("Max Zombie horde","VJ_ZPS_MapSpawner_HordeCount",5,400,2)
            panel:NumSlider("Chance that a horde will appear","VJ_ZPS_MapSpawner_HordeChance",1,500,2)
            panel:NumSlider("Min cooldown time for horde spawns","VJ_ZPS_MapSpawner_HordeCooldownMin",1,800,2)
            panel:NumSlider("Max cooldown time for horde spawns","VJ_ZPS_MapSpawner_HordeCooldownMax",1,800,2)
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
            if ((v:IsNPC() or v:IsNextBot()) && classType != "obj_vj_bullseye" or v:IsPlayer()) && !v:IsFlagSet(FL_NOTARGET) then
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
    local color = Color(15, 100, 0, 10)
    ply.VJ_ZPS_InfectionEffect_Time = CurTime() +0.1
    hook.Add("RenderScreenspaceEffects","VJ_ZPS_InfectionEffect" .. ply:EntIndex(),function()
        if !IsValid(ply) or IsValid(ply) && (CurTime() > ply.VJ_ZPS_InfectionEffect_Time) then hook.Remove("RenderScreenspaceEffects","VJ_ZPS_InfectionEffect"..ply:EntIndex()) return end
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
    timer.Remove(ply:EntIndex().."VJ_ZPS_Immunity")
    timer.Remove(ply:EntIndex().."VJ_ZPS_Regen_Player")
    if ply.ZPS_InfectedVictim then
        ply.ZPS_InfectedVictim = false
    elseif ply.ZPS_ImmuneInfection then
        ply.ZPS_ImmuneInfection = false
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
 if victim.LNR_InfectedVictim or victim.GOTDR_InfectedVictim or victim.NMRIHR_InfectedVictim or victim.CNCR_InfectedVictim then return end
 if GetConVar("VJ_ZPS_Infection"):GetInt() == 0 or victim.IsZPSZombie or victim.ZPS_ImmuneInfection or (victim.VJ_NPC_Class && table.HasValue(victim.VJ_NPC_Class,"CLASS_ZOMBIE")) or (victim.IsVJBaseSNPC && victim.Dead or victim.DeathAnimationCodeRan or victim.GodMode) or (victim:LookupBone("ValveBiped.Bip01_Pelvis") == nil) then return end
 local victimModel = victim:GetModel()
 victim.ZPS_NextCoughT = CurTime() + math.Rand(5,30)
 victim.ZPS_NextEffectT = CurTime() + math.Rand(10,35)
 if GetConVar("VJ_ZPS_InfectionEffects"):GetInt() == 1 && !victim.ZPS_ImmuneInfection then
    hook.Add("Think","VJ_ZPS_VictimCough"..victim:EntIndex(),function()
 if !IsValid(victim) or !victim.ZPS_InfectedVictim or (victim:IsPlayer() && !victim:Alive()) or (victim:IsPlayer() && victim.VJ_IsControllingNPC) or (victim:IsPlayer() && GetConVar("sbox_godmode"):GetInt() == 1) or (victim.IsVJBaseSNPC && victim.Dead or victim.DeathAnimationCodeRan or victim.GodMode) then hook.Remove("Think","VJ_ZPS_VictimCough"..victim:EntIndex()) return end
 if !victim.IsZPSSurvivor && CurTime() > victim.ZPS_NextCoughT then
 if string.find(victimModel,"female") or string.find(victimModel,"alyx") or string.find(victimModel,"mossman") or string.find(victimModel,"chell") then
    VJ.CreateSound(victim,"ambient/voices/cough"..math.random(1,4)..".wav",75,120)
 else
    VJ.CreateSound(victim,"ambient/voices/cough"..math.random(1,4)..".wav",75,100)
end
    victim.ZPS_NextCoughT = CurTime() + math.Rand(5,30)
end
    if CurTime() > victim.ZPS_NextEffectT then
        VJ.CreateSound(victim,"darkborn/zps/infection/jolt-0"..math.random(1,4)..".wav",75,100)
        victim.ZPS_NextEffectT = CurTime() + math.Rand(10,35)
    if victim:IsPlayer() then
        net.Start("VJ_ZPS_InfectionScreenEffect")
        net.WriteEntity(victim)
        net.Send(victim) end
        end
    end)
end
 local deaths
 if victim:IsPlayer() then
    deaths = victim:Deaths()
end
 timer.Create(victim:EntIndex().."VJ_ZPS_InfectionTime",math.random(GetConVar("VJ_ZPS_InfectionTime1"):GetInt(),GetConVar("VJ_ZPS_InfectionTime2"):GetInt()),1,function()
 if IsValid(victim) && victim.ZPS_InfectedVictim && !victim.ZPS_ImmuneInfection then
 if (victim:IsPlayer() && !victim:Alive()) or (victim:IsPlayer() && victim:Deaths() > deaths) or (victim:IsPlayer() && victim.VJ_IsControllingNPC) or (victim:IsPlayer() && GetConVar("sbox_godmode"):GetInt() == 1) or (victim.IsVJBaseSNPC && victim.Dead or victim.DeathAnimationCodeRan or victim.GodMode) then victim.ZPS_InfectedVictim = false timer.Remove(victim:EntIndex().."VJ_ZPS_InfectionTime") return end
 if victim:IsPlayer() && GetConVar("VJ_ZPS_PlayerZombie"):GetInt() == 0 then
    victim:Kill()
    VJ_ZPS_CreateZombie(victim,victim)
end
 if victim:IsPlayer() && GetConVar("VJ_ZPS_PlayerZombie"):GetInt() == 1 then
    VJ_ZPS_SetPlayerZombie(victim,victim)
end
 if victim:IsNPC() or victim:IsNextBot() then
    VJ_ZPS_CreateZombie(victim,victim)
end
    if GetConVar("VJ_ZPS_InfectionEffects"):GetInt() == 1 then
        VJ.CreateSound(victim,{"darkborn/zps/zombies/z_vision/activate.wav","darkborn/zps/zombies/z_vision/deactivate.wav"},75,100) end
        end
    end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function VJ_ZPS_Infect(victim,inflictor,attacker,isPlayer)
    if !victim.ZPS_InfectedVictim or GetConVar("VJ_ZPS_Infection"):GetInt() == 0 or (victim:LookupBone("ValveBiped.Bip01_Pelvis") == nil) then return end
    if !isPlayer then
    if inflictor.ZPS_VirusInfection && !victim.ZPS_ImmuneInfection then
    if inflictor == attacker && victim != inflictor then
    if victim.ZPS_VictimIsInfected then return end
        victim.ZPS_VictimIsInfected = true
        VJ_ZPS_CreateZombie(victim,inflictor)
    end
end
    else
    if inflictor.ZPS_VirusInfection && !victim.ZPS_ImmuneInfection then
    if inflictor == attacker && victim != inflictor then
        VJ_ZPS_CreateZombie(victim,inflictor) end
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function VJ_ZPS_SetPlayerZombie(victim,inflictor,attacker)
 if !victim.ZPS_InfectedVictim or GetConVar("VJ_ZPS_Infection"):GetInt() == 0 or GetConVar("VJ_ZPS_PlayerZombie"):GetInt() == 0 or GetConVar("sbox_godmode"):GetInt() == 1 or victim.VJ_IsControllingNPC or (victim:LookupBone("ValveBiped.Bip01_Pelvis") == nil) then return end
 local zombie = NULL
 local oldModel = victim:GetModel()
 local oldSkin = victim:GetSkin()
 local oldMaterial = victim:GetMaterial()
 local oldColor = victim:GetColor()
 local oldPlayerColor = victim:GetPlayerColor()
 if victim.ZPS_InfectedVictim && GetConVar("VJ_ZPS_Hardcore"):GetInt() == 0 then
    zombie = ents.Create("npc_vj_zps_zinf_ply")
    zombie:VJ_ZPS_CreateBoneMerge(zombie,oldModel,oldSkin,oldColor,oldMaterial,oldPlayerColor,victim)
 elseif victim.ZPS_InfectedVictim && GetConVar("VJ_ZPS_Hardcore"):GetInt() == 1 then
    zombie = ents.Create("npc_vj_zps_zcarrier")
end
    zombie:SetPos(victim:GetPos())
    zombie:SetAngles(victim:GetAngles())
    zombie.GodMode = true
    timer.Simple(0, function() zombie:PlaySoundSystem("Alert") end)
    zombie:Spawn()
    if GetConVar("VJ_ZPS_Hardcore"):GetInt() == 0 then
    if oldModel == "models/darkborn/zps/survivors/pms/eugene.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/eugene.mdl" or oldModel == "models/darkborn/zps/zombies/pms/eugene_zombie.mdl" or oldModel == "models/darkborn/zps/zombies_old/pms/eugene_zombie.mdl" then
        zombie:ZombieVoice_Eugene()
    elseif oldModel == "models/darkborn/zps/survivors/pms/jessica.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/jessica.mdl" or oldModel == "models/darkborn/zps/zombies/pms/jessica_zombie.mdl" or oldModel == "models/darkborn/zps/zombies_old/pms/jessica_zombie.mdl" then
        zombie:ZombieVoice_Jessica()
    elseif oldModel == "models/darkborn/zps/survivors/pms/larry.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/larry.mdl" or oldModel == "models/darkborn/zps/zombies/pms/larry_zombie.mdl" or oldModel == "models/darkborn/zps/zombies_old/pms/larry_zombie.mdl" then
        zombie:ZombieVoice_Larry()
    elseif oldModel == "models/darkborn/zps/survivors/pms/lea.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/lea.mdl" or oldModel == "models/darkborn/zps/zombies/pms/lea_zombie.mdl" or oldModel == "models/darkborn/zps/zombies_old/pms/lea_zombie.mdl" then
        zombie:ZombieVoice_Lea()
    elseif oldModel == "models/darkborn/zps/survivors/pms/marcus.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/marcus.mdl" or oldModel == "models/darkborn/zps/zombies/pms/marcus_zombie.mdl" or oldModel == "models/darkborn/zps/zombies_old/pms/marcus_zombie.mdl" then
        zombie:ZombieVoice_Marcus()
    elseif oldModel == "models/darkborn/zps/survivors/pms/paul.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/paul.mdl" or oldModel == "models/darkborn/zps/zombies/pms/paul_zombie.mdl" or oldModel == "models/darkborn/zps/zombies_old/pms/paul_zombie.mdl" then
        zombie:ZombieVoice_Paul()
    elseif oldModel == "models/darkborn/zps/survivors/pms/pedro.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/pedro.mdl" or oldModel == "models/darkborn/zps/zombies/pms/pedro_zombie.mdl" or oldModel == "models/darkborn/zps/zombies_old/pms/pedro_zombie.mdl" then
        zombie:ZombieVoice_Pedro()
    elseif oldModel == "models/darkborn/zps/survivors/pms/vanessa.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/vanessa.mdl" or oldModel == "models/darkborn/zps/zombies/pms/vanessa_zombie.mdl" or oldModel == "models/darkborn/zps/zombies_old/pms/vanessa_zombie.mdl" then
        zombie:ZombieVoice_Vanessa()
    end
end
 if !IsValid(SpawnControllerObject) then
    local SpawnControllerObject = ents.Create("obj_vj_controller")
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
 if (victim:IsNPC() or victim:IsNextBot() or victim:IsPlayer()) && victim.ZPS_InfectedVictim then
 if !victim.IsZPSSurvivor && GetConVar("VJ_ZPS_Hardcore"):GetInt() == 0 then
    zombie = ents.Create("npc_vj_zps_zinf")
    zombie:VJ_ZPS_CreateBoneMerge(zombie,oldModel,oldSkin,oldColor,oldMaterial,oldPlayerColor,victim)
 elseif victim.IsZPSSurvivor && GetConVar("VJ_ZPS_ZombieModels"):GetInt() == 0 && GetConVar("VJ_ZPS_Hardcore"):GetInt() == 0 then
    zombie = ents.Create("npc_vj_zps_zinf")
    zombie:VJ_ZPS_CreateBoneMerge(zombie,oldModel,oldSkin,oldColor,oldMaterial,oldPlayerColor,victim)
 elseif victim.IsZPSSurvivor && GetConVar("VJ_ZPS_ZombieModels"):GetInt() == 1 && GetConVar("VJ_ZPS_Hardcore"):GetInt() == 0 then
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
 elseif GetConVar("VJ_ZPS_Hardcore"):GetInt() == 1 then
    zombie = ents.Create("npc_vj_zps_zcarrier")
end
    zombie:SetPos(victim:GetPos())
    zombie:SetAngles(victim:GetAngles())
    zombie.GodMode = true
    timer.Simple(0, function() zombie:PlaySoundSystem("Alert") end)
    zombie:Spawn()
    undo.ReplaceEntity(victim,zombie)
    if GetConVar("VJ_ZPS_Hardcore"):GetInt() == 0 && GetConVar("VJ_ZPS_ZombieModels"):GetInt() == 0 then
    if oldModel == "models/darkborn/zps/survivors/eugene.mdl" or oldModel == "models/darkborn/zps/survivors_old/eugene.mdl" or oldModel == "models/darkborn/zps/survivors/pms/eugene.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/eugene.mdl" or oldModel == "models/darkborn/zps/zombies/eugene.mdl" or oldModel == "models/darkborn/zps/zombies_old/eugene.mdl" or oldModel == "models/darkborn/zps/zombies/pms/eugene_zombie.mdl" or oldModel == "models/darkborn/zps/zombies_old/pms/eugene_zombie.mdl" then
        zombie:ZombieVoice_Eugene()
     elseif oldModel == "models/darkborn/zps/survivors/jessica.mdl" or oldModel == "models/darkborn/zps/survivors_old/jessica.mdl" or oldModel == "models/darkborn/zps/survivors/pms/jessica.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/jessica.mdl" or oldModel == "models/darkborn/zps/zombies/jessica.mdl" or oldModel == "models/darkborn/zps/zombies_old/jessica.mdl" or oldModel == "models/darkborn/zps/zombies/pms/jessica_zombie.mdl" or oldModel == "models/darkborn/zps/zombies_old/pms/jessica_zombie.mdl" then
        zombie:ZombieVoice_Jessica()
     elseif oldModel == "models/darkborn/zps/survivors/larry.mdl" or oldModel == "models/darkborn/zps/survivors_old/larry.mdl" or oldModel == "models/darkborn/zps/survivors/pms/larry.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/larry.mdl" or oldModel == "models/darkborn/zps/zombies/larry.mdl" or oldModel == "models/darkborn/zps/zombies_old/larry.mdl" or oldModel == "models/darkborn/zps/zombies/pms/larry_zombie.mdl" or oldModel == "models/darkborn/zps/zombies_old/pms/larry_zombie.mdl" then
        zombie:ZombieVoice_Larry()
     elseif oldModel == "models/darkborn/zps/survivors/lea.mdl" or oldModel == "models/darkborn/zps/survivors_old/lea.mdl" or oldModel == "models/darkborn/zps/survivors/pms/lea.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/lea.mdl" or oldModel == "models/darkborn/zps/zombies/lea.mdl" or oldModel == "models/darkborn/zps/zombies_old/lea.mdl" or oldModel == "models/darkborn/zps/zombies/pms/lea_zombie.mdl" or oldModel == "models/darkborn/zps/zombies_old/pms/lea_zombie.mdl" then
        zombie:ZombieVoice_Lea()
     elseif oldModel == "models/darkborn/zps/survivors/marcus.mdl" or oldModel == "models/darkborn/zps/survivors_old/marcus.mdl" or oldModel == "models/darkborn/zps/survivors/pms/marcus.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/marcus.mdl" or oldModel == "models/darkborn/zps/zombies/marcus.mdl" or oldModel == "models/darkborn/zps/zombies_old/marcus.mdl" or oldModel == "models/darkborn/zps/zombies/pms/marcus_zombie.mdl" or oldModel == "models/darkborn/zps/zombies_old/pms/marcus_zombie.mdl" then
        zombie:ZombieVoice_Marcus()
     elseif oldModel == "models/darkborn/zps/survivors/paul.mdl" or oldModel == "models/darkborn/zps/survivors_old/paul.mdl" or oldModel == "models/darkborn/zps/survivors/pms/paul.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/paul.mdl" or oldModel == "models/darkborn/zps/zombies/paul.mdl" or oldModel == "models/darkborn/zps/zombies_old/paul.mdl" or oldModel == "models/darkborn/zps/zombies/pms/paul_zombie.mdl" or oldModel == "models/darkborn/zps/zombies_old/pms/paul_zombie.mdl" then
        zombie:ZombieVoice_Paul()
     elseif oldModel == "models/darkborn/zps/survivors/pedro.mdl" or oldModel == "models/darkborn/zps/survivors_old/pedro.mdl" or oldModel == "models/darkborn/zps/survivors/pms/pedro.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/pedro.mdl" or oldModel == "models/darkborn/zps/zombies/pedro.mdl" or oldModel == "models/darkborn/zps/zombies_old/pedro.mdl" or oldModel == "models/darkborn/zps/zombies/pms/pedro_zombie.mdl" or oldModel == "models/darkborn/zps/zombies_old/pms/pedro_zombie.mdl" then
        zombie:ZombieVoice_Pedro()
     elseif oldModel == "models/darkborn/zps/survivors/vanessa.mdl" or oldModel == "models/darkborn/zps/survivors_old/vanessa.mdl" or oldModel == "models/darkborn/zps/survivors/pms/vanessa.mdl" or oldModel == "models/darkborn/zps/survivors_old/pms/vanessa.mdl" or oldModel == "models/darkborn/zps/zombies/vanessa.mdl" or oldModel == "models/darkborn/zps/zombies_old/vanessa.mdl" or oldModel == "models/darkborn/zps/zombies/pms/vanessa_zombie.mdl" or oldModel == "models/darkborn/zps/zombies_old/pms/vanessa_zombie.mdl" then
        zombie:ZombieVoice_Vanessa()
        end
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
    if !victim.IsZPSSurvivor && !string.find(oldModel,"models/darkborn/zps/survivors/") && !string.find(oldModel,"models/darkborn/zps/survivors_old/") && !string.find(oldModel,"models/darkborn/zps/survivors/pms/") && !string.find(oldModel,"models/darkborn/zps/survivors_old/pms/") && !string.find(oldModel,"models/darkborn/zps/zombies/") && !string.find(oldModel,"models/darkborn/zps/zombies_old/") && !string.find(oldModel,"models/darkborn/zps/zombies/pms/") && !string.find(oldModel,"models/darkborn/zps/zombies_old/pms/") then
    if string.find(oldModel,"female") or string.find(oldModel,"alyx") or string.find(oldModel,"mossman") or string.find(oldModel,"chell") then
        zombie:ZombieVoice_InfectedFemale()
    else
        zombie:ZombieVoice_InfectedMale()
    end
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
 if victim:IsNPC() or victim:IsNextBot() then
    SafeRemoveEntity(victim)
end
    if victim:IsNPC() && IsValid(victim:GetActiveWeapon()) then
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