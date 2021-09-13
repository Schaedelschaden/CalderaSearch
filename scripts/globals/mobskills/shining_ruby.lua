---------------------------------------------
--  Shining Ruby
--
--  Description: Carbuncle gains effects similar to "Protect" and "Shell".
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    mob:delStatusEffect(tpz.effect.SHINING_RUBY)
    mob:addStatusEffect(tpz.effect.SHINING_RUBY, 1, 0, duration)
    mob:messageBasic(tpz.msg.basic.GAINS_EFFECT_OF_STATUS, tpz.effect.PROTECT)
	mob:messageBasic(tpz.msg.basic.GAINS_EFFECT_OF_STATUS, tpz.effect.SHELL)
end