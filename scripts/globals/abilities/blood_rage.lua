-----------------------------------
-- Ability: Blood Rage
-- Enhances critical hit rate for party members within area of effect.
-- Obtained: Warrior Level 87
-- Recast Time: 5:00
-- Duration: 0:30
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player, target, ability)
	target:delStatusEffect(tpz.effect.WARCRY)
    target:addStatusEffect(tpz.effect.BLOOD_RAGE,20,0,30)
	local CritHitRate = player:getMod(tpz.mod.CRITHITRATE)
end
