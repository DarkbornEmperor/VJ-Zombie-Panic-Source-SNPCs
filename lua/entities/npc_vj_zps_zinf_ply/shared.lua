ENT.Base = "npc_vj_creature_base" -- List of all base types: https://github.com/DrVrej/VJ-Base/wiki/Base-Types
ENT.Type = "ai"
ENT.PrintName = "Zombie (Player)"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Category = "Zombie Panic! Source"

ENT.VJ_ID_Undead = true
ENT.VJ_ZPS_Zombie = true

if CLIENT then
    VJ.AddKillIcon("npc_vj_zps_zinf_ply", ENT.PrintName, "zps/killicons/destroy_zombie", Color(255, 0, 0))
end