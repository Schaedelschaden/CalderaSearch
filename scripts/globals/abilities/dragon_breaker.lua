-----------------------------------
-- Ability: Dragon Breaker
-- Lowers accuracy, evasion, magic accuracy, magic evasion and TP gain for dragons.  
-- Obtained: Dragoon Level 87
-- Recast Time: 05:00
-- Duration: 03:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
	local family = target:getSystem()
    if (family == tpz.eco.DRAGON) then
		return 0,0
	else
		return tpz.msg.basic.CANNOT_ON_THAT_TARG, 0
	end
end

function onUseAbility(player,target,ability)
	target:addStatusEffect(tpz.effect.DRAGON_BREAKER,1,0,180)
end
