/*--------------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "obj_vj_projectile_base"
ENT.PrintName = "Snowball"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Information = "Projectiles for my addons"
ENT.Category = "VJ Base"
ENT.Spawnable = false

ENT.VJTag_ID_Danger = false

if CLIENT then
    local Name = "Snowball"
    local LangName = "obj_vj_zps_snowball"
    language.Add(LangName, Name)
    killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
    language.Add("#"..LangName, Name)
    killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = "models/darkborn/zps/weapons/w_snowball.mdl"
ENT.DoesDirectDamage = false
ENT.DecalTbl_DeathDecals = {"VJ_ZPS_Snow"}
ENT.SoundTbl_OnCollide = {"darkborn/zps/weapons/physics/snowball/impact01.wav","darkborn/zps/weapons/physics/snowball/impact02.wav","darkborn/zps/weapons/physics/snowball/impact03.wav"}
ENT.SoundTbl_OnRemove = {""}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
    phys:Wake()
    phys:EnableGravity(true)
    phys:EnableDrag(false)
    phys:SetBuoyancyRatio(0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DeathEffects(data,phys)
    ParticleEffect("vj_zps_impact_snowball", data.HitPos, Angle(0,0,0), nil)
    VJ.EmitSound(self,{"darkborn/zps/weapons/physics/snowball/impact01.wav","darkborn/zps/weapons/physics/snowball/impact02.wav","darkborn/zps/weapons/physics/snowball/impact03.wav"},75,100)
end