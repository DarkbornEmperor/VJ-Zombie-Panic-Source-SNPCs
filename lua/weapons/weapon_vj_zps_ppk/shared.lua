SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "PPK"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Zombie Panic! Source"
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/darkborn/zps/weapons/w_ppk.mdl"
SWEP.HoldType = "pistol"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.MadeForNPCsOnly = true
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_CustomSpread = 0.8
SWEP.NPC_ReloadSound = {"darkborn/zps/weapons/firearms/ppk/reload.wav"}
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 30
SWEP.Primary.ClipSize = 7
SWEP.Primary.Ammo = "Pistol"
SWEP.Primary.Sound = {"darkborn/zps/weapons/firearms/ppk/fire.wav"}
SWEP.PrimaryEffects_MuzzleParticles = {"vj_zps_muzzle"}
SWEP.PrimaryEffects_ShellType = "ShellEject"
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound = {"darkborn/zps/weapons/firearms/ppk/dryfire.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnPrimaryAttack_BeforeShoot()
    local Brt = math.random(1,3)
    local Num = 0.35
    if Brt == 1 then self.NPC_TimeUntilFireExtraTimers = {Num,Num*2}
    self.NPC_NextPrimaryFire = math.Rand(1.25,1.55)
    elseif Brt == 2 then self.NPC_TimeUntilFireExtraTimers = {Num,Num*2,Num*3}
    self.NPC_NextPrimaryFire = math.Rand(1.65,1.85)
    elseif Brt == 3 then self.NPC_TimeUntilFireExtraTimers = {Num,Num*2,Num*3,Num*4}
    self.NPC_NextPrimaryFire = math.Rand(2.05,2.25)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnReload()
    self:SetBodygroup(1,1)
    timer.Simple(1.6, function()
        if IsValid(self) then
            self:SetBodygroup(1,0)
        end
    end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_Reload()
    local owner = self:GetOwner()
    owner.NextThrowGrenadeT = owner.NextThrowGrenadeT + 2
    owner.NextChaseTime = 0
    self:CustomOnReload()
    if self.NPC_HasReloadSound == true then VJ.EmitSound(owner, self.NPC_ReloadSound, self.NPC_ReloadSoundLevel) end
end