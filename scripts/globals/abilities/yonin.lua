-----------------------------------
-- Ability: Yonin
-- Increases enmity and enhances "Ninja Tool Expertise" effect, but impairs accuracy. Improves evasion and reduces enemy Critical Hit Rate when in front of target.
-- Obtained: Ninja Level 40
-- Recast Time: 3:00
-- Duration: 5:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    local power    = 30
    local tick     = 15
    local duration = 300
    local subPower = 30

    target:delStatusEffect(tpz.effect.INNIN)
    target:delStatusEffect(tpz.effect.YONIN)
    target:addStatusEffect(tpz.effect.YONIN, power, tick, duration, 0, subPower)
end
