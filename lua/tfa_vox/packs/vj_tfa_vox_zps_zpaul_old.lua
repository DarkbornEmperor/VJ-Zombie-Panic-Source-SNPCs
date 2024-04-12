TFAVOX_Models = TFAVOX_Models or {""}

local model = "models/darkborn/zps/zombies_old/pms/paul_zombie.mdl"

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
            "darkborn/zps/zombies/paul/death/death-01.wav",
            "darkborn/zps/zombies/paul/death/death-02.wav",
            "darkborn/zps/zombies/paul/death/death-03.wav",
            "darkborn/zps/zombies/paul/death/death-04.wav",
            "darkborn/zps/zombies/paul/death/death-05.wav",
            "darkborn/zps/zombies/paul/death/death-06.wav",
            "darkborn/zps/zombies/paul/death/death-07.wav"
			})
		},
		['spawn'] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"spawn",{""})
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
	        "darkborn/zps/zombies/paul/jump/jump-01.wav",
	        "darkborn/zps/zombies/paul/jump/jump-02.wav",
	        "darkborn/zps/zombies/paul/jump/jump-03.wav",
	        "darkborn/zps/zombies/paul/jump/jump-04.wav",
	        "darkborn/zps/zombies/paul/jump/jump-05.wav",
	        "darkborn/zps/zombies/paul/jump/jump-06.wav"
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
            "darkborn/zps/zombies/paul/pain/pain-01.wav",
            "darkborn/zps/zombies/paul/pain/pain-02.wav",
            "darkborn/zps/zombies/paul/pain/pain-03.wav",
            "darkborn/zps/zombies/paul/pain/pain-04.wav",
            "darkborn/zps/zombies/paul/pain/pain-05.wav"
            })
		},
		[HITGROUP_HEAD] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_HEAD",{
            "darkborn/zps/zombies/paul/pain/pain-01.wav",
            "darkborn/zps/zombies/paul/pain/pain-02.wav",
            "darkborn/zps/zombies/paul/pain/pain-03.wav",
            "darkborn/zps/zombies/paul/pain/pain-04.wav",
            "darkborn/zps/zombies/paul/pain/pain-05.wav"
            })
		},
		[HITGROUP_CHEST] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_CHEST",{
            "darkborn/zps/zombies/paul/pain/pain-01.wav",
            "darkborn/zps/zombies/paul/pain/pain-02.wav",
            "darkborn/zps/zombies/paul/pain/pain-03.wav",
            "darkborn/zps/zombies/paul/pain/pain-04.wav",
            "darkborn/zps/zombies/paul/pain/pain-05.wav"
            })
		},
		[HITGROUP_STOMACH] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_STOMACH",{
            "darkborn/zps/zombies/paul/pain/pain-01.wav",
            "darkborn/zps/zombies/paul/pain/pain-02.wav",
            "darkborn/zps/zombies/paul/pain/pain-03.wav",
            "darkborn/zps/zombies/paul/pain/pain-04.wav",
            "darkborn/zps/zombies/paul/pain/pain-05.wav"
            })
		},
		[HITGROUP_LEFTARM] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_LEFTARM",{
            "darkborn/zps/zombies/paul/pain/pain-01.wav",
            "darkborn/zps/zombies/paul/pain/pain-02.wav",
            "darkborn/zps/zombies/paul/pain/pain-03.wav",
            "darkborn/zps/zombies/paul/pain/pain-04.wav",
            "darkborn/zps/zombies/paul/pain/pain-05.wav"
            })
		},
		[HITGROUP_RIGHTARM] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_RIGHTARM",{
            "darkborn/zps/zombies/paul/pain/pain-01.wav",
            "darkborn/zps/zombies/paul/pain/pain-02.wav",
            "darkborn/zps/zombies/paul/pain/pain-03.wav",
            "darkborn/zps/zombies/paul/pain/pain-04.wav",
            "darkborn/zps/zombies/paul/pain/pain-05.wav"
            })
		},
		[HITGROUP_LEFTLEG] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_LEFTLEG",{
            "darkborn/zps/zombies/paul/pain/pain-01.wav",
            "darkborn/zps/zombies/paul/pain/pain-02.wav",
            "darkborn/zps/zombies/paul/pain/pain-03.wav",
            "darkborn/zps/zombies/paul/pain/pain-04.wav",
            "darkborn/zps/zombies/paul/pain/pain-05.wav"
            })
		},
		[HITGROUP_RIGHTLEG] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_RIGHTLEG",{
            "darkborn/zps/zombies/paul/pain/pain-01.wav",
            "darkborn/zps/zombies/paul/pain/pain-02.wav",
            "darkborn/zps/zombies/paul/pain/pain-03.wav",
            "darkborn/zps/zombies/paul/pain/pain-04.wav",
            "darkborn/zps/zombies/paul/pain/pain-05.wav"
            })
		},
		[HITGROUP_GEAR] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_GEAR",{
            "darkborn/zps/zombies/paul/pain/pain-01.wav",
            "darkborn/zps/zombies/paul/pain/pain-02.wav",
            "darkborn/zps/zombies/paul/pain/pain-03.wav",
            "darkborn/zps/zombies/paul/pain/pain-04.wav",
            "darkborn/zps/zombies/paul/pain/pain-05.wav"
            })
		  }
		},
	['callouts'] = {
		['taunt'] = { -- callout classname in these quotes
			['name'] = "Taunt",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Taunt",{
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
	        })
		},
		['noaction'] = { -- callout classname in these quotes
			['name'] = "No Action",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_NoAction",{
            "darkborn/zps/zombies/paul/noaction/noaction-01.wav",
            "darkborn/zps/zombies/paul/noaction/noaction-02.wav",
            "darkborn/zps/zombies/paul/noaction/noaction-03.wav",
            "darkborn/zps/zombies/paul/noaction/noaction-04.wav",
            "darkborn/zps/zombies/paul/noaction/noaction-05.wav",
            "darkborn/zps/zombies/paul/noaction/noaction-06.wav"
		    })
	    }
	},
	['external'] = { --Completely optional, allows you to integrate with external mods
		['bash'] = { -- Used by TFA Base
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Bash",{    
            "darkborn/zps/zombies/paul/attacks/attack-01.wav",
            "darkborn/zps/zombies/paul/attacks/attack-02.wav",
            "darkborn/zps/zombies/paul/attacks/attack-03.wav",
            "darkborn/zps/zombies/paul/attacks/attack-04.wav",
            "darkborn/zps/zombies/paul/attacks/attack-05.wav",
            "darkborn/zps/zombies/paul/attacks/attack-06.wav"
			})
		}
	}
}