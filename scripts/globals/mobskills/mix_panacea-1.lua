---------------------------------------------
-- Mix: Panacea-1
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
    target:eraseAllStatusEffect()

    -- Table of non-erasable effects
    local effects =
    {
        tpz.effect.TERROR,
        tpz.effect.SLEEP_I,
        tpz.effect.SLEEP_II,
        tpz.effect.LULLABY,
        tpz.effect.STUN,
        tpz.effect.SILENCE,
        tpz.effect.WEAKNESS,
        tpz.effect.PARALYSIS,
        tpz.effect.BLINDNESS,
        tpz.effect.AMNESIA,
        tpz.effect.CHARM_I,
        tpz.effect.CHARM_II,
        tpz.effect.POISON,
        tpz.effect.CURSE_I,
        tpz.effect.CURSE_II,
    }

    for _, v in pairs(effects) do
        target:delStatusEffect(v)
    end
    
    skill:setMsg(tpz.msg.basic.NONE)

    return effect
end
