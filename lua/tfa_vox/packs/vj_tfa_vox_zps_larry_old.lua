TFAVOX_Models = TFAVOX_Models or {""}

local model = "models/darkborn/zps/survivors_old/pms/larry.mdl"

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
			})
		},
		['death'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"death",{
            "darkborn/zps/survivors/larry/death/death-01.wav",
	        "darkborn/zps/survivors/larry/death/death-02.wav",
	        "darkborn/zps/survivors/larry/death/death-03.wav",
	        "darkborn/zps/survivors/larry/death/death-04.wav",
	        "darkborn/zps/survivors/larry/death/death-05.wav"
			})
		},
		['spawn'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"spawn",{
			"darkborn/zps/survivors/larry/go/go-01.wav",
	        "darkborn/zps/survivors/larry/go/go-02.wav",
	        "darkborn/zps/survivors/larry/go/go-03.wav",
	        "darkborn/zps/survivors/larry/go/go-04.wav",
	        "darkborn/zps/survivors/larry/go/go-05.wav"
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
			"darkborn/zps/survivors/larry/commandmenu/needammo/needammo-01.wav",
	        "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-02.wav",
	        "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-03.wav",
	        "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-04.wav",
	        "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-05.wav",
	        "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-06.wav",
	        "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-07.wav",
	        "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-08.wav",
	        "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-09.wav",
	        "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-10.wav"
			})
		},
		['fall'] = {
			['delay']= 8,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"fall",{""})
		},
		['jump'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"jump",{
	        "darkborn/zps/survivors/larry/jump/jump-01.wav",
	        "darkborn/zps/survivors/larry/jump/jump-02.wav",
	        "darkborn/zps/survivors/larry/jump/jump-03.wav",
	        "darkborn/zps/survivors/larry/jump/jump-04.wav",
	        "darkborn/zps/survivors/larry/jump/jump-05.wav",
	        "darkborn/zps/survivors/larry/jump/jump-06.wav"
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
			"darkborn/zps/survivors/larry/kill/kill-01.wav",
	        "darkborn/zps/survivors/larry/kill/kill-02.wav",
	        "darkborn/zps/survivors/larry/kill/kill-03.wav",
	        "darkborn/zps/survivors/larry/kill/kill-04.wav",
	        "darkborn/zps/survivors/larry/kill/kill-05.wav",
	        "darkborn/zps/survivors/larry/kill/kill-06.wav",
	        "darkborn/zps/survivors/larry/kill/kill-07.wav",
	        "darkborn/zps/survivors/larry/kill/kill-08.wav",
	        "darkborn/zps/survivors/larry/kill/kill-09.wav"
			})
		},
		['cp'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdcp",{
			"darkborn/zps/survivors/larry/kill/kill-01.wav",
	        "darkborn/zps/survivors/larry/kill/kill-02.wav",
	        "darkborn/zps/survivors/larry/kill/kill-03.wav",
	        "darkborn/zps/survivors/larry/kill/kill-04.wav",
	        "darkborn/zps/survivors/larry/kill/kill-05.wav",
	        "darkborn/zps/survivors/larry/kill/kill-06.wav",
	        "darkborn/zps/survivors/larry/kill/kill-07.wav",
	        "darkborn/zps/survivors/larry/kill/kill-08.wav",
	        "darkborn/zps/survivors/larry/kill/kill-09.wav"
			})
		},
		['zombie'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdzom",{
			"darkborn/zps/survivors/larry/kill/kill-01.wav",
	        "darkborn/zps/survivors/larry/kill/kill-02.wav",
	        "darkborn/zps/survivors/larry/kill/kill-03.wav",
	        "darkborn/zps/survivors/larry/kill/kill-04.wav",
	        "darkborn/zps/survivors/larry/kill/kill-05.wav",
	        "darkborn/zps/survivors/larry/kill/kill-06.wav",
	        "darkborn/zps/survivors/larry/kill/kill-07.wav",
	        "darkborn/zps/survivors/larry/kill/kill-08.wav",
	        "darkborn/zps/survivors/larry/kill/kill-09.wav"
			})
		},
		['headcrab'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdhc",{
			"darkborn/zps/survivors/larry/kill/kill-01.wav",
	        "darkborn/zps/survivors/larry/kill/kill-02.wav",
	        "darkborn/zps/survivors/larry/kill/kill-03.wav",
	        "darkborn/zps/survivors/larry/kill/kill-04.wav",
	        "darkborn/zps/survivors/larry/kill/kill-05.wav",
	        "darkborn/zps/survivors/larry/kill/kill-06.wav",
	        "darkborn/zps/survivors/larry/kill/kill-07.wav",
	        "darkborn/zps/survivors/larry/kill/kill-08.wav",
	        "darkborn/zps/survivors/larry/kill/kill-09.wav"
			})
		},
		['antlion'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdant",{
			"darkborn/zps/survivors/larry/kill/kill-01.wav",
	        "darkborn/zps/survivors/larry/kill/kill-02.wav",
	        "darkborn/zps/survivors/larry/kill/kill-03.wav",
	        "darkborn/zps/survivors/larry/kill/kill-04.wav",
	        "darkborn/zps/survivors/larry/kill/kill-05.wav",
	        "darkborn/zps/survivors/larry/kill/kill-06.wav",
	        "darkborn/zps/survivors/larry/kill/kill-07.wav",
	        "darkborn/zps/survivors/larry/kill/kill-08.wav",
	        "darkborn/zps/survivors/larry/kill/kill-09.wav"
			})
		},
		['barnacle'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdbarn",{
			"darkborn/zps/survivors/larry/kill/kill-01.wav",
	        "darkborn/zps/survivors/larry/kill/kill-02.wav",
	        "darkborn/zps/survivors/larry/kill/kill-03.wav",
	        "darkborn/zps/survivors/larry/kill/kill-04.wav",
	        "darkborn/zps/survivors/larry/kill/kill-05.wav",
	        "darkborn/zps/survivors/larry/kill/kill-06.wav",
	        "darkborn/zps/survivors/larry/kill/kill-07.wav",
	        "darkborn/zps/survivors/larry/kill/kill-08.wav",
	        "darkborn/zps/survivors/larry/kill/kill-09.wav"
			})
		},
		['manhack'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdmh",{
			"darkborn/zps/survivors/larry/kill/kill-01.wav",
	        "darkborn/zps/survivors/larry/kill/kill-02.wav",
	        "darkborn/zps/survivors/larry/kill/kill-03.wav",
	        "darkborn/zps/survivors/larry/kill/kill-04.wav",
	        "darkborn/zps/survivors/larry/kill/kill-05.wav",
	        "darkborn/zps/survivors/larry/kill/kill-06.wav",
	        "darkborn/zps/survivors/larry/kill/kill-07.wav",
	        "darkborn/zps/survivors/larry/kill/kill-08.wav",
	        "darkborn/zps/survivors/larry/kill/kill-09.wav"
			})
		},
		['scanner'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdsca",{
			"darkborn/zps/survivors/larry/kill/kill-01.wav",
	        "darkborn/zps/survivors/larry/kill/kill-02.wav",
	        "darkborn/zps/survivors/larry/kill/kill-03.wav",
	        "darkborn/zps/survivors/larry/kill/kill-04.wav",
	        "darkborn/zps/survivors/larry/kill/kill-05.wav",
	        "darkborn/zps/survivors/larry/kill/kill-06.wav",
	        "darkborn/zps/survivors/larry/kill/kill-07.wav",
	        "darkborn/zps/survivors/larry/kill/kill-08.wav",
	        "darkborn/zps/survivors/larry/kill/kill-09.wav"
			})
		},
		['sniper'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdsni",{
			"darkborn/zps/survivors/larry/kill/kill-01.wav",
	        "darkborn/zps/survivors/larry/kill/kill-02.wav",
	        "darkborn/zps/survivors/larry/kill/kill-03.wav",
	        "darkborn/zps/survivors/larry/kill/kill-04.wav",
	        "darkborn/zps/survivors/larry/kill/kill-05.wav",
	        "darkborn/zps/survivors/larry/kill/kill-06.wav",
	        "darkborn/zps/survivors/larry/kill/kill-07.wav",
	        "darkborn/zps/survivors/larry/kill/kill-08.wav",
	        "darkborn/zps/survivors/larry/kill/kill-09.wav"
			})
		},
		['turret'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdtur",{
			"darkborn/zps/survivors/larry/kill/kill-01.wav",
	        "darkborn/zps/survivors/larry/kill/kill-02.wav",
	        "darkborn/zps/survivors/larry/kill/kill-03.wav",
	        "darkborn/zps/survivors/larry/kill/kill-04.wav",
	        "darkborn/zps/survivors/larry/kill/kill-05.wav",
	        "darkborn/zps/survivors/larry/kill/kill-06.wav",
	        "darkborn/zps/survivors/larry/kill/kill-07.wav",
	        "darkborn/zps/survivors/larry/kill/kill-08.wav",
	        "darkborn/zps/survivors/larry/kill/kill-09.wav"
			})
		},
		['ally'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdally",{
			"darkborn/zps/survivors/larry/kill/kill-01.wav",
	        "darkborn/zps/survivors/larry/kill/kill-02.wav",
	        "darkborn/zps/survivors/larry/kill/kill-03.wav",
	        "darkborn/zps/survivors/larry/kill/kill-04.wav",
	        "darkborn/zps/survivors/larry/kill/kill-05.wav",
	        "darkborn/zps/survivors/larry/kill/kill-06.wav",
	        "darkborn/zps/survivors/larry/kill/kill-07.wav",
	        "darkborn/zps/survivors/larry/kill/kill-08.wav",
	        "darkborn/zps/survivors/larry/kill/kill-09.wav"
			})
		},
		-- ['npc_pigeon'] = { -- classname overrides category entry
			-- ['delay']= nil,
			-- ['sound'] = TFAVOX_GenerateSound( mdlprefix, "murdpigeon", { "snd1", "snd2", "snd3" } )
		-- },
		['generic'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdgener",{
			"darkborn/zps/survivors/larry/kill/kill-01.wav",
	        "darkborn/zps/survivors/larry/kill/kill-02.wav",
	        "darkborn/zps/survivors/larry/kill/kill-03.wav",
	        "darkborn/zps/survivors/larry/kill/kill-04.wav",
	        "darkborn/zps/survivors/larry/kill/kill-05.wav",
	        "darkborn/zps/survivors/larry/kill/kill-06.wav",
	        "darkborn/zps/survivors/larry/kill/kill-07.wav",
	        "darkborn/zps/survivors/larry/kill/kill-08.wav",
	        "darkborn/zps/survivors/larry/kill/kill-09.wav"
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
            })
		},
		[HITGROUP_HEAD] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_HEAD",{
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
            })
		},
		[HITGROUP_CHEST] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_CHEST",{
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
            })
		},
		[HITGROUP_STOMACH] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_STOMACH",{
            "darkborn/zps/survivors/eugene/pain/pain-01.wav",
            "darkborn/zps/survivors/eugene/pain/pain-02.wav",
            "darkborn/zps/survivors/eugene/pain/pain-03.wav",
            "darkborn/zps/survivors/eugene/pain/pain-04.wav",
            "darkborn/zps/survivors/eugene/pain/pain-05.wav",
            "darkborn/zps/survivors/eugene/pain/pain-06.wav"
            })
		},
		[HITGROUP_LEFTARM] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_LEFTARM",{
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
            })
		},
		[HITGROUP_RIGHTARM] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_RIGHTARM",{
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
            })
		},
		[HITGROUP_LEFTLEG] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_LEFTLEG",{
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
            })
		},
		[HITGROUP_RIGHTLEG] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_RIGHTLEG",{
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
            })
		},
		[HITGROUP_GEAR] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_GEAR",{
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
            })
		  }
		},
	['callouts'] = {
		['taunt'] = { -- callout classname in these quotes
			['name'] = "Taunt",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Taunt",{
            "darkborn/zps/survivors/larry/taunts/taunt-01.wav",
	        "darkborn/zps/survivors/larry/taunts/taunt-02.wav",
	        "darkborn/zps/survivors/larry/taunts/taunt-03.wav",
	        "darkborn/zps/survivors/larry/taunts/taunt-04.wav",
	        "darkborn/zps/survivors/larry/taunts/taunt-05.wav",
	        "darkborn/zps/survivors/larry/taunts/taunt-06.wav",
	        "darkborn/zps/survivors/larry/taunts/taunt-07.wav",
	        "darkborn/zps/survivors/larry/taunts/taunt-08.wav"
	        })
		},
		['fire'] = { -- callout classname in these quotes
			['name'] = "Fire",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Fire",{
            "darkborn/zps/survivors/larry/commandmenu/fire/fire-01.wav",
	        "darkborn/zps/survivors/larry/commandmenu/fire/fire-02.wav",
	        "darkborn/zps/survivors/larry/commandmenu/fire/fire-03.wav",
	        "darkborn/zps/survivors/larry/commandmenu/fire/fire-04.wav",
	        "darkborn/zps/survivors/larry/commandmenu/fire/fire-05.wav",
	        "darkborn/zps/survivors/larry/commandmenu/fire/fire-06.wav",
	        "darkborn/zps/survivors/larry/commandmenu/fire/fire-07.wav",
	        "darkborn/zps/survivors/larry/commandmenu/fire/fire-08.wav"
	        })
		},
		['anger'] = { -- callout classname in these quotes
			['name'] = "Anger",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Anger",{
            "darkborn/zps/survivors/larry/commandmenu/anger/anger-01.wav",
	        "darkborn/zps/survivors/larry/commandmenu/anger/anger-02.wav",
	        "darkborn/zps/survivors/larry/commandmenu/anger/anger-04.wav",
	        "darkborn/zps/survivors/larry/commandmenu/anger/anger-05.wav",
	        "darkborn/zps/survivors/larry/commandmenu/anger/anger-06.wav",
	        "darkborn/zps/survivors/larry/commandmenu/anger/anger-07.wav",
	        "darkborn/zps/survivors/larry/commandmenu/anger/anger-08.wav"
		    })
		},
		['needammo'] = { -- callout classname in these quotes
			['name'] = "Need Ammo",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_NeedAmmo",{
			"darkborn/zps/survivors/larry/commandmenu/needammo/needammo-01.wav",
	        "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-02.wav",
	        "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-03.wav",
	        "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-04.wav",
	        "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-05.wav",
	        "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-06.wav",
	        "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-07.wav",
	        "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-08.wav",
	        "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-09.wav",
	        "darkborn/zps/survivors/larry/commandmenu/needammo/needammo-10.wav"
	        })
		},
		['needweapon'] = { -- callout classname in these quotes
			['name'] = "Need Weapon",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_NeedWeapon",{
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
	        "darkborn/zps/survivors/larry/commandmenu/needweapon/needweapon-11.wav"
	        })
		},
		['needhealth'] = { -- callout classname in these quotes
			['name'] = "Need Health",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_NeedHealth",{
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
	        })
		},
		['acknowledge'] = { -- callout classname in these quotes
			['name'] = "Acknowledge",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Acknowledge",{
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
	        "darkborn/zps/survivors/larry/commandmenu/acknowledge/yes-11.wav"
	        })
		},
		['decline'] = { -- callout classname in these quotes
			['name'] = "Decline",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Decline",{
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
	        })
		},
		['positivestatus'] = { -- callout classname in these quotes
			['name'] = "Positive Status",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_PositiveStatus",{
            "darkborn/zps/survivors/larry/commandmenu/positivestatus/positivestatus-01.wav",
	        "darkborn/zps/survivors/larry/commandmenu/positivestatus/positivestatus-02.wav",
	        "darkborn/zps/survivors/larry/commandmenu/positivestatus/positivestatus-03.wav",
	        "darkborn/zps/survivors/larry/commandmenu/positivestatus/positivestatus-04.wav",
	        "darkborn/zps/survivors/larry/commandmenu/positivestatus/positivestatus-05.wav",
	        "darkborn/zps/survivors/larry/commandmenu/positivestatus/positivestatus-06.wav",
	        "darkborn/zps/survivors/larry/commandmenu/positivestatus/positivestatus-07.wav",
	        "darkborn/zps/survivors/larry/commandmenu/positivestatus/positivestatus-08.wav",
	        "darkborn/zps/survivors/larry/commandmenu/positivestatus/positivestatus-09.wav"
	        })
		},
		['statusreport'] = { -- callout classname in these quotes
			['name'] = "Status Report",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_StatusReport",{
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
	        "darkborn/zps/survivors/larry/commandmenu/statusreport/statusreport-12.wav"
	        })
		},
		['thanks'] = { -- callout classname in these quotes
			['name'] = "Thanks",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Thanks",{
			"darkborn/zps/survivors/larry/commandmenu/thanks/thanks-01.wav",
	        "darkborn/zps/survivors/larry/commandmenu/thanks/thanks-02.wav",
	        "darkborn/zps/survivors/larry/commandmenu/thanks/thanks-03.wav",
	        "darkborn/zps/survivors/larry/commandmenu/thanks/thanks-04.wav",
	        "darkborn/zps/survivors/larry/commandmenu/thanks/thanks-05.wav",
	        "darkborn/zps/survivors/larry/commandmenu/thanks/thanks-06.wav",
	        "darkborn/zps/survivors/larry/commandmenu/thanks/thanks-07.wav",
	        "darkborn/zps/survivors/larry/commandmenu/thanks/thanks-08.wav",
	        "darkborn/zps/survivors/larry/commandmenu/thanks/thanks-09.wav"
	        })
		},
		['praise'] = { -- callout classname in these quotes
			['name'] = "Praise",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Praise",{
			"darkborn/zps/survivors/larry/commandmenu/praise/praise-02.wav",
	        "darkborn/zps/survivors/larry/commandmenu/praise/praise-03.wav",
	        "darkborn/zps/survivors/larry/commandmenu/praise/praise-04.wav",
	        "darkborn/zps/survivors/larry/commandmenu/praise/praise-05.wav",
	        "darkborn/zps/survivors/larry/commandmenu/praise/praise-06.wav",
	        "darkborn/zps/survivors/larry/commandmenu/praise/praise-07.wav",
	        "darkborn/zps/survivors/larry/commandmenu/praise/praise-08.wav"
	        })
		},
		['hold'] = { -- callout classname in these quotes
			['name'] = "Hold",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Hold",{
			"darkborn/zps/survivors/larry/commandmenu/hold/hold-01.wav",
	        "darkborn/zps/survivors/larry/commandmenu/hold/hold-02.wav",
	        "darkborn/zps/survivors/larry/commandmenu/hold/hold-03.wav",
	        "darkborn/zps/survivors/larry/commandmenu/hold/hold-04.wav",
	        "darkborn/zps/survivors/larry/commandmenu/hold/hold-06.wav",
	        "darkborn/zps/survivors/larry/commandmenu/hold/hold-07.wav",
	        "darkborn/zps/survivors/larry/commandmenu/hold/hold-08.wav",
	        "darkborn/zps/survivors/larry/commandmenu/hold/hold-09.wav",
	        "darkborn/zps/survivors/larry/commandmenu/hold/hold-10.wav",
	        "darkborn/zps/survivors/larry/commandmenu/hold/hold-11.wav"
	        })
		},
		['keepmoving'] = { -- callout classname in these quotes
			['name'] = "Keep Moving",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_KeepMoving",{
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
	        })
		},
		['go'] = { -- callout classname in these quotes
			['name'] = "Go",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Go",{
			"darkborn/zps/survivors/larry/go/go-01.wav",
	        "darkborn/zps/survivors/larry/go/go-02.wav",
	        "darkborn/zps/survivors/larry/go/go-03.wav",
	        "darkborn/zps/survivors/larry/go/go-04.wav",
	        "darkborn/zps/survivors/larry/go/go-05.wav"
	        })
		},		
		['cover'] = { -- callout classname in these quotes
			['name'] = "Cover",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Cover",{
            "darkborn/zps/survivors/larry/commandmenu/cover/cover-01.wav",
	        "darkborn/zps/survivors/larry/commandmenu/cover/cover-02.wav",
	        "darkborn/zps/survivors/larry/commandmenu/cover/cover-03.wav",
	        "darkborn/zps/survivors/larry/commandmenu/cover/cover-04.wav",
            "darkborn/zps/survivors/larry/commandmenu/cover/cover-05.wav",
	        "darkborn/zps/survivors/larry/commandmenu/cover/cover-06.wav",
	        "darkborn/zps/survivors/larry/commandmenu/cover/cover-07.wav",
	        "darkborn/zps/survivors/larry/commandmenu/cover/cover-08.wav",
	        "darkborn/zps/survivors/larry/commandmenu/cover/cover-09.wav",
	        "darkborn/zps/survivors/larry/commandmenu/cover/cover-10.wav",
	        "darkborn/zps/survivors/larry/commandmenu/cover/cover-11.wav"
		    })
		},
		['escape'] = { -- callout classname in these quotes
			['name'] = "Escape",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Escape",{
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
	        })
		},
		['panic'] = { -- callout classname in these quotes
			['name'] = "Panic!",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Panic",{
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
	        })
	    }
	},
	['external'] = { --Completely optional, allows you to integrate with external mods
		['bash'] = { -- Used by TFA Base
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Bash",{    
            "darkborn/zps/survivors/larry/meleegrunts/melee-01.wav",
	        "darkborn/zps/survivors/larry/meleegrunts/melee-02.wav",
	        "darkborn/zps/survivors/larry/meleegrunts/melee-03.wav",
	        "darkborn/zps/survivors/larry/meleegrunts/melee-04.wav",
	        "darkborn/zps/survivors/larry/meleegrunts/melee-05.wav",
	        "darkborn/zps/survivors/larry/meleegrunts/melee-06.wav"
			})
		}
	}
}