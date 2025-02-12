AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rightypes reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 100
ENT.HealthRegenerationAmount = 1
ENT.HealthRegenerationDelay = VJ.SET(1,1)
ENT.HealthRegenerationResetOnDmg = false
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_PLAYER_ALLY"}
ENT.FriendsWithAllPlayerAllies = true
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_zps_blood_impact_red_01"}
//ENT.BloodDecal = {"VJ_ZPS_Blood_Red"}
ENT.Weapon_WaitOnOcclusionTime = VJ.SET(2,3)
ENT.HasMeleeAttack = false
ENT.MeleeAttackDamage = 25
ENT.AnimTbl_MeleeAttack = "vjseq_vjges_gesture_push"
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 60
ENT.Weapon_FindCoverOnReload = false
//ENT.HasGrenadeAttack = true -- We use a seperate weapon for Grenade attack
ENT.GrenadeAttackEntity = "obj_vj_zps_grenade"
ENT.GrenadeAttackModel = "models/darkborn/zps/weapons/w_grenade_thrown.mdl"
ENT.TimeUntilGrenadeIsReleased = 0.4
ENT.AnimTbl_GrenadeAttack = "vjseq_vjges_gesture_throw_grenade"
ENT.GrenadeAttackAttachment = "anim_attachment_RH"
ENT.AnimTbl_Medic_GiveHealth = "vjges_gesture_inoculator_inject"
ENT.Medic_TimeUntilHeal = 0.7
ENT.Medic_SpawnPropOnHeal = false
ENT.Medic_SpawnPropOnHealModel = "models/darkborn/zps/weapons/w_inoculator.mdl"
ENT.Medic_SpawnPropOnHealAttachment = "anim_attachment_RH"
ENT.AnimTbl_CallForHelp = {"vjges_g_barricade","vjges_gesture_interaction_use_empty"}
ENT.AnimTbl_CallForBackUpOnDamage = "vjges_gesture_interaction_grab_empty"
ENT.HasExtraMeleeAttackSounds = true
ENT.HideOnUnknownDamage = false
ENT.OnKilledEnemy_OnlyLast = false
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
    -- ====== Controller Data ====== --
ENT.ControllerParameters = {
    CameraMode = 2, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
    ThirdP_Offset = Vector(40, 25, -50), -- The offset for the controller when the camera is in third person
    FirstP_Bone = "ValveBiped.Bip01_Head1", -- If left empty, the base will attempt to calculate a position for first person
    FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
-- Custom
ENT.ZPS_Armor = false
ENT.ZPS_ArmorHP = 100
ENT.ZPS_Crouching = false
ENT.ZPS_Panic = false
ENT.ZPS_ImmuneInfection = false
ENT.ZPS_NextMeleeSoundT = 0
ENT.ZPS_NextWepSwitchT = 0
ENT.ZPS_NextJumpT = 0
ENT.ZPS_NextPanicT = 0
ENT.ZPS_NextSelfHealT = 0
ENT.ZPS_NextCoughT = 0
ENT.IsZPSSurvivor = true
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep = {
"common/null.wav"
}
ENT.SoundTbl_MeleeAttack = {
"common/null.wav"
}
ENT.SoundTbl_MeleeAttackExtra = {
"darkborn/zps/weapons/melee/push/push_hit-01.wav",
"darkborn/zps/weapons/melee/push/push_hit-02.wav",
"darkborn/zps/weapons/melee/push/push_hit-03.wav",
"darkborn/zps/weapons/melee/push/push_hit-04.wav"
}
ENT.SoundTbl_MedicAfterHeal = {
"darkborn/zps/weapons/health/inoculator/inject.wav"
}
ENT.SoundTbl_Impact = {
"darkborn/zps/shared/impacts/flesh_impact-01.wav",
"darkborn/zps/shared/impacts/flesh_impact-02.wav",
"darkborn/zps/shared/impacts/flesh_impact-03.wav",
"darkborn/zps/shared/impacts/flesh_impact-04.wav"
}
ENT.WeaponsList = {
    ["Close"] = {
        "weapon_vj_zps_rem870",
        "weapon_vj_zps_shorty",
        "weapon_vj_zps_winchester",
        "weapon_vj_zps_ied"
    },
    ["Normal"] = {
        "weapon_vj_zps_glock17",
        "weapon_vj_zps_glock18c",
        "weapon_vj_zps_usp",
        "weapon_vj_zps_revolver",
        "weapon_vj_zps_mp5",
        "weapon_vj_zps_ak47",
        "weapon_vj_zps_m4",
        "weapon_vj_zps_grenade",
        "weapon_vj_zps_snowball",
        "weapon_vj_zps_tennisball"
    },
}
ENT.WeaponsList_Cont = {
    ["ContWeapons"] = {
        "weapon_vj_zps_glock17",
        "weapon_vj_zps_glock18c",
        "weapon_vj_zps_usp",
        "weapon_vj_zps_revolver",
        "weapon_vj_zps_mp5",
        "weapon_vj_zps_ak47",
        "weapon_vj_zps_m4",
        "weapon_vj_zps_rem870",
        "weapon_vj_zps_shorty",
        "weapon_vj_zps_winchester",
        "weapon_vj_zps_grenade",
        "weapon_vj_zps_ied",
        "weapon_vj_zps_snowball",
        "weapon_vj_zps_tennisball"
    },
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "melee" or (key == "melee_weapon" && IsValid(self:GetActiveWeapon()) && self:GetActiveWeapon().IsMeleeWeapon) then
        self:ExecuteMeleeAttack()
    /*elseif key == "grenade_attack" then
        timer.Adjust("attack_grenade_start"..self:EntIndex(), 0)*/
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    self:Survivor_PreInit()
    if math.random(1,2) == 1 then
        self.WeaponInventory_MeleeList = VJ.PICK({VJ_ZPS_MELEEWEAPONS})
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Survivor_PreInit() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
 self:SurvivorVoices()
 //self:CapabilitiesRemove(CAP_ANIMATEDFACE)
 self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
 self.ZPS_NextWepSwitchT = CurTime() + math.Rand(2,4)
 self.ZPS_NextSelfHealT = CurTime() + math.Rand(10,20)
 if math.random(1,5) == 1 then self.IsMedic = true end
 if math.random(1,5) == 1 then self.ZPS_Armor = true end
 if !self.DisableWeapons then
 if !self.WeaponInventory_MeleeList then
    self:Give(VJ.PICK(VJ_ZPS_MELEEWEAPONS))
 else
    self:Give(VJ.PICK(VJ_ZPS_WEAPONS))
    end
end
 if GetConVar("VJ_ZPS_Melee"):GetInt() == 1 then
    self.HasMeleeAttack = true
end
 if GetConVar("VJ_ZPS_ReloadCover"):GetInt() == 1 then
    self.Weapon_FindCoverOnReload = true
end
 if GetConVar("VJ_ZPS_WeaponSwitch"):GetInt() == 0 or !self.WeaponInventory_MeleeList then return end
    for _,category in pairs(self.WeaponsList) do
        for _,wep in pairs(category) do
            self:Give(wep)
    end
end
     local wepList = math.random(1,2)
     if wepList == 1 then
        self:DoChangeWeapon(VJ.PICK(self.WeaponsList["Normal"]),true)
     elseif wepList == 2 then
        self:DoChangeWeapon(VJ.PICK(self.WeaponsList["Close"]),true)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SurvivorVoices()
 local cType = self:GetClass()
 if cType == "npc_vj_zps_eugene" then
        self:SurvivorVoice_Eugene()
 elseif cType == "npc_vj_zps_jessica" then
        self:SurvivorVoice_Jessica()
 elseif cType == "npc_vj_zps_larry" then
        self:SurvivorVoice_Larry()
 elseif cType == "npc_vj_zps_lea" then
        self:SurvivorVoice_Lea()
 elseif cType == "npc_vj_zps_marcus" then
        self:SurvivorVoice_Marcus()
 elseif cType == "npc_vj_zps_paul" then
        self:SurvivorVoice_Paul()
 elseif cType == "npc_vj_zps_pedro" then
        self:SurvivorVoice_Pedro()
 elseif cType == "npc_vj_zps_vanessa" then
        self:SurvivorVoice_Vanessa()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SurvivorVoice_Eugene()
    self.SoundTbl_Idle = {
    "darkborn/zps/survivors/eugene/camping/hm_camp-01.wav",
    "darkborn/zps/survivors/eugene/camping/hm_camp-02.wav",
    "darkborn/zps/survivors/eugene/camping/hm_camp-03.wav",
    "darkborn/zps/survivors/eugene/camping/hm_camp-04.wav",
    "darkborn/zps/survivors/eugene/camping/hm_camp-05.wav",
    "darkborn/zps/survivors/eugene/camping/hm_camp-06.wav",
    "darkborn/zps/survivors/eugene/go/go-01.wav",
    "darkborn/zps/survivors/eugene/go/go-02.wav",
    "darkborn/zps/survivors/eugene/go/go-03.wav",
    "darkborn/zps/survivors/eugene/go/go-05.wav",
    "darkborn/zps/survivors/eugene/go/go-06.wav",
    "darkborn/zps/survivors/eugene/noaction/no_action-01.wav",
    "darkborn/zps/survivors/eugene/noaction/no_action-02.wav",
    "darkborn/zps/survivors/eugene/noaction/no_action-03.wav",
    "darkborn/zps/survivors/eugene/noaction/no_action-04.wav",
    "darkborn/zps/survivors/eugene/noaction/no_action-05.wav",
    "darkborn/zps/survivors/eugene/noaction/no_action-06.wav"
}
    self.SoundTbl_IdleDialogue = {
    "darkborn/zps/survivors/eugene/commandmenu/needweapon/needweapon-01.wav",
    "darkborn/zps/survivors/eugene/commandmenu/needweapon/needweapon-02.wav",
    "darkborn/zps/survivors/eugene/commandmenu/needweapon/needweapon-03.wav",
    "darkborn/zps/survivors/eugene/commandmenu/needweapon/needweapon-04.wav",
    "darkborn/zps/survivors/eugene/commandmenu/needweapon/needweapon-05.wav",
    "darkborn/zps/survivors/eugene/commandmenu/needweapon/needweapon-06.wav",
    "darkborn/zps/survivors/eugene/commandmenu/needammo/needammo-01.wav",
    "darkborn/zps/survivors/eugene/commandmenu/needammo/needammo-04.wav",
    "darkborn/zps/survivors/eugene/commandmenu/needammo/needammo-05.wav",
    "darkborn/zps/survivors/eugene/commandmenu/needammo/needammo-06.wav",
    "darkborn/zps/survivors/eugene/commandmenu/thanks/thanks-01.wav",
    "darkborn/zps/survivors/eugene/commandmenu/thanks/thanks-02.wav",
    "darkborn/zps/survivors/eugene/commandmenu/thanks/thanks-03.wav",
    "darkborn/zps/survivors/eugene/commandmenu/thanks/thanks-04.wav",
    "darkborn/zps/survivors/eugene/commandmenu/thanks/thanks-05.wav",
    "darkborn/zps/survivors/eugene/commandmenu/thanks/thanks-06.wav",
    "darkborn/zps/survivors/eugene/commandmenu/hold/hold-01.wav",
    "darkborn/zps/survivors/eugene/commandmenu/hold/hold-02.wav",
    "darkborn/zps/survivors/eugene/commandmenu/hold/hold-03.wav",
    "darkborn/zps/survivors/eugene/commandmenu/hold/hold-04.wav",
    "darkborn/zps/survivors/eugene/commandmenu/hold/hold-05.wav",
    "darkborn/zps/survivors/eugene/commandmenu/hold/hold-06.wav",
    "darkborn/zps/survivors/eugene/commandmenu/statusreport/statusreport-01.wav",
    "darkborn/zps/survivors/eugene/commandmenu/statusreport/statusreport-02.wav",
    "darkborn/zps/survivors/eugene/commandmenu/statusreport/statusreport-03.wav",
    "darkborn/zps/survivors/eugene/commandmenu/statusreport/statusreport-04.wav",
    "darkborn/zps/survivors/eugene/commandmenu/statusreport/statusreport-05.wav",
    "darkborn/zps/survivors/eugene/commandmenu/praise/praise-01.wav",
    "darkborn/zps/survivors/eugene/commandmenu/praise/praise-02.wav",
    "darkborn/zps/survivors/eugene/commandmenu/praise/praise-03.wav",
    "darkborn/zps/survivors/eugene/commandmenu/praise/praise-04.wav",
    "darkborn/zps/survivors/eugene/commandmenu/praise/praise-05.wav",
    "darkborn/zps/survivors/eugene/commandmenu/praise/praise-06.wav"
}
    self.SoundTbl_IdleDialogueAnswer = {
    "darkborn/zps/survivors/eugene/commandmenu/positivestatus/postitivestatus-01.wav",
    "darkborn/zps/survivors/eugene/commandmenu/positivestatus/postitivestatus-02.wav",
    "darkborn/zps/survivors/eugene/commandmenu/positivestatus/postitivestatus-03.wav",
    "darkborn/zps/survivors/eugene/commandmenu/positivestatus/postitivestatus-04.wav",
    "darkborn/zps/survivors/eugene/commandmenu/positivestatus/postitivestatus-05.wav",
    "darkborn/zps/survivors/eugene/commandmenu/positivestatus/postitivestatus-06.wav",
    "darkborn/zps/survivors/eugene/commandmenu/positivestatus/postitivestatus-07.wav",
    "darkborn/zps/survivors/eugene/commandmenu/decline/decline-01.wav",
    "darkborn/zps/survivors/eugene/commandmenu/decline/decline-02.wav",
    "darkborn/zps/survivors/eugene/commandmenu/decline/decline-03.wav",
    "darkborn/zps/survivors/eugene/commandmenu/decline/decline-04.wav",
    "darkborn/zps/survivors/eugene/commandmenu/decline/decline-05.wav",
    "darkborn/zps/survivors/eugene/commandmenu/decline/decline-06.wav",
    "darkborn/zps/survivors/eugene/commandmenu/decline/decline-07.wav",
    "darkborn/zps/survivors/eugene/commandmenu/decline/decline-08.wav",
    "darkborn/zps/survivors/eugene/commandmenu/acknowledge/acknowledge-01.wav",
    "darkborn/zps/survivors/eugene/commandmenu/acknowledge/acknowledge-02.wav",
    "darkborn/zps/survivors/eugene/commandmenu/acknowledge/acknowledge-03.wav",
    "darkborn/zps/survivors/eugene/commandmenu/acknowledge/acknowledge-04.wav",
    "darkborn/zps/survivors/eugene/commandmenu/acknowledge/acknowledge-05.wav",
    "darkborn/zps/survivors/eugene/commandmenu/acknowledge/acknowledge-06.wav"
}
    self.SoundTbl_CombatIdle = {
    "darkborn/zps/survivors/eugene/taunts/taunt-01.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-02.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-03.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-04.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-05.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-06.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-07.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-08.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-09.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-10.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-11.wav"
}
    self.SoundTbl_Suppressing = {
    "darkborn/zps/survivors/eugene/commandmenu/fire/fire-01.wav",
    "darkborn/zps/survivors/eugene/commandmenu/fire/fire-02.wav",
    "darkborn/zps/survivors/eugene/commandmenu/fire/fire-03.wav",
    "darkborn/zps/survivors/eugene/commandmenu/fire/fire-04.wav",
    "darkborn/zps/survivors/eugene/commandmenu/fire/fire-05.wav"
}
    self.SoundTbl_Alert = {
    "darkborn/zps/survivors/eugene/taunts/taunt-01.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-02.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-03.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-04.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-05.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-06.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-07.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-08.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-09.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-10.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-11.wav"
}
    self.SoundTbl_CallForHelp = {
    "darkborn/zps/survivors/eugene/panic!/panic-01.wav",
    "darkborn/zps/survivors/eugene/panic!/panic-02.wav",
    "darkborn/zps/survivors/eugene/panic!/panic-03.wav",
    "darkborn/zps/survivors/eugene/panic!/panic-04.wav",
    "darkborn/zps/survivors/eugene/panic!/panic-05.wav",
    "darkborn/zps/survivors/eugene/panic!/panic-06.wav"
}
    self.SoundTbl_OnReceiveOrder = {
    "darkborn/zps/survivors/eugene/keepmoving/keep_moving-01.wav",
    "darkborn/zps/survivors/eugene/keepmoving/keep_moving-02.wav",
    "darkborn/zps/survivors/eugene/keepmoving/keep_moving-03.wav",
    "darkborn/zps/survivors/eugene/keepmoving/keep_moving-04.wav",
    "darkborn/zps/survivors/eugene/keepmoving/keep_moving-05.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "darkborn/zps/survivors/eugene/meleegrunts/melee_grunt-01.wav",
    "darkborn/zps/survivors/eugene/meleegrunts/melee_grunt-02.wav",
    "darkborn/zps/survivors/eugene/meleegrunts/melee_grunt-03.wav",
    "darkborn/zps/survivors/eugene/meleegrunts/melee_grunt-04.wav",
    "darkborn/zps/survivors/eugene/meleegrunts/melee_grunt-05.wav",
    "darkborn/zps/survivors/eugene/meleegrunts/melee_grunt-06.wav"
}
    self.SoundTbl_OnKilledEnemy = {
    "darkborn/zps/survivors/eugene/kill/kill-01.wav",
    "darkborn/zps/survivors/eugene/kill/kill-02.wav",
    "darkborn/zps/survivors/eugene/kill/kill-03.wav",
    "darkborn/zps/survivors/eugene/kill/kill-04.wav",
    "darkborn/zps/survivors/eugene/kill/kill-05.wav",
    "darkborn/zps/survivors/eugene/kill/kill-06.wav",
    "darkborn/zps/survivors/eugene/kill/kill-07.wav",
    "darkborn/zps/survivors/eugene/kill/kill-08.wav",
    "darkborn/zps/survivors/eugene/kill/kill-09.wav",
    "darkborn/zps/survivors/eugene/kill/kill-10.wav"
}
    self.SoundTbl_GrenadeAttack = {
    "darkborn/zps/survivors/eugene/taunts/taunt-01.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-02.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-03.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-04.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-05.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-06.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-07.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-08.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-09.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-10.wav",
    "darkborn/zps/survivors/eugene/taunts/taunt-11.wav"
}
    self.SoundTbl_OnGrenadeSight = {
    "darkborn/zps/survivors/eugene/panic!/panic-01.wav",
    "darkborn/zps/survivors/eugene/panic!/panic-02.wav",
    "darkborn/zps/survivors/eugene/panic!/panic-03.wav",
    "darkborn/zps/survivors/eugene/panic!/panic-04.wav",
    "darkborn/zps/survivors/eugene/panic!/panic-05.wav",
    "darkborn/zps/survivors/eugene/panic!/panic-06.wav",
    "darkborn/zps/survivors/eugene/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/eugene/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/eugene/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/eugene/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/eugene/commandmenu/escape/escape-05.wav"
}
    self.SoundTbl_OnDangerSight = {
    "darkborn/zps/survivors/eugene/panic!/panic-01.wav",
    "darkborn/zps/survivors/eugene/panic!/panic-02.wav",
    "darkborn/zps/survivors/eugene/panic!/panic-03.wav",
    "darkborn/zps/survivors/eugene/panic!/panic-04.wav",
    "darkborn/zps/survivors/eugene/panic!/panic-05.wav",
    "darkborn/zps/survivors/eugene/panic!/panic-06.wav",
    "darkborn/zps/survivors/eugene/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/eugene/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/eugene/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/eugene/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/eugene/commandmenu/escape/escape-05.wav"
}
    self.SoundTbl_WeaponReload = {
    "darkborn/zps/survivors/eugene/commandmenu/needammo/needammo-02.wav",
    "darkborn/zps/survivors/eugene/commandmenu/needammo/needammo-03.wav",
    "darkborn/zps/survivors/eugene/commandmenu/cover/cover-01.wav",
    "darkborn/zps/survivors/eugene/commandmenu/cover/cover-02.wav"
}
    self.SoundTbl_Pain = {
    "darkborn/zps/survivors/eugene/pain/pain-01.wav",
    "darkborn/zps/survivors/eugene/pain/pain-02.wav",
    "darkborn/zps/survivors/eugene/pain/pain-03.wav",
    "darkborn/zps/survivors/eugene/pain/pain-04.wav",
    "darkborn/zps/survivors/eugene/pain/pain-05.wav",
    "darkborn/zps/survivors/eugene/pain/pain-06.wav"
}
    self.SoundTbl_DamageByPlayer = {
    "darkborn/zps/survivors/eugene/commandmenu/anger/anger-01.wav",
    "darkborn/zps/survivors/eugene/commandmenu/anger/anger-02.wav",
    "darkborn/zps/survivors/eugene/commandmenu/anger/anger-03.wav",
    "darkborn/zps/survivors/eugene/commandmenu/anger/anger-04.wav",
    "darkborn/zps/survivors/eugene/commandmenu/anger/anger-05.wav",
    "darkborn/zps/survivors/eugene/commandmenu/anger/anger-06.wav",
    "darkborn/zps/survivors/eugene/commandmenu/anger/anger-07.wav",
    "darkborn/zps/survivors/eugene/commandmenu/anger/anger-08.wav",
    "darkborn/zps/survivors/eugene/commandmenu/anger/anger-09.wav",
    "darkborn/zps/survivors/eugene/commandmenu/anger/anger-10.wav"
}
    self.SoundTbl_AllyDeath = {
    "darkborn/zps/survivors/eugene/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/eugene/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/eugene/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/eugene/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/eugene/commandmenu/escape/escape-05.wav"
}
    self.SoundTbl_Investigate = {
    "darkborn/zps/survivors/eugene/go/go-04.wav"
}
    self.SoundTbl_Death = {
    "darkborn/zps/survivors/eugene/death/death-01.wav",
    "darkborn/zps/survivors/eugene/death/death-02.wav",
    "darkborn/zps/survivors/eugene/death/death-03.wav",
    "darkborn/zps/survivors/eugene/death/death-04.wav",
    "darkborn/zps/survivors/eugene/death/death-05.wav",
    "darkborn/zps/survivors/eugene/death/death-06.wav"
}
    self.SoundTbl_MedicReceiveHeal = {
    "darkborn/zps/survivors/eugene/commandmenu/needhealth/needhealth-01.wav",
    "darkborn/zps/survivors/eugene/commandmenu/needhealth/needhealth-02.wav",
    "darkborn/zps/survivors/eugene/commandmenu/needhealth/needhealth-03.wav",
    "darkborn/zps/survivors/eugene/commandmenu/needhealth/needhealth-04.wav",
    "darkborn/zps/survivors/eugene/commandmenu/needhealth/needhealth-05.wav",
    "darkborn/zps/survivors/eugene/commandmenu/needhealth/needhealth-06.wav"
}
    self.SoundTbl_FollowPlayer = {
    "darkborn/zps/survivors/eugene/commandmenu/cover/cover-03.wav",
    "darkborn/zps/survivors/eugene/commandmenu/cover/cover-04.wav",
    "darkborn/zps/survivors/eugene/commandmenu/cover/cover-05.wav",
    "darkborn/zps/survivors/eugene/commandmenu/cover/cover-06.wav"
}
    self.SoundTbl_Jump = {
    "darkborn/zps/survivors/eugene/jump/jump-01.wav",
    "darkborn/zps/survivors/eugene/jump/jump-02.wav",
    "darkborn/zps/survivors/eugene/jump/jump-03.wav",
    "darkborn/zps/survivors/eugene/jump/jump-04.wav",
    "darkborn/zps/survivors/eugene/jump/jump-05.wav",
    "darkborn/zps/survivors/eugene/jump/jump-06.wav"
}
    self.SoundTbl_Cough = {
    "darkborn/zps/survivors/eugene/cough/coughing01.wav",
    "darkborn/zps/survivors/eugene/cough/coughing02.wav",
    "darkborn/zps/survivors/eugene/cough/coughing03.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SurvivorVoice_Jessica()
    self.SoundTbl_Idle = {
    "darkborn/zps/survivors/jessica/camping/camp-01.wav",
    "darkborn/zps/survivors/jessica/camping/camp-02.wav",
    "darkborn/zps/survivors/jessica/camping/camp-03.wav",
    "darkborn/zps/survivors/jessica/camping/camp-04.wav",
    "darkborn/zps/survivors/jessica/camping/camp-05.wav",
    "darkborn/zps/survivors/jessica/camping/camp-06.wav",
    "darkborn/zps/survivors/jessica/go/go-01.wav",
    "darkborn/zps/survivors/jessica/go/go-02.wav",
    "darkborn/zps/survivors/jessica/go/go-03.wav",
    "darkborn/zps/survivors/jessica/go/go-04.wav",
    "darkborn/zps/survivors/jessica/noaction/noaction-01.wav",
    "darkborn/zps/survivors/jessica/noaction/noaction-02.wav",
    "darkborn/zps/survivors/jessica/noaction/noaction-03.wav",
    "darkborn/zps/survivors/jessica/noaction/noaction-04.wav"
}
    self.SoundTbl_IdleDialogue = {
    "darkborn/zps/survivors/jessica/commandmenu/needweapon/needweapon-01.wav",
    "darkborn/zps/survivors/jessica/commandmenu/needweapon/needweapon-02.wav",
    "darkborn/zps/survivors/jessica/commandmenu/needweapon/needweapon-03.wav",
    "darkborn/zps/survivors/jessica/commandmenu/needweapon/needweapon-04.wav",
    "darkborn/zps/survivors/jessica/commandmenu/needweapon/needweapon-05.wav",
    "darkborn/zps/survivors/jessica/commandmenu/needammo/needammo-01.wav",
    "darkborn/zps/survivors/jessica/commandmenu/needammo/needammo-03.wav",
    "darkborn/zps/survivors/jessica/commandmenu/needammo/needammo-04.wav",
    "darkborn/zps/survivors/jessica/commandmenu/thanks/thanks-01.wav",
    "darkborn/zps/survivors/jessica/commandmenu/thanks/thanks-02.wav",
    "darkborn/zps/survivors/jessica/commandmenu/thanks/thanks-03.wav",
    "darkborn/zps/survivors/jessica/commandmenu/thanks/thanks-04.wav",
    "darkborn/zps/survivors/jessica/commandmenu/thanks/thanks-05.wav",
    "darkborn/zps/survivors/jessica/commandmenu/thanks/thanks-06.wav",
    "darkborn/zps/survivors/jessica/commandmenu/hold/hold-01.wav",
    "darkborn/zps/survivors/jessica/commandmenu/hold/hold-02.wav",
    "darkborn/zps/survivors/jessica/commandmenu/hold/hold-03.wav",
    "darkborn/zps/survivors/jessica/commandmenu/hold/hold-04.wav",
    "darkborn/zps/survivors/jessica/commandmenu/hold/hold-05.wav",
    "darkborn/zps/survivors/jessica/commandmenu/statusreport/statusreport-01.wav",
    "darkborn/zps/survivors/jessica/commandmenu/statusreport/statusreport-02.wav",
    "darkborn/zps/survivors/jessica/commandmenu/statusreport/statusreport-03.wav",
    "darkborn/zps/survivors/jessica/commandmenu/statusreport/statusreport-04.wav",
    "darkborn/zps/survivors/jessica/commandmenu/statusreport/statusreport-05.wav",
    "darkborn/zps/survivors/jessica/commandmenu/praise/praise-01.wav",
    "darkborn/zps/survivors/jessica/commandmenu/praise/praise-02.wav",
    "darkborn/zps/survivors/jessica/commandmenu/praise/praise-03.wav",
    "darkborn/zps/survivors/jessica/commandmenu/praise/praise-04.wav",
    "darkborn/zps/survivors/jessica/commandmenu/praise/praise-05.wav",
    "darkborn/zps/survivors/jessica/commandmenu/praise/praise-06.wav"
}
    self.SoundTbl_IdleDialogueAnswer = {
    "darkborn/zps/survivors/jessica/commandmenu/positivestatus/positivestatus-01.wav",
    "darkborn/zps/survivors/jessica/commandmenu/positivestatus/positivestatus-02.wav",
    "darkborn/zps/survivors/jessica/commandmenu/positivestatus/positivestatus-03.wav",
    "darkborn/zps/survivors/jessica/commandmenu/positivestatus/positivestatus-04.wav",
    "darkborn/zps/survivors/jessica/commandmenu/positivestatus/positivestatus-05.wav",
    "darkborn/zps/survivors/jessica/commandmenu/decline/decline-01.wav",
    "darkborn/zps/survivors/jessica/commandmenu/decline/decline-02.wav",
    "darkborn/zps/survivors/jessica/commandmenu/decline/decline-03.wav",
    "darkborn/zps/survivors/jessica/commandmenu/decline/decline-04.wav",
    "darkborn/zps/survivors/jessica/commandmenu/decline/decline-05.wav",
    "darkborn/zps/survivors/jessica/commandmenu/decline/decline-06.wav",
    "darkborn/zps/survivors/jessica/commandmenu/acknowledge/yes-01.wav",
    "darkborn/zps/survivors/jessica/commandmenu/acknowledge/yes-02.wav",
    "darkborn/zps/survivors/jessica/commandmenu/acknowledge/yes-03.wav",
    "darkborn/zps/survivors/jessica/commandmenu/acknowledge/yes-04.wav",
    "darkborn/zps/survivors/jessica/commandmenu/acknowledge/yes-05.wav"
}
    self.SoundTbl_CombatIdle = {
    "darkborn/zps/survivors/jessica/taunts/taunt-01.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-02.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-03.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-04.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-05.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-06.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-07.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-08.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-09.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-10.wav"
}
    self.SoundTbl_Suppressing = {
    "darkborn/zps/survivors/jessica/commandmenu/fire/fire-01.wav",
    "darkborn/zps/survivors/jessica/commandmenu/fire/fire-02.wav",
    "darkborn/zps/survivors/jessica/commandmenu/fire/fire-03.wav",
    "darkborn/zps/survivors/jessica/commandmenu/fire/fire-04.wav",
    "darkborn/zps/survivors/jessica/commandmenu/fire/fire-05.wav",
    "darkborn/zps/survivors/jessica/commandmenu/fire/fire-06.wav"
}
    self.SoundTbl_Alert = {
    "darkborn/zps/survivors/jessica/taunts/taunt-01.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-02.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-03.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-04.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-05.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-06.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-07.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-08.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-09.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-10.wav"
}
    self.SoundTbl_CallForHelp = {
    "darkborn/zps/survivors/jessica/panic!/panic-01.wav",
    "darkborn/zps/survivors/jessica/panic!/panic-02.wav",
    "darkborn/zps/survivors/jessica/panic!/panic-03.wav",
    "darkborn/zps/survivors/jessica/panic!/panic-04.wav",
    "darkborn/zps/survivors/jessica/panic!/panic-05.wav"
}
    self.SoundTbl_OnReceiveOrder = {
    "darkborn/zps/survivors/jessica/keepmoving/keepmoving-01.wav",
    "darkborn/zps/survivors/jessica/keepmoving/keepmoving-02.wav",
    "darkborn/zps/survivors/jessica/keepmoving/keepmoving-03.wav",
    "darkborn/zps/survivors/jessica/keepmoving/keepmoving-04.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "darkborn/zps/survivors/jessica/meleegrunts/melee-01.wav",
    "darkborn/zps/survivors/jessica/meleegrunts/melee-02.wav",
    "darkborn/zps/survivors/jessica/meleegrunts/melee-03.wav",
    "darkborn/zps/survivors/jessica/meleegrunts/melee-04.wav",
    "darkborn/zps/survivors/jessica/meleegrunts/melee-05.wav"
}
    self.SoundTbl_OnKilledEnemy = {
    "darkborn/zps/survivors/jessica/kill/kill-01.wav",
    "darkborn/zps/survivors/jessica/kill/kill-02.wav",
    "darkborn/zps/survivors/jessica/kill/kill-03.wav",
    "darkborn/zps/survivors/jessica/kill/kill-04.wav",
    "darkborn/zps/survivors/jessica/kill/kill-05.wav",
    "darkborn/zps/survivors/jessica/kill/kill-06.wav",
    "darkborn/zps/survivors/jessica/kill/kill-07.wav"
}
    self.SoundTbl_GrenadeAttack = {
    "darkborn/zps/survivors/jessica/taunts/taunt-01.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-02.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-03.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-04.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-05.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-06.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-07.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-08.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-09.wav",
    "darkborn/zps/survivors/jessica/taunts/taunt-10.wav",
    "darkborn/zps/survivors/jessica/panic!/panic-01.wav",
    "darkborn/zps/survivors/jessica/panic!/panic-02.wav",
    "darkborn/zps/survivors/jessica/panic!/panic-03.wav",
    "darkborn/zps/survivors/jessica/panic!/panic-04.wav",
    "darkborn/zps/survivors/jessica/panic!/panic-05.wav"
}
    self.SoundTbl_OnGrenadeSight = {
    "darkborn/zps/survivors/jessica/panic!/panic-01.wav",
    "darkborn/zps/survivors/jessica/panic!/panic-02.wav",
    "darkborn/zps/survivors/jessica/panic!/panic-03.wav",
    "darkborn/zps/survivors/jessica/panic!/panic-04.wav",
    "darkborn/zps/survivors/jessica/panic!/panic-05.wav",
    "darkborn/zps/survivors/jessica/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/jessica/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/jessica/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/jessica/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/jessica/commandmenu/escape/escape-05.wav"
}
    self.SoundTbl_OnDangerSight = {
    "darkborn/zps/survivors/jessica/panic!/panic-01.wav",
    "darkborn/zps/survivors/jessica/panic!/panic-02.wav",
    "darkborn/zps/survivors/jessica/panic!/panic-03.wav",
    "darkborn/zps/survivors/jessica/panic!/panic-04.wav",
    "darkborn/zps/survivors/jessica/panic!/panic-05.wav",
    "darkborn/zps/survivors/jessica/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/jessica/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/jessica/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/jessica/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/jessica/commandmenu/escape/escape-05.wav"
}
    self.SoundTbl_WeaponReload = {
    "darkborn/zps/survivors/jessica/commandmenu/needammo/needammo-02.wav",
    "darkborn/zps/survivors/jessica/commandmenu/needammo/needammo-05.wav"
}
    self.SoundTbl_Pain = {
    "darkborn/zps/survivors/jessica/pain/pain-01.wav",
    "darkborn/zps/survivors/jessica/pain/pain-02.wav",
    "darkborn/zps/survivors/jessica/pain/pain-03.wav",
    "darkborn/zps/survivors/jessica/pain/pain-04.wav",
    "darkborn/zps/survivors/jessica/pain/pain-05.wav",
    "darkborn/zps/survivors/jessica/pain/pain-06.wav"
}
    self.SoundTbl_DamageByPlayer = {
    "darkborn/zps/survivors/jessica/commandmenu/anger/anger-01.wav",
    "darkborn/zps/survivors/jessica/commandmenu/anger/anger-02.wav",
    "darkborn/zps/survivors/jessica/commandmenu/anger/anger-03.wav",
    "darkborn/zps/survivors/jessica/commandmenu/anger/anger-04.wav",
    "darkborn/zps/survivors/jessica/commandmenu/anger/anger-05.wav",
    "darkborn/zps/survivors/jessica/commandmenu/anger/anger-06.wav",
    "darkborn/zps/survivors/jessica/commandmenu/anger/anger-07.wav",
    "darkborn/zps/survivors/jessica/commandmenu/anger/anger-08.wav"
}
    self.SoundTbl_AllyDeath = {
    "darkborn/zps/survivors/jessica/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/jessica/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/jessica/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/jessica/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/jessica/commandmenu/escape/escape-05.wav"
}
    self.SoundTbl_Death = {
    "darkborn/zps/survivors/jessica/death/death-01.wav",
    "darkborn/zps/survivors/jessica/death/death-02.wav",
    "darkborn/zps/survivors/jessica/death/death-03.wav",
    "darkborn/zps/survivors/jessica/death/death-04.wav",
    "darkborn/zps/survivors/jessica/death/death-05.wav"
}
    self.SoundTbl_MedicReceiveHeal = {
    "darkborn/zps/survivors/jessica/commandmenu/needhealth/needhealth-01.wav",
    "darkborn/zps/survivors/jessica/commandmenu/needhealth/needhealth-02.wav",
    "darkborn/zps/survivors/jessica/commandmenu/needhealth/needhealth-03.wav",
    "darkborn/zps/survivors/jessica/commandmenu/needhealth/needhealth-04.wav",
    "darkborn/zps/survivors/jessica/commandmenu/needhealth/needhealth-05.wav"
}
    self.SoundTbl_FollowPlayer = {
    "darkborn/zps/survivors/jessica/commandmenu/cover/cover-01.wav",
    "darkborn/zps/survivors/jessica/commandmenu/cover/cover-02.wav",
    "darkborn/zps/survivors/jessica/commandmenu/cover/cover-03.wav",
    "darkborn/zps/survivors/jessica/commandmenu/cover/cover-04.wav",
    "darkborn/zps/survivors/jessica/commandmenu/cover/cover-05.wav"
}
    self.SoundTbl_Jump = {
    "darkborn/zps/survivors/jessica/jump/jump-01.wav",
    "darkborn/zps/survivors/jessica/jump/jump-02.wav",
    "darkborn/zps/survivors/jessica/jump/jump-03.wav",
    "darkborn/zps/survivors/jessica/jump/jump-04.wav",
    "darkborn/zps/survivors/jessica/jump/jump-05.wav"
}
    self.SoundTbl_Cough = {
    "darkborn/zps/survivors/jessica/cough/coughing01.wav",
    "darkborn/zps/survivors/jessica/cough/coughing02.wav",
    "darkborn/zps/survivors/jessica/cough/coughing03.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SurvivorVoice_Larry()
    self.SoundTbl_Idle = {
    "darkborn/zps/survivors/larry/camping/camp-01.wav",
    "darkborn/zps/survivors/larry/camping/camp-02.wav",
    "darkborn/zps/survivors/larry/camping/camp-03.wav",
    "darkborn/zps/survivors/larry/camping/camp-04.wav",
    "darkborn/zps/survivors/larry/camping/camp-05.wav",
    "darkborn/zps/survivors/larry/camping/camp-06.wav",
    "darkborn/zps/survivors/larry/camping/camp-07.wav",
    "darkborn/zps/survivors/larry/camping/camp-08.wav",
    "darkborn/zps/survivors/larry/go/go-01.wav",
    "darkborn/zps/survivors/larry/go/go-02.wav",
    "darkborn/zps/survivors/larry/go/go-03.wav",
    "darkborn/zps/survivors/larry/go/go-04.wav",
    "darkborn/zps/survivors/larry/go/go-05.wav",
    "darkborn/zps/survivors/larry/noaction/noaction-01.wav",
    "darkborn/zps/survivors/larry/noaction/noaction-02.wav",
    "darkborn/zps/survivors/larry/noaction/noaction-03.wav",
    "darkborn/zps/survivors/larry/noaction/noaction-04.wav",
    "darkborn/zps/survivors/larry/noaction/noaction-05.wav",
    "darkborn/zps/survivors/larry/noaction/noaction-06.wav"
}
    self.SoundTbl_IdleDialogue = {
    "darkborn/zps/survivors/larry/commandmenu/needweapon/needweapon-01.wav",
    "darkborn/zps/survivors/larry/commandmenu/needweapon/needweapon-02.wav",
    "darkborn/zps/survivors/larry/commandmenu/needweapon/needweapon-03.wav",
    "darkborn/zps/survivors/larry/commandmenu/needweapon/needweapon-04.wav",
    "darkborn/zps/survivors/larry/commandmenu/needweapon/needweapon-05.wav",
    "darkborn/zps/survivors/larry/commandmenu/needweapon/needweapon-06.wav",
    "darkborn/zps/survivors/larry/commandmenu/needweapon/needweapon-07.wav",
    "darkborn/zps/survivors/larry/commandmenu/needweapon/needweapon-08.wav",
    "darkborn/zps/survivors/larry/commandmenu/needweapon/needweapon-09.wav",
    "darkborn/zps/survivors/larry/commandmenu/needweapon/needweapon-10.wav",
    "darkborn/zps/survivors/larry/commandmenu/needweapon/needweapon-11.wav",
    "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-01.wav",
    "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-02.wav",
    "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-03.wav",
    "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-04.wav",
    "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-05.wav",
    "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-06.wav",
    "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-07.wav",
    "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-08.wav",
    "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-09.wav",
    "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-10.wav",
    "darkborn/zps/survivors/larry/commandmenu/thanks/thanks-01.wav",
    "darkborn/zps/survivors/larry/commandmenu/thanks/thanks-02.wav",
    "darkborn/zps/survivors/larry/commandmenu/thanks/thanks-03.wav",
    "darkborn/zps/survivors/larry/commandmenu/thanks/thanks-04.wav",
    "darkborn/zps/survivors/larry/commandmenu/thanks/thanks-05.wav",
    "darkborn/zps/survivors/larry/commandmenu/thanks/thanks-06.wav",
    "darkborn/zps/survivors/larry/commandmenu/thanks/thanks-07.wav",
    "darkborn/zps/survivors/larry/commandmenu/thanks/thanks-08.wav",
    "darkborn/zps/survivors/larry/commandmenu/thanks/thanks-09.wav",
    "darkborn/zps/survivors/larry/commandmenu/hold/hold-01.wav",
    "darkborn/zps/survivors/larry/commandmenu/hold/hold-02.wav",
    "darkborn/zps/survivors/larry/commandmenu/hold/hold-03.wav",
    "darkborn/zps/survivors/larry/commandmenu/hold/hold-04.wav",
    "darkborn/zps/survivors/larry/commandmenu/hold/hold-06.wav",
    "darkborn/zps/survivors/larry/commandmenu/hold/hold-07.wav",
    "darkborn/zps/survivors/larry/commandmenu/hold/hold-08.wav",
    "darkborn/zps/survivors/larry/commandmenu/hold/hold-09.wav",
    "darkborn/zps/survivors/larry/commandmenu/hold/hold-10.wav",
    "darkborn/zps/survivors/larry/commandmenu/hold/hold-11.wav",
    "darkborn/zps/survivors/larry/commandmenu/statusreport/statusreport-01.wav",
    "darkborn/zps/survivors/larry/commandmenu/statusreport/statusreport-02.wav",
    "darkborn/zps/survivors/larry/commandmenu/statusreport/statusreport-03.wav",
    "darkborn/zps/survivors/larry/commandmenu/statusreport/statusreport-04.wav",
    "darkborn/zps/survivors/larry/commandmenu/statusreport/statusreport-05.wav",
    "darkborn/zps/survivors/larry/commandmenu/statusreport/statusreport-06.wav",
    "darkborn/zps/survivors/larry/commandmenu/statusreport/statusreport-07.wav",
    "darkborn/zps/survivors/larry/commandmenu/statusreport/statusreport-08.wav",
    "darkborn/zps/survivors/larry/commandmenu/statusreport/statusreport-09.wav",
    "darkborn/zps/survivors/larry/commandmenu/statusreport/statusreport-10.wav",
    "darkborn/zps/survivors/larry/commandmenu/statusreport/statusreport-11.wav",
    "darkborn/zps/survivors/larry/commandmenu/statusreport/statusreport-12.wav",
    "darkborn/zps/survivors/larry/commandmenu/praise/praise-01.wav",
    "darkborn/zps/survivors/larry/commandmenu/praise/praise-02.wav",
    "darkborn/zps/survivors/larry/commandmenu/praise/praise-03.wav",
    "darkborn/zps/survivors/larry/commandmenu/praise/praise-04.wav",
    "darkborn/zps/survivors/larry/commandmenu/praise/praise-05.wav",
    "darkborn/zps/survivors/larry/commandmenu/praise/praise-06.wav",
    "darkborn/zps/survivors/larry/commandmenu/praise/praise-07.wav",
    "darkborn/zps/survivors/larry/commandmenu/praise/praise-08.wav"
}
    self.SoundTbl_IdleDialogueAnswer = {
    "darkborn/zps/survivors/larry/commandmenu/positivestatus/positivestatus-01.wav",
    "darkborn/zps/survivors/larry/commandmenu/positivestatus/positivestatus-02.wav",
    "darkborn/zps/survivors/larry/commandmenu/positivestatus/positivestatus-03.wav",
    "darkborn/zps/survivors/larry/commandmenu/positivestatus/positivestatus-04.wav",
    "darkborn/zps/survivors/larry/commandmenu/positivestatus/positivestatus-05.wav",
    "darkborn/zps/survivors/larry/commandmenu/positivestatus/positivestatus-06.wav",
    "darkborn/zps/survivors/larry/commandmenu/positivestatus/positivestatus-07.wav",
    "darkborn/zps/survivors/larry/commandmenu/positivestatus/positivestatus-08.wav",
    "darkborn/zps/survivors/larry/commandmenu/positivestatus/positivestatus-09.wav",
    "darkborn/zps/survivors/larry/commandmenu/acknowledge/yes-01.wav",
    "darkborn/zps/survivors/larry/commandmenu/acknowledge/yes-02.wav",
    "darkborn/zps/survivors/larry/commandmenu/acknowledge/yes-03.wav",
    "darkborn/zps/survivors/larry/commandmenu/acknowledge/yes-04.wav",
    "darkborn/zps/survivors/larry/commandmenu/acknowledge/yes-05.wav",
    "darkborn/zps/survivors/larry/commandmenu/acknowledge/yes-06.wav",
    "darkborn/zps/survivors/larry/commandmenu/acknowledge/yes-07.wav",
    "darkborn/zps/survivors/larry/commandmenu/acknowledge/yes-08.wav",
    "darkborn/zps/survivors/larry/commandmenu/acknowledge/yes-09.wav",
    "darkborn/zps/survivors/larry/commandmenu/acknowledge/yes-10.wav",
    "darkborn/zps/survivors/larry/commandmenu/acknowledge/yes-11.wav",
    "darkborn/zps/survivors/larry/commandmenu/decline/decline-01.wav",
    "darkborn/zps/survivors/larry/commandmenu/decline/decline-02.wav",
    "darkborn/zps/survivors/larry/commandmenu/decline/decline-03.wav",
    "darkborn/zps/survivors/larry/commandmenu/decline/decline-04.wav",
    "darkborn/zps/survivors/larry/commandmenu/decline/decline-05.wav",
    "darkborn/zps/survivors/larry/commandmenu/decline/decline-06.wav",
    "darkborn/zps/survivors/larry/commandmenu/decline/decline-07.wav",
    "darkborn/zps/survivors/larry/commandmenu/decline/decline-08.wav",
    "darkborn/zps/survivors/larry/commandmenu/decline/decline-09.wav",
    "darkborn/zps/survivors/larry/commandmenu/decline/decline-10.wav"
}
    self.SoundTbl_CombatIdle = {
    "darkborn/zps/survivors/larry/taunts/taunt-01.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-02.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-03.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-04.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-05.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-06.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-07.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-08.wav"
}
    self.SoundTbl_Suppressing = {
    "darkborn/zps/survivors/larry/commandmenu/fire/fire-01.wav",
    "darkborn/zps/survivors/larry/commandmenu/fire/fire-02.wav",
    "darkborn/zps/survivors/larry/commandmenu/fire/fire-03.wav",
    "darkborn/zps/survivors/larry/commandmenu/fire/fire-04.wav",
    "darkborn/zps/survivors/larry/commandmenu/fire/fire-05.wav",
    "darkborn/zps/survivors/larry/commandmenu/fire/fire-06.wav",
    "darkborn/zps/survivors/larry/commandmenu/fire/fire-07.wav",
    "darkborn/zps/survivors/larry/commandmenu/fire/fire-08.wav"
}
    self.SoundTbl_Alert = {
    "darkborn/zps/survivors/larry/taunts/taunt-01.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-02.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-03.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-04.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-05.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-06.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-07.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-08.wav"
}
    self.SoundTbl_CallForHelp = {
    "darkborn/zps/survivors/larry/panic!/panic-01.wav",
    "darkborn/zps/survivors/larry/panic!/panic-02.wav",
    "darkborn/zps/survivors/larry/panic!/panic-03.wav",
    "darkborn/zps/survivors/larry/panic!/panic-04.wav",
    "darkborn/zps/survivors/larry/panic!/panic-05.wav",
    "darkborn/zps/survivors/larry/panic!/panic-06.wav",
    "darkborn/zps/survivors/larry/panic!/panic-07.wav",
    "darkborn/zps/survivors/larry/panic!/panic-08.wav",
    "darkborn/zps/survivors/larry/panic!/panic-09.wav",
    "darkborn/zps/survivors/larry/panic!/panic-10.wav"
}
    self.SoundTbl_OnReceiveOrder = {
    "darkborn/zps/survivors/larry/keepmoving/keepmoving-01.wav",
    "darkborn/zps/survivors/larry/keepmoving/keepmoving-02.wav",
    "darkborn/zps/survivors/larry/keepmoving/keepmoving-03.wav",
    "darkborn/zps/survivors/larry/keepmoving/keepmoving-04.wav",
    "darkborn/zps/survivors/larry/keepmoving/keepmoving-05.wav",
    "darkborn/zps/survivors/larry/keepmoving/keepmoving-06.wav",
    "darkborn/zps/survivors/larry/keepmoving/keepmoving-07.wav",
    "darkborn/zps/survivors/larry/keepmoving/keepmoving-08.wav",
    "darkborn/zps/survivors/larry/keepmoving/keepmoving-09.wav",
    "darkborn/zps/survivors/larry/keepmoving/keepmoving-10.wav",
    "darkborn/zps/survivors/larry/keepmoving/keepmoving-11.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "darkborn/zps/survivors/larry/meleegrunts/melee-01.wav",
    "darkborn/zps/survivors/larry/meleegrunts/melee-02.wav",
    "darkborn/zps/survivors/larry/meleegrunts/melee-03.wav",
    "darkborn/zps/survivors/larry/meleegrunts/melee-04.wav",
    "darkborn/zps/survivors/larry/meleegrunts/melee-05.wav",
    "darkborn/zps/survivors/larry/meleegrunts/melee-06.wav"
}
    self.SoundTbl_OnKilledEnemy = {
    "darkborn/zps/survivors/larry/kill/kill-01.wav",
    "darkborn/zps/survivors/larry/kill/kill-02.wav",
    "darkborn/zps/survivors/larry/kill/kill-03.wav",
    "darkborn/zps/survivors/larry/kill/kill-04.wav",
    "darkborn/zps/survivors/larry/kill/kill-05.wav",
    "darkborn/zps/survivors/larry/kill/kill-06.wav",
    "darkborn/zps/survivors/larry/kill/kill-07.wav",
    "darkborn/zps/survivors/larry/kill/kill-08.wav",
    "darkborn/zps/survivors/larry/kill/kill-09.wav"
}
    self.SoundTbl_GrenadeAttack = {
    "darkborn/zps/survivors/larry/taunts/taunt-01.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-02.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-03.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-04.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-05.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-06.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-07.wav",
    "darkborn/zps/survivors/larry/taunts/taunt-08.wav"
}
    self.SoundTbl_OnGrenadeSight = {
    "darkborn/zps/survivors/larry/panic!/panic-01.wav",
    "darkborn/zps/survivors/larry/panic!/panic-02.wav",
    "darkborn/zps/survivors/larry/panic!/panic-03.wav",
    "darkborn/zps/survivors/larry/panic!/panic-04.wav",
    "darkborn/zps/survivors/larry/panic!/panic-05.wav",
    "darkborn/zps/survivors/larry/panic!/panic-06.wav",
    "darkborn/zps/survivors/larry/panic!/panic-07.wav",
    "darkborn/zps/survivors/larry/panic!/panic-08.wav",
    "darkborn/zps/survivors/larry/panic!/panic-09.wav",
    "darkborn/zps/survivors/larry/panic!/panic-10.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-05.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-06.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-07.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-08.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-09.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-10.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-11.wav"
}
    self.SoundTbl_OnDangerSight = {
    "darkborn/zps/survivors/larry/panic!/panic-01.wav",
    "darkborn/zps/survivors/larry/panic!/panic-02.wav",
    "darkborn/zps/survivors/larry/panic!/panic-03.wav",
    "darkborn/zps/survivors/larry/panic!/panic-04.wav",
    "darkborn/zps/survivors/larry/panic!/panic-05.wav",
    "darkborn/zps/survivors/larry/panic!/panic-06.wav",
    "darkborn/zps/survivors/larry/panic!/panic-07.wav",
    "darkborn/zps/survivors/larry/panic!/panic-08.wav",
    "darkborn/zps/survivors/larry/panic!/panic-09.wav",
    "darkborn/zps/survivors/larry/panic!/panic-10.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-05.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-06.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-07.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-08.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-09.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-10.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-11.wav"
}
    self.SoundTbl_WeaponReload = {
    "darkborn/zps/survivors/larry/commandmenu/cover/cover-01.wav",
    "darkborn/zps/survivors/larry/commandmenu/cover/cover-02.wav",
    "darkborn/zps/survivors/larry/commandmenu/cover/cover-03.wav",
    "darkborn/zps/survivors/larry/commandmenu/cover/cover-04.wav"
}
    self.SoundTbl_Pain = {
    "darkborn/zps/survivors/larry/pain/pain-01.wav",
    "darkborn/zps/survivors/larry/pain/pain-02.wav",
    "darkborn/zps/survivors/larry/pain/pain-03.wav",
    "darkborn/zps/survivors/larry/pain/pain-04.wav",
    "darkborn/zps/survivors/larry/pain/pain-05.wav",
    "darkborn/zps/survivors/larry/pain/pain-06.wav",
    "darkborn/zps/survivors/larry/pain/pain-07.wav",
    "darkborn/zps/survivors/larry/pain/pain-08.wav",
    "darkborn/zps/survivors/larry/pain/pain-09.wav",
    "darkborn/zps/survivors/larry/pain/pain-10.wav",
    "darkborn/zps/survivors/larry/pain/pain-11.wav"
}
    self.SoundTbl_DamageByPlayer = {
    "darkborn/zps/survivors/larry/commandmenu/anger/anger-01.wav",
    "darkborn/zps/survivors/larry/commandmenu/anger/anger-02.wav",
    "darkborn/zps/survivors/larry/commandmenu/anger/anger-04.wav",
    "darkborn/zps/survivors/larry/commandmenu/anger/anger-05.wav",
    "darkborn/zps/survivors/larry/commandmenu/anger/anger-06.wav",
    "darkborn/zps/survivors/larry/commandmenu/anger/anger-07.wav",
    "darkborn/zps/survivors/larry/commandmenu/anger/anger-08.wav"
}
    self.SoundTbl_AllyDeath = {
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-05.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-06.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-07.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-08.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-09.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-10.wav",
    "darkborn/zps/survivors/larry/commandmenu/escape/escape-11.wav"
}
    self.SoundTbl_Death = {
    "darkborn/zps/survivors/larry/death/death-01.wav",
    "darkborn/zps/survivors/larry/death/death-02.wav",
    "darkborn/zps/survivors/larry/death/death-03.wav",
    "darkborn/zps/survivors/larry/death/death-04.wav",
    "darkborn/zps/survivors/larry/death/death-05.wav"
}
    self.SoundTbl_MedicReceiveHeal = {
    "darkborn/zps/survivors/larry/commandmenu/needhealth/needhealth-01.wav",
    "darkborn/zps/survivors/larry/commandmenu/needhealth/needhealth-02.wav",
    "darkborn/zps/survivors/larry/commandmenu/needhealth/needhealth-03.wav",
    "darkborn/zps/survivors/larry/commandmenu/needhealth/needhealth-04.wav",
    "darkborn/zps/survivors/larry/commandmenu/needhealth/needhealth-05.wav",
    "darkborn/zps/survivors/larry/commandmenu/needhealth/needhealth-06.wav",
    "darkborn/zps/survivors/larry/commandmenu/needhealth/needhealth-07.wav",
    "darkborn/zps/survivors/larry/commandmenu/needhealth/needhealth-08.wav",
    "darkborn/zps/survivors/larry/commandmenu/needhealth/needhealth-09.wav",
    "darkborn/zps/survivors/larry/commandmenu/needhealth/needhealth-10.wav"
}
    self.SoundTbl_FollowPlayer = {
    "darkborn/zps/survivors/larry/commandmenu/cover/cover-05.wav",
    "darkborn/zps/survivors/larry/commandmenu/cover/cover-06.wav",
    "darkborn/zps/survivors/larry/commandmenu/cover/cover-07.wav",
    "darkborn/zps/survivors/larry/commandmenu/cover/cover-08.wav",
    "darkborn/zps/survivors/larry/commandmenu/cover/cover-09.wav",
    "darkborn/zps/survivors/larry/commandmenu/cover/cover-10.wav",
    "darkborn/zps/survivors/larry/commandmenu/cover/cover-11.wav"
}
    self.SoundTbl_Jump = {
    "darkborn/zps/survivors/larry/jump/jump-01.wav",
    "darkborn/zps/survivors/larry/jump/jump-02.wav",
    "darkborn/zps/survivors/larry/jump/jump-03.wav",
    "darkborn/zps/survivors/larry/jump/jump-04.wav",
    "darkborn/zps/survivors/larry/jump/jump-05.wav",
    "darkborn/zps/survivors/larry/jump/jump-06.wav"
}
    self.SoundTbl_Cough = {
    "darkborn/zps/survivors/larry/cough/cough-01.wav",
    "darkborn/zps/survivors/larry/cough/cough-02.wav",
    "darkborn/zps/survivors/larry/cough/cough-03.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SurvivorVoice_Lea()
    self.SoundTbl_Idle = {
    "darkborn/zps/survivors/lea/camping/camp-01.wav",
    "darkborn/zps/survivors/lea/camping/camp-02.wav",
    "darkborn/zps/survivors/lea/camping/camp-03.wav",
    "darkborn/zps/survivors/lea/camping/camp-04.wav",
    "darkborn/zps/survivors/lea/camping/camp-05.wav",
    "darkborn/zps/survivors/lea/camping/camp-06.wav",
    "darkborn/zps/survivors/lea/camping/camp-07.wav",
    "darkborn/zps/survivors/lea/go/go-01.wav",
    "darkborn/zps/survivors/lea/go/go-02.wav",
    "darkborn/zps/survivors/lea/go/go-03.wav",
    "darkborn/zps/survivors/lea/go/go-04.wav",
    "darkborn/zps/survivors/lea/go/go-05.wav",
    "darkborn/zps/survivors/lea/noaction/noaction-01.wav",
    "darkborn/zps/survivors/lea/noaction/noaction-02.wav",
    "darkborn/zps/survivors/lea/noaction/noaction-03.wav",
    "darkborn/zps/survivors/lea/noaction/noaction-04.wav"
}
    self.SoundTbl_IdleDialogue = {
    "darkborn/zps/survivors/lea/commandmenu/needweapon/needweapon-01.wav",
    "darkborn/zps/survivors/lea/commandmenu/needweapon/needweapon-02.wav",
    "darkborn/zps/survivors/lea/commandmenu/needweapon/needweapon-03.wav",
    "darkborn/zps/survivors/lea/commandmenu/needweapon/needweapon-04.wav",
    "darkborn/zps/survivors/lea/commandmenu/needweapon/needweapon-05.wav",
    "darkborn/zps/survivors/lea/commandmenu/needammo/needammo-02.wav",
    "darkborn/zps/survivors/lea/commandmenu/needammo/needammo-04.wav",
    "darkborn/zps/survivors/lea/commandmenu/needammo/needammo-05.wav",
    "darkborn/zps/survivors/lea/commandmenu/thanks/thanks-01.wav",
    "darkborn/zps/survivors/lea/commandmenu/thanks/thanks-02.wav",
    "darkborn/zps/survivors/lea/commandmenu/thanks/thanks-03.wav",
    "darkborn/zps/survivors/lea/commandmenu/thanks/thanks-04.wav",
    "darkborn/zps/survivors/lea/commandmenu/thanks/thanks-05.wav",
    "darkborn/zps/survivors/lea/commandmenu/thanks/thanks-06.wav",
    "darkborn/zps/survivors/lea/commandmenu/hold/hold-01.wav",
    "darkborn/zps/survivors/lea/commandmenu/hold/hold-02.wav",
    "darkborn/zps/survivors/lea/commandmenu/hold/hold-03.wav",
    "darkborn/zps/survivors/lea/commandmenu/hold/hold-04.wav",
    "darkborn/zps/survivors/lea/commandmenu/hold/hold-05.wav",
    "darkborn/zps/survivors/lea/commandmenu/statusreport/statusreport-01.wav",
    "darkborn/zps/survivors/lea/commandmenu/statusreport/statusreport-02.wav",
    "darkborn/zps/survivors/lea/commandmenu/statusreport/statusreport-03.wav",
    "darkborn/zps/survivors/lea/commandmenu/statusreport/statusreport-04.wav",
    "darkborn/zps/survivors/lea/commandmenu/statusreport/statusreport-05.wav",
    "darkborn/zps/survivors/lea/commandmenu/praise/praise-01.wav",
    "darkborn/zps/survivors/lea/commandmenu/praise/praise-02.wav",
    "darkborn/zps/survivors/lea/commandmenu/praise/praise-03.wav",
    "darkborn/zps/survivors/lea/commandmenu/praise/praise-04.wav",
    "darkborn/zps/survivors/lea/commandmenu/praise/praise-05.wav",
    "darkborn/zps/survivors/lea/commandmenu/praise/praise-06.wav"
}
    self.SoundTbl_IdleDialogueAnswer = {
    "darkborn/zps/survivors/lea/commandmenu/positivestatus/positivestatus-01.wav",
    "darkborn/zps/survivors/lea/commandmenu/positivestatus/positivestatus-02.wav",
    "darkborn/zps/survivors/lea/commandmenu/positivestatus/positivestatus-03.wav",
    "darkborn/zps/survivors/lea/commandmenu/positivestatus/positivestatus-04.wav",
    "darkborn/zps/survivors/lea/commandmenu/positivestatus/positivestatus-05.wav",
    "darkborn/zps/survivors/lea/commandmenu/decline/decline-01.wav",
    "darkborn/zps/survivors/lea/commandmenu/decline/decline-02.wav",
    "darkborn/zps/survivors/lea/commandmenu/decline/decline-03.wav",
    "darkborn/zps/survivors/lea/commandmenu/decline/decline-04.wav",
    "darkborn/zps/survivors/lea/commandmenu/decline/decline-05.wav",
    "darkborn/zps/survivors/lea/commandmenu/decline/decline-06.wav",
    "darkborn/zps/survivors/lea/commandmenu/acknowledge/yes-01.wav",
    "darkborn/zps/survivors/lea/commandmenu/acknowledge/yes-02.wav",
    "darkborn/zps/survivors/lea/commandmenu/acknowledge/yes-03.wav",
    "darkborn/zps/survivors/lea/commandmenu/acknowledge/yes-04.wav",
    "darkborn/zps/survivors/lea/commandmenu/acknowledge/yes-05.wav"
}
    self.SoundTbl_CombatIdle = {
    "darkborn/zps/survivors/lea/taunts/taunt-01.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-02.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-03.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-04.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-05.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-06.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-07.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-08.wav"
}
    self.SoundTbl_Suppressing = {
    "darkborn/zps/survivors/lea/commandmenu/fire/fire-01.wav",
    "darkborn/zps/survivors/lea/commandmenu/fire/fire-02.wav",
    "darkborn/zps/survivors/lea/commandmenu/fire/fire-03.wav",
    "darkborn/zps/survivors/lea/commandmenu/fire/fire-04.wav",
    "darkborn/zps/survivors/lea/commandmenu/fire/fire-05.wav",
    "darkborn/zps/survivors/lea/commandmenu/fire/fire-06.wav"
}
    self.SoundTbl_Alert = {
    "darkborn/zps/survivors/lea/taunts/taunt-01.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-02.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-03.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-04.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-05.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-06.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-07.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-08.wav"
}
    self.SoundTbl_CallForHelp = {
    "darkborn/zps/survivors/lea/panic/panic-01.wav",
    "darkborn/zps/survivors/lea/panic/panic-02.wav",
    "darkborn/zps/survivors/lea/panic/panic-03.wav",
    "darkborn/zps/survivors/lea/panic/panic-04.wav",
    "darkborn/zps/survivors/lea/panic/panic-05.wav",
    "darkborn/zps/survivors/lea/panic/panic-06.wav"
}
    self.SoundTbl_OnReceiveOrder = {
    "darkborn/zps/survivors/lea/commandmenu/cover/cover-05.wav",
    "darkborn/zps/survivors/lea/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/lea/commandmenu/escape/escape-03.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "darkborn/zps/survivors/lea/meleegrunts/melee-01.wav",
    "darkborn/zps/survivors/lea/meleegrunts/melee-02.wav",
    "darkborn/zps/survivors/lea/meleegrunts/melee-03.wav",
    "darkborn/zps/survivors/lea/meleegrunts/melee-04.wav",
    "darkborn/zps/survivors/lea/meleegrunts/melee-05.wav"
}
    self.SoundTbl_OnKilledEnemy = {
    "darkborn/zps/survivors/lea/kill/kill-01.wav",
    "darkborn/zps/survivors/lea/kill/kill-02.wav",
    "darkborn/zps/survivors/lea/kill/kill-03.wav",
    "darkborn/zps/survivors/lea/kill/kill-04.wav",
    "darkborn/zps/survivors/lea/kill/kill-05.wav",
    "darkborn/zps/survivors/lea/kill/kill-06.wav",
    "darkborn/zps/survivors/lea/kill/kill-07.wav"
}
    self.SoundTbl_GrenadeAttack = {
    "darkborn/zps/survivors/lea/taunts/taunt-01.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-02.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-03.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-04.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-05.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-06.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-07.wav",
    "darkborn/zps/survivors/lea/taunts/taunt-08.wav"
}
    self.SoundTbl_OnGrenadeSight = {
    "darkborn/zps/survivors/lea/panic/panic-01.wav",
    "darkborn/zps/survivors/lea/panic/panic-02.wav",
    "darkborn/zps/survivors/lea/panic/panic-03.wav",
    "darkborn/zps/survivors/lea/panic/panic-04.wav",
    "darkborn/zps/survivors/lea/panic/panic-05.wav",
    "darkborn/zps/survivors/lea/panic/panic-06.wav",
    "darkborn/zps/survivors/lea/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/lea/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/lea/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/lea/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/lea/commandmenu/escape/escape-05.wav"
}
    self.SoundTbl_OnDangerSight = {
    "darkborn/zps/survivors/lea/panic/panic-01.wav",
    "darkborn/zps/survivors/lea/panic/panic-02.wav",
    "darkborn/zps/survivors/lea/panic/panic-03.wav",
    "darkborn/zps/survivors/lea/panic/panic-04.wav",
    "darkborn/zps/survivors/lea/panic/panic-05.wav",
    "darkborn/zps/survivors/lea/panic/panic-06.wav",
    "darkborn/zps/survivors/lea/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/lea/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/lea/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/lea/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/lea/commandmenu/escape/escape-05.wav",
    "darkborn/zps/survivors/lea/commandmenu/run/run-01.wav"
}
    self.SoundTbl_WeaponReload = {
    "darkborn/zps/survivors/lea/commandmenu/needammo/needammo-01.wav",
    "darkborn/zps/survivors/lea/commandmenu/needammo/needammo-03.wav",
    "darkborn/zps/survivors/lea/commandmenu/cover/cover-01.wav",
    "darkborn/zps/survivors/lea/commandmenu/cover/cover-02.wav",
    "darkborn/zps/survivors/lea/commandmenu/cover/cover-03.wav"
}
    self.SoundTbl_Pain = {
    "darkborn/zps/survivors/lea/pain/pain-01.wav",
    "darkborn/zps/survivors/lea/pain/pain-02.wav",
    "darkborn/zps/survivors/lea/pain/pain-03.wav",
    "darkborn/zps/survivors/lea/pain/pain-04.wav",
    "darkborn/zps/survivors/lea/pain/pain-05.wav",
    "darkborn/zps/survivors/lea/pain/pain-06.wav"
}
    self.SoundTbl_DamageByPlayer = {
    "darkborn/zps/survivors/lea/commandmenu/anger/anger-01.wav",
    "darkborn/zps/survivors/lea/commandmenu/anger/anger-02.wav",
    "darkborn/zps/survivors/lea/commandmenu/anger/anger-03.wav",
    "darkborn/zps/survivors/lea/commandmenu/anger/anger-04.wav",
    "darkborn/zps/survivors/lea/commandmenu/anger/anger-05.wav",
    "darkborn/zps/survivors/lea/commandmenu/anger/anger-06.wav",
    "darkborn/zps/survivors/lea/commandmenu/anger/anger-07.wav",
    "darkborn/zps/survivors/lea/commandmenu/anger/anger-08.wav"
}
    self.SoundTbl_AllyDeath = {
    "darkborn/zps/survivors/lea/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/lea/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/lea/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/lea/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/lea/commandmenu/escape/escape-05.wav"
}
    self.SoundTbl_Death = {
    "darkborn/zps/survivors/lea/death/death-01.wav",
    "darkborn/zps/survivors/lea/death/death-02.wav",
    "darkborn/zps/survivors/lea/death/death-03.wav",
    "darkborn/zps/survivors/lea/death/death-04.wav",
    "darkborn/zps/survivors/lea/death/death-05.wav",
    "darkborn/zps/survivors/lea/death/death-06.wav"
}
    self.SoundTbl_MedicReceiveHeal = {
    "darkborn/zps/survivors/lea/commandmenu/needhealth/needhealth-01.wav",
    "darkborn/zps/survivors/lea/commandmenu/needhealth/needhealth-02.wav",
    "darkborn/zps/survivors/lea/commandmenu/needhealth/needhealth-03.wav",
    "darkborn/zps/survivors/lea/commandmenu/needhealth/needhealth-04.wav",
    "darkborn/zps/survivors/lea/commandmenu/needhealth/needhealth-05.wav"
}
    self.SoundTbl_FollowPlayer = {
    "darkborn/zps/survivors/lea/commandmenu/cover/cover-04.wav",
    "darkborn/zps/survivors/lea/commandmenu/cover/cover-05.wav"
}
    self.SoundTbl_Jump = {
    "darkborn/zps/survivors/lea/jump/jump-01.wav",
    "darkborn/zps/survivors/lea/jump/jump-02.wav",
    "darkborn/zps/survivors/lea/jump/jump-03.wav",
    "darkborn/zps/survivors/lea/jump/jump-04.wav",
    "darkborn/zps/survivors/lea/jump/jump-05.wav"
}
    self.SoundTbl_Cough = {
    "darkborn/zps/survivors/lea/cough/coughing01.wav",
    "darkborn/zps/survivors/lea/cough/coughing02.wav",
    "darkborn/zps/survivors/lea/cough/coughing03.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SurvivorVoice_Marcus()
    self.SoundTbl_Idle = {
    "darkborn/zps/survivors/marcus/camping/camp-01.wav",
    "darkborn/zps/survivors/marcus/camping/camp-02.wav",
    "darkborn/zps/survivors/marcus/camping/camp-03.wav",
    "darkborn/zps/survivors/marcus/camping/camp-04.wav",
    "darkborn/zps/survivors/marcus/camping/camp-05.wav",
    "darkborn/zps/survivors/marcus/camping/camp-06.wav",
    "darkborn/zps/survivors/marcus/camping/camp-07.wav",
    "darkborn/zps/survivors/marcus/go/go-01.wav",
    "darkborn/zps/survivors/marcus/go/go-02.wav",
    "darkborn/zps/survivors/marcus/go/go-03.wav",
    "darkborn/zps/survivors/marcus/go/go-05.wav",
    "darkborn/zps/survivors/marcus/go/go-06.wav",
    "darkborn/zps/survivors/marcus/noaction/noaction-01.wav",
    "darkborn/zps/survivors/marcus/noaction/noaction-02.wav",
    "darkborn/zps/survivors/marcus/noaction/noaction-03.wav",
    "darkborn/zps/survivors/marcus/noaction/noaction-04.wav",
    "darkborn/zps/survivors/marcus/noaction/noaction-05.wav"
}
    self.SoundTbl_IdleDialogue = {
    "darkborn/zps/survivors/marcus/commandmenu/needweapon/need_weapon-01.wav",
    "darkborn/zps/survivors/marcus/commandmenu/needweapon/need_weapon-02.wav",
    "darkborn/zps/survivors/marcus/commandmenu/needweapon/need_weapon-03.wav",
    "darkborn/zps/survivors/marcus/commandmenu/needweapon/need_weapon-04.wav",
    "darkborn/zps/survivors/marcus/commandmenu/needweapon/need_weapon-05.wav",
    "darkborn/zps/survivors/marcus/commandmenu/needammo/need_ammo-01.wav",
    "darkborn/zps/survivors/marcus/commandmenu/needammo/need_ammo-03.wav",
    "darkborn/zps/survivors/marcus/commandmenu/needammo/need_ammo-05.wav",
    "darkborn/zps/survivors/marcus/commandmenu/thanks/thanks-01.wav",
    "darkborn/zps/survivors/marcus/commandmenu/thanks/thanks-02.wav",
    "darkborn/zps/survivors/marcus/commandmenu/thanks/thanks-03.wav",
    "darkborn/zps/survivors/marcus/commandmenu/thanks/thanks-04.wav",
    "darkborn/zps/survivors/marcus/commandmenu/thanks/thanks-05.wav",
    "darkborn/zps/survivors/marcus/commandmenu/hold/hold-01.wav",
    "darkborn/zps/survivors/marcus/commandmenu/hold/hold-02.wav",
    "darkborn/zps/survivors/marcus/commandmenu/hold/hold-03.wav",
    "darkborn/zps/survivors/marcus/commandmenu/hold/hold-04.wav",
    "darkborn/zps/survivors/marcus/commandmenu/hold/hold-05.wav",
    "darkborn/zps/survivors/marcus/commandmenu/statusreport/status_report-01.wav",
    "darkborn/zps/survivors/marcus/commandmenu/statusreport/status_report-02.wav",
    "darkborn/zps/survivors/marcus/commandmenu/statusreport/status_report-03.wav",
    "darkborn/zps/survivors/marcus/commandmenu/statusreport/status_report-04.wav",
    "darkborn/zps/survivors/marcus/commandmenu/statusreport/status_report-05.wav",
    "darkborn/zps/survivors/marcus/commandmenu/praise/praise-01.wav",
    "darkborn/zps/survivors/marcus/commandmenu/praise/praise-02.wav",
    "darkborn/zps/survivors/marcus/commandmenu/praise/praise-03.wav",
    "darkborn/zps/survivors/marcus/commandmenu/praise/praise-04.wav",
    "darkborn/zps/survivors/marcus/commandmenu/praise/praise-05.wav"
}
    self.SoundTbl_IdleDialogueAnswer = {
    "darkborn/zps/survivors/marcus/commandmenu/positivestatus/positive_status-01.wav",
    "darkborn/zps/survivors/marcus/commandmenu/positivestatus/positive_status-02.wav",
    "darkborn/zps/survivors/marcus/commandmenu/positivestatus/positive_status-03.wav",
    "darkborn/zps/survivors/marcus/commandmenu/positivestatus/positive_status-04.wav",
    "darkborn/zps/survivors/marcus/commandmenu/positivestatus/positive_status-05.wav",
    "darkborn/zps/survivors/marcus/commandmenu/decline/decline-01.wav",
    "darkborn/zps/survivors/marcus/commandmenu/decline/decline-02.wav",
    "darkborn/zps/survivors/marcus/commandmenu/decline/decline-03.wav",
    "darkborn/zps/survivors/marcus/commandmenu/decline/decline-04.wav",
    "darkborn/zps/survivors/marcus/commandmenu/decline/decline-05.wav",
    "darkborn/zps/survivors/marcus/commandmenu/decline/decline-06.wav",
    "darkborn/zps/survivors/marcus/commandmenu/acknowlege/acknowlege-01.wav",
    "darkborn/zps/survivors/marcus/commandmenu/acknowlege/acknowlege-02.wav",
    "darkborn/zps/survivors/marcus/commandmenu/acknowlege/acknowlege-03.wav",
    "darkborn/zps/survivors/marcus/commandmenu/acknowlege/acknowlege-04.wav",
    "darkborn/zps/survivors/marcus/commandmenu/acknowlege/acknowlege-05.wav",
    "darkborn/zps/survivors/marcus/commandmenu/acknowlege/acknowlege-06.wav"
}
    self.SoundTbl_CombatIdle = {
    "darkborn/zps/survivors/marcus/taunts/taunt-01.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-02.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-03.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-04.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-05.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-06.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-07.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-08.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-09.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-10.wav"
}
    self.SoundTbl_Suppressing = {
    "darkborn/zps/survivors/marcus/commandmenu/fire/fire-01.wav",
    "darkborn/zps/survivors/marcus/commandmenu/fire/fire-02.wav",
    "darkborn/zps/survivors/marcus/commandmenu/fire/fire-03.wav",
    "darkborn/zps/survivors/marcus/commandmenu/fire/fire-04.wav",
    "darkborn/zps/survivors/marcus/commandmenu/fire/fire-05.wav"
}
    self.SoundTbl_Alert = {
    "darkborn/zps/survivors/marcus/taunts/taunt-01.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-02.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-03.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-04.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-05.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-06.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-07.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-08.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-09.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-10.wav"
}
    self.SoundTbl_CallForHelp = {
    "darkborn/zps/survivors/marcus/panic!/panic-01.wav",
    "darkborn/zps/survivors/marcus/panic!/panic-02.wav",
    "darkborn/zps/survivors/marcus/panic!/panic-03.wav",
    "darkborn/zps/survivors/marcus/panic!/panic-04.wav",
    "darkborn/zps/survivors/marcus/panic!/panic-05.wav",
    "darkborn/zps/survivors/marcus/panic!/panic-06.wav"
}
    self.SoundTbl_OnReceiveOrder = {
    "darkborn/zps/survivors/marcus/keepmoving/keep_moving-01.wav",
    "darkborn/zps/survivors/marcus/keepmoving/keep_moving-02.wav",
    "darkborn/zps/survivors/marcus/keepmoving/keep_moving-03.wav",
    "darkborn/zps/survivors/marcus/keepmoving/keep_moving-04.wav",
    "darkborn/zps/survivors/marcus/keepmoving/keep_moving-05.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "darkborn/zps/survivors/marcus/meleegrunts/meleegrunt-01.wav",
    "darkborn/zps/survivors/marcus/meleegrunts/meleegrunt-02.wav",
    "darkborn/zps/survivors/marcus/meleegrunts/meleegrunt-03.wav",
    "darkborn/zps/survivors/marcus/meleegrunts/meleegrunt-04.wav",
    "darkborn/zps/survivors/marcus/meleegrunts/meleegrunt-05.wav",
    "darkborn/zps/survivors/marcus/meleegrunts/meleegrunt-06.wav"
}
    self.SoundTbl_OnKilledEnemy = {
    "darkborn/zps/survivors/marcus/kill/kill-01.wav",
    "darkborn/zps/survivors/marcus/kill/kill-02.wav",
    "darkborn/zps/survivors/marcus/kill/kill-03.wav",
    "darkborn/zps/survivors/marcus/kill/kill-04.wav",
    "darkborn/zps/survivors/marcus/kill/kill-05.wav",
    "darkborn/zps/survivors/marcus/kill/kill-06.wav",
    "darkborn/zps/survivors/marcus/kill/kill-07.wav",
    "darkborn/zps/survivors/marcus/kill/kill-08.wav",
    "darkborn/zps/survivors/marcus/kill/kill-09.wav"
}
    self.SoundTbl_GrenadeAttack = {
    "darkborn/zps/survivors/marcus/taunts/taunt-01.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-02.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-03.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-04.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-05.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-06.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-07.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-08.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-09.wav",
    "darkborn/zps/survivors/marcus/taunts/taunt-10.wav"
}
    self.SoundTbl_OnGrenadeSight = {
    "darkborn/zps/survivors/marcus/panic!/panic-01.wav",
    "darkborn/zps/survivors/marcus/panic!/panic-02.wav",
    "darkborn/zps/survivors/marcus/panic!/panic-03.wav",
    "darkborn/zps/survivors/marcus/panic!/panic-04.wav",
    "darkborn/zps/survivors/marcus/panic!/panic-05.wav",
    "darkborn/zps/survivors/marcus/panic!/panic-06.wav",
    "darkborn/zps/survivors/marcus/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/marcus/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/marcus/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/marcus/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/marcus/commandmenu/escape/escape-05.wav"
}
    self.SoundTbl_OnDangerSight = {
    "darkborn/zps/survivors/marcus/panic!/panic-01.wav",
    "darkborn/zps/survivors/marcus/panic!/panic-02.wav",
    "darkborn/zps/survivors/marcus/panic!/panic-03.wav",
    "darkborn/zps/survivors/marcus/panic!/panic-04.wav",
    "darkborn/zps/survivors/marcus/panic!/panic-05.wav",
    "darkborn/zps/survivors/marcus/panic!/panic-06.wav",
    "darkborn/zps/survivors/marcus/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/marcus/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/marcus/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/marcus/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/marcus/commandmenu/escape/escape-05.wav"
}
    self.SoundTbl_WeaponReload = {
    "darkborn/zps/survivors/marcus/commandmenu/needammo/need_ammo-02.wav",
    "darkborn/zps/survivors/marcus/commandmenu/needammo/need_ammo-04.wav",
    "darkborn/zps/survivors/marcus/commandmenu/cover/cover-02.wav",
    "darkborn/zps/survivors/marcus/commandmenu/cover/cover-03.wav",
    "darkborn/zps/survivors/marcus/commandmenu/cover/cover-04.wav"
}
    self.SoundTbl_Pain = {
    "darkborn/zps/survivors/marcus/pain/pain-01.wav",
    "darkborn/zps/survivors/marcus/pain/pain-02.wav",
    "darkborn/zps/survivors/marcus/pain/pain-03.wav",
    "darkborn/zps/survivors/marcus/pain/pain-04.wav",
    "darkborn/zps/survivors/marcus/pain/pain-05.wav",
    "darkborn/zps/survivors/marcus/pain/pain-06.wav"
}
    self.SoundTbl_DamageByPlayer = {
    "darkborn/zps/survivors/marcus/commandmenu/anger/anger-01.wav",
    "darkborn/zps/survivors/marcus/commandmenu/anger/anger-02.wav",
    "darkborn/zps/survivors/marcus/commandmenu/anger/anger-03.wav",
    "darkborn/zps/survivors/marcus/commandmenu/anger/anger-04.wav",
    "darkborn/zps/survivors/marcus/commandmenu/anger/anger-05.wav",
    "darkborn/zps/survivors/marcus/commandmenu/anger/anger-06.wav",
    "darkborn/zps/survivors/marcus/commandmenu/anger/anger-07.wav",
    "darkborn/zps/survivors/marcus/commandmenu/anger/anger-08.wav",
    "darkborn/zps/survivors/marcus/commandmenu/anger/anger-09.wav",
    "darkborn/zps/survivors/marcus/commandmenu/anger/anger-10.wav"
}
    self.SoundTbl_AllyDeath = {
    "darkborn/zps/survivors/marcus/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/marcus/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/marcus/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/marcus/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/marcus/commandmenu/escape/escape-05.wav"
}
    self.SoundTbl_Investigate = {
    "darkborn/zps/survivors/marcus/go/go-04.wav"
}
    self.SoundTbl_Death = {
    "darkborn/zps/survivors/marcus/death/death-01.wav",
    "darkborn/zps/survivors/marcus/death/death-02.wav",
    "darkborn/zps/survivors/marcus/death/death-03.wav",
    "darkborn/zps/survivors/marcus/death/death-04.wav",
    "darkborn/zps/survivors/marcus/death/death-05.wav",
    "darkborn/zps/survivors/marcus/death/death-06.wav"
}
    self.SoundTbl_MedicReceiveHeal = {
    "darkborn/zps/survivors/marcus/commandmenu/needhealth/need_health-01.wav",
    "darkborn/zps/survivors/marcus/commandmenu/needhealth/need_health-02.wav",
    "darkborn/zps/survivors/marcus/commandmenu/needhealth/need_health-03.wav",
    "darkborn/zps/survivors/marcus/commandmenu/needhealth/need_health-04.wav",
    "darkborn/zps/survivors/marcus/commandmenu/needhealth/need_health-05.wav"
}
    self.SoundTbl_FollowPlayer = {
    "darkborn/zps/survivors/marcus/commandmenu/cover/cover-01.wav",
    "darkborn/zps/survivors/marcus/commandmenu/cover/cover-05.wav"
}
    self.SoundTbl_Jump = {
    "darkborn/zps/survivors/marcus/jump/cop_jump-01.wav",
    "darkborn/zps/survivors/marcus/jump/cop_jump-02.wav",
    "darkborn/zps/survivors/marcus/jump/cop_jump-03.wav",
    "darkborn/zps/survivors/marcus/jump/cop_jump-04.wav",
    "darkborn/zps/survivors/marcus/jump/cop_jump-05.wav",
    "darkborn/zps/survivors/marcus/jump/cop_jump-06.wav"
}
    self.SoundTbl_Cough = {
    "darkborn/zps/survivors/marcus/cough/coughing01.wav",
    "darkborn/zps/survivors/marcus/cough/coughing02.wav",
    "darkborn/zps/survivors/marcus/cough/coughing03.wav",
    "darkborn/zps/survivors/marcus/cough/coughing04.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SurvivorVoice_Paul()
    self.SoundTbl_Idle = {
    "darkborn/zps/survivors/paul/camping/camp-01.wav",
    "darkborn/zps/survivors/paul/camping/camp-02.wav",
    "darkborn/zps/survivors/paul/camping/camp-03.wav",
    "darkborn/zps/survivors/paul/camping/camp-04.wav",
    "darkborn/zps/survivors/paul/camping/camp-05.wav",
    "darkborn/zps/survivors/paul/go/go-01.wav",
    "darkborn/zps/survivors/paul/go/go-02.wav",
    "darkborn/zps/survivors/paul/go/go-03.wav",
    "darkborn/zps/survivors/paul/go/go-04.wav",
    "darkborn/zps/survivors/paul/go/go-05.wav",
    "darkborn/zps/survivors/paul/noaction/noaction-01.wav",
    "darkborn/zps/survivors/paul/noaction/noaction-02.wav",
    "darkborn/zps/survivors/paul/noaction/noaction-03.wav",
    "darkborn/zps/survivors/paul/noaction/noaction-04.wav",
    "darkborn/zps/survivors/paul/noaction/noaction-05.wav"
}
    self.SoundTbl_IdleDialogue = {
    "darkborn/zps/survivors/paul/commandmenu/needweapon/needweapon-01.wav",
    "darkborn/zps/survivors/paul/commandmenu/needweapon/needweapon-02.wav",
    "darkborn/zps/survivors/paul/commandmenu/needweapon/needweapon-03.wav",
    "darkborn/zps/survivors/paul/commandmenu/needweapon/needweapon-04.wav",
    "darkborn/zps/survivors/paul/commandmenu/needweapon/needweapon-05.wav",
    "darkborn/zps/survivors/paul/commandmenu/needammo/needammo-01.wav",
    "darkborn/zps/survivors/paul/commandmenu/needammo/needammo-02.wav",
    "darkborn/zps/survivors/paul/commandmenu/needammo/needammo-03.wav",
    "darkborn/zps/survivors/paul/commandmenu/needammo/needammo-04.wav",
    "darkborn/zps/survivors/paul/commandmenu/needammo/needammo-05.wav",
    "darkborn/zps/survivors/paul/commandmenu/thanks/thanks-01.wav",
    "darkborn/zps/survivors/paul/commandmenu/thanks/thanks-02.wav",
    "darkborn/zps/survivors/paul/commandmenu/thanks/thanks-03.wav",
    "darkborn/zps/survivors/paul/commandmenu/thanks/thanks-04.wav",
    "darkborn/zps/survivors/paul/commandmenu/thanks/thanks-05.wav",
    "darkborn/zps/survivors/paul/commandmenu/hold/hold-01.wav",
    "darkborn/zps/survivors/paul/commandmenu/hold/hold-02.wav",
    "darkborn/zps/survivors/paul/commandmenu/hold/hold-03.wav",
    "darkborn/zps/survivors/paul/commandmenu/hold/hold-04.wav",
    "darkborn/zps/survivors/paul/commandmenu/hold/hold-05.wav",
    "darkborn/zps/survivors/paul/commandmenu/statusreport/statusreport-01.wav",
    "darkborn/zps/survivors/paul/commandmenu/statusreport/statusreport-02.wav",
    "darkborn/zps/survivors/paul/commandmenu/statusreport/statusreport-03.wav",
    "darkborn/zps/survivors/paul/commandmenu/statusreport/statusreport-04.wav",
    "darkborn/zps/survivors/paul/commandmenu/statusreport/statusreport-05.wav",
    "darkborn/zps/survivors/paul/commandmenu/praise/praise-01.wav",
    "darkborn/zps/survivors/paul/commandmenu/praise/praise-02.wav",
    "darkborn/zps/survivors/paul/commandmenu/praise/praise-03.wav",
    "darkborn/zps/survivors/paul/commandmenu/praise/praise-04.wav",
    "darkborn/zps/survivors/paul/commandmenu/praise/praise-05.wav",
    "darkborn/zps/survivors/paul/commandmenu/praise/praise-06.wav",
    "darkborn/zps/survivors/paul/commandmenu/praise/praise-07.wav"
}
    self.SoundTbl_IdleDialogueAnswer = {
    "darkborn/zps/survivors/paul/commandmenu/positivestatus/positivestatus-01.wav",
    "darkborn/zps/survivors/paul/commandmenu/positivestatus/positivestatus-02.wav",
    "darkborn/zps/survivors/paul/commandmenu/positivestatus/positivestatus-03.wav",
    "darkborn/zps/survivors/paul/commandmenu/positivestatus/positivestatus-04.wav",
    "darkborn/zps/survivors/paul/commandmenu/positivestatus/positivestatus-05.wav",
    "darkborn/zps/survivors/paul/commandmenu/positivestatus/positivestatus-06.wav",
    "darkborn/zps/survivors/paul/commandmenu/decline/decline-01.wav",
    "darkborn/zps/survivors/paul/commandmenu/decline/decline-02.wav",
    "darkborn/zps/survivors/paul/commandmenu/decline/decline-03.wav",
    "darkborn/zps/survivors/paul/commandmenu/decline/decline-04.wav",
    "darkborn/zps/survivors/paul/commandmenu/decline/decline-05.wav",
    "darkborn/zps/survivors/paul/commandmenu/decline/decline-06.wav",
    "darkborn/zps/survivors/paul/commandmenu/acknowlege/yes-01.wav",
    "darkborn/zps/survivors/paul/commandmenu/acknowlege/yes-02.wav",
    "darkborn/zps/survivors/paul/commandmenu/acknowlege/yes-03.wav",
    "darkborn/zps/survivors/paul/commandmenu/acknowlege/yes-04.wav",
    "darkborn/zps/survivors/paul/commandmenu/acknowlege/yes-05.wav",
    "darkborn/zps/survivors/paul/commandmenu/acknowlege/yes-06.wav"
}
    self.SoundTbl_CombatIdle = {
    "darkborn/zps/survivors/paul/taunts/taunt-01.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-02.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-03.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-04.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-05.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-06.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-07.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-08.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-09.wav"
}
    self.SoundTbl_Suppressing = {
    "darkborn/zps/survivors/paul/commandmenu/fire/fire-01.wav",
    "darkborn/zps/survivors/paul/commandmenu/fire/fire-02.wav",
    "darkborn/zps/survivors/paul/commandmenu/fire/fire-03.wav",
    "darkborn/zps/survivors/paul/commandmenu/fire/fire-04.wav",
    "darkborn/zps/survivors/paul/commandmenu/fire/fire-05.wav"
}
    self.SoundTbl_Alert = {
    "darkborn/zps/survivors/paul/taunts/taunt-01.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-02.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-03.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-04.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-05.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-06.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-07.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-08.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-09.wav"
}
    self.SoundTbl_CallForHelp = {
    "darkborn/zps/survivors/paul/panic!/panic-01.wav",
    "darkborn/zps/survivors/paul/panic!/panic-02.wav",
    "darkborn/zps/survivors/paul/panic!/panic-03.wav",
    "darkborn/zps/survivors/paul/panic!/panic-04.wav",
    "darkborn/zps/survivors/paul/panic!/panic-05.wav"
}
    self.SoundTbl_OnReceiveOrder = {
    "darkborn/zps/survivors/paul/keepmoving/keepmoving-01.wav",
    "darkborn/zps/survivors/paul/keepmoving/keepmoving-02.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "darkborn/zps/survivors/paul/meleegrunts/melee-01.wav",
    "darkborn/zps/survivors/paul/meleegrunts/melee-02.wav",
    "darkborn/zps/survivors/paul/meleegrunts/melee-03.wav",
    "darkborn/zps/survivors/paul/meleegrunts/melee-04.wav",
    "darkborn/zps/survivors/paul/meleegrunts/melee-05.wav"
}
    self.SoundTbl_OnKilledEnemy = {
    "darkborn/zps/survivors/paul/kill/kill-01.wav",
    "darkborn/zps/survivors/paul/kill/kill-02.wav",
    "darkborn/zps/survivors/paul/kill/kill-03.wav",
    "darkborn/zps/survivors/paul/kill/kill-04.wav",
    "darkborn/zps/survivors/paul/kill/kill-05.wav",
    "darkborn/zps/survivors/paul/kill/kill-06.wav",
    "darkborn/zps/survivors/paul/kill/kill-07.wav",
    "darkborn/zps/survivors/paul/kill/kill-08.wav",
    "darkborn/zps/survivors/paul/kill/kill-09.wav"
}
    self.SoundTbl_GrenadeAttack = {
    "darkborn/zps/survivors/paul/taunts/taunt-01.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-02.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-03.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-04.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-05.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-06.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-07.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-08.wav",
    "darkborn/zps/survivors/paul/taunts/taunt-09.wav"
}
    self.SoundTbl_OnGrenadeSight = {
    "darkborn/zps/survivors/paul/panic!/panic-01.wav",
    "darkborn/zps/survivors/paul/panic!/panic-02.wav",
    "darkborn/zps/survivors/paul/panic!/panic-03.wav",
    "darkborn/zps/survivors/paul/panic!/panic-04.wav",
    "darkborn/zps/survivors/paul/panic!/panic-05.wav",
    "darkborn/zps/survivors/paul/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/paul/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/paul/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/paul/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/paul/commandmenu/escape/escape-05.wav"
}
    self.SoundTbl_OnDangerSight = {
    "darkborn/zps/survivors/paul/panic!/panic-01.wav",
    "darkborn/zps/survivors/paul/panic!/panic-02.wav",
    "darkborn/zps/survivors/paul/panic!/panic-03.wav",
    "darkborn/zps/survivors/paul/panic!/panic-04.wav",
    "darkborn/zps/survivors/paul/panic!/panic-05.wav",
    "darkborn/zps/survivors/paul/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/paul/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/paul/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/paul/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/paul/commandmenu/escape/escape-05.wav"
}
    self.SoundTbl_WeaponReload = {
    "darkborn/zps/survivors/paul/commandmenu/cover/cover-01.wav",
    "darkborn/zps/survivors/paul/commandmenu/cover/cover-05.wav"
}
    self.SoundTbl_Pain = {
    "darkborn/zps/survivors/paul/pain/pain-01.wav",
    "darkborn/zps/survivors/paul/pain/pain-02.wav",
    "darkborn/zps/survivors/paul/pain/pain-03.wav",
    "darkborn/zps/survivors/paul/pain/pain-04.wav",
    "darkborn/zps/survivors/paul/pain/pain-05.wav",
    "darkborn/zps/survivors/paul/pain/pain-06.wav"
}
    self.SoundTbl_DamageByPlayer = {
    "darkborn/zps/survivors/paul/commandmenu/anger/anger-01.wav",
    "darkborn/zps/survivors/paul/commandmenu/anger/anger-02.wav",
    "darkborn/zps/survivors/paul/commandmenu/anger/anger-03.wav",
    "darkborn/zps/survivors/paul/commandmenu/anger/anger-04.wav",
    "darkborn/zps/survivors/paul/commandmenu/anger/anger-05.wav",
    "darkborn/zps/survivors/paul/commandmenu/anger/anger-06.wav",
    "darkborn/zps/survivors/paul/commandmenu/anger/anger-07.wav",
    "darkborn/zps/survivors/paul/commandmenu/anger/anger-08.wav",
    "darkborn/zps/survivors/paul/commandmenu/anger/anger-09.wav"
}
    self.SoundTbl_AllyDeath = {
    "darkborn/zps/survivors/paul/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/paul/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/paul/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/paul/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/paul/commandmenu/escape/escape-05.wav"
}
    self.SoundTbl_Death = {
    "darkborn/zps/survivors/paul/death/death-01.wav",
    "darkborn/zps/survivors/paul/death/death-02.wav",
    "darkborn/zps/survivors/paul/death/death-03.wav",
    "darkborn/zps/survivors/paul/death/death-04.wav",
    "darkborn/zps/survivors/paul/death/death-05.wav",
    "darkborn/zps/survivors/paul/death/death-06.wav"
}
    self.SoundTbl_MedicReceiveHeal = {
    "darkborn/zps/survivors/paul/commandmenu/needhealth/needhealth-01.wav",
    "darkborn/zps/survivors/paul/commandmenu/needhealth/needhealth-02.wav",
    "darkborn/zps/survivors/paul/commandmenu/needhealth/needhealth-03.wav",
    "darkborn/zps/survivors/paul/commandmenu/needhealth/needhealth-04.wav",
    "darkborn/zps/survivors/paul/commandmenu/needhealth/needhealth-05.wav"
}
    self.SoundTbl_FollowPlayer = {
    "darkborn/zps/survivors/paul/commandmenu/cover/cover-02.wav",
    "darkborn/zps/survivors/paul/commandmenu/cover/cover-03.wav",
    "darkborn/zps/survivors/paul/commandmenu/cover/cover-04.wav",
    "darkborn/zps/survivors/paul/commandmenu/cover/cover-06.wav"
}
    self.SoundTbl_Jump = {
    "darkborn/zps/survivors/paul/jump/jump-01.wav",
    "darkborn/zps/survivors/paul/jump/jump-02.wav",
    "darkborn/zps/survivors/paul/jump/jump-03.wav",
    "darkborn/zps/survivors/paul/jump/jump-04.wav",
    "darkborn/zps/survivors/paul/jump/jump-05.wav"
}
    self.SoundTbl_Cough = {
    "darkborn/zps/survivors/paul/cough/coughing01.wav",
    "darkborn/zps/survivors/paul/cough/coughing02.wav",
    "darkborn/zps/survivors/paul/cough/coughing03.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SurvivorVoice_Pedro()
    self.SoundTbl_Idle = {
    "darkborn/zps/survivors/pedro/camping/camping-01.wav",
    "darkborn/zps/survivors/pedro/camping/camping-02.wav",
    "darkborn/zps/survivors/pedro/camping/camping-03.wav",
    "darkborn/zps/survivors/pedro/camping/camping-04.wav",
    "darkborn/zps/survivors/pedro/camping/camping-05.wav",
    "darkborn/zps/survivors/pedro/camping/camping-06.wav",
    "darkborn/zps/survivors/pedro/camping/camping-07.wav",
    "darkborn/zps/survivors/pedro/go/go-01.wav",
    "darkborn/zps/survivors/pedro/go/go-03.wav",
    "darkborn/zps/survivors/pedro/go/go-04.wav",
    "darkborn/zps/survivors/pedro/go/go-05.wav",
    "darkborn/zps/survivors/pedro/go/go-06.wav",
    "darkborn/zps/survivors/pedro/noaction/noaction-01.wav",
    "darkborn/zps/survivors/pedro/noaction/noaction-02.wav",
    "darkborn/zps/survivors/pedro/noaction/noaction-03.wav",
    "darkborn/zps/survivors/pedro/noaction/noaction-04.wav",
    "darkborn/zps/survivors/pedro/noaction/noaction-05.wav"
}
    self.SoundTbl_IdleDialogue = {
    "darkborn/zps/survivors/pedro/commandmenu/needweapon/need_weapon-01.wav",
    "darkborn/zps/survivors/pedro/commandmenu/needweapon/need_weapon-02.wav",
    "darkborn/zps/survivors/pedro/commandmenu/needweapon/need_weapon-03.wav",
    "darkborn/zps/survivors/pedro/commandmenu/needweapon/need_weapon-04.wav",
    "darkborn/zps/survivors/pedro/commandmenu/needweapon/need_weapon-05.wav",
    "darkborn/zps/survivors/pedro/commandmenu/needammo/needammo-01.wav",
    "darkborn/zps/survivors/pedro/commandmenu/needammo/needammo-03.wav",
    "darkborn/zps/survivors/pedro/commandmenu/needammo/needammo-04.wav",
    "darkborn/zps/survivors/pedro/commandmenu/thanks/thanks-01.wav",
    "darkborn/zps/survivors/pedro/commandmenu/thanks/thanks-02.wav",
    "darkborn/zps/survivors/pedro/commandmenu/thanks/thanks-03.wav",
    "darkborn/zps/survivors/pedro/commandmenu/thanks/thanks-04.wav",
    "darkborn/zps/survivors/pedro/commandmenu/thanks/thanks-05.wav",
    "darkborn/zps/survivors/pedro/commandmenu/hold/hold-01.wav",
    "darkborn/zps/survivors/pedro/commandmenu/hold/hold-02.wav",
    "darkborn/zps/survivors/pedro/commandmenu/hold/hold-03.wav",
    "darkborn/zps/survivors/pedro/commandmenu/hold/hold-04.wav",
    "darkborn/zps/survivors/pedro/commandmenu/hold/hold-05.wav",
    "darkborn/zps/survivors/pedro/commandmenu/statusreport/status_report-01.wav",
    "darkborn/zps/survivors/pedro/commandmenu/statusreport/status_report-02.wav",
    "darkborn/zps/survivors/pedro/commandmenu/statusreport/status_report-03.wav",
    "darkborn/zps/survivors/pedro/commandmenu/statusreport/status_report-04.wav",
    "darkborn/zps/survivors/pedro/commandmenu/statusreport/status_report-05.wav",
    "darkborn/zps/survivors/pedro/commandmenu/praise/praise-01.wav",
    "darkborn/zps/survivors/pedro/commandmenu/praise/praise-02.wav",
    "darkborn/zps/survivors/pedro/commandmenu/praise/praise-03.wav",
    "darkborn/zps/survivors/pedro/commandmenu/praise/praise-04.wav",
    "darkborn/zps/survivors/pedro/commandmenu/praise/praise-05.wav"
}
    self.SoundTbl_IdleDialogueAnswer = {
    "darkborn/zps/survivors/pedro/commandmenu/positivestatus/positivestatus-01.wav",
    "darkborn/zps/survivors/pedro/commandmenu/positivestatus/positivestatus-02.wav",
    "darkborn/zps/survivors/pedro/commandmenu/positivestatus/positivestatus-03.wav",
    "darkborn/zps/survivors/pedro/commandmenu/positivestatus/positivestatus-04.wav",
    "darkborn/zps/survivors/pedro/commandmenu/positivestatus/positivestatus-05.wav",
    "darkborn/zps/survivors/pedro/commandmenu/decline/decline-01.wav",
    "darkborn/zps/survivors/pedro/commandmenu/decline/decline-02.wav",
    "darkborn/zps/survivors/pedro/commandmenu/decline/decline-03.wav",
    "darkborn/zps/survivors/pedro/commandmenu/decline/decline-04.wav",
    "darkborn/zps/survivors/pedro/commandmenu/decline/decline-05.wav",
    "darkborn/zps/survivors/pedro/commandmenu/decline/decline-06.wav",
    "darkborn/zps/survivors/pedro/commandmenu/acknowledge/acknowledge-01.wav",
    "darkborn/zps/survivors/pedro/commandmenu/acknowledge/acknowledge-02.wav",
    "darkborn/zps/survivors/pedro/commandmenu/acknowledge/acknowledge-03.wav",
    "darkborn/zps/survivors/pedro/commandmenu/acknowledge/acknowledge-04.wav",
    "darkborn/zps/survivors/pedro/commandmenu/acknowledge/acknowledge-05.wav"
}
    self.SoundTbl_CombatIdle = {
    "darkborn/zps/survivors/pedro/taunts/taunt-01.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-02.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-03.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-04.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-05.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-06.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-07.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-08.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-09.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-10.wav"
}
    self.SoundTbl_Suppressing = {
    "darkborn/zps/survivors/pedro/commandmenu/fire/fire-01.wav",
    "darkborn/zps/survivors/pedro/commandmenu/fire/fire-02.wav",
    "darkborn/zps/survivors/pedro/commandmenu/fire/fire-03.wav",
    "darkborn/zps/survivors/pedro/commandmenu/fire/fire-04.wav",
    "darkborn/zps/survivors/pedro/commandmenu/fire/fire-05.wav"
}
    self.SoundTbl_Alert = {
    "darkborn/zps/survivors/pedro/taunts/taunt-01.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-02.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-03.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-04.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-05.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-06.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-07.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-08.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-09.wav"
}
    self.SoundTbl_CallForHelp = {
    "darkborn/zps/survivors/pedro/panic!/panic-01.wav",
    "darkborn/zps/survivors/pedro/panic!/panic-02.wav",
    "darkborn/zps/survivors/pedro/panic!/panic-03.wav",
    "darkborn/zps/survivors/pedro/panic!/panic-04.wav",
    "darkborn/zps/survivors/pedro/panic!/panic-05.wav",
    "darkborn/zps/survivors/pedro/panic!/panic-06.wav"
}
    self.SoundTbl_OnReceiveOrder = {
    "darkborn/zps/survivors/pedro/keepmoving/keep_moving-01.wav",
    "darkborn/zps/survivors/pedro/keepmoving/keep_moving-02.wav",
    "darkborn/zps/survivors/pedro/keepmoving/keep_moving-03.wav",
    "darkborn/zps/survivors/pedro/keepmoving/keep_moving-04.wav",
    "darkborn/zps/survivors/pedro/keepmoving/keep_moving-05.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "darkborn/zps/survivors/pedro/meleegrunts/meleegrunt-01.wav",
    "darkborn/zps/survivors/pedro/meleegrunts/meleegrunt-02.wav",
    "darkborn/zps/survivors/pedro/meleegrunts/meleegrunt-03.wav",
    "darkborn/zps/survivors/pedro/meleegrunts/meleegrunt-04.wav",
    "darkborn/zps/survivors/pedro/meleegrunts/meleegrunt-05.wav",
    "darkborn/zps/survivors/pedro/meleegrunts/meleegrunt-06.wav"
}
    self.SoundTbl_OnKilledEnemy = {
    "darkborn/zps/survivors/pedro/kill/kill-01.wav",
    "darkborn/zps/survivors/pedro/kill/kill-02.wav",
    "darkborn/zps/survivors/pedro/kill/kill-03.wav",
    "darkborn/zps/survivors/pedro/kill/kill-04.wav",
    "darkborn/zps/survivors/pedro/kill/kill-05.wav",
    "darkborn/zps/survivors/pedro/kill/kill-06.wav",
    "darkborn/zps/survivors/pedro/kill/kill-07.wav",
    "darkborn/zps/survivors/pedro/kill/kill-08.wav",
    "darkborn/zps/survivors/pedro/kill/kill-09.wav"
}
    self.SoundTbl_CombatIdle = {
    "darkborn/zps/survivors/pedro/taunts/taunt-01.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-02.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-03.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-04.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-05.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-06.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-07.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-08.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-09.wav",
    "darkborn/zps/survivors/pedro/taunts/taunt-10.wav"
}
    self.SoundTbl_GrenadeAttack = {
    "darkborn/zps/survivors/pedro/commandmenu/needammo/needammo-02.wav",
    "darkborn/zps/survivors/pedro/commandmenu/cover/cover-01.wav",
    "darkborn/zps/survivors/pedro/commandmenu/cover/cover-02.wav"
}
    self.SoundTbl_OnGrenadeSight = {
    "darkborn/zps/survivors/pedro/panic!/panic-01.wav",
    "darkborn/zps/survivors/pedro/panic!/panic-02.wav",
    "darkborn/zps/survivors/pedro/panic!/panic-03.wav",
    "darkborn/zps/survivors/pedro/panic!/panic-04.wav",
    "darkborn/zps/survivors/pedro/panic!/panic-05.wav",
    "darkborn/zps/survivors/pedro/panic!/panic-06.wav",
    "darkborn/zps/survivors/pedro/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/pedro/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/pedro/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/pedro/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/pedro/commandmenu/escape/escape-05.wav"
}
    self.SoundTbl_OnDangerSight = {
    "darkborn/zps/survivors/pedro/panic!/panic-01.wav",
    "darkborn/zps/survivors/pedro/panic!/panic-02.wav",
    "darkborn/zps/survivors/pedro/panic!/panic-03.wav",
    "darkborn/zps/survivors/pedro/panic!/panic-04.wav",
    "darkborn/zps/survivors/pedro/panic!/panic-05.wav",
    "darkborn/zps/survivors/pedro/panic!/panic-06.wav",
    "darkborn/zps/survivors/pedro/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/pedro/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/pedro/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/pedro/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/pedro/commandmenu/escape/escape-05.wav"
}
    self.SoundTbl_WeaponReload = {
    "darkborn/zps/survivors/pedro/commandmenu/needammo/needammo-02.wav",
    "darkborn/zps/survivors/pedro/commandmenu/cover/cover-01.wav",
    "darkborn/zps/survivors/pedro/commandmenu/cover/cover-02.wav",
    "darkborn/zps/survivors/pedro/commandmenu/cover/cover-05.wav"
}
    self.SoundTbl_Pain = {
    "darkborn/zps/survivors/pedro/pain/pain-01.wav",
    "darkborn/zps/survivors/pedro/pain/pain-02.wav",
    "darkborn/zps/survivors/pedro/pain/pain-03.wav",
    "darkborn/zps/survivors/pedro/pain/pain-04.wav",
    "darkborn/zps/survivors/pedro/pain/pain-05.wav",
    "darkborn/zps/survivors/pedro/pain/pain-06.wav"
}
    self.SoundTbl_DamageByPlayer = {
    "darkborn/zps/survivors/pedro/commandmenu/anger/anger-01.wav",
    "darkborn/zps/survivors/pedro/commandmenu/anger/anger-02.wav",
    "darkborn/zps/survivors/pedro/commandmenu/anger/anger-03.wav",
    "darkborn/zps/survivors/pedro/commandmenu/anger/anger-04.wav",
    "darkborn/zps/survivors/pedro/commandmenu/anger/anger-05.wav",
    "darkborn/zps/survivors/pedro/commandmenu/anger/anger-06.wav",
    "darkborn/zps/survivors/pedro/commandmenu/anger/anger-07.wav",
    "darkborn/zps/survivors/pedro/commandmenu/anger/anger-08.wav",
    "darkborn/zps/survivors/pedro/commandmenu/anger/anger-09.wav",
    "darkborn/zps/survivors/pedro/commandmenu/anger/anger-10.wav"
}
    self.SoundTbl_AllyDeath = {
    "darkborn/zps/survivors/pedro/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/pedro/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/pedro/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/pedro/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/pedro/commandmenu/escape/escape-05.wav"
}
    self.SoundTbl_Investigate = {
    "darkborn/zps/survivors/pedro/go/go-02.wav"
}
    self.SoundTbl_Death = {
    "darkborn/zps/survivors/pedro/death/death-01.wav",
    "darkborn/zps/survivors/pedro/death/death-02.wav",
    "darkborn/zps/survivors/pedro/death/death-03.wav",
    "darkborn/zps/survivors/pedro/death/death-04.wav",
    "darkborn/zps/survivors/pedro/death/death-05.wav",
    "darkborn/zps/survivors/pedro/death/death-06.wav"
}
    self.SoundTbl_MedicReceiveHeal = {
    "darkborn/zps/survivors/pedro/commandmenu/needhealth/needhealth-01.wav",
    "darkborn/zps/survivors/pedro/commandmenu/needhealth/needhealth-02.wav",
    "darkborn/zps/survivors/pedro/commandmenu/needhealth/needhealth-03.wav",
    "darkborn/zps/survivors/pedro/commandmenu/needhealth/needhealth-04.wav",
    "darkborn/zps/survivors/pedro/commandmenu/needhealth/needhealth-05.wav"
}
    self.SoundTbl_FollowPlayer = {
    "darkborn/zps/survivors/pedro/commandmenu/cover/cover-03.wav",
    "darkborn/zps/survivors/pedro/commandmenu/cover/cover-04.wav"}

    self.SoundTbl_Jump = {
    "darkborn/zps/survivors/pedro/jump/jump-01.wav",
    "darkborn/zps/survivors/pedro/jump/jump-02.wav",
    "darkborn/zps/survivors/pedro/jump/jump-03.wav",
    "darkborn/zps/survivors/pedro/jump/jump-04.wav",
    "darkborn/zps/survivors/pedro/jump/jump-05.wav",
    "darkborn/zps/survivors/pedro/jump/jump-06.wav"
}
    self.SoundTbl_Cough = {
    "darkborn/zps/survivors/pedro/cough/coughing01.wav",
    "darkborn/zps/survivors/pedro/cough/coughing02.wav",
    "darkborn/zps/survivors/pedro/cough/coughing03.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SurvivorVoice_Vanessa()
    self.SoundTbl_Idle = {
    "darkborn/zps/survivors/vanessa/camping/camping-01.wav",
    "darkborn/zps/survivors/vanessa/camping/camping-02.wav",
    "darkborn/zps/survivors/vanessa/camping/camping-03.wav",
    "darkborn/zps/survivors/vanessa/camping/camping-04.wav",
    "darkborn/zps/survivors/vanessa/camping/camping-05.wav",
    "darkborn/zps/survivors/vanessa/go/go-01.wav",
    "darkborn/zps/survivors/vanessa/go/go-02.wav",
    "darkborn/zps/survivors/vanessa/go/go-03.wav",
    "darkborn/zps/survivors/vanessa/go/go-04.wav",
    "darkborn/zps/survivors/vanessa/go/go-05.wav",
    "darkborn/zps/survivors/vanessa/noaction/noaction-01.wav",
    "darkborn/zps/survivors/vanessa/noaction/noaction-02.wav",
    "darkborn/zps/survivors/vanessa/noaction/noaction-03.wav",
    "darkborn/zps/survivors/vanessa/noaction/noaction-04.wav",
    "darkborn/zps/survivors/vanessa/noaction/noaction-05.wav"
}
    self.SoundTbl_IdleDialogue = {
    "darkborn/zps/survivors/vanessa/commandmenu/needweapon/needweapon-01.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/needweapon/needweapon-02.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/needweapon/needweapon-03.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/needweapon/needweapon-04.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/needweapon/needweapon-05.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/needammo/needammo-01.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/needammo/needammo-02.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/needammo/needammo-03.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/needammo/needammo-04.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/needammo/needammo-05.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/needammo/needammo-06.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/thanks/thanks-01.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/thanks/thanks-02.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/thanks/thanks-03.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/thanks/thanks-04.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/thanks/thanks-05.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/hold/hold-01.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/hold/hold-02.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/hold/hold-03.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/hold/hold-04.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/hold/hold-05.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/statusreport/statusreport-01.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/statusreport/statusreport-02.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/statusreport/statusreport-03.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/statusreport/statusreport-04.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/statusreport/statusreport-05.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/praise/praise-01.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/praise/praise-02.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/praise/praise-03.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/praise/praise-04.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/praise/praise-05.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/praise/praise-06.wav"
}
    self.SoundTbl_IdleDialogueAnswer = {
    "darkborn/zps/survivors/vanessa/commandmenu/positivestatus/positivestatus-01.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/positivestatus/positivestatus-02.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/positivestatus/positivestatus-03.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/positivestatus/positivestatus-04.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/positivestatus/positivestatus-05.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/decline/no-01.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/decline/no-02.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/decline/no-03.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/decline/no-04.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/decline/no-05.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/acknowledge/yes-01.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/acknowledge/yes-02.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/acknowledge/yes-03.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/acknowledge/yes-04.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/acknowledge/yes-05.wav"
}
    self.SoundTbl_CombatIdle = {
    "darkborn/zps/survivors/vanessa/taunts/taunt-01.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-02.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-03.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-04.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-05.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-06.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-07.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-08.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-09.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-10.wav"
}
    self.SoundTbl_Suppressing = {
    "darkborn/zps/survivors/vanessa/commandmenu/fire/fire-01.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/fire/fire-02.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/fire/fire-03.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/fire/fire-04.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/fire/fire-05.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/fire/fire-06.wav"
}
    self.SoundTbl_Alert = {
    "darkborn/zps/survivors/vanessa/taunts/taunt-01.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-02.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-03.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-04.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-05.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-06.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-07.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-08.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-09.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-10.wav"
}
    self.SoundTbl_CallForHelp = {
    "darkborn/zps/survivors/vanessa/panic!/panic-01.wav",
    "darkborn/zps/survivors/vanessa/panic!/panic-02.wav",
    "darkborn/zps/survivors/vanessa/panic!/panic-03.wav",
    "darkborn/zps/survivors/vanessa/panic!/panic-04.wav",
    "darkborn/zps/survivors/vanessa/panic!/panic-05.wav",
    "darkborn/zps/survivors/vanessa/panic!/panic-06.wav"
}
    self.SoundTbl_OnReceiveOrder = {
    "darkborn/zps/survivors/vanessa/keepmoving/keepmoving-01.wav",
    "darkborn/zps/survivors/vanessa/keepmoving/keepmoving-02.wav",
    "darkborn/zps/survivors/vanessa/keepmoving/keepmoving-03.wav",
    "darkborn/zps/survivors/vanessa/keepmoving/keepmoving-04.wav",
    "darkborn/zps/survivors/vanessa/keepmoving/keepmoving-05.wav",
    "darkborn/zps/survivors/vanessa/keepmoving/keepmoving-06.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "darkborn/zps/survivors/vanessa/meleegrunts/meleegrunt-01.wav",
    "darkborn/zps/survivors/vanessa/meleegrunts/meleegrunt-02.wav",
    "darkborn/zps/survivors/vanessa/meleegrunts/meleegrunt-03.wav",
    "darkborn/zps/survivors/vanessa/meleegrunts/meleegrunt-04.wav",
    "darkborn/zps/survivors/vanessa/meleegrunts/meleegrunt-05.wav",
    "darkborn/zps/survivors/vanessa/meleegrunts/meleegrunt-06.wav"
}
    self.SoundTbl_OnKilledEnemy = {
    "darkborn/zps/survivors/vanessa/kill/kill-01.wav",
    "darkborn/zps/survivors/vanessa/kill/kill-02.wav",
    "darkborn/zps/survivors/vanessa/kill/kill-03.wav",
    "darkborn/zps/survivors/vanessa/kill/kill-04.wav",
    "darkborn/zps/survivors/vanessa/kill/kill-05.wav",
    "darkborn/zps/survivors/vanessa/kill/kill-06.wav",
    "darkborn/zps/survivors/vanessa/kill/kill-07.wav",
    "darkborn/zps/survivors/vanessa/kill/kill-08.wav"
}
    self.SoundTbl_GrenadeAttack = {
    "darkborn/zps/survivors/vanessa/taunts/taunt-01.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-02.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-03.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-04.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-05.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-06.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-07.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-08.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-09.wav",
    "darkborn/zps/survivors/vanessa/taunts/taunt-10.wav"
}
    self.SoundTbl_OnGrenadeSight = {
    "darkborn/zps/survivors/vanessa/panic!/panic-01.wav",
    "darkborn/zps/survivors/vanessa/panic!/panic-02.wav",
    "darkborn/zps/survivors/vanessa/panic!/panic-03.wav",
    "darkborn/zps/survivors/vanessa/panic!/panic-04.wav",
    "darkborn/zps/survivors/vanessa/panic!/panic-05.wav",
    "darkborn/zps/survivors/vanessa/panic!/panic-06.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-05.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-06.wav"
}
    self.SoundTbl_OnDangerSight = {
    "darkborn/zps/survivors/vanessa/panic!/panic-01.wav",
    "darkborn/zps/survivors/vanessa/panic!/panic-02.wav",
    "darkborn/zps/survivors/vanessa/panic!/panic-03.wav",
    "darkborn/zps/survivors/vanessa/panic!/panic-04.wav",
    "darkborn/zps/survivors/vanessa/panic!/panic-05.wav",
    "darkborn/zps/survivors/vanessa/panic!/panic-06.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-05.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-06.wav"
}
    self.SoundTbl_WeaponReload = {
    "darkborn/zps/survivors/vanessa/commandmenu/cover/cover-03.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/cover/cover-05.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/cover/cover-06.wav"
}
    self.SoundTbl_Pain = {
    "darkborn/zps/survivors/vanessa/pain/pain-01.wav",
    "darkborn/zps/survivors/vanessa/pain/pain-02.wav",
    "darkborn/zps/survivors/vanessa/pain/pain-03.wav",
    "darkborn/zps/survivors/vanessa/pain/pain-04.wav",
    "darkborn/zps/survivors/vanessa/pain/pain-05.wav",
    "darkborn/zps/survivors/vanessa/pain/pain-06.wav"
}
    self.SoundTbl_DamageByPlayer = {
    "darkborn/zps/survivors/vanessa/commandmenu/anger/anger-01.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/anger/anger-02.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/anger/anger-03.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/anger/anger-04.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/anger/anger-05.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/anger/anger-06.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/anger/anger-07.wav"
}
    self.SoundTbl_AllyDeath = {
    "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-01.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-02.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-03.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-04.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-05.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-06.wav"
}
    self.SoundTbl_Death = {
    "darkborn/zps/survivors/vanessa/death/deathrattle-01.wav",
    "darkborn/zps/survivors/vanessa/death/deathrattle-02.wav",
    "darkborn/zps/survivors/vanessa/death/deathrattle-03.wav",
    "darkborn/zps/survivors/vanessa/death/deathrattle-04.wav",
    "darkborn/zps/survivors/vanessa/death/deathrattle-05.wav"
}
    self.SoundTbl_MedicReceiveHeal = {
    "darkborn/zps/survivors/vanessa/commandmenu/needhealth/needhealth-01.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/needhealth/needhealth-02.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/needhealth/needhealth-03.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/needhealth/needhealth-04.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/needhealth/needhealth-05.wav"
}
    self.SoundTbl_FollowPlayer = {
    "darkborn/zps/survivors/vanessa/commandmenu/cover/cover-01.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/cover/cover-02.wav",
    "darkborn/zps/survivors/vanessa/commandmenu/cover/cover-04.wav"
}
    self.SoundTbl_Jump = {
    "darkborn/zps/survivors/vanessa/jump/jump-01.wav",
    "darkborn/zps/survivors/vanessa/jump/jump-02.wav",
    "darkborn/zps/survivors/vanessa/jump/jump-03.wav",
    "darkborn/zps/survivors/vanessa/jump/jump-04.wav"
}
    self.SoundTbl_Cough = {
    "darkborn/zps/survivors/vanessa/cough/coughing01.wav",
    "darkborn/zps/survivors/vanessa/cough/coughing02.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnChangeActivity(newAct)
 if newAct == ACT_JUMP && !self.VJ_IsBeingControlled then
    self:PlaySoundSystem("Speech",self.SoundTbl_Jump)
end
 if newAct == ACT_LAND then
    self:SetNavType(NAV_GROUND)
end
    return self.BaseClass.OnChangeActivity(newAct)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply)
    ply:ChatPrint("DUCK: Crouch")
    ply:ChatPrint("JUMP: Jump")
    ply:ChatPrint("WALK: Switch Weapon")
 if !self.IsMedic then return end
    ply:ChatPrint("USE: Heal")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
    if self.ZPS_Crouching && self.Weapon_CanFireWhileMoving && IsValid(self:GetEnemy()) then
    if (self.EnemyData.IsVisible or (self.EnemyData.LastVisibleTime + 5) > CurTime()) && self.CurrentSchedule != nil && self.CurrentSchedule.CanShootWhenMoving && self:CanFireWeapon(true, false) then
        self.WeaponAttackState = VJ.WEP_ATTACK_STATE_FIRE
    if act == ACT_WALK then
        return self:TranslateActivity(act == ACT_WALK and ACT_WALK_CROUCH_AIM)
    elseif act == ACT_RUN then
        return self:TranslateActivity(act == ACT_RUN and ACT_RUN_CROUCH_AIM)
        end
    end
end
 if act == ACT_IDLE && !self:OnGround() && !self:IsMoving() then
    return self:TranslateActivity(act == ACT_IDLE and ACT_GLIDE)
end
    /*if self.ZPS_Crouching then
    if act == ACT_IDLE then
        return self:TranslateActivity(act == ACT_IDLE and ACT_COVER_LOW)
    elseif act == ACT_WALK then
        return self:TranslateActivity(act == ACT_WALK and ACT_WALK_CROUCH_AIM)
    elseif act == ACT_RUN then
        return self:TranslateActivity(act == ACT_RUN and ACT_RUN_CROUCH_AIM)
    end
end*/
    return self.BaseClass.TranslateActivity(self,act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
   if GetConVar("VJ_ZPS_Jump"):GetInt() == 1 then
      if self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP) && self:GetNavType() != NAV_JUMP then
         if self:IsOnGround() && CurTime() > self.ZPS_NextJumpT then
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
 /*if !IsValid(self:GetActiveWeapon()) or self.DisableWeapons then
    self.SoundTbl_Alert = self.SoundTbl_CallForHelp
    self.SoundTbl_CombatIdle = self.SoundTbl_CallForHelp
end*/
    local controller = self.VJ_TheController
    if IsValid(controller) then
    if controller:KeyDown(IN_WALK) && !self:IsBusy() && CurTime() > self.ZPS_NextWepSwitchT && GetConVar("VJ_ZPS_WeaponSwitch"):GetInt() == 1 && self.WeaponInventory_MeleeList then
       //self:PlayAnim("vjges_throw_arms",true,false,false)
       self:DoChangeWeapon(VJ.PICK(self.WeaponsList_Cont["ContWeapons"]),true)
       self.ZPS_NextWepSwitchT = CurTime() + 1
end
    /*if controller:KeyDown(IN_DUCK) && !self.ZPS_Crouching then
        self.ZPS_Crouching = true
    elseif !controller:KeyDown(IN_DUCK) && self.ZPS_Crouching then
        self.ZPS_Crouching = false
    end*/
end
    if GetConVar("VJ_ZPS_Jump"):GetInt() == 1 && GetConVar("ai_disabled"):GetInt() == 0 && !self.ZPS_Panic then
        if IsValid(self:GetEnemy()) && !self.IsGuard then
            if math.random(1,100) <= 3 && !IsValid(controller) && self:Visible(self:GetEnemy()) && self.WeaponAttackState == VJ.WEP_ATTACK_STATE_FIRE then
                self:AvoidThreat()
            end
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
 //if self.ZPS_Crouching && (self:GetNPCState() != NPC_STATE_ALERT && self:GetNPCState() != NPC_STATE_COMBAT) /*or !self.WeaponAttackState*/ then self.ZPS_Crouching = false end
 if self.ZPS_InfectedVictim && !self.ZPS_ImmuneInfection && CurTime() > self.ZPS_NextCoughT then
    self:PlaySoundSystem("Speech",self.SoundTbl_Cough)
    self.ZPS_NextCoughT = CurTime() + math.Rand(5,30)
end
 if self.IsMedic && !self:IsBusy() && IsValid(self) && !self.Medic_Status && CurTime() > self.ZPS_NextSelfHealT && (self:Health() < self:GetMaxHealth() * 0.75) && ((!self.VJ_IsBeingControlled) or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_USE))) then
    self:PlayAnim("vjges_gesture_inoculator_inject_self",true,false,false)
    if IsValid(self:GetActiveWeapon()) then self:GetActiveWeapon():SetNoDraw(true) end
    local att = self:GetAttachment(self:LookupAttachment("anim_attachment_RH"))
    local inoculator = ents.Create("prop_vj_animatable")
    inoculator:SetModel("models/darkborn/zps/weapons/w_inoculator.mdl")
    inoculator:SetSkin(math.random(0,2))
    inoculator:SetPos(att.Pos)
    inoculator:SetAngles(att.Ang)
    inoculator:SetParent(self)
    inoculator:Fire("SetParentAttachment","anim_attachment_RH")
    inoculator:Spawn()
    inoculator:AddEffects(EF_BONEMERGE)
    inoculator:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
    self.Inoculator = inoculator
    self:DeleteOnRemove(inoculator)
    SafeRemoveEntityDelayed(inoculator,1.2)
 if IsValid(self:GetEnemy()) then self:SCHEDULE_COVER_ORIGIN("TASK_RUN_PATH", function(x) x.CanShootWhenMoving = true x.FaceData = {Type = VJ.FACE_ENEMY} end) end
    timer.Simple(0.7, function() if IsValid(self) && !self.Dead then
    local CurHP = self:Health()
    self:InoculatorInject()
    self:SetHealth(math.Clamp(CurHP + self.Medic_HealAmount, CurHP, self:GetMaxHealth()))
    self:PlaySoundSystem("Speech",self.SoundTbl_MedicReceiveHeal)
    VJ.CreateSound(self,self.SoundTbl_MedicAfterHeal,75,100)
    timer.Remove("timer_melee_bleed"..self:EntIndex())
    timer.Adjust("timer_melee_slowply"..self:EntIndex(), 0)
    self:RemoveAllDecals()
    timer.Simple(0.5,function() if IsValid(self) then
    if IsValid(self:GetActiveWeapon()) then self:GetActiveWeapon():SetNoDraw(false) end end end)
    end
end)
    self.ZPS_NextSelfHealT = CurTime() + math.Rand(10,20)
end
 if GetConVar("VJ_ZPS_WeaponSwitch"):GetInt() == 0 or !self.WeaponInventory_MeleeList or self.DisableWeapons or !IsValid(self:GetActiveWeapon()) then return end
    local ent = self:GetEnemy()
    local dist = self.NearestPointToEnemyDistance
    if IsValid(ent) && !self.VJ_IsBeingControlled && !self.ZPS_Panic then
        local wep = self:GetActiveWeapon()
        if self.WeaponInventoryStatus == VJ.WEP_INVENTORY_MELEE then return end
        local selectType = false
        if dist > 2200 then
            selectType = "Normal"
        elseif dist <= 2200 && dist > 650 then
            selectType = "Normal"
        else
            selectType = "Close"
end
        if selectType && !self:IsBusy() && CurTime() > self.ZPS_NextWepSwitchT && (!IsValid(wep) or (IsValid(wep) && math.random(1, wep:Clip1() > 0 && (wep:Clip1() <= wep:GetMaxClip1() *0.35) && 1 or (selectType == "Close" && 20 or 150)))) == 1 then
            self:DoChangeWeapon(VJ.PICK(self.WeaponsList[selectType]),true)
            //self:PlayAnim("vjges_throw_arms",true,false,false)
            wep = self:GetActiveWeapon()
            self.ZPS_NextWepSwitchT = CurTime() + math.Rand(6,math.Round(math.Clamp(wep:Clip1() *0.5,1,wep:Clip1())))
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAllyKilled(ent)
 if self.VJ_IsBeingControlled or self.IsGuard or (self.NextDoAnyAttackT + 2) > CurTime() then return end
    if math.random(1,5) == 1 && !self.ZPS_Panic then
        self.ZPS_Panic = true
        self:PlaySoundSystem("CallForHelp")
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SelectSchedule()
    self.BaseClass.SelectSchedule(self)
    -- Hide after an ally is killed
    if !self.Dead && self.ZPS_Panic && !self:IsBusy() && !self.VJ_IsBeingControlled then
        self.ZPS_Panic = false
        self:SCHEDULE_COVER_ENEMY("TASK_RUN_PATH", function(x) x.RunCode_OnFail = function() self.NextDoAnyAttackT = 0 end end)
        self.NextDoAnyAttackT = CurTime() + 5
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.JumpHeight = 200
function ENT:AvoidThreat()
  local maxDist = 220
  local maxDepth = 20
  local targetPos = self:GetPos() +Vector(math.Rand(-maxDist,maxDist),math.Rand(-maxDist,maxDist),maxDepth)

  if self:GetNavType() != NAV_JUMP && (IsValid(wep) && wep:Clip1() > 0 or !IsValid(wep)) then
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
    self:ForceMoveJump(self:CalculateProjectile("Curve", self:GetPos(), self:GetPos() +((((pos or self:GetPos() +self:GetUp() *100) -self:GetPos()):GetNormalized() *50) +(self:GetUp() *25)), 250))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMedicBehavior(status,statusData)
    if status == "BeforeHeal" then
        if IsValid(self:GetActiveWeapon()) then self:GetActiveWeapon():SetNoDraw(true) end
        local att = self:GetAttachment(self:LookupAttachment("anim_attachment_RH"))
        local inoculator = ents.Create("prop_vj_animatable")
        inoculator:SetModel("models/darkborn/zps/weapons/w_inoculator.mdl")
        inoculator:SetSkin(math.random(0,2))
        inoculator:SetPos(att.Pos)
        inoculator:SetAngles(att.Ang)
        inoculator:SetParent(self)
        inoculator:Fire("SetParentAttachment","anim_attachment_RH")
        inoculator:Spawn()
        inoculator:AddEffects(EF_BONEMERGE)
        inoculator:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
        self.Inoculator = inoculator
        self:DeleteOnRemove(inoculator)
        SafeRemoveEntityDelayed(inoculator,1.2)
    if inoculator:GetSkin() == 0 then
        self.Medic_HealAmount = 20
    elseif inoculator:GetSkin() == 1 then
        self.Medic_HealAmount = 0
    elseif inoculator:GetSkin() == 2 then
        self.Medic_HealAmount = 100
    end
end
 if status == "OnHeal" then
    if IsValid(statusData) && IsValid(self.Inoculator) && self.Inoculator:GetSkin() == 1 then
        if statusData.ZPS_InfectedVictim then statusData.ZPS_InfectedVictim = false end
        if statusData:IsPlayer() then timer.Create(statusData:EntIndex().."VJ_ZPS_Regen_Player",1,25,function() if IsValid(statusData) then local CurHP = statusData:Health() statusData:SetHealth(math.Clamp(CurHP + 1, CurHP, statusData:GetMaxHealth())) end end) end
        statusData.HasHealthRegeneration = true
        statusData.ZPS_ImmuneInfection = true
        VJ.CreateSound(statusData,"darkborn/zps/weapons/health/inoculator/heartbeat_158.wav",60,100)
        timer.Remove(statusData:EntIndex().."VJ_ZPS_Infection")
        hook.Remove("Think","VJ_ZPS_VictimCough")
        timer.Create(statusData:EntIndex().."VJ_ZPS_Immunity",25,1,function() if IsValid(statusData) then statusData.HasHealthRegeneration = false statusData.ZPS_ImmuneInfection = false end end)
end
        timer.Simple(0.5,function() if IsValid(self) then
        if IsValid(self:GetActiveWeapon()) then self:GetActiveWeapon():SetNoDraw(false) end end
        end)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:InoculatorInject()
    if IsValid(self.Inoculator) then
    if self.Inoculator:GetSkin() == 0 then
        self.Medic_HealAmount = 20
    elseif self.Inoculator:GetSkin() == 1 then
        self.Medic_HealAmount = 0
    elseif self.Inoculator:GetSkin() == 2 then
        self.Medic_HealAmount = 100
end
 if self.Inoculator:GetSkin() == 1 then
    if self.ZPS_InfectedVictim then self.ZPS_InfectedVictim = false end
        self.HasHealthRegeneration = true
        self.ZPS_ImmuneInfection = true
        VJ.CreateSound(self,"darkborn/zps/weapons/health/inoculator/heartbeat_158.wav",60,100)
        timer.Remove(self:EntIndex().."VJ_ZPS_Infection")
        hook.Remove("Think","VJ_ZPS_VictimCough")
        timer.Create(self:EntIndex().."VJ_ZPS_Immunity",25,1,function() if IsValid(statusData) then statusData.HasHealthRegeneration = false statusData.ZPS_ImmuneInfection = false end end)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)
 if IsValid(self:GetActiveWeapon()) && !self.WeaponEntity.IsMeleeWeapon then
    self.MeleeAttackDamage = 25
    self.MeleeAttackDamageType = DMG_CLUB
    self.SoundTbl_MeleeAttackExtra = {
    "darkborn/zps/weapons/melee/push/push_hit-01.wav",
    "darkborn/zps/weapons/melee/push/push_hit-02.wav",
    "darkborn/zps/weapons/melee/push/push_hit-03.wav",
    "darkborn/zps/weapons/melee/push/push_hit-04.wav"
}
    self.SoundTbl_MeleeAttackMiss = {
    "npc/zombie/claw_miss1.wav",
    "npc/zombie/claw_miss2.wav"
}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnWeaponAttack()
 if self.VJ_IsBeingControlled then return end
 local wep = self.WeaponEntity
 if wep.IsMeleeWeapon then self.MeleeAttackAnimationFaceEnemy = false else self.MeleeAttackAnimationFaceEnemy = true end
 if self.Weapon_StrafeWhileFiring && !self.IsGuard && !self.IsFollowing && (wep.IsMeleeWeapon) && self.WeaponAttackState == VJ.WEP_ATTACK_STATE_FIRE && CurTime() > self.NextWeaponStrafeWhileFiringT && (CurTime() - self.EnemyData.TimeSinceAcquired) > 2 then
 timer.Simple(0,function()
    local moveCheck = VJ.PICK(VJ.TraceDirections(self, "Quick", math.random(150, 250), true, false, 8, true))
    if moveCheck then
    self:StopMoving()
    self.NextWeaponStrafeWhileFiringT = CurTime() + math.Rand(self.Weapon_StrafeWhileFiringDelay.a, self.Weapon_StrafeWhileFiringDelay.b)
    self:SetLastPosition(moveCheck)
    self:SCHEDULE_GOTO_POSITION("TASK_RUN_PATH", function(x) x:EngTask("TASK_FACE_ENEMY", 0) x.CanShootWhenMoving = true x.FaceData = {Type = VJ.FACE_ENEMY} end) end end) end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnWeaponStrafeWhileFiring()
  if self.VJ_IsBeingControlled then return end
    if math.random(1,2) == 1 && !self.ZPS_Crouching then
        self.ZPS_Crouching = true
    //elseif math.random(1,2) == 1 && self.ZPS_Crouching then
    else
        self.ZPS_Crouching = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnWeaponReload()
 if IsValid(self:GetActiveWeapon()) then
 local wep = self:GetActiveWeapon()
 local wepHoldType = wep:GetHoldType()
 if wepHoldType == "grenade" then
    self.DisableWeaponReloadAnimation = true
 else
    self.DisableWeaponReloadAnimation = false
    end
end
 //if self.Weapon_FindCoverOnReload then self:SCHEDULE_COVER_ORIGIN("TASK_RUN_PATH", function(x) x.CanShootWhenMoving = true x.ConstantlyFaceEnemy_IfVisible = (IsValid(self:GetActiveWeapon()) and true) or false x.DisableChasingEnemy = false end) return end
 if self.IsGuard or self.ZPS_Panic or self.VJ_IsBeingControlled or !IsValid(self:GetEnemy()) or self.Weapon_FindCoverOnReload or GetConVar("VJ_ZPS_ReloadRun"):GetInt() == 0 or self:DoCoverTrace(self:GetPos() + self:OBBCenter(), self:GetEnemy():EyePos(), false, {SetLastHiddenTime=true}) then return end
 timer.Simple(0,function()
    local moveCheck = VJ.PICK(VJ.TraceDirections(self, "Quick", math.random(150, 400), true, false, 8, true))
    if moveCheck then
    self:StopMoving()
    self:SetLastPosition(moveCheck)
    self:SCHEDULE_GOTO_POSITION(VJ.PICK({"TASK_RUN_PATH", "TASK_WALK_PATH"}), function(x) x:EngTask("TASK_FACE_ENEMY", 0) x.CanShootWhenMoving = true x.FaceData = {Type = VJ.FACE_ENEMY} end) end end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
/*function ENT:OnChangeWeapon(newWeapon,oldWeapon,invSwitch)
    if invSwitch then
        self:PlayAnim("vjges_throw_arms",true,false,false)
    end
end*/
---------------------------------------------------------------------------------------------------------------------------------------------
/*function ENT:OnGrenadeAttack(status,grenade,customEnt,landDir,landingPos)
 if status == "Start" then
    if IsValid(self:GetActiveWeapon()) then self:GetActiveWeapon():SetNoDraw(true) end
    local att = self:GetAttachment(self:LookupAttachment("anim_attachment_LH"))
    self.FakeGrenade = ents.Create("prop_vj_animatable")
    self.FakeGrenade:SetModel(self.GrenadeAttackModel)
    self.FakeGrenade:SetPos(att.Pos)
    self.FakeGrenade:SetAngles(att.Ang)
    self.FakeGrenade:SetParent(self)
    self.FakeGrenade:Fire("SetParentAttachment","anim_attachment_LH")
    self.FakeGrenade:Spawn()
    self.FakeGrenade:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
    self:DeleteOnRemove(self.FakeGrenade)
    SafeRemoveEntityDelayed(self.FakeGrenade,self.TimeUntilGrenadeIsReleased)
end
 if status == "Throw" then
    //SafeRemoveEntity(self.FakeGrenade)
    if IsValid(self:GetActiveWeapon()) then self:GetActiveWeapon():SetNoDraw(false) end
    return (landingPos - grenade:GetPos()) + (self:GetUp()*200 + self:GetForward()*500 + self:GetRight()*math.Rand(-20, 20)) end
end*/
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetAnimationTranslations(h)
    local defIdleAim = ACT_IDLE -- ACT_IDLE_ANGRY
    local defWalkAim = ACT_WALK
    local defRunAim = ACT_RUN
    local defFire = ACT_RANGE_ATTACK1
    local defCrouch = ACT_RANGE_ATTACK1_LOW
    local defCrawl = ACT_RUN_CROUCH
    local defReload = ACT_RELOAD
    local defJump = ACT_JUMP
    local defGlide = ACT_GLIDE
    local defLand = ACT_LAND

    if self:GetActiveWeapon().ZPS_HType then -- Allow for more than default hold types
        h = self:GetActiveWeapon().ZPS_HType
end

    if h == "smg" then
        defIdleAim = VJ.SequenceToActivity(self,"mp5_idle")
        defWalkAim = VJ.SequenceToActivity(self,"mp5_walk")
        defRunAim = VJ.SequenceToActivity(self,"mp5_run")
        defCrouch = VJ.SequenceToActivity(self,"mp5_idle_crouch")
        defCrawl = VJ.SequenceToActivity(self,"mp5_walk_crouch")
        defFire = "vjges_gesture_shoot_mp5"
        defReload = "vjges_gesture_reload_mp5"
        defJump = VJ.SequenceToActivity(self,"mp5_jump")
        defGlide = VJ.SequenceToActivity(self,"mp5_jump")
        defLand = VJ.SequenceToActivity(self,"mp5_idle")
    elseif h == "ar2" or h == "rpg" then
        defIdleAim = VJ.SequenceToActivity(self,"rifle_idle")
        defWalkAim = VJ.SequenceToActivity(self,"rifle_walk")
        defRunAim = VJ.SequenceToActivity(self,"rifle_run")
        defCrouch = VJ.SequenceToActivity(self,"rifle_idle_crouch")
        defCrawl = VJ.SequenceToActivity(self,"rifle_walk_crouch")
        defFire = "vjges_gesture_shoot_rifle"
        defReload = "vjges_gesture_reload_rifle"
        defJump = VJ.SequenceToActivity(self,"rifle_jump")
        defGlide = VJ.SequenceToActivity(self,"rifle_jump")
        defLand = VJ.SequenceToActivity(self,"rifle_idle")
    elseif h == "m4" then
        defIdleAim = VJ.SequenceToActivity(self,"m4_idle")
        defWalkAim = VJ.SequenceToActivity(self,"m4_walk")
        defRunAim = VJ.SequenceToActivity(self,"m4_run")
        defCrouch = VJ.SequenceToActivity(self,"m4_idle_crouch")
        defCrawl = VJ.SequenceToActivity(self,"m4_walk_crouch")
        defFire = "vjges_gesture_shoot_m4"
        defReload = "vjges_gesture_reload_m4"
        defJump = VJ.SequenceToActivity(self,"m4_jump")
        defGlide = VJ.SequenceToActivity(self,"m4_jump")
        defLand = VJ.SequenceToActivity(self,"m4_idle")
    elseif h == "shotgun" then
        defIdleAim = VJ.SequenceToActivity(self,"shotgun_idle")
        defWalkAim = VJ.SequenceToActivity(self,"shotgun_walk")
        defRunAim = VJ.SequenceToActivity(self,"shotgun_run")
        defCrouch = VJ.SequenceToActivity(self,"shotgun_idle_crouch")
        defCrawl = VJ.SequenceToActivity(self,"shotgun_walk_crouch")
        defFire = "vjges_gesture_shoot_shotgun"
        defReload = "vjges_gesture_reload_shotgun"
        defJump = VJ.SequenceToActivity(self,"shotgun_jump")
        defGlide = VJ.SequenceToActivity(self,"shotgun_jump")
        defLand = VJ.SequenceToActivity(self,"shotgun_idle")
    elseif h == "shorty" then
        defIdleAim = VJ.SequenceToActivity(self,"shotgun_shorty_idle")
        defWalkAim = VJ.SequenceToActivity(self,"shotgun_shorty_walk")
        defRunAim = VJ.SequenceToActivity(self,"shotgun_shorty_run")
        defCrouch = VJ.SequenceToActivity(self,"shotgun_shorty_idle_crouch")
        defCrawl = VJ.SequenceToActivity(self,"shotgun_shorty_walk_crouch")
        defFire = "vjges_gesture_shoot_shotgun_shorty"
        defReload = "vjges_gesture_reload_shorty"
        defJump = VJ.SequenceToActivity(self,"shotgun_shorty_jump")
        defGlide = VJ.SequenceToActivity(self,"shotgun_shorty_jump")
        defLand = VJ.SequenceToActivity(self,"shotgun_shorty_idle")
    elseif h == "winchester" or h == "crossbow" then
        defIdleAim = VJ.SequenceToActivity(self,"shotgun_winchester_idle")
        defWalkAim = VJ.SequenceToActivity(self,"shotgun_winchester_walk")
        defRunAim = VJ.SequenceToActivity(self,"shotgun_winchester_run")
        defCrouch = VJ.SequenceToActivity(self,"shotgun_winchester_idle_crouch")
        defCrawl = VJ.SequenceToActivity(self,"shotgun_winchester_walk_crouch")
        defFire = "vjges_gesture_shoot_shotgun_winchester"
        defReload = "vjges_gesture_reload_winchester"
        defJump = VJ.SequenceToActivity(self,"shotgun_winchester_jump")
        defGlide = VJ.SequenceToActivity(self,"shotgun_winchester_jump")
        defLand = VJ.SequenceToActivity(self,"shotgun_winchester_idle")
    elseif h == "pistol" then
        defIdleAim = VJ.SequenceToActivity(self,"pistol_idle")
        defWalkAim = VJ.SequenceToActivity(self,"pistol_walk")
        defRunAim = VJ.SequenceToActivity(self,"pistol_run")
        defCrouch = VJ.SequenceToActivity(self,"pistol_idle_crouch")
        defCrawl = VJ.SequenceToActivity(self,"pistol_walk_crouch")
        defFire = "vjges_gesture_shoot_pistol"
        defReload = "vjges_gesture_reload_pistol"
        defJump = VJ.SequenceToActivity(self,"pistol_jump")
        defGlide = VJ.SequenceToActivity(self,"pistol_jump")
        defLand = VJ.SequenceToActivity(self,"pistol_idle")
    elseif h == "revolver" then
        defIdleAim = VJ.SequenceToActivity(self,"revolver_idle")
        defWalkAim = VJ.SequenceToActivity(self,"revolver_walk")
        defRunAim = VJ.SequenceToActivity(self,"revolver_run")
        defCrouch = VJ.SequenceToActivity(self,"revolver_idle_crouch")
        defCrawl = VJ.SequenceToActivity(self,"revolver_walk_crouch")
        defFire = "vjges_gesture_shoot_revolver"
        defReload = "vjges_gesture_reload_revolver"
        defJump = VJ.SequenceToActivity(self,"revolver_jump")
        defGlide = VJ.SequenceToActivity(self,"revolver_jump")
        defLand = VJ.SequenceToActivity(self,"revolver_idle")
    elseif h == "grenade" then
        defIdleAim = VJ.SequenceToActivity(self,"frag_idle")
        defWalkAim = VJ.SequenceToActivity(self,"frag_walk")
        defRunAim = VJ.SequenceToActivity(self,"frag_run")
        defCrouch = VJ.SequenceToActivity(self,"frag_idle_crouch")
        defCrawl = VJ.SequenceToActivity(self,"frag_walk_crouch")
        defFire = "vjges_gesture_throw_grenade"
        //defReload = "vjges_gesture_reload_pistol"
        defJump = VJ.SequenceToActivity(self,"frag_jump")
        defGlide = VJ.SequenceToActivity(self,"frag_jump")
        defLand = VJ.SequenceToActivity(self,"frag_idle")
    elseif h == "ied" then
        defIdleAim = VJ.SequenceToActivity(self,"ied_idle")
        defWalkAim = VJ.SequenceToActivity(self,"ied_walk")
        defRunAim = VJ.SequenceToActivity(self,"ied_run")
        defCrouch = VJ.SequenceToActivity(self,"ied_idle_crouch")
        defCrawl = VJ.SequenceToActivity(self,"ied_walk_crouch")
        defFire = "vjges_gesture_throw_grenade"
        //defReload = "vjges_gesture_reload_pistol"
        defJump = VJ.SequenceToActivity(self,"ied_jump")
        defGlide = VJ.SequenceToActivity(self,"ied_jump")
        defLand = VJ.SequenceToActivity(self,"ied_idle")
    elseif h == "melee" then
        defIdleAim = VJ.SequenceToActivity(self,"melee_idle")
        defWalkAim = VJ.SequenceToActivity(self,"melee_walk")
        defRunAim = VJ.SequenceToActivity(self,"melee_run")
        defCrouch = VJ.SequenceToActivity(self,"melee_idle_crouch")
        defCrawl = VJ.SequenceToActivity(self,"melee_walk_crouch")
        defFire = "vjges_g_attack_1handed"
        defReload = false
        defJump = VJ.SequenceToActivity(self,"melee_jump")
        defGlide = VJ.SequenceToActivity(self,"melee_jump")
        defLand = VJ.SequenceToActivity(self,"melee_idle")
    elseif h == "hammer" then
        defIdleAim = VJ.SequenceToActivity(self,"hammer_idle")
        defWalkAim = VJ.SequenceToActivity(self,"hammer_walk")
        defRunAim = VJ.SequenceToActivity(self,"hammer_run")
        defCrouch = VJ.SequenceToActivity(self,"hammer_idle_crouch")
        defCrawl = VJ.SequenceToActivity(self,"hammer_walk_crouch")
        defFire = "vjges_g_attack_1handed"
        defReload = false
        defJump = VJ.SequenceToActivity(self,"hammer_jump")
        defGlide = VJ.SequenceToActivity(self,"hammer_jump")
        defLand = VJ.SequenceToActivity(self,"hammer_idle")
    elseif h == "melee2" then
        defIdleAim = VJ.SequenceToActivity(self,"melee_2handed_light_idle")
        defWalkAim = VJ.SequenceToActivity(self,"melee_2handed_walk")
        defRunAim = VJ.SequenceToActivity(self,"melee_2handed_run")
        defCrouch = VJ.SequenceToActivity(self,"melee_2handed_idle_crouch")
        defCrawl = VJ.SequenceToActivity(self,"melee_2handed_walk_crouch")
        defFire = "vjges_g_attack_2handed_light"
        defReload = false
        defJump = VJ.SequenceToActivity(self,"melee_2handed_jump")
        defGlide = VJ.SequenceToActivity(self,"melee_2handed_jump")
        defLand = VJ.SequenceToActivity(self,"melee_2handed_light_idle")
    elseif h == "2handheavy" then
        defIdleAim = VJ.SequenceToActivity(self,"melee_2handed_idle")
        defWalkAim = VJ.SequenceToActivity(self,"melee_2handed_heavy_walk")
        defRunAim = VJ.SequenceToActivity(self,"melee_2handed_heavy_run")
        defCrouch = VJ.SequenceToActivity(self,"melee_2handed_heavy_idle_crouch")
        defCrawl = VJ.SequenceToActivity(self,"melee_2handed_heavy_walk_crouch")
        defFire = "vjges_g_attack_2handed_heavy"
        defReload = false
        defJump = VJ.SequenceToActivity(self,"melee_2handed_heavy_jump")
        defGlide = VJ.SequenceToActivity(self,"melee_2handed_heavy_jump")
        defLand = VJ.SequenceToActivity(self,"melee_2handed_heavy_idle")
    elseif h == "chair" then
        defIdleAim = VJ.SequenceToActivity(self,"melee_chair_idle")
        defWalkAim = VJ.SequenceToActivity(self,"melee_chair_walk")
        defRunAim = VJ.SequenceToActivity(self,"melee_chair_run")
        defCrouch = VJ.SequenceToActivity(self,"melee_chair_idle_crouch")
        defCrawl = VJ.SequenceToActivity(self,"melee_chair_walk_crouch")
        defFire = "vjges_g_attack_2handed_chair"
        defReload = false
        defJump = VJ.SequenceToActivity(self,"melee_chair_jump")
        defGlide = VJ.SequenceToActivity(self,"melee_chair_jump")
        defLand = VJ.SequenceToActivity(self,"melee_chair_idle")
    elseif h == "fists" then
        defIdleAim = VJ.SequenceToActivity(self,"empty_idle")
        defWalkAim = VJ.SequenceToActivity(self,"empty_walk")
        defRunAim = VJ.SequenceToActivity(self,"empty_run")
        defCrouch = VJ.SequenceToActivity(self,"empty_idle_crouch")
        defCrawl = VJ.SequenceToActivity(self,"empty_walk_crouch")
        defFire = VJ.PICK({"vjges_gesture_punch_l","vjges_gesture_punch_r"})
        defReload = false
        defJump = VJ.SequenceToActivity(self,"empty_jump")
        defGlide = VJ.SequenceToActivity(self,"empty_jump")
        defLand = VJ.SequenceToActivity(self,"empty_idle")
end

    self.AnimationTranslations[ACT_IDLE] = defIdleAim
    self.AnimationTranslations[ACT_IDLE_ANGRY] = defIdleAim
    self.AnimationTranslations[ACT_WALK] = defWalkAim
    self.AnimationTranslations[ACT_WALK_AGITATED] = defWalkAim
    self.AnimationTranslations[ACT_WALK_AIM] = defWalkAim
    self.AnimationTranslations[ACT_RUN] = defRunAim
    self.AnimationTranslations[ACT_RUN_AGITATED] = defRunAim
    self.AnimationTranslations[ACT_RUN_AIM] = defRunAim
    self.AnimationTranslations[ACT_RANGE_ATTACK1] = defIdleAim
    self.AnimationTranslations[ACT_RANGE_ATTACK1_LOW] = defCrouch
    self.AnimationTranslations[ACT_COVER_LOW] = defCrouch
    self.AnimationTranslations[ACT_WALK_CROUCH] = defCrawl
    self.AnimationTranslations[ACT_WALK_CROUCH_AIM] = defCrawl
    self.AnimationTranslations[ACT_RUN_CROUCH] = defCrawl
    self.AnimationTranslations[ACT_RUN_CROUCH_AIM] = defCrawl
    self.AnimationTranslations[ACT_GESTURE_RANGE_ATTACK1] = defFire
    self.AnimationTranslations[ACT_GESTURE_RANGE_ATTACK2] = defFire
    self.AnimationTranslations[ACT_RELOAD] = defReload
    self.AnimationTranslations[ACT_RELOAD_LOW] = defReload
    self.AnimationTranslations[ACT_JUMP] = defJump
    self.AnimationTranslations[ACT_GLIDE] = defGlide
    self.AnimationTranslations[ACT_LAND] = defLand
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo,hitgroup,status)
 -- Unique headshot sounds
 if status == "PostDamage" && hitgroup == HITGROUP_HEAD then
    self:PlaySoundSystem("Impact",{"darkborn/zps/shared/impacts/flesh_impact_headshot-02.wav","darkborn/zps/shared/impacts/flesh_impact_headshot-03.wav"})
end
    -- For Armor
    if self.ZPS_Armor then self.ZPS_ArmorHP = self.ZPS_ArmorHP -dmginfo:GetDamage()
    if status == "PreDamage" && self.ZPS_ArmorHP > 0 && (dmginfo:IsBulletDamage() or dmginfo:IsDamageType(DMG_SLASH) or dmginfo:IsDamageType(DMG_CLUB)) then
        dmginfo:ScaleDamage(0.80)
        if self.HasSounds && self.HasImpactSounds && (hitgroup == HITGROUP_CHEST or hitgroup == HITGROUP_STOMACH or hitgroup == HITGROUP_GEAR) then VJ_EmitSound(self,"VJ.Impact.Armor")
        local spark = ents.Create("env_spark")
        spark:SetKeyValue("Magnitude","1")
        spark:SetKeyValue("Spark Trail Length","1")
        spark:SetPos(dmginfo:GetDamagePosition())
        spark:SetAngles(self:GetAngles())
        spark:SetParent(self)
        spark:Spawn()
        spark:Activate()
        spark:Fire("StartSpark","",0)
        spark:Fire("StopSpark","",0.001)
        self:DeleteOnRemove(spark) end end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
/*function ENT:OnDeathWeaponDrop(dmginfo,hitgroup,wepEnt)
    if wepEnt:GetClass() == "weapon_vj_zps_fists" then
        wepEnt:Remove()
    end
end*/
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HandleGibOnDeath(dmginfo,hitgroup)
 if GetConVar("VJ_ZPS_Gib"):GetInt() == 0 then return end
    self.HasDeathSounds = false
    VJ.EmitSound(self,"darkborn/zps/shared/impacts/flesh_bodyexplode1.wav",75,100)
 if self.HasGibOnDeathEffects then
    ParticleEffect("vj_zps_blood_explode_01",self:GetPos(),self:GetAngles())
end
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
 if GetConVar("VJ_ZPS_HeadGib"):GetInt() == 0 or GetConVar("VJ_ZPS_OldModels"):GetInt() == 1 then return end
 if dmginfo:GetDamageForce():Length() < 800 then return end
 if hitgroup == HITGROUP_HEAD then
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
    if hitgroup == HITGROUP_HEAD && self.HasGibOnDeathEffects && (corpseEnt:GetBodygroup(0) != 0 or corpseEnt:GetBodygroup(1) != 0 or corpseEnt:GetBodygroup(2) != 0 or corpseEnt:GetBodygroup(3) != 0) then
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
end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootSteps = {
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
        "darkborn/zps/shared/footsteps/concrete1.wav",
        "darkborn/zps/shared/footsteps/concrete2.wav",
        "darkborn/zps/shared/footsteps/concrete3.wav",
        "darkborn/zps/shared/footsteps/concrete4.wav",
    },
    [MAT_DIRT] = {
        "darkborn/zps/shared/footsteps/dirt1.wav",
        "darkborn/zps/shared/footsteps/dirt2.wav",
        "darkborn/zps/shared/footsteps/dirt3.wav",
        "darkborn/zps/shared/footsteps/dirt4.wav",
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
    [MAT_PLASTIC] = {
        "physics/plaster/drywall_footstep1.wav",
        "physics/plaster/drywall_footstep2.wav",
        "physics/plaster/drywall_footstep3.wav",
        "physics/plaster/drywall_footstep4.wav",
    },
    [MAT_METAL] = {
        "darkborn/zps/shared/footsteps/metal1.wav",
        "darkborn/zps/shared/footsteps/metal2.wav",
        "darkborn/zps/shared/footsteps/metal3.wav",
        "darkborn/zps/shared/footsteps/metal4.wav",
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
        "darkborn/zps/shared/survivor_footsteps/tile1.wav",
        "darkborn/zps/shared/survivor_footsteps/tile2.wav",
        "darkborn/zps/shared/survivor_footsteps/tile3.wav",
        "darkborn/zps/shared/survivor_footsteps/tile4.wav",
    },
    [85] = { -- Grass
        "darkborn/zps/shared/footsteps/grass1.wav",
        "darkborn/zps/shared/footsteps/grass2.wav",
        "darkborn/zps/shared/footsteps/grass3.wav",
        "darkborn/zps/shared/footsteps/grass4.wav",
    },
    [MAT_VENT] = {
        "darkborn/zps/shared/footsteps/duct1.wav",
        "darkborn/zps/shared/footsteps/duct2.wav",
        "darkborn/zps/shared/footsteps/duct3.wav",
        "darkborn/zps/shared/footsteps/duct4.wav",
    },
    [MAT_WOOD] = {
        "darkborn/zps/shared/footsteps/wood1.wav",
        "darkborn/zps/shared/footsteps/wood2.wav",
        "darkborn/zps/shared/footsteps/wood3.wav",
        "darkborn/zps/shared/footsteps/wood4.wav",
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
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFootstepSound()
    if !self:IsOnGround() then return end
    local tr = util.TraceLine({
        start = self:GetPos(),
        endpos = self:GetPos() +Vector(0,0,-150),
        filter = {self}
    })
    if tr.Hit && self.FootSteps[tr.MatType] then
        VJ.EmitSound(self,VJ.PICK(self.FootSteps[tr.MatType]),self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
end
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self,"player/footsteps/wade" .. math.random(1,8) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rightypes reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
