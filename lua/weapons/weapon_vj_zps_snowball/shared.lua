SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Snowball"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Zombie Panic! Source"
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 2.5
SWEP.NPC_TimeUntilFire = 0.8
SWEP.NPC_FiringDistanceScale = 0.65
SWEP.NPC_ReloadSound = false
SWEP.NPC_CanBePickedUp = false
SWEP.MadeForNPCsOnly = true
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/darkborn/zps/weapons/w_snowball.mdl"
SWEP.HoldType = "grenade"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 1
SWEP.Primary.ClipSize = 8
//SWEP.Primary.TakeAmmo = 0
SWEP.Primary.Ammo = "grenade"
SWEP.Primary.Sound = "darkborn/zps/weapons/slam/throw.wav"
SWEP.Primary.DisableBulletCode = true
SWEP.HasDryFireSound = false
SWEP.PrimaryEffects_SpawnMuzzleFlash = false
SWEP.PrimaryEffects_SpawnShells = false
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
function SWEP:OnPrimaryAttack(status,statusData)
    if status == "Initial" then
    if CLIENT then return end
        //timer.Simple(0.4, function() if IsValid(self:GetOwner()) then
        local snowball = ents.Create("obj_vj_zps_snowball")
        snowball:SetPos(self:GetBulletPos())
        snowball:SetAngles(self:GetOwner():GetAngles())
        snowball:SetOwner(self:GetOwner())
        snowball:Spawn()
        snowball:Activate()

    local phys = snowball:GetPhysicsObject()
    if IsValid(phys) then
        phys:SetVelocity(self:GetOwner():CalculateProjectile("Curve", self:GetBulletPos(), self:GetOwner():GetEnemy():GetPos() + self:GetOwner():GetEnemy():OBBCenter(), 1200)) end
        /*end
    end)*/
end
    if status == "PostFire" && self:Clip1() <= 0 then
        self.WorldModel_Invisible = true
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnReload(status)
    if status == "Start" then
    timer.Simple(1.6, function()
        if IsValid(self) then
            self.WorldModel_Invisible = false end
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