---------------------------------------------
-- Heliovoid
-- Absorbs one status effect from all players in range.
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores Shadows
-- Range: Unknown radial
-- Notes:
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
    -- try to drain buff
    local effect = mob:stealStatusEffect(target, tpz.effectFlag.DISPELABLE)
    local count  = 1

    if effect ~= 0 then
        skill:setMsg(tpz.msg.basic.EFFECT_DRAINED)
    else
        skill:setMsg(tpz.msg.basic.NO_EFFECT)
    end

    return count
end
