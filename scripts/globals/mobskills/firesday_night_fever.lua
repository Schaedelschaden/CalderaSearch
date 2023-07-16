-----------------------------------
-- Firesday Night Fever
-- Adds buffs Haste, Shell, Protect, Blink
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
-----------------------------------


function onMobSkillCheck(target, mob, skill)

    return 0
end

function onMobWeaponSkill(target, mob, skill)
    -- Not much info on how much haste this gives. Supposed to be "high". Went with Magic Haste Cap
    mobBuffMove(mob, tpz.effect.HASTE, 4375, 3, 180)
    mobBuffMove(mob, tpz.effect.PROTECT, 100, 3, 180)
    skill:setMsg(mobBuffMove(mob, tpz.effect.BLINK, math.random(10, 25), 0, 120))

    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
    return tpz.effect.BLINK
end


