-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Pascerpot
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)

    mob:addMod(tpz.mod.BINDRES, 100)
    mob:addMod(tpz.mod.REGEN, 100)
    mob:addMod(tpz.mod.DEF, 28)
    mob:addMod(tpz.mod.MATT, 150)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 85)
    mob:addMod(tpz.mod.LIGHT_AFFINITY_DMG, 33)

    mob:addListener("EFFECT_GAIN", "COCOON_GAIN", function(mobArg, effect)
		if effect:getType() == tpz.effect.DEFENSE_BOOST then
			mobArg:addMod(tpz.mod.DEF, 750)
		end
    end)

    mob:addListener("EFFECT_LOSE", "COCOON_LOSE", function(mobArg, effect)
		if effect:getType() == tpz.effect.DEFENSE_BOOST then
			mobArg:delMod(tpz.mod.DEF, 750)
		end
    end)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        local isBusy = false
        local act    = mob:getCurrentAction()

        if
            act == tpz.act.MAGIC_START or
            act == tpz.act.MAGIC_CASTING or
            act == tpz.act.MAGIC_START
        then
            isBusy = true
        end

        if
            isBusy == false and
            mob:getMod(tpz.mod.LIGHT_AFFINITY_DMG) > 33
        then
            mob:setMod(tpz.mod.LIGHT_AFFINITY_DMG, 33)
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 1)
    end
end

function onAdditionalEffect(mob, target, damage)
    if math.random(1, 100) <= 20 then
		target:delStatusEffectSilent(tpz.effect.ADDLE)
        -- Inflicts -50% Fast Cast and -100 MACC
        target:addStatusEffect(tpz.effect.ADDLE, 50, 0, 60, 0, 100)

        return tpz.subEffect.DEFENSE_DOWN, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.ADDLE
	end
end

function onSpellPrecast(mob, spell)
	if spell:getID() == 22 then -- Holy II
		mob:setMod(tpz.mod.LIGHT_AFFINITY_DMG, 110)
    elseif spell:getID() == 40 then -- Banishga III
        mob:setMod(tpz.mod.LIGHT_AFFINITY_DMG, 90)
    end
end

function onMobDespawn(mob)
    mob:removeListener("COCOON_GAIN")
    mob:removeListener("COCOON_LOSE")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("COCOON_GAIN")
    mob:removeListener("COCOON_LOSE")
end
