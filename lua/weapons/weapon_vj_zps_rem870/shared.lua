SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Remington 870"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category  = "Zombie Panic! Source"
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel	= "models/darkborn/zps/weapons/w_870.mdl"
SWEP.HoldType = "shotgun"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.MadeForNPCsOnly = true
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 1.5
SWEP.NPC_CustomSpread = 2.5
SWEP.NPC_ExtraFireSound = {"darkborn/zps/weapons/firearms/remington870/pump.wav"}
SWEP.PrimaryEffects_MuzzleParticles = {"vj_zps_muzzle"}
SWEP.NPC_FiringDistanceScale = 0.5
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 10
SWEP.Primary.Force = 1
SWEP.Primary.NumberOfShots = 9
SWEP.Primary.ClipSize = 6
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "Buckshot"
SWEP.Primary.Sound = {"darkborn/zps/weapons/firearms/remington870/fire.wav"}
SWEP.PrimaryEffects_ShellType = "ShotgunShellEject"
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound = {"darkborn/zps/weapons/firearms/remington870/dryfire.wav"}