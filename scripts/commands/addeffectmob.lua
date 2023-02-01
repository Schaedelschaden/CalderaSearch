---------------------------------------------------------------------------------------------------
-- func: !addeffectmob {effect} {power} {duration}
-- desc: Adds the given effect to the targeted mob.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status")
require("scripts/globals/teleports")


cmdprops =
{
    permission = 1,
    parameters = "ssss"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!addeffectmob {effect} {power} {duration}")
end

function onTrigger(player, arg1, arg2, arg3)
    local targ
    local id
    local power
    local duration

    if (tonumber(arg1) == 127) then
        player:PrintToPlayer("That effect is currently disabled due to crashes.")
        return
    end
	
	if (arg1 == nil) then
        error(player, "Invalid effect.")
        return
    else
		targ = player:getCursorTarget()
		if (arg1 == nil) then
			targ = player:getCursorTarget()
			id = tonumber(arg1) or tpz.effect[string.upper(arg1)]
			power = tonumber(arg2) or 1
			duration = tonumber(arg3) or 60
			if (not targ:isMob()) then
				error(player, "You must target a mob with your cursor.")
				return
			end
			if (targ:isNPC()) then
				error(player, "You cannot target an NPC with that.")
                return
			end
--			printf("addeffectmob.lua onTrigger 1 ID: [%i]  Power: [%i]  Duration: [%i]", id, power, duration)
		else
			targ = player:getCursorTarget()
			if (targ == nil) then
				error(player, "You must target a mob with your cursor.")
				return
			end
			if (targ:isNPC()) then
				error(player, "You cannot target an NPC with that.")
                return
			end
			id = tonumber(arg1) or tpz.effect[string.upper(arg1)]
			power = tonumber(arg2) or 1
			duration = tonumber(arg3) or 60
--			printf("addeffectmob.lua onTrigger 2 ID: [%s]  Power: [%i]  Duration: [%i]", id, power, duration)
		end
    end

    if (targ:addStatusEffect(id, power, 3, duration)) then
        printf("addeffectmob.lua onTrigger  ACTIVE")
        targ:messagePublic(280, targ, id, id)
    else
        printf("addeffectmob.lua onTrigger  FAILED")
        targ:messagePublic(283, targ, id)
    end
end
