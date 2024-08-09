ENT.Base = "npc_vj_creature_base" -- List of all base types: https://github.com/DrVrej/VJ-Base/wiki/Base-Types
ENT.Type = "ai"
ENT.PrintName = "Zombie (Player)"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Purpose = "Spawn it and fight with it!"
ENT.Instructions = "Click on the spawnicon to spawn it."
ENT.Category = "Zombie Panic! Source"

if (CLIENT) then
    local Name = "Zombie (Player)"
    local LangName = "npc_vj_zps_zinf_ply"
    language.Add(LangName, Name)
    killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
    language.Add("#"..LangName, Name)
    killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end