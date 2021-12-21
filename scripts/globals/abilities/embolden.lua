-----------------------------------
-- Ability: Embolden
-- Enhances the effects of the next enhancing magic spell you cast, but reduces effect duration. 
-- Obtained: Rune Fencer Level 60
-- Recast Time: 00:10:00
-- Duration: 00:01:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    player:addStatusEffect(tpz.effect.EMBOLDEN, 1, 0, 60)
	
    return tpz.effect.EMBOLDEN
end