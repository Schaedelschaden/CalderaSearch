-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Khalkotaur
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)

    mob:addMod(tpz.mod.DOUBLE_ATTACK, 25)
    mob:addMod(tpz.mod.GUARD, 25)
    mob:addMod(tpz.mod.COUNTER, 25)
    mob:addMod(tpz.mod.FRONTAL_DMG_REDUCTION, 50)
end

function onMobFight(mob, target)
end

function onAdditionalEffect(mob, target, damage)
    if math.random(1, 100) <= 20 then
		local effect = mob:stealStatusEffect(target, tpz.effectFlag.DISPELABLE)

        if effect ~= 0 then
            return tpz.subEffect.HP_DRAIN, tpz.msg.basic.NONE, effect
        end
	end
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
