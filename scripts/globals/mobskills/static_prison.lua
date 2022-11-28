---------------------------------------------------
-- Sparkstorm
-- Hurkan deals lightning damage to enemies within area of effect.
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local dis1 = target:dispelStatusEffect()
    local dis2 = target:dispelStatusEffect()


    if (dis1 ~= tpz.effect.NONE and dis2 ~= tpz.effect.NONE) then
        skill:setMsg(tpz.msg.basic.DISAPPEAR_NUM)
        return 2
    elseif (dis1 ~= tpz.effect.NONE or dis2 ~= tpz.effect.NONE) then
        -- dispeled only one
        skill:setMsg(tpz.msg.basic.DISAPPEAR_NUM)
        return 1
    else
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT) -- no effect
    end

    local ce = mob:getCE(target)
	local ve = mob:getVE(target)
	local scale = (ve+ce)/60000
    local dmgmod = 4+(2*scale)
    local accmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.LIGHTNING, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING, MOBPARAM_IGNORE_SHADOWS)

    return dmg
end
