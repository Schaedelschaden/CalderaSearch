-----------------------------------------
-- Spell: Sacrifice
--
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local count = 0

    local removables =
    {
        tpz.effect.FLASH,
        tpz.effect.BLINDNESS,
        tpz.effect.PARALYSIS,
        tpz.effect.POISON,
        tpz.effect.CURSE_I,
        tpz.effect.CURSE_II,
        tpz.effect.DISEASE,
        tpz.effect.PLAGUE,
    }

    if caster:hasStatusEffect(tpz.effect.AFFLATUS_SOLACE) then
        local maxRemoved = 7

        -- Check for up to 7 effects from the removable list
        for i = 1, #removables do
            if
                target:hasStatusEffect(removables[i]) and
                count < maxRemoved
            then
                spell:setMsg(tpz.msg.basic.MAGIC_ABSORB_AILMENT)

                local statusEffect = target:getStatusEffect(removables[i])

                -- Only add it to the caster if they don't have the effect
                if caster:hasStatusEffect(removables[i]) == false then
                    caster:addStatusEffect(removables[i], statusEffect:getPower(), statusEffect:getTickCount(), statusEffect:getDuration())
                end

                target:delStatusEffect(removables[i])

                count = count + 1
            end
        end

        -- Check for erasable status effects excluding the above removable list
        for i = 1, (maxRemoved - count) do
            local stealEffect = caster:stealStatusEffect(target, tpz.effectFlag.ERASABLE)

            if stealEffect ~= 0 then
                spell:setMsg(tpz.msg.basic.MAGIC_ABSORB_AILMENT)

                count = count + 1
            end
        end

        return count
    else
        -- remove one effect and add it to me
        for i, effect in ipairs(removables) do
            if target:hasStatusEffect(effect) then
                spell:setMsg(tpz.msg.basic.MAGIC_ABSORB_AILMENT)

                local statusEffect = target:getStatusEffect(effect)

                -- only add it to me if I don't have it
                if caster:hasStatusEffect(effect) == false then
                    caster:addStatusEffect(effect, statusEffect:getPower(), statusEffect:getTickCount(), statusEffect:getDuration())
                end

                target:delStatusEffect(effect)

                return 1
            end
        end
    end

    spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT) -- no effect

    return 0
end
