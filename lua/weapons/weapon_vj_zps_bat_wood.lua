SWEP.Base = "weapon_vj_zps_melee_base"
SWEP.PrintName = "Wooden Bat"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Zombie Panic! Source"
-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
    VJ.AddKillIcon("weapon_vj_zps_bat_wood", SWEP.PrintName, "zps/killicons/destroy_survivor", Color(0, 160, 255))
end
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/darkborn/zps/weapons/w_baseballbat_wood.mdl"
SWEP.HoldType = "melee2"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 47
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnEquip(newOwner)
    local owner = self:GetOwner()
    owner.MeleeAttackDamage = self.Primary.Damage
    owner.MeleeAttackDamageType = DMG_CLUB
    owner.SoundTbl_MeleeAttackExtra = {
        "darkborn/zps/weapons/melee/bat/bat_hit-01.wav",
        "darkborn/zps/weapons/melee/bat/bat_hit-02.wav",
        "darkborn/zps/weapons/melee/bat/bat_hit-03.wav",
        "darkborn/zps/weapons/melee/bat/bat_hit-04.wav"
    }
    owner.SoundTbl_MeleeAttackMiss =
        "weapons/iceaxe/iceaxe_swing1.wav"
end