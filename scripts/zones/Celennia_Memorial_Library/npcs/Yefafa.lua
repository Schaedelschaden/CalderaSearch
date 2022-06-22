-----------------------------------
-- Area: Celennia Memorial Library
--  NPC: Yefafa
-- !pos -115.7428 -2.1500 -95.0393 284
-----------------------------------
local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")
-----------------------------------
function onTrade(player, npc, trade)
	
end

function onTrigger(player, npc)
    player:PrintToPlayer(string.format("Yefafa : You want me to act like a Moogle huh!? Well, ku-po-po-KUPOW!"),tpz.msg.channel.NS_SAY)
	player:dispelAllStatusEffect(bit.bor(tpz.effectFlag.NONE, tpz.effectFlag.DISPELABLE, tpz.effectFlag.ERASABLE, tpz.effectFlag.ATTACK,
										 tpz.effectFlag.EMPATHY, tpz.effectFlag.DAMAGE, tpz.effectFlag.MAGIC_BEGIN,
										 tpz.effectFlag.MAGIC_END, tpz.effectFlag.ON_ZONE, tpz.effectFlag.NO_LOSS_MESSAGE, tpz.effectFlag.INVISIBLE,
										 tpz.effectFlag.DETECTABLE, tpz.effectFlag.NO_REST, tpz.effectFlag.PREVENT_ACTION, tpz.effectFlag.WALTZABLE,
										 tpz.effectFlag.SONG, tpz.effectFlag.ROLL, tpz.effectFlag.CONFRONTATION, tpz.effectFlag.LOGOUT,
										 tpz.effectFlag.BLOODPACT, tpz.effectFlag.ON_JOBCHANGE, tpz.effectFlag.OFFLINE_TICK, tpz.effectFlag.AURA))
    player:sendMenu(1)
end

function onEventUpdate(player, csid, option)
	player:PrintToPlayer(string.format("Yefafa : Ugh, you're making me do something?"),tpz.msg.channel.NS_SAY)
end

function onEventFinish(player, csid, option)
	player:PrintToPlayer(string.format("Yefafa : Ugh, you're making me do something?"),tpz.msg.channel.NS_SAY)
end