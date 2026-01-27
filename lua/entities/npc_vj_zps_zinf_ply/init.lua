include("entities/npc_vj_zps_zbase/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 2,
    ThirdP_Offset = Vector(30, 25, -50),
    FirstP_Bone = "ValveBiped.Bip01_Head1",
    FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_PreInit()
    if self:GetClass() == "npc_vj_zps_zinf_ply" then
        self.Model =
            "models/darkborn/zps/breen_ply.mdl"
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_Init()
    self:SetNoDraw(true)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/