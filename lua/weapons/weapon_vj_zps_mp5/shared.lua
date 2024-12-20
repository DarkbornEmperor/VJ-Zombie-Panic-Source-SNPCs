SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "MP5"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Zombie Panic! Source"
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/darkborn/zps/weapons/w_mp5.mdl"
SWEP.HoldType = "smg"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.MadeForNPCsOnly = true
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 1.0
SWEP.NPC_TimeUntilFire = 0.08
SWEP.NPC_ExtraShotsPerFire = 4
SWEP.NPC_CustomSpread = 1.5
SWEP.NPC_ReloadSound = "darkborn/zps/weapons/firearms/mp5/reload.wav"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 21
SWEP.Primary.ClipSize = 30
SWEP.Primary.Ammo = "SMG1"
SWEP.Primary.Sound = "VJ.ZPS_MP5.Single"
SWEP.PrimaryEffects_MuzzleParticles = {"vj_zps_muzzle"}
SWEP.PrimaryEffects_ShellType = "ShellEject"
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound = "darkborn/zps/weapons/firearms/mp5/dryfire.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
    for i=1,(self.NPC_ExtraShotsPerFire) do
        table.insert(self.NPC_TimeUntilFireExtraTimers, self.NPC_TimeUntilFire*(1+#self.NPC_TimeUntilFireExtraTimers))
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnPrimaryAttack(status,statusData)
    if status == "Initial" then
    local Brt = math.random(1,8)
    local Num = 0.08
    if Brt == 1 then
        self.NPC_TimeUntilFireExtraTimers = {Num,Num*2}
        self.NPC_NextPrimaryFire = math.Rand(0.6,0.7)
    elseif Brt == 2 then
        self.NPC_TimeUntilFireExtraTimers = {Num,Num*2,Num*3}
        self.NPC_NextPrimaryFire = math.Rand(0.7,0.8)
    elseif Brt == 3 then
        self.NPC_TimeUntilFireExtraTimers = {Num,Num*2,Num*3,Num*4}
        self.NPC_NextPrimaryFire = math.Rand(0.8,0.9)
    elseif Brt == 4 then
        self.NPC_TimeUntilFireExtraTimers = {Num,Num*2,Num*3,Num*4,Num*5}
        self.NPC_NextPrimaryFire = math.Rand(0.9,1.25)
    elseif Brt == 5 then
        self.NPC_TimeUntilFireExtraTimers = {Num,Num*2,Num*3,Num*4,Num*5,Num*6}
        self.NPC_NextPrimaryFire = math.Rand(1.25,1.35)
    elseif Brt == 6 then
        self.NPC_TimeUntilFireExtraTimers = {Num,Num*2,Num*3,Num*4,Num*5,Num*6,Num*7}
        self.NPC_NextPrimaryFire = math.Rand(1.35,1.45)
    elseif Brt == 7 then
        self.NPC_TimeUntilFireExtraTimers = {Num,Num*2,Num*3,Num*4,Num*5,Num*6,Num*7,Num*8}
        self.NPC_NextPrimaryFire = math.Rand(1.45,1.55)
    elseif Brt == 8 then
        self.NPC_TimeUntilFireExtraTimers = {Num,Num*2,Num*3,Num*4,Num*5,Num*6,Num*7,Num*8,Num*9}
        self.NPC_NextPrimaryFire = math.Rand(1.55,1.85)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnReload(status)
    if status == "Start" then
    self:SetBodygroup(1,1)
    timer.Simple(1.8, function()
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