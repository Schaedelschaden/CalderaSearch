-----------------------------------
-- Ability: Sengikori
-- Grants a bonus to skillchains and magic bursts initiated by your next weapon skill. 
-- Obtained: Samurai Level 77
-- Recast Time: 3:00
-- Duration: 1:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
	local power = 25 + player:getMod(tpz.mod.SENGIKORI_BONUS)
	player:addStatusEffect(tpz.effect.SENGIKORI, power, 0, 60)
end