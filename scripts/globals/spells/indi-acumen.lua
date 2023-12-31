-----------------------------------------
-- Spell: Indi-Acumen
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    if target:hasStatusEffect(tpz.effect.COLURE_ACTIVE) then
        local effect = target:getStatusEffect(tpz.effect.COLURE_ACTIVE)
        if effect:getSubType() == tpz.effect.GEO_MAGIC_ATK_BOOST then
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
        power = (skill / 60) + (GeomancyPotency(caster) * 3)
    else
        power = (skill / 60)
    end

    if caster:getObjType() == tpz.objType.TRUST and not caster:hasStatusEffect(tpz.effect.ENTRUST) then
        power = math.floor(utils.clamp(caster:getMainLvl(), 0, 99) / 4.7)
    elseif caster:getObjType() == tpz.objType.TRUST and caster:hasStatusEffect(tpz.effect.ENTRUST) then
        power = math.floor(utils.clamp(caster:getMainLvl(), 0, 99) / 8.25)
    end

    if power < 1 then
        power = 1
    end

    if (caster:hasStatusEffect(tpz.effect.BOLSTER)) then
        power = power * 2
    end

    target:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 1, 3, duration, tpz.effect.GEO_MAGIC_ATK_BOOST, power, tpz.auraTarget.ALLIES, tpz.effectFlag.AURA)

    return tpz.effect.COLURE_ACTIVE
end
