include("entities/npc_vj_zps_zbase/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/darkborn/zps/zombies/carrier.mdl"
ENT.StartHealth = 250
ENT.MeleeAttackDamage = 35

local math_random = math.random
local math_rand = math.Rand
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_PreInit()
    if GetConVar("VJ_ZPS_OldModels"):GetInt() == 1 then
        self.Model =
            "models/darkborn/zps/zombies_old/carrier.mdl"
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_Init()
    if GetConVar("VJ_ZPS_SantaHat"):GetInt() == 1 then
        local santaHat = ents.Create("prop_vj_animatable")
        santaHat:SetModel("models/darkborn/zps/festive/santahat.mdl")
        santaHat:SetLocalPos(self:GetPos())
        santaHat:SetOwner(self)
        santaHat:SetParent(self)
        santaHat:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
        santaHat:Spawn()
        santaHat:Activate()
        santaHat:SetSolid(SOLID_NONE)
        santaHat:AddEffects(EF_BONEMERGE)
        self.SantaHat = santaHat
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttackExecute(status, ent, isProp)
    if status == "PreDamage" then
        if self:IsOnFire() then ent:Ignite(math_rand(3,5)) end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
/*function ENT:Zombie_OnThinkActive()
    for _, v in ipairs(ents.FindInSphere(self:GetPos(), 3000)) do
        if v:IsNPC() && v != self && v:GetClass() != self:GetClass() && v:Disposition(self) == D_LI && ((!self.VJ_IsBeingControlled) or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_RELOAD))) && IsValid(self:GetEnemy()) then
            if CurTime() > self.ZPS_BerserkNextT then
                if self.ZPS_Stimulated then
                    self.ZPS_Berserk = true
                    effects.BeamRingPoint(self:GetPos(), 0.3, 2, 400, 16, 0, Color(0, 255, 63, 255), {material = "sprites/physcannon_bluelight2", framerate = 20})
                    effects.BeamRingPoint(self:GetPos(), 0.3, 2, 200, 16, 0, Color(0, 255, 63, 255), {material = "sprites/physcannon_bluelight2", framerate = 20})
                    VJ.EmitSound(self,"darkborn/zps/zombies/carrier/berserk/carrier_berserk-0" .. math_random(1,7) .. ".wav", 80)
                end
                self.ZPS_BerserkNextT = CurTime() + (math_rand(10,15))
            end
        end
    end
end*/