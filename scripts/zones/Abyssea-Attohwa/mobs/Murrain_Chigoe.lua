-----------------------------------
-- Area: Abyssea-Attohwa
--  Mob: Murrain Chigoe
-- Note: This mob does not need chigoe mixin
-- TODO: En-Disease
-----------------------------------

function onMobFight(mob, target)
    mob:untargetable(false)
    mob:hideName(false)
end

function onMobDisengage(mob)
    mob:untargetable(true)
    mob:hideName(true)
end

function onMobDeath(mob, player, isKiller)
end
