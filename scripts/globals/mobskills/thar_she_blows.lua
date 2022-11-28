---------------------------------------------
-- Thar She Blows
--
-- Description: Instant KO
-- Type: 
-- Utsusemi/Blink absorb: 
-- Range: Unknown
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/utils")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local targetPosition = mob:getFacingAngle(target)

    if
        (targetPosition >= 0 and targetPosition <= 51) or
        (targetPosition <= 0 and targetPosition >= -51)
    then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local dmg = target:getHP()
    
    target:setHP(0)

    return dmg
end
