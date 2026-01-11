/*--------------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "obj_vj_projectile_base"
ENT.PrintName = "Snowball"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Category = "VJ Base"

ENT.VJ_ID_Danger = false

if CLIENT then
    VJ.AddKillIcon("obj_vj_zps_snowball", ENT.PrintName, "zps/killicons/destroy_survivor", Color(0, 160, 255))
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = "models/darkborn/zps/weapons/w_snowball.mdl"
ENT.ProjectileType = VJ.PROJ_TYPE_GRAVITY
ENT.DoesDirectDamage = false
ENT.CollisionDecal = "VJ_ZPS_Snow"
ENT.SoundTbl_OnCollide = {
    "darkborn/zps/weapons/physics/snowball/impact01.wav",
    "darkborn/zps/weapons/physics/snowball/impact02.wav",
    "darkborn/zps/weapons/physics/snowball/impact03.wav"
}
local math_rand = math.Rand
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:InitPhys()
    local phys = self:GetPhysicsObject()
    if IsValid(phys) then
        phys:AddAngleVelocity(Vector(math_rand(500, 500), math_rand(500, 500), math_rand(500, 500)))
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDestroy(data, phys)
    ParticleEffect("vj_zps_impact_snowball", data.HitPos, Angle(0, 0, 0), nil)
    //VJ.EmitSound(self, {"darkborn/zps/weapons/physics/snowball/impact01.wav", "darkborn/zps/weapons/physics/snowball/impact02.wav", "darkborn/zps/weapons/physics/snowball/impact03.wav"}, 75, 100)
end