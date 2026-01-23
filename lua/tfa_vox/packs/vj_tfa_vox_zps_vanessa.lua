TFAVOX_Models = TFAVOX_Models or {""}

local model = "models/darkborn/zps/survivors/pms/vanessa.mdl"

local tmptbl = string.Split(model,"/")
local mdlprefix = tmptbl[#tmptbl] or model
mdlprefix = string.Replace(mdlprefix,".mdl", "")
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
            "darkborn/zps/survivors/vanessa/commandmenu/needhealth/needhealth-01.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needhealth/needhealth-02.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needhealth/needhealth-03.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needhealth/needhealth-04.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needhealth/needhealth-05.wav"
            })
        },
        ['death'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"death",{
            "darkborn/zps/survivors/vanessa/death/deathrattle-01.wav",
            "darkborn/zps/survivors/vanessa/death/deathrattle-02.wav",
            "darkborn/zps/survivors/vanessa/death/deathrattle-03.wav",
            "darkborn/zps/survivors/vanessa/death/deathrattle-04.wav",
            "darkborn/zps/survivors/vanessa/death/deathrattle-05.wav"
            })
        },
        ['spawn'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"spawn",{
            "darkborn/zps/survivors/vanessa/go/go-01.wav",
            "darkborn/zps/survivors/vanessa/go/go-02.wav",
            "darkborn/zps/survivors/vanessa/go/go-03.wav",
            "darkborn/zps/survivors/vanessa/go/go-04.wav",
            "darkborn/zps/survivors/vanessa/go/go-05.wav"
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
            "darkborn/zps/survivors/vanessa/commandmenu/needammo/needammo-01.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needammo/needammo-02.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needammo/needammo-03.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needammo/needammo-04.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needammo/needammo-05.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needammo/needammo-06.wav"
            })
        },
        ['fall'] = {
            ['delay']= 8,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"fall",{""})
        },
        ['jump'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"jump",{
            "darkborn/zps/survivors/vanessa/jump/jump-01.wav",
            "darkborn/zps/survivors/vanessa/jump/jump-02.wav",
            "darkborn/zps/survivors/vanessa/jump/jump-03.wav",
            "darkborn/zps/survivors/vanessa/jump/jump-04.wav"
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
            "darkborn/zps/survivors/vanessa/kill/kill-01.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-02.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-03.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-04.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-05.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-06.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-07.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-08.wav"
            })
        },
        ['cp'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdcp",{
            "darkborn/zps/survivors/vanessa/kill/kill-01.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-02.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-03.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-04.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-05.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-06.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-07.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-08.wav"
            })
        },
        ['zombie'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdzom",{
            "darkborn/zps/survivors/vanessa/kill/kill-01.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-02.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-03.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-04.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-05.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-06.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-07.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-08.wav"
            })
        },
        ['headcrab'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdhc",{
            "darkborn/zps/survivors/vanessa/kill/kill-01.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-02.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-03.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-04.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-05.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-06.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-07.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-08.wav"
            })
        },
        ['antlion'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdant",{
            "darkborn/zps/survivors/vanessa/kill/kill-01.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-02.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-03.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-04.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-05.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-06.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-07.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-08.wav"
            })
        },
        ['barnacle'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdbarn",{
            "darkborn/zps/survivors/vanessa/kill/kill-01.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-02.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-03.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-04.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-05.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-06.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-07.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-08.wav"
            })
        },
        ['manhack'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdmh",{
            "darkborn/zps/survivors/vanessa/kill/kill-01.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-02.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-03.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-04.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-05.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-06.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-07.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-08.wav"
            })
        },
        ['scanner'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdsca",{
            "darkborn/zps/survivors/vanessa/kill/kill-01.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-02.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-03.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-04.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-05.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-06.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-07.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-08.wav"
            })
        },
        ['sniper'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdsni",{
            "darkborn/zps/survivors/vanessa/kill/kill-01.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-02.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-03.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-04.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-05.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-06.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-07.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-08.wav"
            })
        },
        ['turret'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdtur",{
            "darkborn/zps/survivors/vanessa/kill/kill-01.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-02.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-03.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-04.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-05.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-06.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-07.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-08.wav"
            })
        },
        ['ally'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdally",{
            "darkborn/zps/survivors/vanessa/kill/kill-01.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-02.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-03.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-04.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-05.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-06.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-07.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-08.wav"
            })
        },
        -- ['npc_pigeon'] = { -- classname overrides category entry
            -- ['delay']= nil,
            -- ['sound'] = TFAVOX_GenerateSound( mdlprefix, "murdpigeon", { "snd1", "snd2", "snd3" } )
        -- },
        ['generic'] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdgener",{
            "darkborn/zps/survivors/vanessa/kill/kill-01.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-02.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-03.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-04.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-05.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-06.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-07.wav",
            "darkborn/zps/survivors/vanessa/kill/kill-08.wav"
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
            "darkborn/zps/survivors/vanessa/pain/pain-01.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-02.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-03.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-04.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-05.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-06.wav"
            })
        },
        [HITGROUP_HEAD] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_HEAD",{
            "darkborn/zps/survivors/vanessa/pain/pain-01.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-02.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-03.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-04.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-05.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-06.wav"
            })
        },
        [HITGROUP_CHEST] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_CHEST",{
            "darkborn/zps/survivors/vanessa/pain/pain-01.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-02.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-03.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-04.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-05.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-06.wav"
            })
        },
        [HITGROUP_STOMACH] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_STOMACH",{
            "darkborn/zps/survivors/vanessa/pain/pain-01.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-02.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-03.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-04.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-05.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-06.wav"
            })
        },
        [HITGROUP_LEFTARM] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_LEFTARM",{
            "darkborn/zps/survivors/vanessa/pain/pain-01.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-02.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-03.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-04.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-05.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-06.wav"
            })
        },
        [HITGROUP_RIGHTARM] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_RIGHTARM",{
            "darkborn/zps/survivors/vanessa/pain/pain-01.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-02.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-03.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-04.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-05.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-06.wav"
            })
        },
        [HITGROUP_LEFTLEG] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_LEFTLEG",{
            "darkborn/zps/survivors/vanessa/pain/pain-01.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-02.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-03.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-04.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-05.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-06.wav"
            })
        },
        [HITGROUP_RIGHTLEG] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_RIGHTLEG",{
            "darkborn/zps/survivors/vanessa/pain/pain-01.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-02.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-03.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-04.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-05.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-06.wav"
            })
        },
        [HITGROUP_GEAR] = {
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_GEAR",{
            "darkborn/zps/survivors/vanessa/pain/pain-01.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-02.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-03.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-04.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-05.wav",
            "darkborn/zps/survivors/vanessa/pain/pain-06.wav"
            })
          }
        },
    ['callouts'] = {
        ['taunt'] = { -- callout classname in these quotes
            ['name'] = "Taunt",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Taunt",{
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
            })
        },
        ['fire'] = { -- callout classname in these quotes
            ['name'] = "Fire",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Fire",{
            "darkborn/zps/survivors/vanessa/commandmenu/fire/fire-01.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/fire/fire-02.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/fire/fire-03.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/fire/fire-04.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/fire/fire-05.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/fire/fire-06.wav"
            })
        },
        ['anger'] = { -- callout classname in these quotes
            ['name'] = "Anger",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Anger",{
            "darkborn/zps/survivors/vanessa/commandmenu/anger/anger-01.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/anger/anger-02.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/anger/anger-03.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/anger/anger-04.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/anger/anger-05.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/anger/anger-06.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/anger/anger-07.wav"
            })
        },
        ['needammo'] = { -- callout classname in these quotes
            ['name'] = "Need Ammo",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_NeedAmmo",{
            "darkborn/zps/survivors/vanessa/commandmenu/needammo/needammo-01.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needammo/needammo-02.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needammo/needammo-03.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needammo/needammo-04.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needammo/needammo-05.wav"
            })
        },
        ['needweapon'] = { -- callout classname in these quotes
            ['name'] = "Need Weapon",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_NeedWeapon",{
            "darkborn/zps/survivors/vanessa/commandmenu/needweapon/needweapon-01.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needweapon/needweapon-02.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needweapon/needweapon-03.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needweapon/needweapon-04.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needweapon/needweapon-05.wav"
            })
        },
        ['needhealth'] = { -- callout classname in these quotes
            ['name'] = "Need Health",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_NeedHealth",{
            "darkborn/zps/survivors/vanessa/commandmenu/needhealth/needhealth-01.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needhealth/needhealth-02.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needhealth/needhealth-03.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needhealth/needhealth-04.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/needhealth/needhealth-05.wav"
            })
        },
        ['acknowledge'] = { -- callout classname in these quotes
            ['name'] = "Acknowledge",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Acknowledge",{
            "darkborn/zps/survivors/vanessa/commandmenu/acknowledge/yes-01.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/acknowledge/yes-02.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/acknowledge/yes-03.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/acknowledge/yes-04.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/acknowledge/yes-05.wav"
            })
        },
        ['decline'] = { -- callout classname in these quotes
            ['name'] = "Decline",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Decline",{
            "darkborn/zps/survivors/vanessa/commandmenu/decline/no-01.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/decline/no-02.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/decline/no-03.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/decline/no-04.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/decline/no-05.wav"
            })
        },
        ['positivestatus'] = { -- callout classname in these quotes
            ['name'] = "Positive Status",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_PositiveStatus",{
            "darkborn/zps/survivors/vanessa/commandmenu/positivestatus/positivestatus-01.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/positivestatus/positivestatus-02.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/positivestatus/positivestatus-03.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/positivestatus/positivestatus-04.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/positivestatus/positivestatus-05.wav"
            })
        },
        ['statusreport'] = { -- callout classname in these quotes
            ['name'] = "Status Report",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_StatusReport",{
            "darkborn/zps/survivors/vanessa/commandmenu/statusreport/statusreport-01.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/statusreport/statusreport-02.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/statusreport/statusreport-03.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/statusreport/statusreport-04.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/statusreport/statusreport-05.wav"
            })
        },
        ['thanks'] = { -- callout classname in these quotes
            ['name'] = "Thanks",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Thanks",{
            "darkborn/zps/survivors/vanessa/commandmenu/thanks/thanks-01.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/thanks/thanks-02.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/thanks/thanks-03.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/thanks/thanks-04.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/thanks/thanks-05.wav"
            })
        },
        ['praise'] = { -- callout classname in these quotes
            ['name'] = "Praise",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Praise",{
            "darkborn/zps/survivors/vanessa/commandmenu/praise/praise-01.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/praise/praise-02.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/praise/praise-03.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/praise/praise-04.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/praise/praise-05.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/praise/praise-06.wav"
            })
        },
        ['hold'] = { -- callout classname in these quotes
            ['name'] = "Hold",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Hold",{
            "darkborn/zps/survivors/vanessa/commandmenu/hold/hold-01.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/hold/hold-02.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/hold/hold-03.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/hold/hold-04.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/hold/hold-05.wav"
            })
        },
        ['keepmoving'] = { -- callout classname in these quotes
            ['name'] = "Keep Moving",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_KeepMoving",{
            "darkborn/zps/survivors/vanessa/keepmoving/keepmoving-01.wav",
            "darkborn/zps/survivors/vanessa/keepmoving/keepmoving-02.wav",
            "darkborn/zps/survivors/vanessa/keepmoving/keepmoving-03.wav",
            "darkborn/zps/survivors/vanessa/keepmoving/keepmoving-04.wav",
            "darkborn/zps/survivors/vanessa/keepmoving/keepmoving-05.wav",
            "darkborn/zps/survivors/vanessa/keepmoving/keepmoving-06.wav"
            })
        },
        ['go'] = { -- callout classname in these quotes
            ['name'] = "Go",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Go",{
            "darkborn/zps/survivors/vanessa/go/go-01.wav",
            "darkborn/zps/survivors/vanessa/go/go-02.wav",
            "darkborn/zps/survivors/vanessa/go/go-03.wav",
            "darkborn/zps/survivors/vanessa/go/go-04.wav",
            "darkborn/zps/survivors/vanessa/go/go-05.wav"
            })
        },
        ['cover'] = { -- callout classname in these quotes
            ['name'] = "Cover",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Cover",{
            "darkborn/zps/survivors/vanessa/commandmenu/cover/cover-01.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/cover/cover-02.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/cover/cover-03.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/cover/cover-04.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/cover/cover-05.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/cover/cover-06.wav"
            })
        },
        ['escape'] = { -- callout classname in these quotes
            ['name'] = "Escape",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Escape",{
            "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-01.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-02.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-03.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-04.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-05.wav",
            "darkborn/zps/survivors/vanessa/commandmenu/escape/escape-06.wav"
            })
        },
        ['panic'] = { -- callout classname in these quotes
            ['name'] = "Panic!",--Callout friendly name ( what you see in the wheel )
            ['delay']= nil,
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Panic",{
            "darkborn/zps/survivors/vanessa/panic!/panic-01.wav",
            "darkborn/zps/survivors/vanessa/panic!/panic-02.wav",
            "darkborn/zps/survivors/vanessa/panic!/panic-03.wav",
            "darkborn/zps/survivors/vanessa/panic!/panic-04.wav",
            "darkborn/zps/survivors/vanessa/panic!/panic-05.wav",
            "darkborn/zps/survivors/vanessa/panic!/panic-06.wav"
            })
        }
    },
    ['external'] = { --Completely optional, allows you to integrate with external mods
        ['bash'] = { -- Used by TFA Base
            ['sound'] = TFAVOX_GenerateSound(mdlprefix,"Bash",{
            "darkborn/zps/survivors/vanessa/meleegrunts/meleegrunt-01.wav",
            "darkborn/zps/survivors/vanessa/meleegrunts/meleegrunt-02.wav",
            "darkborn/zps/survivors/vanessa/meleegrunts/meleegrunt-03.wav",
            "darkborn/zps/survivors/vanessa/meleegrunts/meleegrunt-04.wav",
            "darkborn/zps/survivors/vanessa/meleegrunts/meleegrunt-05.wav",
            "darkborn/zps/survivors/vanessa/meleegrunts/meleegrunt-06.wav"
            })
        }
    }
}