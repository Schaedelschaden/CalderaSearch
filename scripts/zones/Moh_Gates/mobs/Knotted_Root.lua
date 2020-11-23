-----------------------------------
-- Area: Moh Gates
--  Mob: Knotted Root
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

function onMobDeath(mob, player, isKiller)
	player:PrintToPlayer(string.format("You killed me! I don't know how to open right now though..."))
--	mob:setAnimation(tpz.anim.OPEN_DOOR)
--	mob:entityAnimationPacket("sp00")
end;