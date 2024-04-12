TFAVOX_Models = TFAVOX_Models or {""}

local model = "models/darkborn/zps/zombies_old/pms/carrier.mdl"

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
			['delay']= 8,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"crithealth",{""})
		},
		['death'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"death",{
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
			})
		},
		['spawn'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"spawn",{
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
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"noammo",{""})
		},
		['fall'] = {
			['delay']= 8,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"fall",{""})
		},
		['jump'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"jump",{
	        "darkborn/zps/zombies/carrier/jump/zcarrier_jump-01.wav",
	        "darkborn/zps/zombies/carrier/jump/zcarrier_jump-02.wav",
	        "darkborn/zps/zombies/carrier/jump/zcarrier_jump-03.wav",
	        "darkborn/zps/zombies/carrier/jump/zcarrier_jump-04.wav",
	        "darkborn/zps/zombies/carrier/jump/zcarrier_jump-05.wav",
	        "darkborn/zps/zombies/carrier/jump/zcarrier_jump-06.wav",
	        "darkborn/zps/zombies/carrier/jump/zcarrier_jump-07.wav",
	        "darkborn/zps/zombies/carrier/jump/zcarrier_jump-08.wav",
	        "darkborn/zps/zombies/carrier/jump/zcarrier_jump-09.wav"
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
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdcomb",{""})
		},
		['cp'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdcp",{""})
		},
		['zombie'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdzom",{""})
		},
		['headcrab'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdhc",{""})
		},
		['antlion'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdant",{""})
		},
		['barnacle'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdbarn",{""})
		},
		['manhack'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdmh",{""})
		},
		['scanner'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdsca",{""})
		},
		['sniper'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdsni",{""})
		},
		['turret'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdtur",{""})
		},
		['ally'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdally",{""})
		},
		-- ['npc_pigeon'] = { -- classname overrides category entry
			-- ['delay']= nil,
			-- ['sound'] = TFAVOX_GenerateSound( mdlprefix, "murdpigeon", { "snd1", "snd2", "snd3" } )
		-- },
		['generic'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"murdgener",{""})
		}
	},
	['spot'] = {
		['combine'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"spotcomb",{"darkborn/zps/zombies/carrier/actions/survivor_spotted.wav"})
		},
		['cp'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"spotcp",{"darkborn/zps/zombies/carrier/actions/survivor_spotted.wav"})
		},
		['zombie'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"spotzom",{"darkborn/zps/zombies/carrier/actions/survivor_spotted.wav"})
		},
		['headcrab'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"spothc",{"darkborn/zps/zombies/carrier/actions/survivor_spotted.wav"})
		},
		['antlion'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"spotant",{"darkborn/zps/zombies/carrier/actions/survivor_spotted.wav"})
		},
		['barnacle'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"spotbarn",{"darkborn/zps/zombies/carrier/actions/survivor_spotted.wav"})
		},
		['manhack'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"spotmh",{"darkborn/zps/zombies/carrier/actions/survivor_spotted.wav"})
		},
		['scanner'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"spotsca",{"darkborn/zps/zombies/carrier/actions/survivor_spotted.wav"})
		},
		['sniper'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"spotsni",{"darkborn/zps/zombies/carrier/actions/survivor_spotted.wav"})
		},
		['turret'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"spottur",{"darkborn/zps/zombies/carrier/actions/survivor_spotted.wav"})
		},
		['ally'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"spotally",{"darkborn/zps/zombies/carrier/actions/survivor_spotted.wav"})
		},
		-- ['npc_crow'] = { -- classname overrides category entry
			-- ['delay']= nil,
			-- ['sound'] = TFAVOX_GenerateSound( mdlprefix, "spotcrow", { "snd1", "snd2", "snd3" } )
		-- },
		['generic'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"spotgener",{"darkborn/zps/zombies/carrier/actions/survivor_spotted.wav"})
		}
	},
	['damage'] = {
		[HITGROUP_GENERIC] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"HITGROUP_GENERIC",{
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
            })
		},
		[HITGROUP_HEAD] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_HEAD",{
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
            })
		},
		[HITGROUP_CHEST] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_CHEST",{
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
            })
		},
		[HITGROUP_STOMACH] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_STOMACH",{
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
            })
		},
		[HITGROUP_LEFTARM] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_LEFTARM",{
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
            })
		},
		[HITGROUP_RIGHTARM] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_RIGHTARM",{
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
            })
		},
		[HITGROUP_LEFTLEG] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_LEFTLEG",{
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
            })
		},
		[HITGROUP_RIGHTLEG] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_RIGHTLEG",{
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
            })
		},
		[HITGROUP_GEAR] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_GEAR",{
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
            })
		  }
		},
	['callouts'] = {
		['taunt'] = { -- callout classname in these quotes
			['name'] = "Taunt",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Taunt",{
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
	        })
		},
		['noaction'] = { -- callout classname in these quotes
			['name'] = "No Action",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_NoAction",{
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
		    })
		},		
		['go'] = { -- callout classname in these quotes
			['name'] = "Go",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Go",{
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
		    })
		},
		['berserk'] = { -- callout classname in these quotes
			['name'] = "Berserk",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Berserk",{
			"darkborn/zps/zombies/carrier/berserk/carrier_berserk-01.wav",
            "darkborn/zps/zombies/carrier/berserk/carrier_berserk-02.wav",
            "darkborn/zps/zombies/carrier/berserk/carrier_berserk-03.wav",
            "darkborn/zps/zombies/carrier/berserk/carrier_berserk-04.wav",
            "darkborn/zps/zombies/carrier/berserk/carrier_berserk-05.wav",
            "darkborn/zps/zombies/carrier/berserk/carrier_berserk-06.wav",
            "darkborn/zps/zombies/carrier/berserk/carrier_berserk-07.wav"
			})
	    }
	},
	['external'] = { --Completely optional, allows you to integrate with external mods
		['bash'] = { -- Used by TFA Base
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Bash",{    
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
			})
		}
	}
}