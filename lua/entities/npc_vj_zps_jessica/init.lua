include("entities/npc_vj_zps_sbase/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/darkborn/zps/survivors/jessica.mdl"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Survivor_PreInit()
    if GetConVar("VJ_ZPS_OldModels"):GetInt() == 1 then
       self.Model = "models/darkborn/zps/survivors_old/jessica.mdl"
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/