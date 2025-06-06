SWEP.Base = "weapon_vj_zps_melee_base"
SWEP.PrintName = "Hammer"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Zombie Panic! Source"
-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
    VJ.AddKillIcon("weapon_vj_zps_hammer", SWEP.PrintName, "zps/killicons/destroy_survivor", Color(0,160,255))
end
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/darkborn/zps/weapons/w_hammer.mdl"
SWEP.HoldType = "melee"
SWEP.ZPS_HType = "hammer"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 52
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnEquip(newOwner)
    local owner = self:GetOwner()
    owner.MeleeAttackDamage = self.Primary.Damage
    owner.MeleeAttackDamageType = DMG_CLUB
    owner.SoundTbl_MeleeAttackExtra = {
    "darkborn/zps/weapons/melee/hammer/hit_melee01.wav"
    }
    owner.SoundTbl_MeleeAttackMiss = {
    "weapons/iceaxe/iceaxe_swing1.wav"
    }
end