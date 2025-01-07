/*--------------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "obj_vj_grenade"
ENT.PrintName = "Tennis Ball"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Information = "Projectiles for my addons"
ENT.Category = "VJ Base"
ENT.Spawnable = false

ENT.VJ_ID_Grenade = false
ENT.VJ_ID_Grabbable = false
ENT.VJ_ID_Danger = false

if CLIENT then
    local Name = "Tennis Ball"
    local LangName = "obj_vj_zps_tennisball"
    language.Add(LangName, Name)
    killicon.Add(LangName,"zps/icons/destroy_survivor",Color(255,80,0,255))
    language.Add("#"..LangName, Name)
    killicon.Add("#"..LangName,"zps/icons/destroy_survivor",Color(255,80,0,255))
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = "models/darkborn/zps/weapons/w_tennisball.mdl"
ENT.DoesDirectDamage = false
ENT.DoesRadiusDamage = false
ENT.SoundTbl_OnCollide = {"darkborn/zps/weapons/physics/tennisball/impact01.wav","darkborn/zps/weapons/physics/tennisball/impact02.wav","darkborn/zps/weapons/physics/tennisball/impact03.wav"}
-- Custom
ENT.FuseTime = 10
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:InitPhys()
    local phys = self:GetPhysicsObject()
    if IsValid(phys) then
        phys:AddAngleVelocity(Vector(math.Rand(500, 500), math.Rand(500, 500), math.Rand(500, 500)))
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDestroy()
    self:Remove()
end