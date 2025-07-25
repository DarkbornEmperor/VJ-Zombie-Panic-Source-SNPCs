AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 200
ENT.HealthRegenParams = {
    Enabled = true,
    Amount = 4,
    Delay = VJ.SET(2,2),
    ResetOnDmg = true,
}
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_zps_blood_impact_red_01"}
//ENT.BloodDecal = {"VJ_ZPS_Blood_Red"}
ENT.PropInteraction_MaxScale = 5
ENT.HasMeleeAttack = true
ENT.HasMeleeAttackKnockBack = true
ENT.MeleeAttackDamage = 25
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackPlayerSpeed = true
ENT.MeleeAttackPlayerSpeedTime = 0.5
ENT.HasMeleeAttackPlayerSpeedSounds = false
ENT.HasExtraMeleeAttackSounds = true
ENT.DamageResponse = "OnlySearch"
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 2,
    ThirdP_Offset = Vector(40, 25, -50),
    FirstP_Bone = "ValveBiped.Bip01_Head1",
    FirstP_Offset = Vector(0, 0, 5),
}
-- Custom
ENT.ZPS_VirusInfection = true
ENT.ZPS_Crouching = false
ENT.ZPS_CanBreakDoors = false
ENT.ZPS_Berserk = false
ENT.ZPS_AttackingDoor = false
ENT.ZPS_DoorToBreak = NULL
ENT.ZPS_BerserkSpeed = 1.2
ENT.ZPS_NextBerserkT = 0
ENT.ZPS_NextJumpT = 0
ENT.ZPS_NextMeleeAnimT = 0
ENT.IsZPSZombie = true
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep = "common/null.wav"
ENT.SoundTbl_MeleeAttackExtra = {
"darkborn/zps/zombies/z_attack/hit/z_hit-01.wav",
"darkborn/zps/zombies/z_attack/hit/z_hit-02.wav",
"darkborn/zps/zombies/z_attack/hit/z_hit-03.wav",
"darkborn/zps/zombies/z_attack/hit/z_hit-04.wav",
"darkborn/zps/zombies/z_attack/hit/z_hit-05.wav",
"darkborn/zps/zombies/z_attack/hit/z_hit-06.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"darkborn/zps/zombies/z_attack/swipe/z-swipe-1.wav",
"darkborn/zps/zombies/z_attack/swipe/z-swipe-2.wav",
"darkborn/zps/zombies/z_attack/swipe/z-swipe-3.wav",
"darkborn/zps/zombies/z_attack/swipe/z-swipe-4.wav",
"darkborn/zps/zombies/z_attack/swipe/z-swipe-5.wav",
"darkborn/zps/zombies/z_attack/swipe/z-swipe-6.wav"
}
ENT.SoundTbl_Impact = {
"darkborn/zps/shared/impacts/flesh_impact-01.wav",
"darkborn/zps/shared/impacts/flesh_impact-02.wav",
"darkborn/zps/shared/impacts/flesh_impact-03.wav",
"darkborn/zps/shared/impacts/flesh_impact-04.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
 if key == "step" then
    self:PlayFootstepSound()
 elseif key == "melee" then
    self:ExecuteMeleeAttack()
end
 if key == "break_door" then
 if IsValid(self.ZPS_DoorToBreak) then
    self:PlaySoundSystem("BeforeMeleeAttack", self.SoundTbl_BeforeMeleeAttack)
    VJ.EmitSound(self,"physics/wood/wood_panel_impact_hard1.wav",75,100)
 local doorDmg = self.MeleeAttackDamage
 local door = self.ZPS_DoorToBreak
 if door.doorHP == nil then
    door.doorHP = 200 - doorDmg
 elseif door.doorHP <= 0 then
    self:PlaySoundSystem("MeleeAttackMiss", self.SoundTbl_MeleeAttackMiss)
    return -- To prevent door props making a duplication when it shouldn't
 else
    door.doorHP = door.doorHP - doorDmg
end
    if door:GetClass() == "prop_door_rotating" && door.doorHP <= 0 then
        VJ.EmitSound(door,"physics/wood/wood_furniture_break"..math.random(1,2)..".wav",75,100)
        VJ.EmitSound(door,"ambient/materials/door_hit1.wav",75,100)
        ParticleEffect("door_pound_core",door:GetPos(),door:GetAngles(),nil)
        ParticleEffect("door_explosion_chunks",door:GetPos(),door:GetAngles(),nil)
        door:Remove()
        local doorGib = ents.Create("prop_physics")
        doorGib:SetPos(door:GetPos())
        doorGib:SetAngles(door:GetAngles())
        doorGib:SetModel(door:GetModel())
        doorGib:SetSkin(door:GetSkin())
        doorGib:SetBodygroup(1,door:GetBodygroup(1))
        doorGib:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
        doorGib:SetSolid(SOLID_NONE)
        doorGib:Spawn()
        doorGib:GetPhysicsObject():ApplyForceCenter(self:GetForward()*10000)
        SafeRemoveEntityDelayed(doorGib,30)
    elseif door:GetClass() == "func_door_rotating" && door.doorHP <= 0 then
        VJ.EmitSound(door,"physics/wood/wood_furniture_break"..math.random(1,2)..".wav",75,100)
        VJ.EmitSound(door,"ambient/materials/door_hit1.wav",75,100)
        ParticleEffect("door_pound_core",door:GetPos(),door:GetAngles(),nil)
        ParticleEffect("door_explosion_chunks",door:GetPos(),door:GetAngles(),nil)
        door:Remove()
        local doorGibs = ents.Create("prop_dynamic")
        doorGibs:SetPos(door:GetPos())
        doorGibs:SetAngles(door:GetAngles())
        doorGibs:SetModel("models/props_c17/FurnitureDresser001a.mdl")
        doorGibs:Spawn()
        doorGibs:TakeDamage(9999)
        doorGibs:Fire("break") end
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
     self:Zombie_PreInit()
     if GetConVar("VJ_ZPS_BreakDoors"):GetInt() == 1 then
        self.ZPS_CanBreakDoors = true
        self.CanOpenDoors = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_PreInit() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
   self:Zombie_Init()
   self:ZombieVoices()
   self:CapabilitiesRemove(CAP_ANIMATEDFACE)
   self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
   self.ZPS_NextBerserkT = CurTime() + math.Rand(10,20)
   if GetConVar("VJ_ZPS_Hardcore"):GetInt() == 1 then
   if self:GetClass() == "npc_vj_zps_zcarrier" then self:SetSkin(1) end
        self.HealthRegenParams.Amount = 4
        self.HealthRegenParams.Delay = VJ.SET(1,1)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_Init() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoices()
    local cType = self:GetClass()
    if cType == "npc_vj_zps_zcarrier" then
        self:ZombieVoice_Carrier()
    elseif cType == "npc_vj_zps_zeugene" then
        self:ZombieVoice_Eugene()
    elseif cType == "npc_vj_zps_zjessica" then
        self:ZombieVoice_Jessica()
    elseif cType == "npc_vj_zps_zlarry" then
        self:ZombieVoice_Larry()
    elseif cType == "npc_vj_zps_zlea" then
        self:ZombieVoice_Lea()
    elseif cType == "npc_vj_zps_zmarcus" then
        self:ZombieVoice_Marcus()
    elseif cType == "npc_vj_zps_zpaul" then
        self:ZombieVoice_Paul()
    elseif cType == "npc_vj_zps_zpedro" then
        self:ZombieVoice_Pedro()
    elseif cType == "npc_vj_zps_zvanessa" then
        self:ZombieVoice_Vanessa()
    /*elseif cType == "npc_vj_zps_zinf" or cType == "npc_vj_zps_zinf_ply" then
        self:ZombieVoice_InfectedMale()*/
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoice_InfectedMale()
    local pickVoice = math.random(1,5)
    if pickVoice == 1 then
        self:ZombieVoice_Eugene()
    elseif pickVoice == 2 then
        self:ZombieVoice_Larry()
    elseif pickVoice == 3 then
        self:ZombieVoice_Marcus()
    elseif pickVoice == 4 then
        self:ZombieVoice_Paul()
    elseif pickVoice == 5 then
        self:ZombieVoice_Pedro()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoice_InfectedFemale()
    local pickVoice = math.random(1,3)
    if pickVoice == 1 then
        self:ZombieVoice_Jessica()
    elseif pickVoice == 2 then
        self:ZombieVoice_Lea()
    elseif pickVoice == 3 then
        self:ZombieVoice_Vanessa()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnChangeActivity(newAct)
 if newAct == ACT_JUMP && !self.VJ_IsBeingControlled then
    self:PlaySoundSystem("Speech",self.SoundTbl_Jump)
end
 if newAct == ACT_LAND then
    self:SetNavType(NAV_GROUND)
end
    return self.BaseClass.OnChangeActivity(self,newAct)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
    self.ZPS_NextBerserkT = CurTime() + math.Rand(10,20)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply,controlEnt)
 ply:ChatPrint("ATTACK2: Prop Attack (While holding ATTACK2, press ATTACK1)")
 ply:ChatPrint("RELOAD: Break Door (If valid)")
 ply:ChatPrint("JUMP: Jump")
 ply:ChatPrint("DUCK: Crouch")
 ply:ChatPrint("SPRINT: Berserk (Cooldown is 10-15 seconds)")

 net.Start("VJ_ZPS_Zombie_HUD")
 net.WriteBool(false)
 net.WriteEntity(self)
 net.Send(ply)

 function self.VJ_TheControllerEntity:OnStopControlling()
    net.Start("VJ_ZPS_Zombie_HUD")
    net.WriteBool(true)
    net.WriteEntity(self)
    net.Send(ply)
end
    if self:GetClass() == "npc_vj_zps_zinf_ply" then
    if IsValid(ply) then
        self.ZombieCont = ply
        self:SetName(self.ZombieCont:GetName().. " (Zombie)")
        ply:SetHealth(ply:GetMaxHealth())
    end
end
    function controlEnt:OnThink()
        self.VJCE_NPC:SetArrivalSpeed(9999)
        self.VJC_NPC_CanTurn = self.VJC_Camera_Mode == 2
        self.VJC_BullseyeTracking = self.VJCE_NPC:IsMoving() or self.VJC_Camera_Mode == 2
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
    if !self.ZPS_Crouching then
    if (act == ACT_WALK or act == ACT_RUN) && self:GetClass() == "npc_vj_zps_zcarrier" then
        return ACT_RUN
    elseif (act == ACT_WALK or act == ACT_RUN) && self:GetClass() != "npc_vj_zps_zcarrier" then
        return ACT_WALK
    end
end
    if self.ZPS_Crouching then
    if act == ACT_IDLE then
        return ACT_IDLE_STEALTH
    elseif act == ACT_WALK or act == ACT_RUN then
        return ACT_WALK_STEALTH
    end
end
 if act == ACT_IDLE && !self:OnGround() && !self:IsMoving() then
    return ACT_GLIDE
end
    return self.BaseClass.TranslateActivity(self,act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
    if GetConVar("VJ_ZPS_Jump"):GetInt() == 1 then
    if self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP) && self:GetNavType() != NAV_JUMP then
    if self:OnGround() && CurTime() > self.ZPS_NextJumpT then
    local maxDist = 220
    local maxDepth = 20
    local targetPos = self:GetPos() +Vector(math.Rand(-maxDist,maxDist),math.Rand(-maxDist,maxDist),maxDepth)
        self:Jump(targetPos)
        /*if self.VJ_TheController:KeyDown(IN_FORWARD) then self:SetVelocity(self:GetUp()*200 + self:GetForward()*350)
        elseif self.VJ_TheController:KeyDown(IN_BACK) then self:SetVelocity(self:GetUp()*200 + self:GetForward()*-350)
        elseif self.VJ_TheController:KeyDown(IN_MOVELEFT) then self:SetVelocity(self:GetUp()*200 + self:GetRight()*-350)
        elseif self.VJ_TheController:KeyDown(IN_MOVERIGHT) then self:SetVelocity(self:GetUp()*200 + self:GetRight()*350) end*/
        self:PlaySoundSystem("Speech",self.SoundTbl_Jump)
        self.ZPS_NextJumpT = CurTime() + 0.8
        end
    end
end
    local controller = self.VJ_TheController
    local curAct = self:GetSequenceActivity(self:GetIdealSequence())
    if GetConVar("VJ_ZPS_Jump"):GetInt() == 1 && GetConVar("ai_disabled"):GetInt() == 0 then
    if IsValid(self:GetEnemy()) && !self.ZPS_Crouching && !self.IsGuard && curAct != ACT_OPEN_DOOR && !IsValid(self.ZPS_DoorToBreak) then
    if math.random(1,100) <= 3 && self.EnemyData.DistanceNearest < 150 && !IsValid(controller) && self:Visible(self:GetEnemy()) then
        self:AvoidThreat()
        end
    end
end
    if GetConVar("VJ_ZPS_BreakDoors"):GetInt() == 0 or self.Dead then self.ZPS_DoorToBreak = NULL return end
    if !IsValid(self.ZPS_DoorToBreak) && !self.ZPS_AttackingDoor then
    if ((!self.VJ_IsBeingControlled) or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_RELOAD))) then
    for _,v in pairs(ents.FindInSphere(self:GetPos(),30)) do
    if GetConVar("VJ_ZPS_BreakDoors_Func"):GetInt() == 1 && v:GetClass() == "func_door_rotating" && v:Visible(self) then self.ZPS_DoorToBreak = v end
    if v:GetClass() == "prop_door_rotating" && v:Visible(self) then
    local anim = string.lower(v:GetSequenceName(v:GetSequence()))
    if string.find(anim,"idle") or string.find(anim,"open") /*or string.find(anim,"locked")*/ then
        self.ZPS_AttackingDoor = true
        self.ZPS_DoorToBreak = v break end
        end
    end
end
    else
    if IsValid(self.ZPS_DoorToBreak) then
    local dist = VJ.GetNearestDistance(self,self.ZPS_DoorToBreak)
    if IsValid(self.ZPS_DoorToBreak) && self.ZPS_AttackingDoor && (self.AttackAnimTime > CurTime() or !self.ZPS_DoorToBreak:Visible(self)) or dist > 40 then self.ZPS_AttackingDoor = false self.ZPS_DoorToBreak = NULL return end
    if curAct != ACT_OPEN_DOOR && IsValid(self.ZPS_DoorToBreak) && self.ZPS_NextMeleeAnimT < CurTime() then
        self:SetTurnTarget(self.ZPS_DoorToBreak)
        self:PlayAnim(ACT_OPEN_DOOR,false,false,false,0,{AlwaysUseGesture=true})
        self.ZPS_NextMeleeAnimT = CurTime() + VJ.AnimDuration(self,ACT_OPEN_DOOR)
        end
    end
end
    if !IsValid(self.ZPS_DoorToBreak) && self.ZPS_AttackingDoor then
        self.ZPS_AttackingDoor = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.JumpHeight = 200
function ENT:AvoidThreat()
    local maxDist = 220
    local maxDepth = 20
    local targetPos = self:GetPos() +Vector(math.Rand(-maxDist,maxDist),math.Rand(-maxDist,maxDist),maxDepth)

    if self:GetNavType() != NAV_JUMP then
        self:Jump(targetPos)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Jump(pos)
 self:StopMoving()
 self:ResetMoveCalc()
 self:SetNavType(NAV_GROUND)
 self:SetMoveType(MOVETYPE_STEP)
 if self.CurrentSchedule then
    self.CurrentSchedule = nil
    self.CurrentScheduleName = nil
    self.CurrentTask = nil
    self.CurrentTaskID = nil
end
    //self.NextIdleStandTime = CurTime()
    self.NextIdleTime = CurTime()
    self.NextChaseTime = CurTime()
    self:ForceMoveJump(VJ.CalculateTrajectory(self, NULL, "CurveOld", self:GetPos(), self:GetPos() +((((pos or self:GetPos() +self:GetUp() *100) -self:GetPos()):GetNormalized() *50) +(self:GetUp() *25)), 250))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Crouch(bCrouch)
    if bCrouch then
        self:SetHullType(HULL_TINY)
        self:SetCollisionBounds(Vector(13,13,35),Vector(-13,-13,0))
    else
        self:SetHullType(HULL_HUMAN)
        self:SetCollisionBounds(Vector(13,13,72),Vector(-13,-13,0))
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
    self:Zombie_OnThinkActive()
    if GetConVar("VJ_ZPS_Crouch"):GetInt() == 1 then
    local curAct = self:GetSequenceActivity(self:GetIdealSequence())
    if IsValid(self:GetEnemy()) && self:GetEnemy():IsPlayer() && !self.VJ_IsBeingControlled && curAct != ACT_OPEN_DOOR then
    if IsValid(self:GetBlockingEntity()) || (self:GetEnemy():GetPos():Distance(self:GetPos()) <= 350 && self:GetEnemy():Crouching()) then
        self:Crouch(true)
        self.ZPS_Crouching = true
    else
        self:Crouch(false)
        self.ZPS_Crouching = false
    end
end
    if self.VJ_IsBeingControlled then
    if self.VJ_TheController:KeyDown(IN_DUCK) then
        self:Crouch(true)
        self.ZPS_Crouching = true
    else
        self:Crouch(false)
        self.ZPS_Crouching = false
        end
    end
end
    if self:GetClass() != "npc_vj_zps_zcarrier" && self:IsMoving() && self:OnGround() then
    if self.ZPS_Berserk then
        self:SetPlaybackRate(self.ZPS_BerserkSpeed)
        local berserkSpeed = 0.5
        self:SetVelocity(self:GetMoveVelocity() *berserkSpeed)
    elseif !self.ZPS_Berserk then
        self:SetPlaybackRate(1)
        self:SetVelocity(self:GetMoveVelocity() *0)
    end
end
     if IsValid(self:GetEnemy()) && !self.ZPS_Berserk && !self.ZPS_Crouching && CurTime() > self.ZPS_NextBerserkT && ((!self.VJ_IsBeingControlled) or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_SPEED))) then
        self.ZPS_Berserk = true
        self:PlaySoundSystem("Speech",self.SoundTbl_Berserk)
        timer.Simple(8,function() if IsValid(self) then
        self.ZPS_Berserk = false
        self.ZPS_NextBerserkT = CurTime() + math.Rand(10,20) end
        end)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_OnThinkActive() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttack(status,enemy)
    if status == "Init" then
    if self.MeleeAttack_IsPropAttack or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_ATTACK2)) then
        self.AnimTbl_MeleeAttack =
        "vjseq_vjges_s_push_z"
    else
        self.AnimTbl_MeleeAttack = {
        "vjseq_vjges_s_attack1",
        "vjseq_vjges_s_attack2",
        "vjseq_vjges_s_attack3"
 }
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttackExecute(status,ent,isProp)
 if status == "PreDamage" then
 if self:IsOnFire() then ent:Ignite(4) end
 if ent:IsPlayer() && ent:Health() < self.MeleeAttackDamage + 1 && ent.ZPS_InfectedVictim then
    VJ_ZPS_SetPlayerZombie(ent,self,self)
end
    if math.random(1,GetConVar("VJ_ZPS_InfectionChance"):GetInt()) == 1 && (ent:LookupBone("ValveBiped.Bip01_Pelvis") != nil) && !ent.ZPS_InfectedVictim then
    if (ent:IsPlayer() /*&& ent:Armor() < 25*/ && GetConVar("sbox_godmode"):GetInt() == 0) or ent:IsNPC() or ent:IsNextBot() then
    if ent.ZPS_InfectedVictim then return end
        ent.ZPS_InfectedVictim = true
        if ent.IsZPSSurvivor then ent.ZPS_NextCoughT = CurTime() + math.random(1,30) end
        //if ent:IsPlayer() then ent:PrintMessage(HUD_PRINTTALK, "You've been infected.") end
        VJ_ZPS_InfectionApply(ent,self) end
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo,hitgroup,status)
 -- Unique headshot sounds
 if status == "PostDamage" && hitgroup == HITGROUP_HEAD then
    self:PlaySoundSystem("Impact",{"darkborn/zps/shared/impacts/flesh_impact_headshot-02.wav","darkborn/zps/shared/impacts/flesh_impact_headshot-03.wav"})
end
     if status == "PreDamage" && GetConVar("VJ_ZPS_Hardcore"):GetInt() == 1 /*&& dmginfo:IsBulletDamage()*/ then
        dmginfo:ScaleDamage(0.50)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HandleGibOnDeath(dmginfo,hitgroup)
 if GetConVar("VJ_ZPS_Gib"):GetInt() == 0 then return end
    self.HasDeathSounds = false
    VJ.EmitSound(self,"darkborn/zps/shared/impacts/flesh_bodyexplode1.wav",75,100)
 if self.HasGibOnDeathEffects then
    ParticleEffect("vj_zps_blood_explode_01",self:GetPos(),self:GetAngles())
end
    if IsValid(self.SantaHat) then self:CreateGibEntity("prop_physics","models/darkborn/zps/festive/santahat.mdl",{Pos=self:LocalToWorld(Vector(0,0,-5)),Ang=self:GetAngles()}) end
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_head.mdl",{Pos=self:LocalToWorld(Vector(0,0,68)),Ang=self:GetAngles(),CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_ribs.mdl",{Pos=self:LocalToWorld(Vector(0,0,0)),Ang=self:GetAngles(),CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_pelvis.mdl",{Pos=self:LocalToWorld(Vector(0,0,2)),Ang=self:GetAngles(),CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_leg_l.mdl",{Pos=self:LocalToWorld(Vector(0,6,2)),Ang=self:GetAngles(),CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_leg_r.mdl",{Pos=self:LocalToWorld(Vector(0,-6,2)),Ang=self:GetAngles(),CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_arm_r.mdl",{Pos=self:LocalToWorld(Vector(0,-20,55)),Ang=self:GetAngles(),CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_arm_l.mdl",{Pos=self:LocalToWorld(Vector(0,20,55)),Ang=self:GetAngles(),CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_meatclump01.mdl",{Pos=self:LocalToWorld(Vector(0,0,60)),Ang=self:GetAngles(),CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_meatclump01.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles(),CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_meatclump02.mdl",{Pos=self:LocalToWorld(Vector(0,0,60)),Ang=self:GetAngles(),CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_meatclump02.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles(),CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_meatclump03.mdl",{Pos=self:LocalToWorld(Vector(0,0,60)),Ang=self:GetAngles(),CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_meatclump03.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles(),CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_meatclump_tiny01.mdl",{Pos=self:LocalToWorld(Vector(0,-20,55)),Ang=self:GetAngles(),CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_meatclump_tiny01.mdl",{Pos=self:LocalToWorld(Vector(0,20,55)),Ang=self:GetAngles(),CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_meatclump_tiny02.mdl",{Pos=self:LocalToWorld(Vector(0,-20,55)),Ang=self:GetAngles(),CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_meatclump_tiny02.mdl",{Pos=self:LocalToWorld(Vector(0,20,55)),Ang=self:GetAngles(),CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_meatclump_tiny03.mdl",{Pos=self:LocalToWorld(Vector(0,-20,55)),Ang=self:GetAngles(),CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_meatclump_tiny03.mdl",{Pos=self:LocalToWorld(Vector(0,20,55)),Ang=self:GetAngles(),CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    return true,{AllowCorpse=false,AllowSound=false}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo,hitgroup,corpseEnt)
    if IsValid(self.SantaHat) then
    if hitgroup == HITGROUP_HEAD then
        self:CreateGibEntity("prop_physics","models/darkborn/zps/festive/santahat.mdl",{Pos=self:LocalToWorld(Vector(8,0,-5)),Ang=self:GetAngles(),Vel="UseDamageForce"})
        self.SantaHat:Remove()
    else
        self.SantaHat:SetOwner(corpseEnt)
        self.SantaHat:SetParent(corpseEnt)
    end
end
 if IsValid(self.Bonemerge) then
    corpseEnt:VJ_ZPS_CreateBoneMerge(corpseEnt,self.Bonemerge:GetModel(),self.Bonemerge:GetSkin(),self.Bonemerge:GetColor(),self.Bonemerge:GetMaterial(),self.Bonemerge:GetPlayerColor(),self.Bonemerge)
end
 if GetConVar("VJ_ZPS_HeadGib"):GetInt() == 0 or GetConVar("VJ_ZPS_OldModels"):GetInt() == 1 then return end
 if dmginfo:GetDamageForce():Length() < 800 then return end
 if hitgroup == HITGROUP_HEAD && !IsValid(self.Bonemerge) then
    VJ.EmitSound(corpseEnt,"darkborn/zps/shared/impacts/flesh_impact_headshot-01.wav",75,100)
    corpseEnt:RemoveAllDecals()
    corpseEnt:SetBodygroup(0,math.random(1,3))
    corpseEnt:SetBodygroup(1,math.random(1,3))
    corpseEnt:SetBodygroup(2,math.random(1,3))
    corpseEnt:SetBodygroup(3,math.random(1,3))
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_meatclump02.mdl",{Pos=self:GetAttachment(self:LookupAttachment("forward")).Pos,CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_meatclump02.mdl",{Pos=self:GetAttachment(self:LookupAttachment("forward")).Pos,CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_meatclump02.mdl",{Pos=self:GetAttachment(self:LookupAttachment("forward")).Pos,CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
end
    if hitgroup == HITGROUP_HEAD && !IsValid(self.Bonemerge) && self.HasGibOnDeathEffects && (corpseEnt:GetBodygroup(0) != 0 or corpseEnt:GetBodygroup(1) != 0 or corpseEnt:GetBodygroup(2) != 0 or corpseEnt:GetBodygroup(3) != 0) then
        VJ.EmitSound(corpseEnt,"darkborn/zps/shared/impacts/flesh_bloodspray-0"..math.random(1,3)..".wav",60,100)
    if corpseEnt:GetBodygroup(0) == 1 or corpseEnt:GetBodygroup(1) == 1 or corpseEnt:GetBodygroup(2) == 1 or corpseEnt:GetBodygroup(3) == 1 then
        local bleedOut = ents.Create("info_particle_system")
        bleedOut:SetKeyValue("effect_name","vj_zps_blood_headshot")
        bleedOut:SetPos(corpseEnt:GetAttachment(corpseEnt:LookupAttachment("headshot1")).Pos)
        bleedOut:SetAngles(corpseEnt:GetAttachment(corpseEnt:LookupAttachment("headshot1")).Ang)
        bleedOut:SetParent(corpseEnt)
        bleedOut:Fire("SetParentAttachment","headshot1")
        bleedOut:Spawn()
        bleedOut:Activate()
        bleedOut:Fire("Start","",0)
    elseif corpseEnt:GetBodygroup(0) == 2 or corpseEnt:GetBodygroup(1) == 2 or corpseEnt:GetBodygroup(2) == 2 or corpseEnt:GetBodygroup(3) == 2 then
        bleedOut = ents.Create("info_particle_system")
        bleedOut:SetKeyValue("effect_name","vj_zps_blood_headshot")
        bleedOut:SetPos(corpseEnt:GetAttachment(corpseEnt:LookupAttachment("headshot2")).Pos)
        bleedOut:SetAngles(corpseEnt:GetAttachment(corpseEnt:LookupAttachment("headshot2")).Ang)
        bleedOut:SetParent(corpseEnt)
        bleedOut:Fire("SetParentAttachment","headshot2")
        bleedOut:Spawn()
        bleedOut:Activate()
        bleedOut:Fire("Start","",0)
    elseif corpseEnt:GetBodygroup(0) == 3 or corpseEnt:GetBodygroup(1) == 3 or corpseEnt:GetBodygroup(2) == 3 or corpseEnt:GetBodygroup(3) == 3 then
        bleedOut = ents.Create("info_particle_system")
        bleedOut:SetKeyValue("effect_name","vj_zps_blood_headshot")
        bleedOut:SetPos(corpseEnt:GetAttachment(corpseEnt:LookupAttachment("headshot3")).Pos)
        bleedOut:SetAngles(corpseEnt:GetAttachment(corpseEnt:LookupAttachment("headshot3")).Ang)
        bleedOut:SetParent(corpseEnt)
        bleedOut:Fire("SetParentAttachment","headshot3")
        bleedOut:Spawn()
        bleedOut:Activate()
        bleedOut:Fire("Start","",0)
    end
end
 -- For bonemerged Zombies
 if IsValid(self.Bonemerge) && (string.find(self.Bonemerge:GetModel(),"models/darkborn/zps/survivors/") or string.find(self.Bonemerge:GetModel(),"models/darkborn/zps/survivors/pms/")) then
 if hitgroup == HITGROUP_HEAD then
    VJ.EmitSound(corpseEnt,"darkborn/zps/shared/impacts/flesh_impact_headshot-01.wav",75,100)
    corpseEnt.Bonemerge:RemoveAllDecals()
    corpseEnt.Bonemerge:SetBodygroup(0,math.random(1,3))
    corpseEnt.Bonemerge:SetBodygroup(1,math.random(1,3))
    corpseEnt.Bonemerge:SetBodygroup(2,math.random(1,3))
    corpseEnt.Bonemerge:SetBodygroup(3,math.random(1,3))
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_meatclump02.mdl",{Pos=self:GetAttachment(self:LookupAttachment("forward")).Pos,CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_meatclump02.mdl",{Pos=self:GetAttachment(self:LookupAttachment("forward")).Pos,CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
    self:CreateGibEntity("obj_vj_gib","models/darkborn/zps/gibs/gib_meatclump02.mdl",{Pos=self:GetAttachment(self:LookupAttachment("forward")).Pos,CollideSound={"darkborn/zps/shared/gibs/flesh_impact_bloody-01.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-02.wav","darkborn/zps/shared/gibs/flesh_impact_bloody-03.wav"}},function(gib) ParticleEffectAttach("vj_zps_blood_gib_trail",PATTACH_POINT_FOLLOW,gib,gib:LookupAttachment("origin")) end)
end
    if hitgroup == HITGROUP_HEAD && self.HasGibOnDeathEffects && (corpseEnt.Bonemerge:GetBodygroup(0) != 0 or corpseEnt.Bonemerge:GetBodygroup(1) != 0 or corpseEnt.Bonemerge:GetBodygroup(2) != 0 or corpseEnt.Bonemerge:GetBodygroup(3) != 0) then
        VJ.EmitSound(corpseEnt,"darkborn/zps/shared/impacts/flesh_bloodspray-0"..math.random(1,3)..".wav",60,100)
    if corpseEnt.Bonemerge:GetBodygroup(0) == 1 or corpseEnt.Bonemerge:GetBodygroup(1) == 1 or corpseEnt.Bonemerge:GetBodygroup(2) == 1 or corpseEnt.Bonemerge:GetBodygroup(3) == 1 then
        local bleedOut = ents.Create("info_particle_system")
        bleedOut:SetKeyValue("effect_name","vj_zps_blood_headshot")
        bleedOut:SetPos(corpseEnt.Bonemerge:GetAttachment(corpseEnt.Bonemerge:LookupAttachment("headshot1")).Pos)
        bleedOut:SetAngles(corpseEnt.Bonemerge:GetAttachment(corpseEnt.Bonemerge:LookupAttachment("headshot1")).Ang)
        bleedOut:SetParent(corpseEnt.Bonemerge)
        bleedOut:Fire("SetParentAttachment","headshot1")
        bleedOut:Spawn()
        bleedOut:Activate()
        bleedOut:Fire("Start","",0)
    elseif corpseEnt.Bonemerge:GetBodygroup(0) == 2 or corpseEnt.Bonemerge:GetBodygroup(1) == 2 or corpseEnt.Bonemerge:GetBodygroup(2) == 2 or corpseEnt.Bonemerge:GetBodygroup(3) == 2 then
        bleedOut = ents.Create("info_particle_system")
        bleedOut:SetKeyValue("effect_name","vj_zps_blood_headshot")
        bleedOut:SetPos(corpseEnt.Bonemerge:GetAttachment(corpseEnt.Bonemerge:LookupAttachment("headshot2")).Pos)
        bleedOut:SetAngles(corpseEnt.Bonemerge:GetAttachment(corpseEnt.Bonemerge:LookupAttachment("headshot2")).Ang)
        bleedOut:SetParent(corpseEnt.Bonemerge)
        bleedOut:Fire("SetParentAttachment","headshot2")
        bleedOut:Spawn()
        bleedOut:Activate()
        bleedOut:Fire("Start","",0)
    elseif corpseEnt.Bonemerge:GetBodygroup(0) == 3 or corpseEnt.Bonemerge:GetBodygroup(1) == 3 or corpseEnt.Bonemerge:GetBodygroup(2) == 3 or corpseEnt.Bonemerge:GetBodygroup(3) == 3 then
        bleedOut = ents.Create("info_particle_system")
        bleedOut:SetKeyValue("effect_name","vj_zps_blood_headshot")
        bleedOut:SetPos(corpseEnt.Bonemerge:GetAttachment(corpseEnt.Bonemerge:LookupAttachment("headshot3")).Pos)
        bleedOut:SetAngles(corpseEnt.Bonemerge:GetAttachment(corpseEnt.Bonemerge:LookupAttachment("headshot3")).Ang)
        bleedOut:SetParent(corpseEnt.Bonemerge)
        bleedOut:Fire("SetParentAttachment","headshot3")
        bleedOut:Spawn()
        bleedOut:Activate()
        bleedOut:Fire("Start","",0) end
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
    -- If no corpse spawned, make sure to remove the hat!
    if !IsValid(self.Corpse) && IsValid(self.SantaHat) then
        self.SantaHat:Remove()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoice_Carrier()
    self.SoundTbl_Idle = {
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-01.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-02.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-03.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-04.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-05.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-06.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-07.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-08.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-09.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-10.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-11.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-12.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-13.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-14.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-15.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-16.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-17.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-18.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-19.wav",
    "darkborn/zps/zombies/carrier/noaction/zcarrier_noaction-01.wav",
    "darkborn/zps/zombies/carrier/noaction/zcarrier_noaction-02.wav",
    "darkborn/zps/zombies/carrier/noaction/zcarrier_noaction-03.wav",
    "darkborn/zps/zombies/carrier/noaction/zcarrier_noaction-04.wav",
    "darkborn/zps/zombies/carrier/noaction/zcarrier_noaction-05.wav",
    "darkborn/zps/zombies/carrier/noaction/zcarrier_noaction-06.wav",
    "darkborn/zps/zombies/carrier/noaction/zcarrier_noaction-07.wav",
    "darkborn/zps/zombies/carrier/noaction/zcarrier_noaction-08.wav",
    "darkborn/zps/zombies/carrier/noaction/zcarrier_noaction-09.wav",
    "darkborn/zps/zombies/carrier/noaction/zcarrier_noaction-10.wav",
    "darkborn/zps/zombies/carrier/noaction/zcarrier_noaction-11.wav",
    "darkborn/zps/zombies/carrier/noaction/zcarrier_noaction-12.wav"
}
    self.SoundTbl_Investigate = {
    "darkborn/zps/zombies/carrier/go/carrier_go-01.wav",
    "darkborn/zps/zombies/carrier/go/carrier_go-02.wav",
    "darkborn/zps/zombies/carrier/go/carrier_go-03.wav",
    "darkborn/zps/zombies/carrier/go/carrier_go-04.wav",
    "darkborn/zps/zombies/carrier/go/carrier_go-05.wav",
    "darkborn/zps/zombies/carrier/go/carrier_go-06.wav",
    "darkborn/zps/zombies/carrier/go/carrier_go-07.wav",
    "darkborn/zps/zombies/carrier/go/carrier_go-08.wav",
    "darkborn/zps/zombies/carrier/go/carrier_go-09.wav",
    "darkborn/zps/zombies/carrier/go/carrier_go-10.wav"
}
    self.SoundTbl_Alert = {
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-01.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-02.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-03.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-04.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-05.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-06.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-07.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-08.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-09.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-10.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-11.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-12.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-13.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-14.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-15.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-16.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-17.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-18.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-19.wav"
}
    self.SoundTbl_CallForHelp = {
    "darkborn/zps/zombies/carrier/go/carrier_go-01.wav",
    "darkborn/zps/zombies/carrier/go/carrier_go-02.wav",
    "darkborn/zps/zombies/carrier/go/carrier_go-03.wav",
    "darkborn/zps/zombies/carrier/go/carrier_go-04.wav",
    "darkborn/zps/zombies/carrier/go/carrier_go-05.wav",
    "darkborn/zps/zombies/carrier/go/carrier_go-06.wav",
    "darkborn/zps/zombies/carrier/go/carrier_go-07.wav",
    "darkborn/zps/zombies/carrier/go/carrier_go-08.wav",
    "darkborn/zps/zombies/carrier/go/carrier_go-09.wav",
    "darkborn/zps/zombies/carrier/go/carrier_go-10.wav"
}
    self.SoundTbl_CombatIdle = {
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-01.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-02.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-03.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-04.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-05.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-06.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-07.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-08.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-09.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-10.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-11.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-12.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-13.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-14.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-15.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-16.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-17.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-18.wav",
    "darkborn/zps/zombies/carrier/taunts/zcarrier_taunt-19.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "darkborn/zps/zombies/carrier/attacks/zcarrier_attack-01.wav",
    "darkborn/zps/zombies/carrier/attacks/zcarrier_attack-02.wav",
    "darkborn/zps/zombies/carrier/attacks/zcarrier_attack-03.wav",
    "darkborn/zps/zombies/carrier/attacks/zcarrier_attack-04.wav",
    "darkborn/zps/zombies/carrier/attacks/zcarrier_attack-05.wav",
    "darkborn/zps/zombies/carrier/attacks/zcarrier_attack-06.wav",
    "darkborn/zps/zombies/carrier/attacks/zcarrier_attack-07.wav",
    "darkborn/zps/zombies/carrier/attacks/zcarrier_attack-08.wav",
    "darkborn/zps/zombies/carrier/attacks/zcarrier_attack-09.wav",
    "darkborn/zps/zombies/carrier/attacks/zcarrier_attack-10.wav",
    "darkborn/zps/zombies/carrier/attacks/zcarrier_attack-11.wav"
}
    self.SoundTbl_Pain = {
    "darkborn/zps/zombies/carrier/pain/zcarrier_pain-01.wav",
    "darkborn/zps/zombies/carrier/pain/zcarrier_pain-02.wav",
    "darkborn/zps/zombies/carrier/pain/zcarrier_pain-03.wav",
    "darkborn/zps/zombies/carrier/pain/zcarrier_pain-04.wav",
    "darkborn/zps/zombies/carrier/pain/zcarrier_pain-05.wav",
    "darkborn/zps/zombies/carrier/pain/zcarrier_pain-06.wav",
    "darkborn/zps/zombies/carrier/pain/zcarrier_pain-07.wav",
    "darkborn/zps/zombies/carrier/pain/zcarrier_pain-08.wav",
    "darkborn/zps/zombies/carrier/pain/zcarrier_pain-09.wav",
    "darkborn/zps/zombies/carrier/pain/zcarrier_pain-10.wav",
    "darkborn/zps/zombies/carrier/pain/zcarrier_pain-11.wav",
    "darkborn/zps/zombies/carrier/pain/zcarrier_pain-12.wav",
    "darkborn/zps/zombies/carrier/pain/zcarrier_pain-13.wav"
}
    self.SoundTbl_Death = {
    "darkborn/zps/zombies/carrier/death/zcarrier_death-01.wav",
    "darkborn/zps/zombies/carrier/death/zcarrier_death-02.wav",
    "darkborn/zps/zombies/carrier/death/zcarrier_death-03.wav",
    "darkborn/zps/zombies/carrier/death/zcarrier_death-04.wav",
    "darkborn/zps/zombies/carrier/death/zcarrier_death-05.wav",
    "darkborn/zps/zombies/carrier/death/zcarrier_death-06.wav",
    "darkborn/zps/zombies/carrier/death/zcarrier_death-07.wav",
    "darkborn/zps/zombies/carrier/death/zcarrier_death-08.wav",
    "darkborn/zps/zombies/carrier/death/zcarrier_death-09.wav",
    "darkborn/zps/zombies/carrier/death/zcarrier_death-10.wav",
    "darkborn/zps/zombies/carrier/death/zcarrier_death-11.wav",
    "darkborn/zps/zombies/carrier/death/zcarrier_death-12.wav",
    "darkborn/zps/zombies/carrier/death/zcarrier_death-13.wav",
    "darkborn/zps/zombies/carrier/death/zcarrier_death-14.wav",
    "darkborn/zps/zombies/carrier/death/zcarrier_death-15.wav"
}
    self.SoundTbl_Jump = {
    "darkborn/zps/zombies/carrier/jump/zcarrier_jump-01.wav",
    "darkborn/zps/zombies/carrier/jump/zcarrier_jump-02.wav",
    "darkborn/zps/zombies/carrier/jump/zcarrier_jump-03.wav",
    "darkborn/zps/zombies/carrier/jump/zcarrier_jump-04.wav",
    "darkborn/zps/zombies/carrier/jump/zcarrier_jump-05.wav",
    "darkborn/zps/zombies/carrier/jump/zcarrier_jump-06.wav",
    "darkborn/zps/zombies/carrier/jump/zcarrier_jump-07.wav",
    "darkborn/zps/zombies/carrier/jump/zcarrier_jump-08.wav",
    "darkborn/zps/zombies/carrier/jump/zcarrier_jump-09.wav"
}
    self.SoundTbl_Berserk = {
    "darkborn/zps/zombies/carrier/berserk/carrier_berserk-01.wav",
    "darkborn/zps/zombies/carrier/berserk/carrier_berserk-02.wav",
    "darkborn/zps/zombies/carrier/berserk/carrier_berserk-03.wav",
    "darkborn/zps/zombies/carrier/berserk/carrier_berserk-04.wav",
    "darkborn/zps/zombies/carrier/berserk/carrier_berserk-05.wav",
    "darkborn/zps/zombies/carrier/berserk/carrier_berserk-06.wav",
    "darkborn/zps/zombies/carrier/berserk/carrier_berserk-07.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoice_Eugene()
    self.SoundTbl_Idle = {
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt1.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt2.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt3.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt4.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt5.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt6.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt7.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt8.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt9.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt10.wav",
    "darkborn/zps/zombies/eugene/noaction/zmale1_nouse-01.wav",
    "darkborn/zps/zombies/eugene/noaction/zmale1_nouse-02.wav",
    "darkborn/zps/zombies/eugene/noaction/zmale1_nouse-03.wav",
    "darkborn/zps/zombies/eugene/noaction/zmale1_nouse-04.wav",
    "darkborn/zps/zombies/eugene/noaction/zmale1_nouse-05.wav"
}
    self.SoundTbl_Alert = {
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt1.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt10.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt2.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt3.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt4.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt5.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt6.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt7.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt8.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt9.wav"
}
    self.SoundTbl_CombatIdle = {
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt1.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt10.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt2.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt3.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt4.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt5.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt6.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt7.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt8.wav",
    "darkborn/zps/zombies/eugene/taunts/zmale_taunt9.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "darkborn/zps/zombies/eugene/attacks/zmale_attack1.wav",
    "darkborn/zps/zombies/eugene/attacks/zmale_attack2.wav",
    "darkborn/zps/zombies/eugene/attacks/zmale_attack3.wav",
    "darkborn/zps/zombies/eugene/attacks/zmale_attack4.wav",
    "darkborn/zps/zombies/eugene/attacks/zmale_attack5.wav",
    "darkborn/zps/zombies/eugene/attacks/zmale_attack6.wav",
    "darkborn/zps/zombies/eugene/attacks/zmale_attack7.wav"
}
    self.SoundTbl_Pain = {
    "darkborn/zps/zombies/eugene/pain/zmale_pain1.wav",
    "darkborn/zps/zombies/eugene/pain/zmale_pain2.wav",
    "darkborn/zps/zombies/eugene/pain/zmale_pain3.wav",
    "darkborn/zps/zombies/eugene/pain/zmale_pain4.wav",
    "darkborn/zps/zombies/eugene/pain/zmale_pain5.wav",
    "darkborn/zps/zombies/eugene/pain/zmale_pain6.wav"
}
    self.SoundTbl_Death = {
    "darkborn/zps/zombies/eugene/death/zmale_death1.wav",
    "darkborn/zps/zombies/eugene/death/zmale_death2.wav",
    "darkborn/zps/zombies/eugene/death/zmale_death3.wav",
    "darkborn/zps/zombies/eugene/death/zmale_death4.wav",
    "darkborn/zps/zombies/eugene/death/zmale_death5.wav",
    "darkborn/zps/zombies/eugene/death/zmale_death6.wav"
}
    self.SoundTbl_Jump = {
    "darkborn/zps/zombies/eugene/jump/zmale1_jump-01.wav",
    "darkborn/zps/zombies/eugene/jump/zmale1_jump-02.wav",
    "darkborn/zps/zombies/eugene/jump/zmale1_jump-03.wav",
    "darkborn/zps/zombies/eugene/jump/zmale1_jump-04.wav",
    "darkborn/zps/zombies/eugene/jump/zmale1_jump-05.wav",
    "darkborn/zps/zombies/eugene/jump/zmale1_jump-06.wav"
}
    self.SoundTbl_Berserk = {
    "darkborn/zps/zombies/eugene/berserk/zmale_berserk-01.wav",
    "darkborn/zps/zombies/eugene/berserk/zmale_berserk-02.wav",
    "darkborn/zps/zombies/eugene/berserk/zmale_berserk-03.wav",
    "darkborn/zps/zombies/eugene/berserk/zmale_berserk-04.wav",
    "darkborn/zps/zombies/eugene/berserk/zmale_berserk-05.wav",
    "darkborn/zps/zombies/eugene/berserk/zmale_berserk-06.wav",
    "darkborn/zps/zombies/eugene/berserk/zmale_berserk-07.wav",
    "darkborn/zps/zombies/eugene/berserk/zmale_berserk-08.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoice_Jessica()
    self.SoundTbl_Idle = {
    "darkborn/zps/zombies/jessica/taunts/taunt-01.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-02.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-03.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-04.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-05.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-06.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-07.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-08.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-09.wav",
    "darkborn/zps/zombies/jessica/noaction/noaction-01.wav",
    "darkborn/zps/zombies/jessica/noaction/noaction-02.wav",
    "darkborn/zps/zombies/jessica/noaction/noaction-03.wav",
    "darkborn/zps/zombies/jessica/noaction/noaction-04.wav",
    "darkborn/zps/zombies/jessica/noaction/noaction-05.wav",
    "darkborn/zps/zombies/jessica/noaction/noaction-06.wav"
}
    self.SoundTbl_Alert = {
    "darkborn/zps/zombies/jessica/taunts/taunt-01.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-02.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-03.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-04.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-05.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-06.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-07.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-08.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-09.wav"
}
    self.SoundTbl_CombatIdle = {
    "darkborn/zps/zombies/jessica/taunts/taunt-01.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-02.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-03.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-04.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-05.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-06.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-07.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-08.wav",
    "darkborn/zps/zombies/jessica/taunts/taunt-09.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "darkborn/zps/zombies/jessica/attacks/attack-01.wav",
    "darkborn/zps/zombies/jessica/attacks/attack-02.wav",
    "darkborn/zps/zombies/jessica/attacks/attack-03.wav",
    "darkborn/zps/zombies/jessica/attacks/attack-04.wav",
    "darkborn/zps/zombies/jessica/attacks/attack-05.wav"
}
    self.SoundTbl_Pain = {
    "darkborn/zps/zombies/jessica/pain/pain-01.wav",
    "darkborn/zps/zombies/jessica/pain/pain-02.wav",
    "darkborn/zps/zombies/jessica/pain/pain-03.wav",
    "darkborn/zps/zombies/jessica/pain/pain-04.wav",
    "darkborn/zps/zombies/jessica/pain/pain-05.wav",
    "darkborn/zps/zombies/jessica/pain/pain-06.wav"
}
    self.SoundTbl_Death = {
    "darkborn/zps/zombies/jessica/death/death-01.wav",
    "darkborn/zps/zombies/jessica/death/death-02.wav",
    "darkborn/zps/zombies/jessica/death/death-03.wav",
    "darkborn/zps/zombies/jessica/death/death-04.wav",
    "darkborn/zps/zombies/jessica/death/death-05.wav"
}
    self.SoundTbl_Jump = {
    "darkborn/zps/zombies/jessica/jump/jump-01.wav",
    "darkborn/zps/zombies/jessica/jump/jump-02.wav",
    "darkborn/zps/zombies/jessica/jump/jump-03.wav",
    "darkborn/zps/zombies/jessica/jump/jump-04.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoice_Larry()
    self.SoundTbl_Idle = {
    "darkborn/zps/zombies/larry/taunts/taunt-01.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-02.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-03.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-04.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-05.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-06.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-07.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-08.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-09.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-10.wav",
    "darkborn/zps/zombies/larry/noaction/noaction-01.wav",
    "darkborn/zps/zombies/larry/noaction/noaction-02.wav",
    "darkborn/zps/zombies/larry/noaction/noaction-03.wav",
    "darkborn/zps/zombies/larry/noaction/noaction-04.wav",
    "darkborn/zps/zombies/larry/noaction/noaction-05.wav"
}
    self.SoundTbl_Alert = {
    "darkborn/zps/zombies/larry/taunts/taunt-01.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-02.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-03.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-04.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-05.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-06.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-07.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-08.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-09.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-10.wav"
}
    self.SoundTbl_CombatIdle = {
    "darkborn/zps/zombies/larry/taunts/taunt-01.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-02.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-03.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-04.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-05.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-06.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-07.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-08.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-09.wav",
    "darkborn/zps/zombies/larry/taunts/taunt-10.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "darkborn/zps/zombies/larry/attacks/attack-01.wav",
    "darkborn/zps/zombies/larry/attacks/attack-02.wav",
    "darkborn/zps/zombies/larry/attacks/attack-03.wav",
    "darkborn/zps/zombies/larry/attacks/attack-04.wav",
    "darkborn/zps/zombies/larry/attacks/attack-05.wav",
    "darkborn/zps/zombies/larry/attacks/attack-06.wav",
    "darkborn/zps/zombies/larry/attacks/attack-07.wav",
    "darkborn/zps/zombies/larry/attacks/attack-08.wav",
    "darkborn/zps/zombies/larry/attacks/attack-09.wav"
}
    self.SoundTbl_Pain = {
    "darkborn/zps/zombies/larry/pain/pain-01.wav",
    "darkborn/zps/zombies/larry/pain/pain-02.wav",
    "darkborn/zps/zombies/larry/pain/pain-03.wav",
    "darkborn/zps/zombies/larry/pain/pain-04.wav",
    "darkborn/zps/zombies/larry/pain/pain-05.wav",
    "darkborn/zps/zombies/larry/pain/pain-06.wav",
    "darkborn/zps/zombies/larry/pain/pain-07.wav",
    "darkborn/zps/zombies/larry/pain/pain-08.wav",
    "darkborn/zps/zombies/larry/pain/pain-09.wav"
}
    self.SoundTbl_Death = {
    "darkborn/zps/zombies/larry/death/death-01.wav",
    "darkborn/zps/zombies/larry/death/death-02.wav",
    "darkborn/zps/zombies/larry/death/death-03.wav",
    "darkborn/zps/zombies/larry/death/death-04.wav",
    "darkborn/zps/zombies/larry/death/death-05.wav"
}
    self.SoundTbl_Jump = {
    "darkborn/zps/zombies/larry/jump/jump-01.wav",
    "darkborn/zps/zombies/larry/jump/jump-02.wav",
    "darkborn/zps/zombies/larry/jump/jump-03.wav",
    "darkborn/zps/zombies/larry/jump/jump-04.wav",
    "darkborn/zps/zombies/larry/jump/jump-05.wav",
    "darkborn/zps/zombies/larry/jump/jump-06.wav",
    "darkborn/zps/zombies/larry/jump/jump-07.wav"
}
    self.SoundTbl_Berserk = {
    "darkborn/zps/zombies/larry/berserk/berserk-01.wav",
    "darkborn/zps/zombies/larry/berserk/berserk-02.wav",
    "darkborn/zps/zombies/larry/berserk/berserk-03.wav",
    "darkborn/zps/zombies/larry/berserk/berserk-04.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoice_Lea()
    self.SoundTbl_Idle = {
    "darkborn/zps/zombies/lea/taunts/taunt-01.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-01.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-03.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-04.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-05.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-06.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-07.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-08.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-09.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-10.wav",
    "darkborn/zps/zombies/lea/noaction/noaction-01.wav",
    "darkborn/zps/zombies/lea/noaction/noaction-02.wav",
    "darkborn/zps/zombies/lea/noaction/noaction-03.wav",
    "darkborn/zps/zombies/lea/noaction/noaction-04.wav",
    "darkborn/zps/zombies/lea/noaction/noaction-05.wav",
    "darkborn/zps/zombies/lea/noaction/noaction-06.wav",
    "darkborn/zps/zombies/lea/noaction/noaction-07.wav"
}
    self.SoundTbl_Alert = {
    "darkborn/zps/zombies/lea/taunts/taunt-01.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-01.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-03.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-04.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-05.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-06.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-07.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-08.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-09.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-10.wav"
}
    self.SoundTbl_CombatIdle = {
    "darkborn/zps/zombies/lea/taunts/taunt-01.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-01.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-03.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-04.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-05.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-06.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-07.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-08.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-09.wav",
    "darkborn/zps/zombies/lea/taunts/taunt-10.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "darkborn/zps/zombies/lea/attacks/attack-01.wav",
    "darkborn/zps/zombies/lea/attacks/attack-02.wav",
    "darkborn/zps/zombies/lea/attacks/attack-03.wav",
    "darkborn/zps/zombies/lea/attacks/attack-04.wav",
    "darkborn/zps/zombies/lea/attacks/attack-05.wav",
    "darkborn/zps/zombies/lea/attacks/attack-06.wav"
}
    self.SoundTbl_Pain = {
    "darkborn/zps/zombies/lea/pain/pain-01.wav",
    "darkborn/zps/zombies/lea/pain/pain-02.wav",
    "darkborn/zps/zombies/lea/pain/pain-03.wav",
    "darkborn/zps/zombies/lea/pain/pain-04.wav",
    "darkborn/zps/zombies/lea/pain/pain-05.wav"
}
    self.SoundTbl_Death = {
    "darkborn/zps/zombies/lea/death/death-01.wav",
    "darkborn/zps/zombies/lea/death/death-02.wav",
    "darkborn/zps/zombies/lea/death/death-03.wav",
    "darkborn/zps/zombies/lea/death/death-04.wav",
    "darkborn/zps/zombies/lea/death/death-05.wav",
    "darkborn/zps/zombies/lea/death/death-06.wav",
    "darkborn/zps/zombies/lea/death/death-07.wav"
}
    self.SoundTbl_Jump = {
    "darkborn/zps/zombies/lea/jump/jump-01.wav",
    "darkborn/zps/zombies/lea/jump/jump-02.wav",
    "darkborn/zps/zombies/lea/jump/jump-03.wav",
    "darkborn/zps/zombies/lea/jump/jump-04.wav",
    "darkborn/zps/zombies/lea/jump/jump-05.wav",
    "darkborn/zps/zombies/lea/jump/jump-06.wav",
    "darkborn/zps/zombies/lea/jump/jump-07.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoice_Marcus()
    self.SoundTbl_Idle = {
    "darkborn/zps/zombies/marcus/taunts/taunt-01.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-02.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-03.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-04.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-05.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-06.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-07.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-08.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-09.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-10.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-11.wav",
    "darkborn/zps/zombies/marcus/noaction/noaction-01.wav",
    "darkborn/zps/zombies/marcus/noaction/noaction-02.wav",
    "darkborn/zps/zombies/marcus/noaction/noaction-03.wav",
    "darkborn/zps/zombies/marcus/noaction/noaction-04.wav",
    "darkborn/zps/zombies/marcus/noaction/noaction-05.wav",
    "darkborn/zps/zombies/marcus/noaction/noaction-06.wav"
}
    self.SoundTbl_Alert = {
    "darkborn/zps/zombies/marcus/taunts/taunt-01.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-02.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-03.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-04.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-05.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-06.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-07.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-08.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-09.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-10.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-11.wav"
}
    self.SoundTbl_CombatIdle = {
    "darkborn/zps/zombies/marcus/taunts/taunt-01.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-02.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-03.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-04.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-05.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-06.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-07.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-08.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-09.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-10.wav",
    "darkborn/zps/zombies/marcus/taunts/taunt-11.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "darkborn/zps/zombies/marcus/attacks/attack-01.wav",
    "darkborn/zps/zombies/marcus/attacks/attack-02.wav",
    "darkborn/zps/zombies/marcus/attacks/attack-03.wav",
    "darkborn/zps/zombies/marcus/attacks/attack-04.wav",
    "darkborn/zps/zombies/marcus/attacks/attack-05.wav",
    "darkborn/zps/zombies/marcus/attacks/attack-06.wav"
}
    self.SoundTbl_Pain = {
    "darkborn/zps/zombies/marcus/pain/pain-01.wav",
    "darkborn/zps/zombies/marcus/pain/pain-02.wav",
    "darkborn/zps/zombies/marcus/pain/pain-03.wav",
    "darkborn/zps/zombies/marcus/pain/pain-04.wav",
    "darkborn/zps/zombies/marcus/pain/pain-05.wav",
    "darkborn/zps/zombies/marcus/pain/pain-06.wav"
}
    self.SoundTbl_Death = {
    "darkborn/zps/zombies/marcus/death/death-01.wav",
    "darkborn/zps/zombies/marcus/death/death-02.wav",
    "darkborn/zps/zombies/marcus/death/death-03.wav",
    "darkborn/zps/zombies/marcus/death/death-04.wav",
    "darkborn/zps/zombies/marcus/death/death-05.wav",
    "darkborn/zps/zombies/marcus/death/death-06.wav",
    "darkborn/zps/zombies/marcus/death/death-07.wav"
}
    self.SoundTbl_Jump = {
    "darkborn/zps/zombies/marcus/jump/jump-01.wav",
    "darkborn/zps/zombies/marcus/jump/jump-02.wav",
    "darkborn/zps/zombies/marcus/jump/jump-03.wav",
    "darkborn/zps/zombies/marcus/jump/jump-04.wav",
    "darkborn/zps/zombies/marcus/jump/jump-05.wav",
    "darkborn/zps/zombies/marcus/jump/jump-06.wav",
    "darkborn/zps/zombies/marcus/jump/jump-07.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoice_Paul()
    self.SoundTbl_Idle = {
    "darkborn/zps/zombies/paul/taunts/taunt-01.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-02.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-03.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-04.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-05.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-06.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-07.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-08.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-09.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-10.wav",
    "darkborn/zps/zombies/paul/noaction/noaction-01.wav",
    "darkborn/zps/zombies/paul/noaction/noaction-02.wav",
    "darkborn/zps/zombies/paul/noaction/noaction-03.wav",
    "darkborn/zps/zombies/paul/noaction/noaction-04.wav",
    "darkborn/zps/zombies/paul/noaction/noaction-05.wav",
    "darkborn/zps/zombies/paul/noaction/noaction-06.wav"
}
    self.SoundTbl_Alert = {
    "darkborn/zps/zombies/paul/taunts/taunt-01.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-02.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-03.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-04.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-05.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-06.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-07.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-08.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-09.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-10.wav"
}
    self.SoundTbl_CombatIdle = {
    "darkborn/zps/zombies/paul/taunts/taunt-01.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-02.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-03.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-04.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-05.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-06.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-07.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-08.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-09.wav",
    "darkborn/zps/zombies/paul/taunts/taunt-10.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "darkborn/zps/zombies/paul/attacks/attack-01.wav",
    "darkborn/zps/zombies/paul/attacks/attack-02.wav",
    "darkborn/zps/zombies/paul/attacks/attack-03.wav",
    "darkborn/zps/zombies/paul/attacks/attack-04.wav",
    "darkborn/zps/zombies/paul/attacks/attack-05.wav",
    "darkborn/zps/zombies/paul/attacks/attack-06.wav"
}
    self.SoundTbl_Pain = {
    "darkborn/zps/zombies/paul/pain/pain-01.wav",
    "darkborn/zps/zombies/paul/pain/pain-02.wav",
    "darkborn/zps/zombies/paul/pain/pain-03.wav",
    "darkborn/zps/zombies/paul/pain/pain-04.wav",
    "darkborn/zps/zombies/paul/pain/pain-05.wav"
}
    self.SoundTbl_Death = {
    "darkborn/zps/zombies/paul/death/death-01.wav",
    "darkborn/zps/zombies/paul/death/death-02.wav",
    "darkborn/zps/zombies/paul/death/death-03.wav",
    "darkborn/zps/zombies/paul/death/death-04.wav",
    "darkborn/zps/zombies/paul/death/death-05.wav",
    "darkborn/zps/zombies/paul/death/death-06.wav",
    "darkborn/zps/zombies/paul/death/death-07.wav"
}
    self.SoundTbl_Jump = {
    "darkborn/zps/zombies/paul/jump/jump-01.wav",
    "darkborn/zps/zombies/paul/jump/jump-02.wav",
    "darkborn/zps/zombies/paul/jump/jump-03.wav",
    "darkborn/zps/zombies/paul/jump/jump-04.wav",
    "darkborn/zps/zombies/paul/jump/jump-05.wav",
    "darkborn/zps/zombies/paul/jump/jump-06.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoice_Pedro()
    self.SoundTbl_Idle = {
    "darkborn/zps/zombies/pedro/taunts/taunt-01.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-02.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-03.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-04.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-05.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-06.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-07.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-08.wav",
    "darkborn/zps/zombies/pedro/noaction/noaction-01.wav",
    "darkborn/zps/zombies/pedro/noaction/noaction-02.wav",
    "darkborn/zps/zombies/pedro/noaction/noaction-03.wav",
    "darkborn/zps/zombies/pedro/noaction/noaction-04.wav",
    "darkborn/zps/zombies/pedro/noaction/noaction-05.wav",
    "darkborn/zps/zombies/pedro/noaction/noaction-06.wav"
}
    self.SoundTbl_Alert = {
    "darkborn/zps/zombies/pedro/taunts/taunt-01.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-02.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-03.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-04.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-05.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-06.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-07.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-08.wav"
}
    self.SoundTbl_CombatIdle = {
    "darkborn/zps/zombies/pedro/taunts/taunt-01.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-02.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-03.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-04.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-05.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-06.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-07.wav",
    "darkborn/zps/zombies/pedro/taunts/taunt-08.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "darkborn/zps/zombies/pedro/attacks/attack-01.wav",
    "darkborn/zps/zombies/pedro/attacks/attack-02.wav",
    "darkborn/zps/zombies/pedro/attacks/attack-03.wav",
    "darkborn/zps/zombies/pedro/attacks/attack-04.wav",
    "darkborn/zps/zombies/pedro/attacks/attack-05.wav",
    "darkborn/zps/zombies/pedro/attacks/attack-06.wav"
}
    self.SoundTbl_Pain = {
    "darkborn/zps/zombies/pedro/pain/pain-01.wav",
    "darkborn/zps/zombies/pedro/pain/pain-02.wav",
    "darkborn/zps/zombies/pedro/pain/pain-03.wav",
    "darkborn/zps/zombies/pedro/pain/pain-04.wav",
    "darkborn/zps/zombies/pedro/pain/pain-05.wav",
    "darkborn/zps/zombies/pedro/pain/pain-06.wav"
}
    self.SoundTbl_Death = {
    "darkborn/zps/zombies/pedro/death/death-01.wav",
    "darkborn/zps/zombies/pedro/death/death-02.wav",
    "darkborn/zps/zombies/pedro/death/death-03.wav",
    "darkborn/zps/zombies/pedro/death/death-04.wav",
    "darkborn/zps/zombies/pedro/death/death-05.wav",
    "darkborn/zps/zombies/pedro/death/death-06.wav"
}
    self.SoundTbl_Jump = {
    "darkborn/zps/zombies/pedro/jump/jump-01.wav",
    "darkborn/zps/zombies/pedro/jump/jump-02.wav",
    "darkborn/zps/zombies/pedro/jump/jump-03.wav",
    "darkborn/zps/zombies/pedro/jump/jump-04.wav",
    "darkborn/zps/zombies/pedro/jump/jump-05.wav",
    "darkborn/zps/zombies/pedro/jump/jump-06.wav",
    "darkborn/zps/zombies/pedro/jump/jump-07.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:ZombieVoice_Vanessa()
    self.SoundTbl_Idle = {
    "darkborn/zps/zombies/vanessa/taunts/taunt-01.wav",
    "darkborn/zps/zombies/vanessa/taunts/taunt-02.wav",
    "darkborn/zps/zombies/vanessa/taunts/taunt-03.wav",
    "darkborn/zps/zombies/vanessa/taunts/taunt-04.wav",
    "darkborn/zps/zombies/vanessa/taunts/taunt-05.wav",
    "darkborn/zps/zombies/vanessa/taunts/taunt-06.wav",
    "darkborn/zps/zombies/vanessa/noaction/noaction-01.wav",
    "darkborn/zps/zombies/vanessa/noaction/noaction-02.wav",
    "darkborn/zps/zombies/vanessa/noaction/noaction-03.wav",
    "darkborn/zps/zombies/vanessa/noaction/noaction-04.wav",
    "darkborn/zps/zombies/vanessa/noaction/noaction-05.wav"
}
    self.SoundTbl_Alert = {
    "darkborn/zps/zombies/vanessa/taunts/taunt-01.wav",
    "darkborn/zps/zombies/vanessa/taunts/taunt-02.wav",
    "darkborn/zps/zombies/vanessa/taunts/taunt-03.wav",
    "darkborn/zps/zombies/vanessa/taunts/taunt-04.wav",
    "darkborn/zps/zombies/vanessa/taunts/taunt-05.wav",
    "darkborn/zps/zombies/vanessa/taunts/taunt-06.wav"
}
    self.SoundTbl_CombatIdle = {
    "darkborn/zps/zombies/vanessa/taunts/taunt-01.wav",
    "darkborn/zps/zombies/vanessa/taunts/taunt-02.wav",
    "darkborn/zps/zombies/vanessa/taunts/taunt-03.wav",
    "darkborn/zps/zombies/vanessa/taunts/taunt-04.wav",
    "darkborn/zps/zombies/vanessa/taunts/taunt-05.wav",
    "darkborn/zps/zombies/vanessa/taunts/taunt-06.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "darkborn/zps/zombies/vanessa/attacks/attack-01.wav",
    "darkborn/zps/zombies/vanessa/attacks/attack-02.wav",
    "darkborn/zps/zombies/vanessa/attacks/attack-03.wav",
    "darkborn/zps/zombies/vanessa/attacks/attack-04.wav",
    "darkborn/zps/zombies/vanessa/attacks/attack-05.wav",
    "darkborn/zps/zombies/vanessa/attacks/attack-06.wav"
}
    self.SoundTbl_Pain = {
    "darkborn/zps/zombies/vanessa/pain/pain-01.wav",
    "darkborn/zps/zombies/vanessa/pain/pain-02.wav",
    "darkborn/zps/zombies/vanessa/pain/pain-03.wav",
    "darkborn/zps/zombies/vanessa/pain/pain-04.wav",
    "darkborn/zps/zombies/vanessa/pain/pain-05.wav",
    "darkborn/zps/zombies/vanessa/pain/pain-06.wav",
    "darkborn/zps/zombies/vanessa/pain/pain-07.wav",
    "darkborn/zps/zombies/vanessa/pain/pain-08.wav"
}
    self.SoundTbl_Death = {
    "darkborn/zps/zombies/vanessa/death/death-01.wav",
    "darkborn/zps/zombies/vanessa/death/death-02.wav",
    "darkborn/zps/zombies/vanessa/death/death-03.wav",
    "darkborn/zps/zombies/vanessa/death/death-04.wav",
    "darkborn/zps/zombies/vanessa/death/death-05.wav",
    "darkborn/zps/zombies/vanessa/death/death-06.wav"
}
    self.SoundTbl_Jump = {
    "darkborn/zps/zombies/vanessa/jump/jump-01.wav",
    "darkborn/zps/zombies/vanessa/jump/jump-02.wav",
    "darkborn/zps/zombies/vanessa/jump/jump-03.wav",
    "darkborn/zps/zombies/vanessa/jump/jump-04.wav",
    "darkborn/zps/zombies/vanessa/jump/jump-05.wav",
    "darkborn/zps/zombies/vanessa/jump/jump-06.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.Zombie_FootSteps = {
    [MAT_ANTLION] = {
        "physics/flesh/flesh_impact_hard1.wav",
        "physics/flesh/flesh_impact_hard2.wav",
        "physics/flesh/flesh_impact_hard3.wav",
        "physics/flesh/flesh_impact_hard4.wav",
        "physics/flesh/flesh_impact_hard5.wav",
        "physics/flesh/flesh_impact_hard6.wav",
    },
    [MAT_BLOODYFLESH] = {
        "physics/flesh/flesh_impact_hard1.wav",
        "physics/flesh/flesh_impact_hard2.wav",
        "physics/flesh/flesh_impact_hard3.wav",
        "physics/flesh/flesh_impact_hard4.wav",
        "physics/flesh/flesh_impact_hard5.wav",
        "physics/flesh/flesh_impact_hard6.wav",
    },
    [MAT_CONCRETE] = {
        "darkborn/zps/shared/zombie_footsteps/concrete1.wav",
        "darkborn/zps/shared/zombie_footsteps/concrete2.wav",
        "darkborn/zps/shared/zombie_footsteps/concrete3.wav",
        "darkborn/zps/shared/zombie_footsteps/concrete4.wav",
    },
    [MAT_DIRT] = {
        "darkborn/zps/shared/zombie_footsteps/dirt1.wav",
        "darkborn/zps/shared/zombie_footsteps/dirt2.wav",
        "darkborn/zps/shared/zombie_footsteps/dirt3.wav",
        "darkborn/zps/shared/zombie_footsteps/dirt4.wav",
    },
    [MAT_FLESH] = {
        "physics/flesh/flesh_impact_hard1.wav",
        "physics/flesh/flesh_impact_hard2.wav",
        "physics/flesh/flesh_impact_hard3.wav",
        "physics/flesh/flesh_impact_hard4.wav",
        "physics/flesh/flesh_impact_hard5.wav",
        "physics/flesh/flesh_impact_hard6.wav",
    },
    [MAT_GRATE] = {
        "darkborn/zps/shared/footsteps/metalgrate1.wav",
        "darkborn/zps/shared/footsteps/metalgrate2.wav",
        "darkborn/zps/shared/footsteps/metalgrate3.wav",
        "darkborn/zps/shared/footsteps/metalgrate4.wav",
    },
    [MAT_ALIENFLESH] = {
        "physics/flesh/flesh_impact_hard1.wav",
        "physics/flesh/flesh_impact_hard2.wav",
        "physics/flesh/flesh_impact_hard3.wav",
        "physics/flesh/flesh_impact_hard4.wav",
        "physics/flesh/flesh_impact_hard5.wav",
        "physics/flesh/flesh_impact_hard6.wav",
    },
    [74] = { -- Snow
        "darkborn/zps/shared/footsteps/snow1.wav",
        "darkborn/zps/shared/footsteps/snow2.wav",
        "darkborn/zps/shared/footsteps/snow3.wav",
        "darkborn/zps/shared/footsteps/snow4.wav",
    },
    [MAT_COMPUTER] = {
        "physics/plaster/drywall_footstep1.wav",
        "physics/plaster/drywall_footstep2.wav",
        "physics/plaster/drywall_footstep3.wav",
        "physics/plaster/drywall_footstep4.wav",
    },
    [MAT_METAL] = {
        "darkborn/zps/shared/zombie_footsteps/metal1.wav",
        "darkborn/zps/shared/zombie_footsteps/metal2.wav",
        "darkborn/zps/shared/zombie_footsteps/metal3.wav",
        "darkborn/zps/shared/zombie_footsteps/metal4.wav",
    },
    [MAT_SAND] = {
        "darkborn/zps/shared/footsteps/sand1.wav",
        "darkborn/zps/shared/footsteps/sand2.wav",
        "darkborn/zps/shared/footsteps/sand3.wav",
        "darkborn/zps/shared/footsteps/sand4.wav",
    },
    [MAT_FOLIAGE] = {
        "darkborn/zps/shared/footsteps/grass1.wav",
        "darkborn/zps/shared/footsteps/grass2.wav",
        "darkborn/zps/shared/footsteps/grass3.wav",
        "darkborn/zps/shared/footsteps/grass4.wav",
    },
    [MAT_COMPUTER] = {
        "physics/plaster/drywall_footstep1.wav",
        "physics/plaster/drywall_footstep2.wav",
        "physics/plaster/drywall_footstep3.wav",
        "physics/plaster/drywall_footstep4.wav",
    },
    [MAT_SLOSH] = {
        "darkborn/zps/shared/footsteps/slosh1.wav",
        "darkborn/zps/shared/footsteps/slosh2.wav",
        "darkborn/zps/shared/footsteps/slosh3.wav",
        "darkborn/zps/shared/footsteps/slosh4.wav",
    },
    [MAT_TILE] = {
        "darkborn/zps/shared/zombie_footsteps/concrete1.wav",
        "darkborn/zps/shared/zombie_footsteps/concrete2.wav",
        "darkborn/zps/shared/zombie_footsteps/concrete3.wav",
        "darkborn/zps/shared/zombie_footsteps/concrete4.wav",
    },
    [85] = { -- Grass
        "darkborn/zps/shared/footsteps/grass1.wav",
        "darkborn/zps/shared/footsteps/grass2.wav",
        "darkborn/zps/shared/footsteps/grass3.wav",
        "darkborn/zps/shared/footsteps/grass4.wav",
    },
    [MAT_VENT] = {
        "darkborn/zps/shared/zombie_footsteps/duct1.wav",
        "darkborn/zps/shared/zombie_footsteps/duct2.wav",
        "darkborn/zps/shared/zombie_footsteps/duct3.wav",
        "darkborn/zps/shared/zombie_footsteps/duct4.wav",
    },
    [MAT_WOOD] = {
        "darkborn/zps/shared/zombie_footsteps/wood1.wav",
        "darkborn/zps/shared/zombie_footsteps/wood2.wav",
        "darkborn/zps/shared/zombie_footsteps/wood3.wav",
        "darkborn/zps/shared/zombie_footsteps/wood4.wav",
        "darkborn/zps/shared/footsteps/woodpanel1.wav",
        "darkborn/zps/shared/footsteps/woodpanel2.wav",
        "darkborn/zps/shared/footsteps/woodpanel3.wav",
        "darkborn/zps/shared/footsteps/woodpanel4.wav",
    },
    [MAT_GLASS] = {
        "physics/glass/glass_sheet_step1.wav",
        "physics/glass/glass_sheet_step2.wav",
        "physics/glass/glass_sheet_step3.wav",
        "physics/glass/glass_sheet_step4.wav",
    }
}
ENT.Carrier_FootSteps = {
    [MAT_ANTLION] = {
        "physics/flesh/flesh_impact_hard1.wav",
        "physics/flesh/flesh_impact_hard2.wav",
        "physics/flesh/flesh_impact_hard3.wav",
        "physics/flesh/flesh_impact_hard4.wav",
        "physics/flesh/flesh_impact_hard5.wav",
        "physics/flesh/flesh_impact_hard6.wav",
    },
    [MAT_BLOODYFLESH] = {
        "physics/flesh/flesh_impact_hard1.wav",
        "physics/flesh/flesh_impact_hard2.wav",
        "physics/flesh/flesh_impact_hard3.wav",
        "physics/flesh/flesh_impact_hard4.wav",
        "physics/flesh/flesh_impact_hard5.wav",
        "physics/flesh/flesh_impact_hard6.wav",
    },
    [MAT_CONCRETE] = {
        "darkborn/zps/shared/carrier_footsteps/concrete1.wav",
        "darkborn/zps/shared/carrier_footsteps/concrete2.wav",
        "darkborn/zps/shared/carrier_footsteps/concrete3.wav",
        "darkborn/zps/shared/carrier_footsteps/concrete4.wav",
    },
    [MAT_DIRT] = {
        "darkborn/zps/shared/carrier_footsteps/dirt1.wav",
        "darkborn/zps/shared/carrier_footsteps/dirt2.wav",
        "darkborn/zps/shared/carrier_footsteps/dirt3.wav",
        "darkborn/zps/shared/carrier_footsteps/dirt4.wav",
    },
    [MAT_FLESH] = {
        "physics/flesh/flesh_impact_hard1.wav",
        "physics/flesh/flesh_impact_hard2.wav",
        "physics/flesh/flesh_impact_hard3.wav",
        "physics/flesh/flesh_impact_hard4.wav",
        "physics/flesh/flesh_impact_hard5.wav",
        "physics/flesh/flesh_impact_hard6.wav",
    },
    [MAT_GRATE] = {
        "darkborn/zps/shared/carrier_footsteps/metalgrate1.wav",
        "darkborn/zps/shared/carrier_footsteps/metalgrate2.wav",
        "darkborn/zps/shared/carrier_footsteps/metalgrate3.wav",
        "darkborn/zps/shared/carrier_footsteps/metalgrate4.wav",
    },
    [MAT_ALIENFLESH] = {
        "physics/flesh/flesh_impact_hard1.wav",
        "physics/flesh/flesh_impact_hard2.wav",
        "physics/flesh/flesh_impact_hard3.wav",
        "physics/flesh/flesh_impact_hard4.wav",
        "physics/flesh/flesh_impact_hard5.wav",
        "physics/flesh/flesh_impact_hard6.wav",
    },
    [74] = { -- Snow
        "darkborn/zps/shared/carrier_footsteps/snow1.wav",
        "darkborn/zps/shared/carrier_footsteps/snow2.wav",
        "darkborn/zps/shared/carrier_footsteps/snow3.wav",
        "darkborn/zps/shared/carrier_footsteps/snow4.wav",
    },
    [MAT_COMPUTER] = {
        "physics/plaster/drywall_footstep1.wav",
        "physics/plaster/drywall_footstep2.wav",
        "physics/plaster/drywall_footstep3.wav",
        "physics/plaster/drywall_footstep4.wav",
    },
    [MAT_METAL] = {
        "darkborn/zps/shared/carrier_footsteps/metal1.wav",
        "darkborn/zps/shared/carrier_footsteps/metal2.wav",
        "darkborn/zps/shared/carrier_footsteps/metal3.wav",
        "darkborn/zps/shared/carrier_footsteps/metal4.wav",
    },
    [MAT_SAND] = {
        "darkborn/zps/shared/carrier_footsteps/sand1.wav",
        "darkborn/zps/shared/carrier_footsteps/sand2.wav",
        "darkborn/zps/shared/carrier_footsteps/sand3.wav",
        "darkborn/zps/shared/carrier_footsteps/sand4.wav",
    },
    [MAT_FOLIAGE] = {
        "darkborn/zps/shared/carrier_footsteps/grass1.wav",
        "darkborn/zps/shared/carrier_footsteps/grass2.wav",
        "darkborn/zps/shared/carrier_footsteps/grass3.wav",
        "darkborn/zps/shared/carrier_footsteps/grass4.wav",
    },
    [MAT_COMPUTER] = {
        "physics/plaster/drywall_footstep1.wav",
        "physics/plaster/drywall_footstep2.wav",
        "physics/plaster/drywall_footstep3.wav",
        "physics/plaster/drywall_footstep4.wav",
    },
    [MAT_SLOSH] = {
        "darkborn/zps/shared/carrier_footsteps/slosh1.wav",
        "darkborn/zps/shared/carrier_footsteps/slosh2.wav",
        "darkborn/zps/shared/carrier_footsteps/slosh3.wav",
        "darkborn/zps/shared/carrier_footsteps/slosh4.wav",
    },
    [MAT_TILE] = {
        "darkborn/zps/shared/carrier_footsteps/concrete1.wav",
        "darkborn/zps/shared/carrier_footsteps/concrete2.wav",
        "darkborn/zps/shared/carrier_footsteps/concrete3.wav",
        "darkborn/zps/shared/carrier_footsteps/concrete4.wav",
    },
    [85] = { -- Grass
        "darkborn/zps/shared/carrier_footsteps/grass1.wav",
        "darkborn/zps/shared/carrier_footsteps/grass2.wav",
        "darkborn/zps/shared/carrier_footsteps/grass3.wav",
        "darkborn/zps/shared/carrier_footsteps/grass4.wav",
    },
    [MAT_VENT] = {
        "darkborn/zps/shared/carrier_footsteps/duct1.wav",
        "darkborn/zps/shared/carrier_footsteps/duct2.wav",
        "darkborn/zps/shared/carrier_footsteps/duct3.wav",
        "darkborn/zps/shared/carrier_footsteps/duct4.wav",
    },
    [MAT_WOOD] = {
        "darkborn/zps/shared/carrier_footsteps/wood1.wav",
        "darkborn/zps/shared/carrier_footsteps/wood2.wav",
        "darkborn/zps/shared/carrier_footsteps/wood3.wav",
        "darkborn/zps/shared/carrier_footsteps/wood4.wav",
        "darkborn/zps/shared/carrier_footsteps/woodpanel1.wav",
        "darkborn/zps/shared/carrier_footsteps/woodpanel2.wav",
        "darkborn/zps/shared/carrier_footsteps/woodpanel3.wav",
        "darkborn/zps/shared/carrier_footsteps/woodpanel4.wav",
    },
    [MAT_GLASS] = {
        "darkborn/zps/shared/carrier_footsteps/glass1.wav",
        "darkborn/zps/shared/carrier_footsteps/glass2.wav",
        "darkborn/zps/shared/carrier_footsteps/glass3.wav",
        "darkborn/zps/shared/carrier_footsteps/glass4.wav",
    }
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFootstepSound()
 if !self:OnGround() then return end
 local tr = util.TraceLine({
    start = self:GetPos(),
    endpos = self:GetPos() +Vector(0,0,-150),
    filter = {self}
})
 if tr.Hit && self.Zombie_FootSteps[tr.MatType] && self:GetClass() != "npc_vj_zps_zcarrier" then
    VJ.EmitSound(self,VJ.PICK(self.Zombie_FootSteps[tr.MatType]),self.FootstepSoundLevel,self:GetSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
end
 if tr.Hit && self.Carrier_FootSteps[tr.MatType] && self:GetClass() == "npc_vj_zps_zcarrier" then
    VJ.EmitSound(self,VJ.PICK(self.Carrier_FootSteps[tr.MatType]),self.FootstepSoundLevel,self:GetSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
end
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self,"player/footsteps/wade" .. math.random(1,8) .. ".wav",self.FootstepSoundLevel,self:GetSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/