-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Karkatakam
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.FASTCAST, 35)

    mob:setLocalVar("MOBSKILL_INCREASED_POTENCY", 1)

    -- Metallic Body cannot be dispelled
	mob:addListener("EFFECT_GAIN", "METALLIC_BODY_GAIN", function(mobArg, effect)
		if effect:getType() == tpz.effect.STONESKIN then
			effect:unsetFlag(tpz.effectFlag.DISPELABLE)
		end
    end)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        -- Select up to 6 auras
        local numAuras = math.random(1, 6)
        local auras    =
        {
            "AURA_SILENCE",
            "AURA_AMNESIA",
            "AURA_SLOW",
            "AURA_POISON",
            "AURA_ADDLE",
            "AURA_GRAVITY",
        }

        -- Auras are active for 60 seconds (handled in onMobFight)
        local startTime = os.time() + 60

        for i = 1, numAuras do
            local pickAura = math.random(1, 6)

            mobArg:setLocalVar(auras[pickAura], startTime)
        end
    end)
end

function onMobEngaged(mob, target)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        local allianceList = target:getAlliance()
        local playerName   = {}
        local targ

        for i, v in ipairs(allianceList) do
            local distance = mob:checkDistance(v)

            if distance <= 15 then
                if os.time() < mob:getLocalVar("AURA_SILENCE") then
                    v:addStatusEffectEx(tpz.effect.SILENCE, tpz.effect.SILENCE, 1, 0, 30)
                end

                if os.time() < mob:getLocalVar("AURA_AMNESIA") then
                    v:addStatusEffectEx(tpz.effect.AMNESIA, tpz.effect.AMNESIA, 1, 0, 30)
                end

                if os.time() < mob:getLocalVar("AURA_SLOW") then
                    v:addStatusEffectEx(tpz.effect.SLOW, tpz.effect.SLOW, 3000, 0, 30)
                end

                if os.time() < mob:getLocalVar("AURA_POISON") then
                    v:addStatusEffectEx(tpz.effect.POISON, tpz.effect.POISON, 50, 3, 30)
                end

                if os.time() < mob:getLocalVar("AURA_ADDLE") then
                    v:addStatusEffectEx(tpz.effect.ADDLE, tpz.effect.ADDLE, 50, 0, 30)
                end

                if os.time() < mob:getLocalVar("AURA_GRAVITY") then
                    v:addStatusEffectEx(tpz.effect.GRAVITY, tpz.effect.GRAVITY, 50, 0, 30)
                end
            end
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 3)
    end
end

function onSpellPrecast(mob, spell)
    if spell:getID() == 214 then -- Flood
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setRadius(20)
    end
end

function onMobDespawn(mob)
    mob:removeListener("METALLIC_BODY_GAIN")
    mob:removeListener("MOBSKILL_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("METALLIC_BODY_GAIN")
    mob:removeListener("MOBSKILL_USED")
end
