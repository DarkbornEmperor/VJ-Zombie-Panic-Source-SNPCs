/*--------------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "obj_vj_grenade"
ENT.PrintName = "IED"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"ENT.Category =  "VJ Base"
ENT.Spawnable = false

ENT.VJ_ID_Grenade = false
ENT.VJ_ID_Grabbable = false
ENT.VJ_ID_Attackable = true

if CLIENT then
    VJ.AddKillIcon("obj_vj_zps_ied", ENT.PrintName, "zps/killicons/destroy_survivor", Color(0,160,255))
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = "models/darkborn/zps/weapons/w_ied_planted.mdl"
ENT.RadiusDamage = 350
ENT.RadiusDamageRadius = 250
ENT.SoundTbl_OnCollide = {"darkborn/zps/weapons/explosives/ied/ied_drop-01.wav","darkborn/zps/weapons/explosives/ied/ied_drop-02.wav","darkborn/zps/weapons/explosives/ied/ied_drop-03.wav","darkborn/zps/weapons/explosives/ied/ied_drop-04.wav","darkborn/zps/weapons/explosives/ied/ied_drop-05.wav"}
-- Custom
ENT.IED_ArmT = 2
ENT.IED_Armed = false
ENT.IED_NextBlinkT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    timer.Simple(self.IED_ArmT,function() if IsValid(self) then self.IED_Armed = true end end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:InitPhys()
    local phys = self:GetPhysicsObject()
    if IsValid(phys) then
        phys:SetMass(1)
        phys:AddAngleVelocity(Vector(math.Rand(500, 500), math.Rand(500, 500), math.Rand(500, 500)))
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
 if !IsValid(self:GetOwner()) && self.IED_Armed then self:Detonate() return end
 if !self.IED_Armed then return end
 if self.IED_Armed && CurTime() > self.IED_NextBlinkT then
 if self:GetSkin() == 0 then
    self:SetSkin(1)
 elseif self:GetSkin() == 1 then
    self:SetSkin(0)
end
    /*self:SetSkin(1)
    timer.Simple(0.2, function() if IsValid(self) then self:SetSkin(1) end end)
    timer.Simple(0.4, function() if IsValid(self) then self:SetSkin(0) end end)*/ -- Old code
    VJ.CreateSound(self,"darkborn/zps/weapons/explosives/ied/ied_beep_armed.wav",75,100)
    self.IED_NextBlinkT = CurTime() + 1
end
    if IsValid(self:GetOwner()) then
    local owner = self:GetOwner()
    local ownerDist = self:GetPos():Distance(owner:GetPos())
    if IsValid(owner) && ownerDist <= 500 && self:Visible(owner) then
    for _,v in ipairs(ents.FindInSphere(self:GetPos(),150)) do
    if IsValid(v) && IsValid(owner) && (v != owner.VJ_TheController && v != owner.VJ_TheControllerBullseye) && ((v:IsNPC() && v:GetClass() != owner:GetClass() && (owner:IsPlayer() or (owner:IsNPC() && owner:Disposition(v) != D_LI && !v:IsFlagSet(FL_NOTARGET)))) or (v:IsPlayer() && v:Alive() && owner:Disposition(v) != D_LI && (owner:IsPlayer() or (!VJ_CVAR_IGNOREPLAYERS && !v:IsFlagSet(FL_NOTARGET))))) then
        self:Detonate() end end
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local defAngle = Angle(0, 0, 0)
local vecZ4 = Vector(0, 0, 4)
local vezZ100 = Vector(0, 0, 100)
--
function ENT:Detonate()
        self.VJ_ID_Danger = true
        self:SetSkin(1)
        VJ.CreateSound(self,"darkborn/zps/weapons/explosives/ied/ied_alarm.wav",75,100)
        timer.Simple(SoundDuration("darkborn/zps/weapons/explosives/ied/ied_alarm.wav"),function() if IsValid(self) then
        local myPos = self:GetPos()

        ParticleEffect("vj_zps_IED", myPos, defAngle, nil)
        VJ.EmitSound(self,"VJ.ZPS_IED_Explosion")
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
    end)
end