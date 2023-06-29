---------------------------------------------
-- Perfect Defense
--
-- Description: Reduces damage taken and greatly increases resistance to most status tpz.effect.
-- Type: Enhancing
-- Can be dispelled: No
-- Range: Self
-- Notes:
-- Grants immunity to either physical, magical, or ranged damage.
-- Randomly switches immunities starting at 10% health. Accompanied by text
-- "Cease thy struggles...
-- I am immutable...indestructible...impervious...immortal..."
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

    if mob:getObjType() == tpz.objType.TRUST then
        target:delStatusEffect(tpz.effect.PERFECT_DEFENSE)
        target:addStatusEffect(tpz.effect.PERFECT_DEFENSE,1,3,60)
        skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
    else
        MobBuffMove(mob, tpz.effect.PERFECT_DEFENSE, 1, 0, skill:getParam())
        skill:setMsg(tpz.msg.basic.USES)
    end 
    
    return tpz.effect.PERFECT_DEFENSE
end
