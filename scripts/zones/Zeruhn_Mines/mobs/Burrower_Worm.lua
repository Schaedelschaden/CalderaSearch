-----------------------------------
-- Area: Zeruhn Mines (172)
--  Mob: Burrower Worm
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobFight(mob, target)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobDisengage(mob)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 629, 2, tpz.regime.type.GROUNDS)
end