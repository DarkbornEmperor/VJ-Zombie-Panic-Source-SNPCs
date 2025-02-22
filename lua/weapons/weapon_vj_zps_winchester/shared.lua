SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Winchester"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Zombie Panic! Source"
-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
    VJ.AddKillIcon("weapon_vj_zps_winchester", SWEP.PrintName, "zps/killicons/destroy_survivor", Color(0,160,255))
end
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/darkborn/zps/weapons/w_winchester.mdl"
SWEP.HoldType = "shotgun"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.MadeForNPCsOnly = true
SWEP.ZPS_HType = "winchester"
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 1.5
SWEP.NPC_CustomSpread = 1.5
SWEP.NPC_FiringDistanceScale = 0.5
SWEP.NPC_ReloadSound = "darkborn/zps/weapons/firearms/doublebarrel_shotgun/reload.wav"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 16
SWEP.Primary.Force = 1
SWEP.Primary.NumberOfShots = 8
SWEP.Primary.ClipSize = 2
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "Buckshot"
SWEP.Primary.Sound = "VJ.ZPS_Winchester.Single"
SWEP.PrimaryEffects_MuzzleParticles = {"vj_zps_muzzle"}
SWEP.PrimaryEffects_SpawnShells = false
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound = "darkborn/zps/weapons/firearms/doublebarrel_shotgun/dryfire.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnPrimaryAttack(status,statusData)
    if status == "Init" && math.random(1,5) == 1 && self:Clip1() > 1 then
        self.Primary.Sound = "VJ.ZPS_Winchester.Double"
        self.Primary.NumberOfShots = 16
        self.Primary.TakeAmmo = 2
    else
        self.Primary.Sound = "VJ.ZPS_Winchester.Single"
        self.Primary.NumberOfShots = 8
        self.Primary.TakeAmmo = 1
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_Reload()
    local owner = self:GetOwner()
    owner.NextThrowGrenadeT = owner.NextThrowGrenadeT + 2
    owner.NextChaseTime = 0
    self:OnReload("Start")
    if self.NPC_HasReloadSound == true then VJ.EmitSound(owner, self.NPC_ReloadSound, self.NPC_ReloadSoundLevel) end
end