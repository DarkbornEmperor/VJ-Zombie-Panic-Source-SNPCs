SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "IED"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Zombie Panic! Source"
-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
    VJ.AddKillIcon("weapon_vj_zps_ied", SWEP.PrintName, "zps/killicons/destroy_survivor", Color(0, 160, 255))
end
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/darkborn/zps/weapons/w_ied.mdl"
SWEP.HoldType = "grenade"
SWEP.ZPS_HType = "ied"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 2.5
SWEP.NPC_TimeUntilFire = 0.8
SWEP.NPC_FiringDistanceScale = 0.2
SWEP.NPC_CanBePickedUp = false
SWEP.NPC_ReloadSound = {
    "darkborn/zps/weapons/explosives/ied/ied_pull-01.wav",
    "darkborn/zps/weapons/explosives/ied/ied_pull-02.wav"
}
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 1
SWEP.Primary.ClipSize = 1
///SWEP.Primary.TakeAmmo = 0
SWEP.Primary.Ammo = "grenade"
SWEP.Primary.Sound = {
    "darkborn/zps/weapons/explosives/ied/ied_throw-01.wav",
    "darkborn/zps/weapons/explosives/ied/ied_throw-02.wav"
}
SWEP.Primary.DisableBulletCode = true
SWEP.HasDryFireSound = false
SWEP.PrimaryEffects_SpawnMuzzleFlash = false
SWEP.PrimaryEffects_SpawnShells = false
SWEP.PrimaryEffects_SpawnDynamicLight = false
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
    self.IED_LastShotEnt = NULL
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnGetBulletPos()
    local owner = self:GetOwner()

    return owner:GetPos() + owner:GetUp() + Vector(0,-18,40)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:PrimaryAttackEffects(owner)
    return
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnPrimaryAttack(status, statusData)
    if status == "Init" then
        if CLIENT then return end
        if IsValid(self.IED_LastShotEnt) then return true end -- Wait until the last IED has detonated
        local ied = ents.Create("obj_vj_zps_ied")
        ied:SetPos(self:GetBulletPos())
        ied:SetAngles(self:GetOwner():GetAngles())
        ied:SetOwner(self:GetOwner())
        ied:Spawn()
        ied:Activate()
        self.IED_LastShotEnt = ied
        local phys = ied:GetPhysicsObject()
        if IsValid(phys) then
            phys:SetVelocity(self:GetOwner():CalculateProjectile("Curve", self:GetBulletPos(), self:GetOwner():GetEnemy():GetPos() + self:GetOwner():GetEnemy():OBBCenter(), 300))
        end
    end
    if status == "PostFire" && self:Clip1() <= 0 then
        self:SetDrawWorldModel(false)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnReload(status)
    if status == "Start" then
        timer.Simple(1.6, function()
            if IsValid(self) then
                self:SetDrawWorldModel(true)
            end
        end)
    end
end