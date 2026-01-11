ENT.Base = "npc_vj_human_base" -- List of all base types: https://github.com/DrVrej/VJ-Base/wiki/Base-Types
ENT.Type = "ai"
ENT.PrintName = "Survivor"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Category = "Zombie Panic! Source"

ENT.VJ_ZPS_Survivor = true

if CLIENT then
    VJ.AddKillIcon("npc_vj_zps_sbase", ENT.PrintName, "zps/killicons/destroy_survivor", Color(0, 160, 255))
end