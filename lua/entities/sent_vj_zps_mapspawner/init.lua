/* Note: All credits go to Cpt. Hazama. I take no credit for this. */
AddCSLuaFile("shared.lua")
include("shared.lua")

local table_insert = table.insert
local table_remove = table.remove

ENT.Zombie = {
    {class="npc_vj_zps_zcarrier",chance=1},
    {class="npc_vj_zps_zeugene",chance=1},
    {class="npc_vj_zps_zjessica",chance=1},
    {class="npc_vj_zps_zlarry",chance=1},
    {class="npc_vj_zps_zlea",chance=1},
    {class="npc_vj_zps_zmarcus",chance=1},
    {class="npc_vj_zps_zpaul",chance=1},
    {class="npc_vj_zps_zpedro",chance=1},
    {class="npc_vj_zps_zvanessa",chance=1},
}

local MusicList = {
    "darkborn/zps/mapspawner/ac_glowingmist.wav",
    "darkborn/zps/mapspawner/ac_silenthorror.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Initialize()
    local i = 0
    for k, v in ipairs(ents.GetAll()) do
    if v:GetClass() == "sent_vj_zps_mapspawner" then
    i = i + 1
        if i > 1 then PrintMessage(HUD_PRINTTALK, "Only one Map Spawner is allowed on the map.") self.SkipOnRemove = true self:Remove() end
    end
end

    self.nodePositions = {}
    self.navAreas = {}

 for _,pos in pairs(VJ_ZPS_NODEPOS) do
    if pos then table_insert(self.nodePositions,{Position = pos, Time = 0}) end
end

 for _,nav in pairs(navmesh.GetAllNavAreas()) do
    if nav then table_insert(self.navAreas,nav) end
end

 local count = #self.nodePositions +#self.navAreas
 if count <= 50 then
 local msg = "WARNING: Low node/nav-area count detected! The Map Spawner may find it difficult to process with such low nodes/nav-areas. The Map Spawner will now remove itself."
 if count <= 0 then
    msg = "WARNING: No nodes or nav-mesh detected! The Map Spawner relies on nodes/nav-areas for many things. Without any, the Map Spawner will not work! The Map Spawner will now remove itself."
end
    MsgN(msg)
    PrintMessage(HUD_PRINTTALK, msg)
    SafeRemoveEntity(self)
end

    self:SetCollisionGroup(COLLISION_GROUP_NONE)
    self:SetMoveType(MOVETYPE_NONE)
    self:SetSolid(SOLID_NONE)
    self:SetPos(Vector(0, 0, 0))
    self:SetNoDraw(true)
    self:DrawShadow(false)

    self.IsActivated = tobool(GetConVarNumber("VJ_ZPS_MapSpawner_Enabled"))
    self.ZPS_SpawnDistance = GetConVarNumber("VJ_ZPS_MapSpawner_SpawnMax")
    self.ZPS_SpawnDistanceClose = GetConVarNumber("VJ_ZPS_MapSpawner_SpawnMin")
    self.ZPS_HordeChance = GetConVarNumber("VJ_ZPS_MapSpawner_HordeChance")
    self.ZPS_HordeCooldownMin = GetConVarNumber("VJ_ZPS_MapSpawner_HordeCooldownMin")
    self.ZPS_HordeCooldownMax = GetConVarNumber("VJ_ZPS_MapSpawner_HordeCooldownMax")
    self.ZPS_MaxZombie = GetConVarNumber("VJ_ZPS_MapSpawner_MaxZom")
    self.ZPS_MaxHordeSpawn = GetConVarNumber("VJ_ZPS_MapSpawner_HordeCount")
    self.tbl_SpawnedNPCs = {}
    self.tbl_NPCsWithEnemies = {}
    self.tbl_SpawnedSpecialZombie = {}
    self.NextAICheckTime = CurTime() +5
    self.NextZombieSpawnTime = CurTime() +1
    self.NextHordeSpawnTime = CurTime() +math.Rand(self.ZPS_HordeCooldownMin,self.ZPS_HordeCooldownMax)
    self.DidStartMusic = false
    self.NextMusicSwitchT = CurTime() +1
    self.NextAIBossCheckTime = CurTime() +5
    self.HordeSpawnRate = 0.19

    local Ambience = {"darkborn/zps/zombies/carrier/actions/carrier_roar.wav","darkborn/zps/zombies/carrier/actions/survivor_spotted.wav","darkborn/zps/zombies/carrier/actions/survivor_tagged.wav"}
    for _,v in ipairs(player.GetAll()) do
    if GetConVarNumber("VJ_ZPS_MapSpawner_Ambient") == 1 then
        self.ZPS_Ambience = VJ.CreateSound(v,Ambience,GetConVar("VJ_ZPS_MapSpawner_AmbienceVolume"):GetInt(), 100)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CheckVisibility(pos,ent,mdl)
 local check = ents.Create("prop_vj_animatable")
    check:SetModel(mdl or "models/darkborn/zps/zombies/carrier.mdl")
    check:SetPos(pos)
    check:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
    check:Spawn()
    check:SetNoDraw(true)
    check:DrawShadow(false)
    self:DeleteOnRemove(check)
 timer.Simple(0,function()
    SafeRemoveEntity(check)
end)
    return ent:Visible(check)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindCenterNavPoint(ent)
    for _,v in RandomPairs(self.navAreas) do
    local testPos = v:GetCenter()
    local dist = testPos:Distance(ent:GetPos())
    if dist <= self.ZPS_SpawnDistance && dist >= self.ZPS_SpawnDistanceClose && !self:CheckVisibility(testPos,ent) then
        return testPos
    end
end
    return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindHiddenNavPoint(ent)
    for _,v in RandomPairs(self.navAreas) do
    local hidingSpots = v:GetHidingSpots()
    if !hidingSpots then continue end
    if #hidingSpots <= 0 then continue end
    local testPos = VJ.PICK(hidingSpots)
    local dist = testPos:Distance(ent:GetPos())
    if dist <= self.ZPS_SpawnDistance && dist >= self.ZPS_SpawnDistanceClose && !self:CheckVisibility(testPos,ent) then
        return testPos
    end
end
    return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindRandomNavPoint(ent)
    for _,v in RandomPairs(self.navAreas) do
    local testPos = v:GetRandomPoint()
    local dist = testPos:Distance(ent:GetPos())
    if dist <= self.ZPS_SpawnDistance && dist >= self.ZPS_SpawnDistanceClose && !self:CheckVisibility(testPos,ent) then
        return testPos
    end
end
    return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetClosestNavPosition(ent,getHidden)
    local pos = false
    local closestDist = 999999999
    for i,v in pairs(self.navAreas) do
    local hidingSpots = getHidden && v:GetHidingSpots() or true
    if !hidingSpots then continue end
    if istable(hidingSpots) && #hidingSpots <= 0 then continue end
    local testPos = getHidden && VJ.PICK(v:GetHidingSpots()) or v:GetRandomPoint()
    local dist = ent:GetPos():Distance(testPos)
    if dist < closestDist && (dist <= self.ZPS_SpawnDistance && dist >= self.ZPS_SpawnDistanceClose && !self:CheckVisibility(testPos,ent)) then
        closestDist = dist
        pos = testPos
    end
end
    return pos
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetClosestNodePosition(ent)
    local pos = false
    local closestDist = 999999999
    for i,v in pairs(self.nodePositions) do
    if !self:IsNodeUsable(i) then continue end
    local testPos = self:GetNodePosition(i)
    local dist = ent:GetPos():Distance(testPos)
    if dist < closestDist && (dist <= self.ZPS_SpawnDistance && dist >= self.ZPS_SpawnDistanceClose && !self:CheckVisibility(testPos,ent)) then
        closestDist = dist
        pos = testPos
    end
end
    return pos
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindRandomNodePosition(ent)
    for i,v in RandomPairs(self.nodePositions) do
    if !self:IsNodeUsable(i) then continue end
    local testPos = self:GetNodePosition(i)
    local dist = ent && testPos:Distance(ent:GetPos()) or 0
    if ent then
        return testPos
    else
    if dist <= self.ZPS_SpawnDistance && dist >= self.ZPS_SpawnDistanceClose && !self:CheckVisibility(testPos,ent) then
            return testPos
        end
    end
end
    return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindSpawnPosition(getClosest,findHidden)
 local nodes = self.nodePositions
 local navareas = self.navAreas
 local useNav = (#nodes <= 0 && #navareas > 0) or (#navareas > 0 && #nodes > 0 && math.random(1,2) == 1) or false
 local pos = false
 if useNav then
    local getHidden = findHidden or math.random(1,3) == 1
    local testEnt = self:GetRandomEnemy()
    pos = getClosest && self:GetClosestNavPosition(testEnt,getHidden) or getHidden && self:FindHiddenNavPoint(testEnt) or self:FindRandomNavPoint(testEnt)
 else
    local testEnt = self:GetRandomEnemy()
    pos = getClosest && self:GetClosestNodePosition(testEnt) or self:FindRandomNodePosition(testEnt)
end
    return pos
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetNodePosition(i)
    return self.nodePositions[i].Position
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:IsNodeUsable(i)
    return self.nodePositions[i].Time < CurTime()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindEnemy()
    local tbl = {}
    for _,v in pairs(ents.GetAll()) do
    if (v:IsPlayer() || v:IsNPC()) && v:Health() > 0 && !v:IsFlagSet(65536) && (v.VJ_NPC_Class && !VJ.HasValue(v.VJ_NPC_Class,"CLASS_ZOMBIE") or true) then
        table_insert(tbl,v)
    end
end
    return tbl
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetRandomEnemy()
    return VJ.PICK(self:FindEnemy())
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetClosestEnemy(pos)
    local ent = NULL
    local closestDist = 999999999
    for _,v in pairs(self:FindEnemy()) do
    local dist = v:GetPos():Distance(pos)
    if dist < closestDist then
        closestDist = dist
        ent = v
    end
end
    return ent
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CheckEnemyDistance(ent,remove)
 local remove = remove or true
 local closestDist = 999999999
 local visible = false
 for _,v in pairs(self:FindEnemy()) do
 local dist = v:GetPos():Distance(ent:GetPos())
 if dist < closestDist then
    closestDist = dist
end
    if v:Visible(ent) then
        visible = true -- Visible to someone, don't bother removing
    end
end
    if closestDist >= GetConVarNumber("VJ_ZPS_MapSpawner_SpawnMax") +1000 && !visible && !remove then
        SafeRemoveEntity(ent)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Think()
    self.IsActivated = GetConVar("VJ_ZPS_MapSpawner_Enabled")
    if self.IsActivated then
        -- Manage ConVar data
        self.ZPS_SpawnDistance = GetConVarNumber("VJ_ZPS_MapSpawner_SpawnMax")
        self.ZPS_SpawnDistanceClose = GetConVarNumber("VJ_ZPS_MapSpawner_SpawnMin")
        self.ZPS_HordeChance = GetConVarNumber("VJ_ZPS_MapSpawner_HordeChance")
        self.ZPS_HordeCooldownMin = GetConVarNumber("VJ_ZPS_MapSpawner_HordeCooldownMin")
        self.ZPS_HordeCooldownMax = GetConVarNumber("VJ_ZPS_MapSpawner_HordeCooldownMax")
        self.ZPS_MaxZombie = GetConVarNumber("VJ_ZPS_MapSpawner_MaxZom")
        self.ZPS_MaxHordeSpawn = GetConVarNumber("VJ_ZPS_MapSpawner_HordeCount")
        self.AI_RefreshTime = GetConVarNumber("VJ_ZPS_MapSpawner_RefreshRate")

    -- Checks for inactive AI, this code is quite bulky and might be able to be optimized better
    if CurTime() > self.NextAICheckTime then
    if #self.tbl_SpawnedNPCs > 0 then
    for i,v in ipairs(self.tbl_SpawnedNPCs) do
    if IsValid(v) then
    local enemy = v:GetEnemy()
        self:CheckEnemyDistance(v)
    if IsValid(enemy) && !VJ.HasValue(self.tbl_NPCsWithEnemies,v) then
        table_insert(self.tbl_NPCsWithEnemies,v)
    elseif !IsValid(enemy) then
    if VJ.HasValue(self.tbl_NPCsWithEnemies,v) then
        table_remove(self.tbl_NPCsWithEnemies,i)
    end
end
    else
        table_remove(self.tbl_SpawnedNPCs,i)
        end
    end
end
    if #self.tbl_SpawnedSpecialZombie > 0 then
    for i,v in ipairs(self.tbl_SpawnedSpecialZombie) do
    if IsValid(v) then
    local enemy = v:GetEnemy()
        self:CheckEnemyDistance(v)
    if IsValid(enemy) && !VJ.HasValue(self.tbl_NPCsWithEnemies,v) then
        table_insert(self.tbl_NPCsWithEnemies,v)
    elseif !IsValid(enemy) then
    if VJ.HasValue(self.tbl_NPCsWithEnemies,v) then
        table_remove(self.tbl_NPCsWithEnemies,i)
    end
end
    else
        table_remove(self.tbl_SpawnedSpecialZombie,i)
        end
    end
end
    self.NextAICheckTime = CurTime() +5
end

        -- Manages Music
           self:DoMusic(false)

 -- Spawns AI
 if CurTime() > self.NextZombieSpawnTime then
 if #self.tbl_SpawnedNPCs >= self.ZPS_MaxZombie -self.ZPS_MaxHordeSpawn then return end -- Makes sure that we can at least spawn a mob when it's time
    self:SpawnZombie(self:PickZombie(self.Zombie),self:FindSpawnPosition(false))
    self.NextZombieSpawnTime = CurTime() +math.Rand(GetConVarNumber("VJ_ZPS_MapSpawner_DelayMin"),GetConVarNumber("VJ_ZPS_MapSpawner_DelayMax"))
end

    -- Spawns Hordes
    if CurTime() > self.NextHordeSpawnTime && math.random(1,self.ZPS_HordeChance) == 1 then
    for i = 1,self.ZPS_MaxHordeSpawn do
        timer.Simple(self.HordeSpawnRate *i,function() -- Help with lag when spawning
    if IsValid(self) then
        self:SpawnZombie(self:PickZombie(self.Zombie),self:FindSpawnPosition(true,true),true)
        end
    end)
end
        self.NextHordeSpawnTime = CurTime() +math.Rand(self.ZPS_HordeCooldownMin,self.ZPS_HordeCooldownMax)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DoMusic(stop)
    for _,v in ipairs(player.GetAll()) do
    if !stop && !self.DidStartMusic then
        self.DidStartMusic = true
        self.NextMusicSwitchT = CurTime() +1
    if GetConVar("VJ_ZPS_MapSpawner_Music"):GetInt() == 1 then
        self.NextZPSMusicT = self.NextZPSMusicT or 0
    if CurTime() > self.NextZPSMusicT then
        self.ZPS_PickTrack = VJ.PICK(MusicList)
        self.ZPS_Track = VJ.CreateSound(v,self.ZPS_PickTrack,GetConVar("VJ_ZPS_MapSpawner_MusicVolume"):GetInt(),100)
        self.NextZPSMusicT = CurTime() + ((((SoundDuration(self.ZPS_PickTrack) > 0) and SoundDuration(self.ZPS_PickTrack)) or 2) + 1)
        timer.Simple(((((SoundDuration(self.ZPS_PickTrack) > 0) and SoundDuration(self.ZPS_PickTrack)) or 2) + 1),function() if IsValid(self) then self.DidStartMusic = false VJ.STOPSOUND(self.ZPS_Track) end end)
        end
    end
end
    if stop && self.DidStartMusic then
        self.DidStartMusic = false
        self.NextMusicSwitchT = CurTime() +1
        VJ.STOPSOUND(self.ZPS_Track)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetBossCount(class)
    local count = 0
    for _,v in pairs(self.tbl_SpawnedSpecialZombie) do
    if IsValid(v) && v:GetClass() == class then
        count = count +1
    end
end
    return count
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PickZombie(tbl)
    local useMax = tbl == self.SpecialZombie
    local ent = false
    for _,v in RandomPairs(tbl) do
    if !useMax then
    if math.random(1,v.chance) == 1 then
        ent = v.class
    break
end
    else
    if self:GetBossCount(v.class) < v.max then
        ent = v.class
            break
        end
    end
end
    return ent
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SpawnZombie(ent,pos,isMob)
    if ent == false then return end
    if pos == nil or pos == false then return end
    if #self.tbl_SpawnedNPCs >= self.ZPS_MaxZombie then return end
    local Zombie = ents.Create(ent)
        Zombie:SetPos(pos)
        Zombie:SetAngles(Angle(0,math.random(0,360),0))
        Zombie:Spawn()
        table_insert(self.tbl_SpawnedNPCs,Zombie)
    if isMob then
        Zombie.SightAngle = 360
        Zombie.EnemyXRayDetection = true
        Zombie:DrawShadow(false)
    timer.Simple(0,function()
    if IsValid(Zombie) then
        Zombie:DrawShadow(false)
        end
    end)
end
    Zombie.MapSpawner = self
    Zombie.EntitiesToNoCollide = {}
    Zombie.CallForHelp = false
    for _,v in pairs(self.Zombie) do
        table_insert(Zombie.EntitiesToNoCollide,v.class)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRemove()
    self:DoMusic(true)
    VJ.STOPSOUND(self.ZPS_Ambience)
    for index,object in ipairs(self.tbl_SpawnedNPCs) do
    if IsValid(object) then
        object:Remove()
    end
end
    for index,object in ipairs(self.tbl_SpawnedSpecialZombie) do
    if IsValid(object) then
        object:Remove()
        end
    end
end