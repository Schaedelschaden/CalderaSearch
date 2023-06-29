---------------------------------------------
-- Vehement Resolution
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
    if mob:getObjType() == tpz.objType.MOB then
        local baseHeal = math.random(1000, 2000)
        local statusHeal = 2000
        local effectCount = 0
        local dispel = mob:eraseStatusEffect()

        while (dispel ~= tpz.effect.NONE)
        do
            effectCount = effectCount + 1
            dispel = mob:eraseStatusEffect()
        end

        skill:setMsg(tpz.msg.basic.SELF_HEAL)
        return MobHealMove(mob, statusHeal * effectCount + baseHeal)
    else
        mob:eraseStatusEffect()
        return MobHealMove(mob, 500)
    end
end
