/*--------------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Base = "obj_vj_spawner_base"
ENT.Type = "anim"
ENT.PrintName = "Random Survivor Spawner"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Category = "Zombie Panic! Source"

ENT.Spawnable = false
ENT.AdminSpawnable = false
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

local entsList = {
    "npc_vj_zps_eugene",
    "npc_vj_zps_marcus",
    "npc_vj_zps_paul",
    "npc_vj_zps_pedro",
    "npc_vj_zps_larry",
    "npc_vj_zps_jessica",
    "npc_vj_zps_lea",
    "npc_vj_zps_jessica",
    "npc_vj_zps_vanessa"
}
ENT.EntitiesToSpawn = {
    {SpawnPosition = Vector(0, 0, 0), Entities = entsList},
    {SpawnPosition = Vector(50, 50, 0), Entities = entsList},
    {SpawnPosition = Vector(50, -50, 0), Entities = entsList},
    {SpawnPosition = Vector(-50, 50, 0), Entities = entsList},
    {SpawnPosition = Vector(-50, -50, 0), Entities = entsList},
}
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/