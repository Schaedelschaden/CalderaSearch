---------------------------------------------
-- Mix Samsons Strength
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    target:addStatusEffect(tpz.effect.STR_BOOST, 10, 0, 90)
    target:addStatusEffect(tpz.effect.DEX_BOOST, 10, 0, 90)
    target:addStatusEffect(tpz.effect.VIT_BOOST, 10, 0, 90)
    target:addStatusEffect(tpz.effect.AGI_BOOST, 10, 0, 90)
    target:addStatusEffect(tpz.effect.INT_BOOST, 10, 0, 90)
    target:addStatusEffect(tpz.effect.MND_BOOST, 10, 0, 90)
    target:addStatusEffect(tpz.effect.CHR_BOOST, 10, 0, 90)
    skill:setMsg(tpz.msg.basic.NONE)
    return 0
end
