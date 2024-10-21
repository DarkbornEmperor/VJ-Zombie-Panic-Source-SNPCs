include("entities/npc_vj_zps_zbase/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/darkborn/zps/zombies/carrier.mdl"}
ENT.StartHealth = 250
ENT.MeleeAttackDamage = 35
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_PreInit()
    if GetConVar("VJ_ZPS_OldModels"):GetInt() == 1 then
       self.Model = {"models/darkborn/zps/zombies_old/carrier.mdl"}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt,isProp)
 if self:IsOnFire() then hitEnt:Ignite(4) end
    if hitEnt:IsPlayer() && hitEnt:Health() < self.MeleeAttackDamage + 1 && hitEnt.ZPS_InfectedVictim then
        VJ_ZPS_SetPlayerZombie(hitEnt,self,self)
end
    if math.random(1,GetConVar("VJ_ZPS_CarrierInfectionChance"):GetInt()) == 1 && (hitEnt:LookupBone("ValveBiped.Bip01_Pelvis") != nil) && !hitEnt.ZPS_InfectedVictim then
    if (hitEnt:IsPlayer() /*&& hitEnt:Armor() < 25*/ && GetConVar("sbox_godmode"):GetInt() == 0) or hitEnt:IsNPC() then
    if hitEnt.ZPS_InfectedVictim then return end
        hitEnt.ZPS_InfectedVictim = true
        if hitEnt.IsZPSSurvivor then hitEnt.ZPS_NextCoughT = CurTime() + math.random(1,30) end
        //if hitEnt:IsPlayer() then hitEnt:PrintMessage(HUD_PRINTTALK, "You've been infected.") end
        VJ_ZPS_InfectionApply(hitEnt,self)
    end
end
    return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
local berserkSpeed = 1.4
--
function ENT:Zombie_OnThinkActive()
 if self:IsMoving() && self:IsOnGround() then
    if self.ZPS_Berserk then
        self.AnimationPlaybackRate = self.ZPS_BerserkSpeed
        self:SetLocalVelocity(self:GetMoveVelocity() *berserkSpeed)
    else
        self.AnimationPlaybackRate = 1
        self:SetLocalVelocity(self:GetMoveVelocity() *0)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
/*for _,v in ipairs(ents.FindInSphere(self:GetPos(),3000)) do
    if v:IsNPC() && v != self && v:GetClass() != self:GetClass() && v:Disposition(self) == D_LI && ((self.VJ_IsBeingControlled == false) or (self.VJ_IsBeingControlled == true && self.VJ_TheController:KeyDown(IN_RELOAD))) && IsValid(self:GetEnemy()) then
    if CurTime() > self.ZPS_BerserkNextT then
    if self.ZPS_Stimulated == true then
       self.ZPS_Berserk = true
       effects.BeamRingPoint(self:GetPos(), 0.3, 2, 400, 16, 0, Color(0, 255, 63, 255), {material="sprites/physcannon_bluelight2", framerate=20})
       effects.BeamRingPoint(self:GetPos(), 0.3, 2, 200, 16, 0, Color(0, 255, 63, 255), {material="sprites/physcannon_bluelight2", framerate=20})
       VJ.EmitSound(self,"darkborn/zps/zombies/carrier/berserk/carrier_berserk-0"..math.random(1,7)..".wav",80)
       v.AnimTbl_Run = {ACT_RUN_STIMULATED}
end
       self.ZPS_BerserkNextT = CurTime() + (math.Rand(10,15))
            end
        end
    end
end*/
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/