/*--------------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "obj_vj_grenade"
ENT.PrintName = "Grenade"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"ENT.Category =  "VJ Base"
ENT.Spawnable = false

if CLIENT then
    VJ.AddKillIcon("obj_vj_zps_grenade", ENT.PrintName, "zps/killicons/destroy_survivor", Color(0,160,255))
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = "models/darkborn/zps/weapons/w_grenade_thrown.mdl"
ENT.RadiusDamage = 300
ENT.SoundTbl_OnCollide = {"darkborn/zps/weapons/explosives/grenade/nade_bounce-01.wav","darkborn/zps/weapons/explosives/grenade/nade_bounce-02.wav","darkborn/zps/weapons/explosives/grenade/nade_bounce-03.wav","darkborn/zps/weapons/explosives/grenade/nade_bounce-04.wav","darkborn/zps/weapons/explosives/grenade/nade_bounce-05.wav"}
-- Custom
ENT.FussTime = 3
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:InitPhys()
    local phys = self:GetPhysicsObject()
    if IsValid(phys) then
        phys:AddAngleVelocity(Vector(math.Rand(500, 500), math.Rand(500, 500), math.Rand(500, 500)))
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local defAngle = Angle(0, 0, 0)
local vecZ4 = Vector(0, 0, 4)
local vezZ100 = Vector(0, 0, 100)
--
function ENT:OnDestroy()
    local myPos = self:GetPos()

    ParticleEffect("vj_zps_grenade_explosion_01", self:GetPos(), defAngle, nil)
    VJ.EmitSound(self,"VJ.ZPS_HEGrenade_Explosion")
    util.ScreenShake(myPos, 100, 200, 1, 2500)

    local expLight = ents.Create("light_dynamic")
    expLight:SetKeyValue("brightness", "4")
    expLight:SetKeyValue("distance", "300")
    expLight:SetLocalPos(myPos)
    expLight:SetLocalAngles(self:GetAngles())
    expLight:Fire("Color", "255 150 0")
    //expLight:SetParent(self)
    expLight:Spawn()
    expLight:Activate()
    expLight:Fire("TurnOn", "", 0)
    expLight:Fire("Kill","",0.08)
    //self:DeleteOnRemove(expLight)

    self:SetLocalPos(myPos + vecZ4) -- Because the entity is too close to the ground
    local tr = util.TraceLine({
        start = myPos,
        endpos = myPos - vezZ100,
        filter = self
    })
    util.Decal(VJ.PICK(self.CollisionDecal), tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)

    self:DealDamage()
    self:Remove()
end