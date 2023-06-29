-----------------------------------
-- Ability: Tomahawk
-- Expends a Throwing Tomahawk to inflict a special defense down effect on an enemy.
-- Obtained: Warrior Level 75
-- Recast Time: 3:00
-- Duration: 0:30 (base)
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
	if player:getEquipID(tpz.slot.AMMO) ~= 18258 then
		return 216, 0
	end

	if player:getEquipID(tpz.slot.AMMO) == 18258 then
		player:delItem(18258, 1)
		return 0, 0
	end
end

function onUseAbility(player, target, ability)
	local merits   = player:getMerit(tpz.merit.TOMAHAWK) - 15
    local duration = 30 + merits

    target:addStatusEffectEx(tpz.effect.TOMAHAWK, 0, 25, 3, duration, 0, 0, 0)
end