-----------------------------------
-- Ability: Dodge
-- Enhances user's evasion.
-- Obtained: Monk Level 15
-- Recast Time: 5:00
-- Duration: 2:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    local level = player:getMainLvl()
    
    if (player:getMainJob() ~= tpz.job.MNK) then
        level = player:getSubLvl()
    end
    
    local power = (level + 1) + player:getMod(tpz.mod.DODGE_EFFECT)
    
    player:addStatusEffect(tpz.effect.DODGE, power, 0, 120)
end