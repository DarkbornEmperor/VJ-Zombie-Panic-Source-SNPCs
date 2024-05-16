SWEP.Base = "weapon_vj_zps_melee_base"
SWEP.PrintName = "Pipe"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Zombie Panic! Source"
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/darkborn/zps/weapons/w_pipe.mdl"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 49
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnEquip(newOwner)
    local owner = self:GetOwner()
	owner.MeleeAttackDamage = self.Primary.Damage	
	owner.MeleeAttackDamageType = DMG_CLUB
	owner.SoundTbl_MeleeAttackExtra = {
	"darkborn/zps/weapons/melee/crowbar/crowbar_hit-1.wav",
	"darkborn/zps/weapons/melee/crowbar/crowbar_hit-2.wav",
	"darkborn/zps/weapons/melee/crowbar/crowbar_hit-3.wav",
	"darkborn/zps/weapons/melee/crowbar/crowbar_hit-4.wav"
	}
end