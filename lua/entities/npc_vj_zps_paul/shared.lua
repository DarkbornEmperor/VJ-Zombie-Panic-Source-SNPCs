ENT.Base = "npc_vj_human_base" -- List of all base types: https://github.com/DrVrej/VJ-Base/wiki/Base-Types
ENT.Type = "ai"
ENT.PrintName = "Paul"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Purpose = "Spawn it and fight with it!"
ENT.Instructions = "Click on the spawnicon to spawn it."
ENT.Category = "Zombie Panic! Source"

if CLIENT then
    VJ.AddKillIcon("npc_vj_zps_paul", ENT.PrintName, "zps/killicons/destroy_survivor", Color(0,160,255))
end