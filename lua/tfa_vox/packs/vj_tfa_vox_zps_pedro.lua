TFAVOX_Models = TFAVOX_Models or {""}

local model = "models/darkborn/zps/survivors/pms/pedro.mdl"

local tmptbl = string.Split(model,"/")
local mdlprefix = tmptbl[#tmptbl] or model
mdlprefix = string.Replace(mdlprefix,".mdl","")
if model == "models/player/player.mdl" then return end

TFAVOX_Models[model] = {
    ['main'] = {--subtable id
        ['heal'] = {--event id
            ['delay']= nil,--delay ( nil to autocalc )
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"heal",{""}) --sound path(s)
        },
        ['healmax'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"healmax",{""})
        },
        ['crithit'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"crithit",{""})
        },
        ['crithealth'] = {
            ['delay']= 10,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"crithealth",{
            "darkborn/zps/survivors/pedro/commandmenu/needhealth/needhealth-01.wav",
            "darkborn/zps/survivors/pedro/commandmenu/needhealth/needhealth-02.wav",
            "darkborn/zps/survivors/pedro/commandmenu/needhealth/needhealth-03.wav",
            "darkborn/zps/survivors/pedro/commandmenu/needhealth/needhealth-04.wav",
            "darkborn/zps/survivors/pedro/commandmenu/needhealth/needhealth-05.wav"
            })
        },
        ['death'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"death",{
            "darkborn/zps/survivors/pedro/death/death-01.wav",
            "darkborn/zps/survivors/pedro/death/death-02.wav",
            "darkborn/zps/survivors/pedro/death/death-03.wav",
            "darkborn/zps/survivors/pedro/death/death-04.wav",
            "darkborn/zps/survivors/pedro/death/death-05.wav",
            "darkborn/zps/survivors/pedro/death/death-06.wav"
            })
        },
        ['spawn'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"spawn",{
            "darkborn/zps/survivors/pedro/go/go-01.wav",
            "darkborn/zps/survivors/pedro/go/go-02.wav",
            "darkborn/zps/survivors/pedro/go/go-03.wav",
            "darkborn/zps/survivors/pedro/go/go-04.wav",
            "darkborn/zps/survivors/pedro/go/go-05.wav",
            "darkborn/zps/survivors/pedro/go/go-06.wav"
            })
        },
        ['pickup'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"pickup",{""})
        },
        ['reload'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"reload",{""})
        },
        ['noammo'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"noammo",{
            "darkborn/zps/survivors/pedro/commandmenu/needammo/needammo-01.wav",
            "darkborn/zps/survivors/pedro/commandmenu/needammo/needammo-02.wav",
            "darkborn/zps/survivors/pedro/commandmenu/needammo/needammo-03.wav",
            "darkborn/zps/survivors/pedro/commandmenu/needammo/needammo-04.wav"
            })
        },
        ['fall'] = {
            ['delay']= 8,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"fall",{""})
        },
        ['jump'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"jump",{
            "darkborn/zps/survivors/pedro/jump/jump-01.wav",
            "darkborn/zps/survivors/pedro/jump/jump-02.wav",
            "darkborn/zps/survivors/pedro/jump/jump-03.wav",
            "darkborn/zps/survivors/pedro/jump/jump-04.wav",
            "darkborn/zps/survivors/pedro/jump/jump-05.wav",
            "darkborn/zps/survivors/pedro/jump/jump-06.wav"
            })
        },
        ['step'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"step",{""})
        }
    },
    ['murder'] = {
        ['combine'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdcomb",{
            "darkborn/zps/survivors/pedro/kill/kill-01.wav",
            "darkborn/zps/survivors/pedro/kill/kill-02.wav",
            "darkborn/zps/survivors/pedro/kill/kill-03.wav",
            "darkborn/zps/survivors/pedro/kill/kill-04.wav",
            "darkborn/zps/survivors/pedro/kill/kill-05.wav",
            "darkborn/zps/survivors/pedro/kill/kill-06.wav",
            "darkborn/zps/survivors/pedro/kill/kill-07.wav",
            "darkborn/zps/survivors/pedro/kill/kill-08.wav",
            "darkborn/zps/survivors/pedro/kill/kill-09.wav"
            })
        },
        ['cp'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdcp",{
            "darkborn/zps/survivors/pedro/kill/kill-01.wav",
            "darkborn/zps/survivors/pedro/kill/kill-02.wav",
            "darkborn/zps/survivors/pedro/kill/kill-03.wav",
            "darkborn/zps/survivors/pedro/kill/kill-04.wav",
            "darkborn/zps/survivors/pedro/kill/kill-05.wav",
            "darkborn/zps/survivors/pedro/kill/kill-06.wav",
            "darkborn/zps/survivors/pedro/kill/kill-07.wav",
            "darkborn/zps/survivors/pedro/kill/kill-08.wav",
            "darkborn/zps/survivors/pedro/kill/kill-09.wav"
            })
        },
        ['zombie'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdzom",{
            "darkborn/zps/survivors/pedro/kill/kill-01.wav",
            "darkborn/zps/survivors/pedro/kill/kill-02.wav",
            "darkborn/zps/survivors/pedro/kill/kill-03.wav",
            "darkborn/zps/survivors/pedro/kill/kill-04.wav",
            "darkborn/zps/survivors/pedro/kill/kill-05.wav",
            "darkborn/zps/survivors/pedro/kill/kill-06.wav",
            "darkborn/zps/survivors/pedro/kill/kill-07.wav",
            "darkborn/zps/survivors/pedro/kill/kill-08.wav",
            "darkborn/zps/survivors/pedro/kill/kill-09.wav"
            })
        },
        ['headcrab'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdhc",{
            "darkborn/zps/survivors/pedro/kill/kill-01.wav",
            "darkborn/zps/survivors/pedro/kill/kill-02.wav",
            "darkborn/zps/survivors/pedro/kill/kill-03.wav",
            "darkborn/zps/survivors/pedro/kill/kill-04.wav",
            "darkborn/zps/survivors/pedro/kill/kill-05.wav",
            "darkborn/zps/survivors/pedro/kill/kill-06.wav",
            "darkborn/zps/survivors/pedro/kill/kill-07.wav",
            "darkborn/zps/survivors/pedro/kill/kill-08.wav",
            "darkborn/zps/survivors/pedro/kill/kill-09.wav"
            })
        },
        ['antlion'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdant",{
            "darkborn/zps/survivors/pedro/kill/kill-01.wav",
            "darkborn/zps/survivors/pedro/kill/kill-02.wav",
            "darkborn/zps/survivors/pedro/kill/kill-03.wav",
            "darkborn/zps/survivors/pedro/kill/kill-04.wav",
            "darkborn/zps/survivors/pedro/kill/kill-05.wav",
            "darkborn/zps/survivors/pedro/kill/kill-06.wav",
            "darkborn/zps/survivors/pedro/kill/kill-07.wav",
            "darkborn/zps/survivors/pedro/kill/kill-08.wav",
            "darkborn/zps/survivors/pedro/kill/kill-09.wav"
            })
        },
        ['barnacle'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdbarn",{
            "darkborn/zps/survivors/pedro/kill/kill-01.wav",
            "darkborn/zps/survivors/pedro/kill/kill-02.wav",
            "darkborn/zps/survivors/pedro/kill/kill-03.wav",
            "darkborn/zps/survivors/pedro/kill/kill-04.wav",
            "darkborn/zps/survivors/pedro/kill/kill-05.wav",
            "darkborn/zps/survivors/pedro/kill/kill-06.wav",
            "darkborn/zps/survivors/pedro/kill/kill-07.wav",
            "darkborn/zps/survivors/pedro/kill/kill-08.wav",
            "darkborn/zps/survivors/pedro/kill/kill-09.wav"
            })
        },
        ['manhack'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdmh",{
            "darkborn/zps/survivors/pedro/kill/kill-01.wav",
            "darkborn/zps/survivors/pedro/kill/kill-02.wav",
            "darkborn/zps/survivors/pedro/kill/kill-03.wav",
            "darkborn/zps/survivors/pedro/kill/kill-04.wav",
            "darkborn/zps/survivors/pedro/kill/kill-05.wav",
            "darkborn/zps/survivors/pedro/kill/kill-06.wav",
            "darkborn/zps/survivors/pedro/kill/kill-07.wav",
            "darkborn/zps/survivors/pedro/kill/kill-08.wav",
            "darkborn/zps/survivors/pedro/kill/kill-09.wav"
            })
        },
        ['scanner'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdsca",{
            "darkborn/zps/survivors/pedro/kill/kill-01.wav",
            "darkborn/zps/survivors/pedro/kill/kill-02.wav",
            "darkborn/zps/survivors/pedro/kill/kill-03.wav",
            "darkborn/zps/survivors/pedro/kill/kill-04.wav",
            "darkborn/zps/survivors/pedro/kill/kill-05.wav",
            "darkborn/zps/survivors/pedro/kill/kill-06.wav",
            "darkborn/zps/survivors/pedro/kill/kill-07.wav",
            "darkborn/zps/survivors/pedro/kill/kill-08.wav",
            "darkborn/zps/survivors/pedro/kill/kill-09.wav"
            })
        },
        ['sniper'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdsni",{
            "darkborn/zps/survivors/pedro/kill/kill-01.wav",
            "darkborn/zps/survivors/pedro/kill/kill-02.wav",
            "darkborn/zps/survivors/pedro/kill/kill-03.wav",
            "darkborn/zps/survivors/pedro/kill/kill-04.wav",
            "darkborn/zps/survivors/pedro/kill/kill-05.wav",
            "darkborn/zps/survivors/pedro/kill/kill-06.wav",
            "darkborn/zps/survivors/pedro/kill/kill-07.wav",
            "darkborn/zps/survivors/pedro/kill/kill-08.wav",
            "darkborn/zps/survivors/pedro/kill/kill-09.wav"
            })
        },
        ['turret'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdtur",{
            "darkborn/zps/survivors/pedro/kill/kill-01.wav",
            "darkborn/zps/survivors/pedro/kill/kill-02.wav",
            "darkborn/zps/survivors/pedro/kill/kill-03.wav",
            "darkborn/zps/survivors/pedro/kill/kill-04.wav",
            "darkborn/zps/survivors/pedro/kill/kill-05.wav",
            "darkborn/zps/survivors/pedro/kill/kill-06.wav",
            "darkborn/zps/survivors/pedro/kill/kill-07.wav",
            "darkborn/zps/survivors/pedro/kill/kill-08.wav",
            "darkborn/zps/survivors/pedro/kill/kill-09.wav"
            })
        },
        ['ally'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdally",{
            "darkborn/zps/survivors/pedro/kill/kill-01.wav",
            "darkborn/zps/survivors/pedro/kill/kill-02.wav",
            "darkborn/zps/survivors/pedro/kill/kill-03.wav",
            "darkborn/zps/survivors/pedro/kill/kill-04.wav",
            "darkborn/zps/survivors/pedro/kill/kill-05.wav",
            "darkborn/zps/survivors/pedro/kill/kill-06.wav",
            "darkborn/zps/survivors/pedro/kill/kill-07.wav",
            "darkborn/zps/survivors/pedro/kill/kill-08.wav",
            "darkborn/zps/survivors/pedro/kill/kill-09.wav"
            })
        },
        -- ['npc_pigeon'] = { -- classname overrides category entry
            -- ['delay']= nil,
            -- ['sound'] = TFAVOX_GenerateSound( mdlprefix, "murdpigeon", { "snd1", "snd2", "snd3" } )
        -- },
        ['generic'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdgener",{
            "darkborn/zps/survivors/pedro/kill/kill-01.wav",
            "darkborn/zps/survivors/pedro/kill/kill-02.wav",
            "darkborn/zps/survivors/pedro/kill/kill-03.wav",
            "darkborn/zps/survivors/pedro/kill/kill-04.wav",
            "darkborn/zps/survivors/pedro/kill/kill-05.wav",
            "darkborn/zps/survivors/pedro/kill/kill-06.wav",
            "darkborn/zps/survivors/pedro/kill/kill-07.wav",
            "darkborn/zps/survivors/pedro/kill/kill-08.wav",
            "darkborn/zps/survivors/pedro/kill/kill-09.wav"
            })
        }
    },
    ['spot'] = {
        ['combine'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"spotcomb",{""})
        },
        ['cp'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"spotcp",{""})
        },
        ['zombie'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"spotzom",{""})
        },
        ['headcrab'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"spothc",{""})
        },
        ['antlion'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"spotant",{""})
        },
        ['barnacle'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"spotbarn",{""})
        },
        ['manhack'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"spotmh",{""})
        },
        ['scanner'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"spotsca",{""})
        },
        ['sniper'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"spotsni",{""})
        },
        ['turret'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"spottur",{""})
        },
        ['ally'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"spotally",{""})
        },
        -- ['npc_crow'] = { -- classname overrides category entry
            -- ['delay']= nil,
            -- ['sound'] = TFAVOX_GenerateSound( mdlprefix, "spotcrow", { "snd1", "snd2", "snd3" } )
        -- },
        ['generic'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"spotgener",{""})
        }
    },
    ['damage'] = {
        [HITGROUP_GENERIC] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"HITGROUP_GENERIC",{
            "darkborn/zps/survivors/pedro/pain/pain-01.wav",
            "darkborn/zps/survivors/pedro/pain/pain-02.wav",
            "darkborn/zps/survivors/pedro/pain/pain-03.wav",
            "darkborn/zps/survivors/pedro/pain/pain-04.wav",
            "darkborn/zps/survivors/pedro/pain/pain-05.wav",
            "darkborn/zps/survivors/pedro/pain/pain-06.wav"
            })
        },
        [HITGROUP_HEAD] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_HEAD",{
            "darkborn/zps/survivors/pedro/pain/pain-01.wav",
            "darkborn/zps/survivors/pedro/pain/pain-02.wav",
            "darkborn/zps/survivors/pedro/pain/pain-03.wav",
            "darkborn/zps/survivors/pedro/pain/pain-04.wav",
            "darkborn/zps/survivors/pedro/pain/pain-05.wav",
            "darkborn/zps/survivors/pedro/pain/pain-06.wav"
            })
        },
        [HITGROUP_CHEST] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_CHEST",{
            "darkborn/zps/survivors/pedro/pain/pain-01.wav",
            "darkborn/zps/survivors/pedro/pain/pain-02.wav",
            "darkborn/zps/survivors/pedro/pain/pain-03.wav",
            "darkborn/zps/survivors/pedro/pain/pain-04.wav",
            "darkborn/zps/survivors/pedro/pain/pain-05.wav",
            "darkborn/zps/survivors/pedro/pain/pain-06.wav"
            })
        },
        [HITGROUP_STOMACH] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_STOMACH",{
            "darkborn/zps/survivors/pedro/pain/pain-01.wav",
            "darkborn/zps/survivors/pedro/pain/pain-02.wav",
            "darkborn/zps/survivors/pedro/pain/pain-03.wav",
            "darkborn/zps/survivors/pedro/pain/pain-04.wav",
            "darkborn/zps/survivors/pedro/pain/pain-05.wav",
            "darkborn/zps/survivors/pedro/pain/pain-06.wav"
            })
        },
        [HITGROUP_LEFTARM] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_LEFTARM",{
            "darkborn/zps/survivors/pedro/pain/pain-01.wav",
            "darkborn/zps/survivors/pedro/pain/pain-02.wav",
            "darkborn/zps/survivors/pedro/pain/pain-03.wav",
            "darkborn/zps/survivors/pedro/pain/pain-04.wav",
            "darkborn/zps/survivors/pedro/pain/pain-05.wav",
            "darkborn/zps/survivors/pedro/pain/pain-06.wav"
            })
        },
        [HITGROUP_RIGHTARM] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_RIGHTARM",{
            "darkborn/zps/survivors/pedro/pain/pain-01.wav",
            "darkborn/zps/survivors/pedro/pain/pain-02.wav",
            "darkborn/zps/survivors/pedro/pain/pain-03.wav",
            "darkborn/zps/survivors/pedro/pain/pain-04.wav",
            "darkborn/zps/survivors/pedro/pain/pain-05.wav",
            "darkborn/zps/survivors/pedro/pain/pain-06.wav"
            })
        },
        [HITGROUP_LEFTLEG] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_LEFTLEG",{
            "darkborn/zps/survivors/pedro/pain/pain-01.wav",
            "darkborn/zps/survivors/pedro/pain/pain-02.wav",
            "darkborn/zps/survivors/pedro/pain/pain-03.wav",
            "darkborn/zps/survivors/pedro/pain/pain-04.wav",
            "darkborn/zps/survivors/pedro/pain/pain-05.wav",
            "darkborn/zps/survivors/pedro/pain/pain-06.wav"
            })
        },
        [HITGROUP_RIGHTLEG] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_RIGHTLEG",{
            "darkborn/zps/survivors/pedro/pain/pain-01.wav",
            "darkborn/zps/survivors/pedro/pain/pain-02.wav",
            "darkborn/zps/survivors/pedro/pain/pain-03.wav",
            "darkborn/zps/survivors/pedro/pain/pain-04.wav",
            "darkborn/zps/survivors/pedro/pain/pain-05.wav",
            "darkborn/zps/survivors/pedro/pain/pain-06.wav"
            })
        },
        [HITGROUP_GEAR] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_GEAR",{
            "darkborn/zps/survivors/pedro/pain/pain-01.wav",
            "darkborn/zps/survivors/pedro/pain/pain-02.wav",
            "darkborn/zps/survivors/pedro/pain/pain-03.wav",
            "darkborn/zps/survivors/pedro/pain/pain-04.wav",
            "darkborn/zps/survivors/pedro/pain/pain-05.wav",
            "darkborn/zps/survivors/pedro/pain/pain-06.wav"
            })
          }
        },
    ['callouts'] = {
        ['taunt'] = { -- callout classname in these quotes
            ['name'] = "Taunt",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Taunt",{
            "darkborn/zps/survivors/pedro/taunts/taunt-01.wav",
            "darkborn/zps/survivors/pedro/taunts/taunt-02.wav",
            "darkborn/zps/survivors/pedro/taunts/taunt-03.wav",
            "darkborn/zps/survivors/pedro/taunts/taunt-04.wav",
            "darkborn/zps/survivors/pedro/taunts/taunt-05.wav",
            "darkborn/zps/survivors/pedro/taunts/taunt-06.wav",
            "darkborn/zps/survivors/pedro/taunts/taunt-07.wav",
            "darkborn/zps/survivors/pedro/taunts/taunt-08.wav",
            "darkborn/zps/survivors/pedro/taunts/taunt-09.wav"
            })
        },
        ['fire'] = { -- callout classname in these quotes
            ['name'] = "Fire",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Fire",{
            "darkborn/zps/survivors/pedro/commandmenu/fire/fire-01.wav",
            "darkborn/zps/survivors/pedro/commandmenu/fire/fire-02.wav",
            "darkborn/zps/survivors/pedro/commandmenu/fire/fire-03.wav",
            "darkborn/zps/survivors/pedro/commandmenu/fire/fire-04.wav",
            "darkborn/zps/survivors/pedro/commandmenu/fire/fire-05.wav"
            })
        },
        ['anger'] = { -- callout classname in these quotes
            ['name'] = "Anger",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Anger",{
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
            })
        },
        ['needammo'] = { -- callout classname in these quotes
            ['name'] = "Need Ammo",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_NeedAmmo",{
            "darkborn/zps/survivors/pedro/commandmenu/needammo/needammo-01.wav",
            "darkborn/zps/survivors/pedro/commandmenu/needammo/needammo-02.wav",
            "darkborn/zps/survivors/pedro/commandmenu/needammo/needammo-03.wav",
            "darkborn/zps/survivors/pedro/commandmenu/needammo/needammo-04.wav"
            })
        },
        ['needweapon'] = { -- callout classname in these quotes
            ['name'] = "Need Weapon",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_NeedWeapon",{
            "darkborn/zps/survivors/pedro/commandmenu/needweapon/need_weapon-01.wav",
            "darkborn/zps/survivors/pedro/commandmenu/needweapon/need_weapon-02.wav",
            "darkborn/zps/survivors/pedro/commandmenu/needweapon/need_weapon-03.wav",
            "darkborn/zps/survivors/pedro/commandmenu/needweapon/need_weapon-04.wav",
            "darkborn/zps/survivors/pedro/commandmenu/needweapon/need_weapon-05.wav"
            })
        },
        ['needhealth'] = { -- callout classname in these quotes
            ['name'] = "Need Health",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_NeedHealth",{
            "darkborn/zps/survivors/pedro/commandmenu/needhealth/needhealth-01.wav",
            "darkborn/zps/survivors/pedro/commandmenu/needhealth/needhealth-02.wav",
            "darkborn/zps/survivors/pedro/commandmenu/needhealth/needhealth-03.wav",
            "darkborn/zps/survivors/pedro/commandmenu/needhealth/needhealth-04.wav",
            "darkborn/zps/survivors/pedro/commandmenu/needhealth/needhealth-05.wav"
            })
        },
        ['acknowledge'] = { -- callout classname in these quotes
            ['name'] = "Acknowledge",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Acknowledge",{
            "darkborn/zps/survivors/pedro/commandmenu/acknowledge/acknowledge-01.wav",
            "darkborn/zps/survivors/pedro/commandmenu/acknowledge/acknowledge-02.wav",
            "darkborn/zps/survivors/pedro/commandmenu/acknowledge/acknowledge-03.wav",
            "darkborn/zps/survivors/pedro/commandmenu/acknowledge/acknowledge-04.wav",
            "darkborn/zps/survivors/pedro/commandmenu/acknowledge/acknowledge-05.wav"
            })
        },
        ['decline'] = { -- callout classname in these quotes
            ['name'] = "Decline",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Decline",{
            "darkborn/zps/survivors/pedro/commandmenu/decline/decline-01.wav",
            "darkborn/zps/survivors/pedro/commandmenu/decline/decline-02.wav",
            "darkborn/zps/survivors/pedro/commandmenu/decline/decline-03.wav",
            "darkborn/zps/survivors/pedro/commandmenu/decline/decline-04.wav",
            "darkborn/zps/survivors/pedro/commandmenu/decline/decline-05.wav",
            "darkborn/zps/survivors/pedro/commandmenu/decline/decline-06.wav"
            })
        },
        ['positivestatus'] = { -- callout classname in these quotes
            ['name'] = "Positive Status",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_PositiveStatus",{
            "darkborn/zps/survivors/pedro/commandmenu/positivestatus/positivestatus-01.wav",
            "darkborn/zps/survivors/pedro/commandmenu/positivestatus/positivestatus-02.wav",
            "darkborn/zps/survivors/pedro/commandmenu/positivestatus/positivestatus-03.wav",
            "darkborn/zps/survivors/pedro/commandmenu/positivestatus/positivestatus-04.wav",
            "darkborn/zps/survivors/pedro/commandmenu/positivestatus/positivestatus-05.wav"
            })
        },
        ['statusreport'] = { -- callout classname in these quotes
            ['name'] = "Status Report",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_StatusReport",{
            "darkborn/zps/survivors/pedro/commandmenu/statusreport/status_report-01.wav",
            "darkborn/zps/survivors/pedro/commandmenu/statusreport/status_report-02.wav",
            "darkborn/zps/survivors/pedro/commandmenu/statusreport/status_report-03.wav",
            "darkborn/zps/survivors/pedro/commandmenu/statusreport/status_report-04.wav",
            "darkborn/zps/survivors/pedro/commandmenu/statusreport/status_report-05.wav"
            })
        },
        ['thanks'] = { -- callout classname in these quotes
            ['name'] = "Thanks",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Thanks",{
            "darkborn/zps/survivors/pedro/commandmenu/thanks/thanks-01.wav",
            "darkborn/zps/survivors/pedro/commandmenu/thanks/thanks-02.wav",
            "darkborn/zps/survivors/pedro/commandmenu/thanks/thanks-03.wav",
            "darkborn/zps/survivors/pedro/commandmenu/thanks/thanks-04.wav",
            "darkborn/zps/survivors/pedro/commandmenu/thanks/thanks-05.wav"
            })
        },
        ['praise'] = { -- callout classname in these quotes
            ['name'] = "Praise",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Praise",{
            "darkborn/zps/survivors/pedro/commandmenu/praise/praise-01.wav",
            "darkborn/zps/survivors/pedro/commandmenu/praise/praise-02.wav",
            "darkborn/zps/survivors/pedro/commandmenu/praise/praise-03.wav",
            "darkborn/zps/survivors/pedro/commandmenu/praise/praise-04.wav",
            "darkborn/zps/survivors/pedro/commandmenu/praise/praise-05.wav"
            })
        },
        ['hold'] = { -- callout classname in these quotes
            ['name'] = "Hold",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Hold",{
            "darkborn/zps/survivors/pedro/commandmenu/hold/hold-01.wav",
            "darkborn/zps/survivors/pedro/commandmenu/hold/hold-02.wav",
            "darkborn/zps/survivors/pedro/commandmenu/hold/hold-03.wav",
            "darkborn/zps/survivors/pedro/commandmenu/hold/hold-04.wav",
            "darkborn/zps/survivors/pedro/commandmenu/hold/hold-05.wav"
            })
        },
        ['keepmoving'] = { -- callout classname in these quotes
            ['name'] = "Keep Moving",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_KeepMoving",{
            "darkborn/zps/survivors/pedro/keepmoving/keep_moving-01.wav",
            "darkborn/zps/survivors/pedro/keepmoving/keep_moving-02.wav",
            "darkborn/zps/survivors/pedro/keepmoving/keep_moving-03.wav",
            "darkborn/zps/survivors/pedro/keepmoving/keep_moving-04.wav",
            "darkborn/zps/survivors/pedro/keepmoving/keep_moving-05.wav"
            })
        },
        ['go'] = { -- callout classname in these quotes
            ['name'] = "Go",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Go",{
            "darkborn/zps/survivors/pedro/go/go-01.wav",
            "darkborn/zps/survivors/pedro/go/go-02.wav",
            "darkborn/zps/survivors/pedro/go/go-03.wav",
            "darkborn/zps/survivors/pedro/go/go-04.wav",
            "darkborn/zps/survivors/pedro/go/go-05.wav",
            "darkborn/zps/survivors/pedro/go/go-06.wav"
            })
        },
        ['cover'] = { -- callout classname in these quotes
            ['name'] = "Cover",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Cover",{
            "darkborn/zps/survivors/pedro/commandmenu/cover/cover-01.wav",
            "darkborn/zps/survivors/pedro/commandmenu/cover/cover-02.wav",
            "darkborn/zps/survivors/pedro/commandmenu/cover/cover-03.wav",
            "darkborn/zps/survivors/pedro/commandmenu/cover/cover-04.wav",
            "darkborn/zps/survivors/pedro/commandmenu/cover/cover-05.wav"
            })
        },
        ['escape'] = { -- callout classname in these quotes
            ['name'] = "Escape",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Escape",{
            "darkborn/zps/survivors/pedro/commandmenu/escape/escape-01.wav",
            "darkborn/zps/survivors/pedro/commandmenu/escape/escape-02.wav",
            "darkborn/zps/survivors/pedro/commandmenu/escape/escape-03.wav",
            "darkborn/zps/survivors/pedro/commandmenu/escape/escape-04.wav",
            "darkborn/zps/survivors/pedro/commandmenu/escape/escape-05.wav"
            })
        },
        ['panic'] = { -- callout classname in these quotes
            ['name'] = "Panic!",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Panic",{
            "darkborn/zps/survivors/pedro/panic!/panic-01.wav",
            "darkborn/zps/survivors/pedro/panic!/panic-02.wav",
            "darkborn/zps/survivors/pedro/panic!/panic-03.wav",
            "darkborn/zps/survivors/pedro/panic!/panic-04.wav",
            "darkborn/zps/survivors/pedro/panic!/panic-05.wav",
            "darkborn/zps/survivors/pedro/panic!/panic-06.wav"
            })
        }
    },
    ['external'] = { --Completely optional, allows you to integrate with external mods
        ['bash'] = { -- Used by TFA Base
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Bash",{
            "darkborn/zps/survivors/pedro/meleegrunts/meleegrunt-01.wav",
            "darkborn/zps/survivors/pedro/meleegrunts/meleegrunt-02.wav",
            "darkborn/zps/survivors/pedro/meleegrunts/meleegrunt-03.wav",
            "darkborn/zps/survivors/pedro/meleegrunts/meleegrunt-04.wav",
            "darkborn/zps/survivors/pedro/meleegrunts/meleegrunt-05.wav",
            "darkborn/zps/survivors/pedro/meleegrunts/meleegrunt-06.wav"
            })
        }
    }
}