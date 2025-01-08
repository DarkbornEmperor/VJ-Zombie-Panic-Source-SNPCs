SWEP.Base = "weapon_vj_zps_melee_base"
SWEP.PrintName = "Tennis Racket"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Zombie Panic! Source"
-- Client Settings ---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
    VJ.AddKillIcon("weapon_vj_zps_racket", SWEP.PrintName, "zps/icons/destroy_survivor")
end
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/darkborn/zps/weapons/w_racket.mdl"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 52
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnEquip(newOwner)
    local owner = self:GetOwner()
    owner.MeleeAttackDamage = self.Primary.Damage
    owner.MeleeAttackDamageType = DMG_CLUB
    owner.SoundTbl_MeleeAttackExtra = {
    "darkborn/zps/weapons/melee/tennis_racket/hit_melee01.wav"
    }
    owner.SoundTbl_MeleeAttackMiss = {
    "weapons/iceaxe/iceaxe_swing1.wav"
    }
end