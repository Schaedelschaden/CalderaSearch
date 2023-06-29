---------------------------------------------
-- Reprobation
--
-- Description: Dispels all buffs from targets in area of effect, including food.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Dispels shadows
-- Range: Area of Effect
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dispel = target:dispelAllStatusEffect(bit.bor(tpz.effectFlag.DISPELABLE, tpz.effectFlag.FOOD))

    if dispel > 0 then
        skill:setMsg(tpz.msg.basic.DISAPPEAR_NUM)
    else
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
    end

    return dispel
end
