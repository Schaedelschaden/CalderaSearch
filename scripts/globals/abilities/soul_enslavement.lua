-----------------------------------
-- Ability: Soul Enslavement
-- Melee attacks absorb target's TP. 
-- Obtained: Dark Knight Level 96
-- Recast Time: 1:00:00
-- Duration: 00:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0
end

function onUseAbility(player,target,ability)
	target:addStatusEffect(tpz.effect.SOUL_ENSLAVEMENT,1,0,30)
end
