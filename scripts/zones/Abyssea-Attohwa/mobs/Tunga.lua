-----------------------------------
-- Area: Abyssea-Attohwa
--   NM: Tunga
-----------------------------------
mixins = {require("scripts/mixins/families/chigoe")}
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 50)
    mob:addMod(tpz.mod.STR, 250)
    mob:addMod(tpz.mod.EVA, 100)
    mob:setMod(tpz.mod.MACC, 650)
    mob:setMod(tpz.mod.MATT, 200)
    mob:setMod(tpz.mod.REGEN, 250)
end

function onMobFight(mob, target)

    --CHAINSPELL until death.
    if mob:getHP() < mob:getMaxHP() * 0.1 then
        if mob:hasStatusEffect(tpz.effect.CHAINSPELL) == false then
            mob:useMobAbility(692)
            mob:addStatusEffect(tpz.effect.CHAINSPELL, 1, 0, 0)
            mob:getStatusEffect(tpz.effect.CHAINSPELL):setFlag(tpz.effectFlag.DEATH)
        end
    end
end

function onAdditionalEffect(mob, target, damage)
    local params = {}
        params.chance = 100
        params.power = 100
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENLIGHT, params)
end

function onMobDespawn(mob)

end

function onMobDeath(mob, player, isKiller)
end
