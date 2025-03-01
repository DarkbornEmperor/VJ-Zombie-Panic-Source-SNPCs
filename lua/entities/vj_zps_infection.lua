AddCSLuaFile()
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.Base = "prop_vj_animatable"
ENT.Type = "anim"

ENT.AdminOnly = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetupDataTables()
    self:NetworkVar("Vector",0,"PlayerColor")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Initialize()
    self:SetCollisionGroup(COLLISION_GROUP_WORLD)
    self:SetSolid(SOLID_NONE)
    self:AddEffects(EF_BONEMERGE)
    self:SetOwner(self.VJ_Owner)
    if CLIENT && GetConVar("VJ_ZPS_BloodDecals"):GetInt() == 1 then
        //for i = 1,5 do
            util.DecalEx(Material(util.DecalMaterial("Blood")),self,self:GetPos() + Vector(0,0,math.random(20,80)),VectorRand(),Color(255,255,255),1,1)
        //end
    end
end