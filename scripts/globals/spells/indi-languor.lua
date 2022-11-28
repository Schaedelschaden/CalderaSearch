-----------------------------------------
-- Spell: Indi-Languor
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    if target:hasStatusEffect(tpz.effect.COLURE_ACTIVE) then
        local effect = target:getStatusEffect(tpz.effect.COLURE_ACTIVE)
        if effect:getSubType() == tpz.effect.GEO_MAGIC_EVASION_DOWN then
            return tpz.msg.basic.EFFECT_ALREADY_ACTIVE
        end
    end
    return 0
end

function onSpellCast(caster, target, spell)
    local duration = 180 + caster:getMod(tpz.mod.INDI_DURATION)
    local skill = caster:getSkillLevel(tpz.skill.GEOMANCY)
    local power = 0

    if (caster:getWeaponSkillType(tpz.slot.RANGED) == tpz.skill.HANDBELL) then
        skill = skill + caster:getSkillLevel(tpz.skill.HANDBELL)
    end

    if not (caster:hasStatusEffect(tpz.effect.ENTRUST)) then
        power = (skill / 18) + (GeomancyPotency(caster) * 5)
    else
        power = (skill / 18)
    end

    if caster:getObjType() == tpz.objType.TRUST and caster:hasStatusEffect(tpz.effect.ENTRUST) then
        power = math.floor(utils.clamp(caster:getMainLvl(), 0, 99) / 2.4146)
    end

    if power < 1 then
        power = 1
    end

    if (caster:hasStatusEffect(tpz.effect.BOLSTER)) then
        power = power * 2
    end

    target:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 15, 3, duration, tpz.effect.GEO_MAGIC_EVASION, power, tpz.auraTarget.ENEMIES, tpz.effectFlag.AURA)

    return tpz.effect.COLURE_ACTIVE
end
