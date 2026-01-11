SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "AK-47"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Zombie Panic! Source"
-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
    VJ.AddKillIcon("weapon_vj_zps_ak47", SWEP.PrintName, "zps/killicons/destroy_survivor", Color(0, 160, 255))
end
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/darkborn/zps/weapons/w_ak47.mdl"
SWEP.HoldType = "ar2"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.MadeForNPCsOnly = true
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_TimeUntilFire = 0.1
SWEP.NPC_CustomSpread = 1.5
SWEP.NPC_ReloadSound =
    "darkborn/zps/weapons/firearms/ak-47/reload.wav"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 22
SWEP.Primary.ClipSize = 30
SWEP.Primary.Ammo = "SMG1"
SWEP.Primary.Sound = "VJ.ZPS_AK47.Single"
SWEP.PrimaryEffects_MuzzleParticles = {"vj_zps_muzzle"}
SWEP.PrimaryEffects_ShellType = "RifleShellEject"
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound =
    "darkborn/zps/weapons/firearms/ak-47/dryfire.wav"

local math_random = math.random
local math_rand = math.Rand
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnPrimaryAttack(status, statusData)
    if status == "Init" then
        local burst = math_random(1,8)
        local num = 0.1
        if burst == 1 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2}
            self.NPC_NextPrimaryFire = math_rand(0.6,0.7)
        elseif burst == 2 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2, num * 3}
            self.NPC_NextPrimaryFire = math_rand(0.7,0.8)
        elseif burst == 3 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2, num * 3, num * 4}
            self.NPC_NextPrimaryFire = math_rand(0.8,0.9)
        elseif burst == 4 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2, num * 3, num * 4, num * 5}
            self.NPC_NextPrimaryFire = math_rand(0.9,1.25)
        elseif burst == 5 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2, num * 3, num * 4, num * 5, num * 6}
            self.NPC_NextPrimaryFire = math_rand(1.25,1.35)
        elseif burst == 6 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2, num * 3, num * 4, num * 5, num * 6, num * 7}
            self.NPC_NextPrimaryFire = math_rand(1.35,1.45)
        elseif burst == 7 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2, num * 3, num * 4, num * 5, num * 6, num * 7, num * 8}
            self.NPC_NextPrimaryFire = math_rand(1.45,1.55)
        elseif burst == 8 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2, num * 3, num * 4, num * 5, num * 6, num * 7, num * 8, num * 9}
            self.NPC_NextPrimaryFire = math_rand(1.55,1.85)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnReload(status)
    if status == "Start" then
        self:SetBodygroup(1,1)
        timer.Simple(1.8, function()
            if IsValid(self) then
                self:SetBodygroup(1,0)
            end
        end)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_Reload()
    local owner = self:GetOwner()
    owner.NextChaseTime = 0
    self.BaseClass.NPC_Reload(self)
end