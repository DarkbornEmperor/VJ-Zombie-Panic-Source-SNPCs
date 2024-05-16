SWEP.Base = "weapon_vj_zps_melee_base"
SWEP.PrintName = "Aluminum Bat"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Zombie Panic! Source"
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/darkborn/zps/weapons/w_baseballbat_aluminum.mdl"
SWEP.HoldType = "melee2"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 50
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnEquip(newOwner)
    local owner = self:GetOwner()
	owner.MeleeAttackDamage = self.Primary.Damage	
	owner.MeleeAttackDamageType = DMG_CLUB
	owner.SoundTbl_MeleeAttackExtra = {
	"darkborn/zps/weapons/melee/bat/aluminum_hit-01.wav",
	"darkborn/zps/weapons/melee/bat/aluminum_hit-02.wav",
	"darkborn/zps/weapons/melee/bat/aluminum_hit-03.wav",
	"darkborn/zps/weapons/melee/bat/aluminum_hit-04.wav"
	}
end