-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Boulder Eater
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobFight(mob)
	-- mob:setMod(tpz.mod.NO_MOVE, 1)
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 770, 1, tpz.regime.type.GROUNDS)
end
