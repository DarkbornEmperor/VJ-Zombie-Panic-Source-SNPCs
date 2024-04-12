TFAVOX_Models = TFAVOX_Models or {""}

local model = "models/darkborn/zps/zombies_old/pms/eugene_zombie.mdl"

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
            "darkborn/zps/zombies/eugene/death/zmale_death1.wav",
            "darkborn/zps/zombies/eugene/death/zmale_death2.wav",
            "darkborn/zps/zombies/eugene/death/zmale_death3.wav",
            "darkborn/zps/zombies/eugene/death/zmale_death4.wav",
            "darkborn/zps/zombies/eugene/death/zmale_death5.wav",
            "darkborn/zps/zombies/eugene/death/zmale_death6.wav"
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
	        "darkborn/zps/zombies/eugene/jump/zmale1_jump-01.wav",
	        "darkborn/zps/zombies/eugene/jump/zmale1_jump-02.wav",
	        "darkborn/zps/zombies/eugene/jump/zmale1_jump-03.wav",
	        "darkborn/zps/zombies/eugene/jump/zmale1_jump-04.wav",
	        "darkborn/zps/zombies/eugene/jump/zmale1_jump-05.wav",
	        "darkborn/zps/zombies/eugene/jump/zmale1_jump-06.wav"
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
            "darkborn/zps/zombies/eugene/pain/zmale_pain1.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain2.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain3.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain4.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain5.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain6.wav"
            })
		},
		[HITGROUP_HEAD] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_HEAD",{
            "darkborn/zps/zombies/eugene/pain/zmale_pain1.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain2.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain3.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain4.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain5.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain6.wav"
            })
		},
		[HITGROUP_CHEST] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_CHEST",{
            "darkborn/zps/zombies/eugene/pain/zmale_pain1.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain2.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain3.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain4.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain5.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain6.wav"
            })
		},
		[HITGROUP_STOMACH] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_STOMACH",{
            "darkborn/zps/zombies/eugene/pain/zmale_pain1.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain2.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain3.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain4.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain5.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain6.wav"
            })
		},
		[HITGROUP_LEFTARM] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_LEFTARM",{
            "darkborn/zps/zombies/eugene/pain/zmale_pain1.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain2.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain3.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain4.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain5.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain6.wav"
            })
		},
		[HITGROUP_RIGHTARM] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_RIGHTARM",{
            "darkborn/zps/zombies/eugene/pain/zmale_pain1.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain2.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain3.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain4.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain5.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain6.wav"
            })
		},
		[HITGROUP_LEFTLEG] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_LEFTLEG",{
            "darkborn/zps/zombies/eugene/pain/zmale_pain1.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain2.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain3.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain4.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain5.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain6.wav"
            })
		},
		[HITGROUP_RIGHTLEG] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_RIGHTLEG",{
            "darkborn/zps/zombies/eugene/pain/zmale_pain1.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain2.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain3.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain4.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain5.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain6.wav"
            })
		},
		[HITGROUP_GEAR] = {
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix, "HITGROUP_GEAR",{
            "darkborn/zps/zombies/eugene/pain/zmale_pain1.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain2.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain3.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain4.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain5.wav",
            "darkborn/zps/zombies/eugene/pain/zmale_pain6.wav"
            })
		  }
		},
	['callouts'] = {
		['taunt'] = { -- callout classname in these quotes
			['name'] = "Taunt",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Taunt",{
            "darkborn/zps/zombies/eugene/taunts/zmale_taunt1.wav",
            "darkborn/zps/zombies/eugene/taunts/zmale_taunt2.wav",
            "darkborn/zps/zombies/eugene/taunts/zmale_taunt3.wav",
            "darkborn/zps/zombies/eugene/taunts/zmale_taunt4.wav",
            "darkborn/zps/zombies/eugene/taunts/zmale_taunt5.wav",
            "darkborn/zps/zombies/eugene/taunts/zmale_taunt6.wav",
            "darkborn/zps/zombies/eugene/taunts/zmale_taunt7.wav",
            "darkborn/zps/zombies/eugene/taunts/zmale_taunt8.wav",
            "darkborn/zps/zombies/eugene/taunts/zmale_taunt9.wav",
            "darkborn/zps/zombies/eugene/taunts/zmale_taunt10.wav"
	        })
		},
		['noaction'] = { -- callout classname in these quotes
			['name'] = "No Action",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_NoAction",{
            "darkborn/zps/zombies/eugene/noaction/zmale1_nouse-01.wav",
            "darkborn/zps/zombies/eugene/noaction/zmale1_nouse-02.wav",
            "darkborn/zps/zombies/eugene/noaction/zmale1_nouse-03.wav",
            "darkborn/zps/zombies/eugene/noaction/zmale1_nouse-04.wav",
            "darkborn/zps/zombies/eugene/noaction/zmale1_nouse-05.wav"
		    })
		},		
		['berserk'] = { -- callout classname in these quotes
			['name'] = "Berserk",--Callout friendly name ( what you see in the wheel )
			['delay']= nil,
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Wheel_Berserk",{
            "darkborn/zps/zombies/eugene/berserk/zmale_berserk-01.wav",
            "darkborn/zps/zombies/eugene/berserk/zmale_berserk-02.wav",
            "darkborn/zps/zombies/eugene/berserk/zmale_berserk-03.wav",
            "darkborn/zps/zombies/eugene/berserk/zmale_berserk-04.wav",
            "darkborn/zps/zombies/eugene/berserk/zmale_berserk-05.wav",
            "darkborn/zps/zombies/eugene/berserk/zmale_berserk-06.wav",
            "darkborn/zps/zombies/eugene/berserk/zmale_berserk-07.wav",
            "darkborn/zps/zombies/eugene/berserk/zmale_berserk-08.wav"
			})
	    }
	},
	['external'] = { --Completely optional, allows you to integrate with external mods
		['bash'] = { -- Used by TFA Base
			['sound'] = TFAVOX_GenerateSound(mdlprefix,"Bash",{    
            "darkborn/zps/zombies/eugene/attacks/zmale_attack1.wav",
            "darkborn/zps/zombies/eugene/attacks/zmale_attack2.wav",
            "darkborn/zps/zombies/eugene/attacks/zmale_attack3.wav",
            "darkborn/zps/zombies/eugene/attacks/zmale_attack4.wav",
            "darkborn/zps/zombies/eugene/attacks/zmale_attack5.wav",
            "darkborn/zps/zombies/eugene/attacks/zmale_attack6.wav",
            "darkborn/zps/zombies/eugene/attacks/zmale_attack7.wav"
			})
		}
	}
}