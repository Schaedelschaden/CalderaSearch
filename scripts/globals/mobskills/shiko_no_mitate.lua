---------------------------------------------
-- Shiko no Mitate
-- Enhances defense.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.DEFENSE_BOOST

    skill:setMsg(MobBuffMove(mob, typeEffect, 15, 0, 300))

    if mob:getObjType() == tpz.objType.TRUST then
        mob:addStatusEffect(tpz.effect.STONESKIN, 300, 0, 300)
        mob:addStatusEffect(tpz.effect.ISSEKIGAN, 25, 0, 300)
    end

    return typeEffect
end
