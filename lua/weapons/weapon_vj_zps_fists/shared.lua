SWEP.Base = "weapon_vj_zps_melee_base"
SWEP.PrintName = "Fists"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Zombie Panic! Source"
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/darkborn/zps/weapons/w_empty.mdl"
SWEP.ZPS_HType = "fists"
-- World Model Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_Invisible = true
SWEP.WorldModel_NoShadow = true
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 33
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnEquip(newOwner)
    local owner = self:GetOwner()
    owner.MeleeAttackDamage = self.Primary.Damage
    owner.MeleeAttackDamageType = DMG_CLUB
    owner.SoundTbl_MeleeAttackExtra = {
    "darkborn/zps/weapons/melee/push/push_hit-01.wav",
    "darkborn/zps/weapons/melee/push/push_hit-02.wav",
    "darkborn/zps/weapons/melee/push/push_hit-03.wav",
    "darkborn/zps/weapons/melee/push/push_hit-04.wav"
    }
    owner.SoundTbl_MeleeAttackMiss = {
    "npc/zombie/claw_miss1.wav",
    "npc/zombie/claw_miss2.wav"
    }
end