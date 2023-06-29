-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Heqet
-----------------------------------
mixins =
{
    require("scripts/mixins/families/poroggo"),
    require("scripts/mixins/abyssea_weakness")
}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.LIGHTRES, 95)
    mob:addMod(tpz.mod.TRIPLE_ATTACK, 35)
    mob:addMod(tpz.mod.FASTCAST, 65)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if
            skillID == 1959 -- Water Bomb
        then
            mobArg:castSpell(200) -- Waterga II

            mobArg:timer(4000, function(mob)
                mobArg:castSpell(200) -- Waterga II
            end)
        end
    end)
end

function onMobFight(mob, target)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
