-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Asanbosam
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:addMod(tpz.mod.REGAIN, 25)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 392 then -- Ultrasonics
            mobArg:useMobAbility(1155) -- Subsonics
        elseif skillID == 394 then -- Blood Drain
            mobArg:useMobAbility(1156) -- Marrow Drain
        end
    end)
end

function onMobFight(mob, target)
end

function onAdditionalEffect(mob, target, damage)
	local subEffect = tpz.subEffect.DISPEL
    local message   = tpz.msg.basic.ADD_EFFECT_DISPEL
    local effect    = target:dispelStatusEffect()

    if effect ~= tpz.effect.NONE then
        return subEffect, message, effect
    end

    return 0, 0, 0
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_USED")
end
