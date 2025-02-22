SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Glock 18c"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Zombie Panic! Source"
-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
    VJ.AddKillIcon("weapon_vj_zps_glock18c", SWEP.PrintName, "zps/killicons/destroy_survivor", Color(0,160,255))
end
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/darkborn/zps/weapons/w_glock18c.mdl"
SWEP.HoldType = "pistol"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.MadeForNPCsOnly = true
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_TimeUntilFire = 0.11
SWEP.NPC_CustomSpread = 0.8
SWEP.NPC_ReloadSound = "darkborn/zps/weapons/firearms/glock18c/reload.wav"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 30
SWEP.Primary.ClipSize = 17
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "Pistol"
SWEP.Primary.Sound = "VJ.ZPS_Glock18c.Single"
SWEP.PrimaryEffects_MuzzleParticles = {"vj_zps_muzzle"}
SWEP.PrimaryEffects_ShellType = "ShellEject"
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound = "darkborn/zps/weapons/firearms/glock18c/dryfire.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnPrimaryAttack(status,statusData)
    if status == "Init" then
    local Brt = math.random(1,3)
    local Num = 0.11
    if Brt == 1 then
        self.NPC_TimeUntilFireExtraTimers = {Num,Num*2}
        self.NPC_NextPrimaryFire = math.Rand(0.65,0.85)
    elseif Brt == 2 then
        self.NPC_TimeUntilFireExtraTimers = {Num,Num*2,Num*3}
        self.NPC_NextPrimaryFire = math.Rand(1.05,1.25)
    elseif Brt == 3 then
        self.NPC_TimeUntilFireExtraTimers = {Num,Num*2,Num*3,Num*4}
        self.NPC_NextPrimaryFire = math.Rand(1.35,1.55)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnReload(status)
    if status == "Start" then
    self:SetBodygroup(1,1)
    timer.Simple(1.6, function()
    if IsValid(self) then
        self:SetBodygroup(1,0) end
        end)
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