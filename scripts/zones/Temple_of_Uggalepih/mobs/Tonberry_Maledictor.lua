-----------------------------------
-- Area: Temple of Uggalepih
--  Mob: Tonberry Maledictor
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}
require("scripts/globals/regimes")
-----------------------------------

function onMobSpawn(mob)
    if mob:getID() == 17428670 then
        mob:setMobLevel(130)
    end
end

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 790, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 791, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 792, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 793, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 794, 1, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 795, 1, tpz.regime.type.GROUNDS)
end
