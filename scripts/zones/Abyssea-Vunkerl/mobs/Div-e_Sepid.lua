-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Div-e Sepid
-----------------------------------
mixins =
{
    require("scripts/mixins/families/imp"),
    require("scripts/mixins/abyssea_weakness")
}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)

    mob:addMod(tpz.mod.DOUBLE_ATTACK, 65)
    mob:addMod(tpz.mod.IGNORE_MANA_WALL, 1)
    -- mob:addMod(tpz.mod.AURA_RADIUS_BONUS, 85) -- 6.5y base radius + 8.5y = 15y radius

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 1712 then -- Bugle Call
            -- local duration = 60
            -- local effect   = tpz.effect.BIO
            -- local power    = 100

            -- mobArg:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 9, 3, duration, effect, power, tpz.auraTarget.ENEMIES, tpz.effectFlag.AURA)
            -- mobArg:addStatusEffectEx(tpz.effect.BIO, tpz.effect.BIO, 100, 0, 60, 0, 25, tpz.auraTarget.ENEMIES, tpz.effectFlag.AURA)
            mobArg:addStatusEffectEx(tpz.effect.HUNDRED_FISTS, tpz.effect.HUNDRED_FISTS, 1, 0, 60)

            local effect = mobArg:getStatusEffect(tpz.effect.HUNDRED_FISTS)

            effect:setFlag(tpz.effectFlag.NO_LOSS_MESSAGE)

            mobArg:setLocalVar("AURA_BIO", os.time() + 60)
        end
    end)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        -- Handle aura
        if os.time() < mob:getLocalVar("AURA_BIO") then
            local allianceList = target:getAlliance()
            local playerName   = {}
            local targ

            for i, v in ipairs(allianceList) do
                local distance = mob:checkDistance(v)

                if distance <= 15 then
                    v:addStatusEffectEx(tpz.effect.BIO, tpz.effect.BIO, 100, 0, 15, 0, 25, 4)
                end
            end
        end

        -- 5% chance to regenerate his horn if broken
        if
            mob:AnimationSub() == 1 and
            math.random(0, 100) <= 5
        then
            mob:AnimationSub(0)
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 3)
    end
end

function onAdditionalEffect(mob, target, damage)
    if math.random(1, 100) <= 20 then
		local effect = mob:stealStatusEffect(target, tpz.effectFlag.DISPELABLE)

        if effect ~= 0 then
            return tpz.subEffect.HASTE, tpz.msg.basic.ADD_EFFECT_DISPEL, effect
        end
	end
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_USED")
end
