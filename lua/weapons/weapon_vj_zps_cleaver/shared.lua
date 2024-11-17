SWEP.Base = "weapon_vj_zps_melee_base"
SWEP.PrintName = "Cleaver"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Zombie Panic! Source"
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/darkborn/zps/weapons/w_meatcleaver.mdl"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 72
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnEquip(newOwner)
    local owner = self:GetOwner()
    owner.MeleeAttackDamage = self.Primary.Damage
    owner.MeleeAttackDamageType = DMG_SLASH
    owner.SoundTbl_MeleeAttackExtra = {
    "darkborn/zps/weapons/melee/machete/machete_hit-01.wav",
    "darkborn/zps/weapons/melee/machete/machete_hit-02.wav",
    "darkborn/zps/weapons/melee/machete/machete_hit-03.wav",
    "darkborn/zps/weapons/melee/machete/machete_hit-04.wav"
    }
    owner.SoundTbl_MeleeAttackMiss = {
    "weapons/iceaxe/iceaxe_swing1.wav"
    }
end