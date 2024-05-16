SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Winchester"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Zombie Panic! Source"
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel	= "models/darkborn/zps/weapons/w_winchester.mdl"
SWEP.HoldType = "shotgun"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.MadeForNPCsOnly = true
SWEP.ZPS_HType = "winchester"
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 1.5
SWEP.NPC_CustomSpread = 1.5
SWEP.NPC_FiringDistanceScale = 0.5
SWEP.NPC_ReloadSound = {"darkborn/zps/weapons/firearms/doublebarrel_shotgun/reload.wav"}
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 16
SWEP.Primary.Force = 1
SWEP.Primary.NumberOfShots = 8
SWEP.Primary.ClipSize = 2
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "Buckshot"
SWEP.Primary.Sound = {"darkborn/zps/weapons/firearms/doublebarrel_shotgun/fire.wav"}
SWEP.PrimaryEffects_MuzzleParticles = {"vj_zps_muzzle"}
SWEP.PrimaryEffects_SpawnShells = false
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound = {"darkborn/zps/weapons/firearms/doublebarrel_shotgun/dryfire.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_Reload()
	local owner = self:GetOwner()
	owner.NextThrowGrenadeT = owner.NextThrowGrenadeT + 2
	owner.NextChaseTime = 0
	self:CustomOnReload()
	if self.NPC_HasReloadSound == true then VJ.EmitSound(owner, self.NPC_ReloadSound, self.NPC_ReloadSoundLevel) end
end