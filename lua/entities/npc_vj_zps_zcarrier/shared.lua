ENT.Base = "npc_vj_creature_base" -- List of all base types: https://github.com/DrVrej/VJ-Base/wiki/Base-Types
ENT.Type = "ai"
ENT.PrintName = "Carrier Zombie"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Purpose = "Spawn it and fight with it!"
ENT.Instructions = "Click on the spawnicon to spawn it."
ENT.Category = "Zombie Panic! Source"

if (CLIENT) then
    local Name = "Carrier Zombie"
    local LangName = "npc_vj_zps_zcarrier"
    language.Add(LangName, Name)
    killicon.Add(LangName,"zps/icons/destroy_zombie",Color(255,80,0,255))
    language.Add("#"..LangName, Name)
    killicon.Add("#"..LangName,"zps/icons/destroy_zombie",Color(255,80,0,255))
end