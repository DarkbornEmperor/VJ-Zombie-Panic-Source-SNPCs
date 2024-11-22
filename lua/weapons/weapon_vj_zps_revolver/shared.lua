SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Revolver"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Zombie Panic! Source"
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/darkborn/zps/weapons/w_revolver.mdl"
SWEP.HoldType = "revolver"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.MadeForNPCsOnly = true
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 0.9
SWEP.NPC_CustomSpread = 0.5
SWEP.NPC_ReloadSound = "darkborn/zps/weapons/firearms/magnum/reload.wav"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 88
SWEP.Primary.Force = 1.6
SWEP.Primary.ClipSize = 6
SWEP.Primary.Ammo = "357"
SWEP.Primary.Sound = "darkborn/zps/weapons/firearms/magnum/fire.wav"
SWEP.PrimaryEffects_MuzzleParticles = {"vj_zps_muzzle"}
SWEP.PrimaryEffects_SpawnShells = false
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound = "darkborn/zps/weapons/firearms/magnum/dryfire.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_Reload()
    local owner = self:GetOwner()
    owner.NextThrowGrenadeT = owner.NextThrowGrenadeT + 2
    owner.NextChaseTime = 0
    self:OnReload("Start")
    if self.NPC_HasReloadSound == true then VJ.EmitSound(owner, self.NPC_ReloadSound, self.NPC_ReloadSoundLevel) end
end