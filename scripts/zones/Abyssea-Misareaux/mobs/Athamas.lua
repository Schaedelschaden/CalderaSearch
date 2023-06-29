-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Athamas
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, 50)
end

function onMobFight(mob, target)
end

function onSpellPrecast(mob, spell)
    if spell:getID() == 286 then -- Addle
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setRadius(15)
    end
end

function onMobDrawIn(mob, target)
    local aoeMoves = {812, 286, 359, 366} -- Spider Web, Addle, Silencega, Graviga
    local pickAoE  = math.random(#aoeMoves)

    if pickAoE == 1 then
        mob:useMobAbility(aoeMoves[pickAoE])
    else
        mob:castSpell(aoeMoves[pickAoE])
    end
end

function onAdditionalEffect(mob, target, damage)
	local subEffect = tpz.subEffect.WIND_DAMAGE
    local message   = tpz.msg.basic.ADD_EFFECT_STATUS
    local effect    = tpz.effect.CHOKE

    if target:canGainStatusEffect(tpz.effect.CHOKE) then
        target:addStatusEffect(tpz.effect.CHOKE, 50, 3, 60)

        return subEffect, message, effect
    end

    return 0, 0, 0
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
