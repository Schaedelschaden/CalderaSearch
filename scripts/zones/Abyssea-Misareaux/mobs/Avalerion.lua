-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Avalerion
-----------------------------------
mixins = {require("scripts/mixins/families/colibri_mimic")}
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:addMod(tpz.mod.PARALYZERES, 100)
    mob:addMod(tpz.mod.GRAVITYRES, 100)
    mob:addMod(tpz.mod.STUNRES, 100)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        local target = mobArg:getTarget()

        if skillID == 1700 then -- Snatch Morsel
            local effects = target:getStatusEffects()
            local num     = 0

            for i, effect in ipairs(effects) do
                if
                    utils.mask.getBit(effect:getFlag(), 0) and
                    effect:getType() ~= tpz.effect.RERAISE and
                    num < 5
                then
                    mobArg:addStatusEffectEx(effect:getType(), effect:getType(), effect:getPower(), effect:getTick(), effect:getDuration())
                    num = num + 1
                end
            end
        elseif skillID == 1701 then -- Feather Tickle
            mobArg:resetEnmity(target)
        end
    end)
end

function onMobFight(mob, target)
end

function onAdditionalEffect(mob, target, damage)
	return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.STUN, {chance = 50})
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_USED")
end
