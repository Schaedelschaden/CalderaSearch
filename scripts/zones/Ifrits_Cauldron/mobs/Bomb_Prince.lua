-----------------------------------
-- Area: Ifrit's Cauldron
--   NM: Bomb Prince
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.EXP_BONUS, -100)
    mob:setMobMod(tpz.mobMod.GIL_BONUS, -100)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
    mob:setMod(tpz.mod.STUNRES, 50)
end

function onMobFight(mob, target)
    mob:setMobLevel(math.random(85, 95))
    if mob:getBattleTime() > 1 then
        mob:useMobAbility(511)
    end
end

function onMobDeath(mob, player, isKiller)
end
