include("entities/npc_vj_zps_sbase/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/darkborn/zps/survivors/marcus.mdl"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Survivor_PreInit()
    if GetConVar("VJ_ZPS_Hunted"):GetInt() == 1 then
        self.VJ_NPC_Class = {"CLASS_MARCUS"}
        self.AlliedWithPlayerAllies = false
    end
    if GetConVar("VJ_ZPS_OldModels"):GetInt() == 1 then
        self.Model =
            "models/darkborn/zps/survivors_old/marcus.mdl"
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/