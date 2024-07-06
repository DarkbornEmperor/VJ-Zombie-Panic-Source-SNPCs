SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "IED"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Zombie Panic! Source"
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 2.5
SWEP.NPC_TimeUntilFire = 0.8
SWEP.NPC_FiringDistanceScale = 0.2
SWEP.NPC_ReloadSound = {"darkborn/zps/weapons/explosives/ied/ied_pull-01.wav","darkborn/zps/weapons/explosives/ied/ied_pull-02.wav"}
SWEP.NPC_CanBePickedUp = false
SWEP.MadeForNPCsOnly = true
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/darkborn/zps/weapons/w_ied.mdl"
SWEP.HoldType = "grenade"
SWEP.ZPS_HType = "ied"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 1
SWEP.Primary.ClipSize = 1
///SWEP.Primary.TakeAmmo = 0
SWEP.Primary.Ammo = "grenade"
SWEP.Primary.Sound = {"darkborn/zps/weapons/explosives/ied/ied_throw-01.wav","darkborn/zps/weapons/explosives/ied/ied_throw-02.wav"}
SWEP.Primary.DisableBulletCode = true
SWEP.HasDryFireSound = false
SWEP.PrimaryEffects_SpawnMuzzleFlash = false
SWEP.PrimaryEffects_SpawnShells = false
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize()
    self.IED_LastShotEnt = NULL
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomBulletSpawnPosition()
    local owner = self:GetOwner()

    return owner:GetPos() + owner:GetUp() + Vector(0,-18,40)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnPrimaryAttackEffects()
    return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnPrimaryAttack_BeforeShoot()
    if CLIENT then return end
    if IsValid(self.IED_LastShotEnt) then return true end -- Wait until the last IED has detonated
    //timer.Simple(0.4, function() if IsValid(self:GetOwner()) then
    local ied = ents.Create("obj_vj_zps_ied")
    ied:SetPos(self:GetNW2Vector("VJ_CurBulletPos"))
    ied:SetAngles(self:GetOwner():GetAngles())
    ied:SetOwner(self:GetOwner())
    ied:Spawn()
    ied:Activate()
    self.IED_LastShotEnt = ied

    local phys = ied:GetPhysicsObject()
    if IsValid(phys) then
        phys:SetVelocity(self:GetOwner():CalculateProjectile("Line", self:GetNW2Vector("VJ_CurBulletPos"), self:GetOwner():GetEnemy():GetPos() + self:GetOwner():GetEnemy():OBBCenter(), 300))
            end
        /*end
    end)*/
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnPrimaryAttack_AfterShoot()
    if self:Clip1() <= 0 then
        self.WorldModel_Invisible = true
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnReload()
    timer.Simple(1.6, function()
        if IsValid(self) then
            self.WorldModel_Invisible = false
        end
    end)
end