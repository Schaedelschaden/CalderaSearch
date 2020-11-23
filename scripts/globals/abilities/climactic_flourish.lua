-----------------------------------
-- Ability: Climactic Flourish
-- Allows you to deal critical hits. Requires at least one finishing move.
-- Obtained: Dancer Level 80
-- Recast Time: 01:30
-- Duration: 1:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if (player:hasStatusEffect(tpz.effect.STRIKING_FLOURISH) or 
		player:hasStatusEffect(tpz.effect.TERNARY_FLOURISH) or
		player:hasStatusEffect(tpz.effect.SNEAK_ATTACK)) then
		return tpz.msg.basic.STATUS_PREVENTS,0
	elseif not (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_1) or
		player:hasStatusEffect(tpz.effect.FINISHING_MOVE_2) or
		player:hasStatusEffect(tpz.effect.FINISHING_MOVE_3) or
        player:hasStatusEffect(tpz.effect.FINISHING_MOVE_4) or
        player:hasStatusEffect(tpz.effect.FINISHING_MOVE_5) or
		player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
        return tpz.msg.basic.NO_FINISHINGMOVES,0
	elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_1) or
		player:hasStatusEffect(tpz.effect.FINISHING_MOVE_2) or
		player:hasStatusEffect(tpz.effect.FINISHING_MOVE_3) or
        player:hasStatusEffect(tpz.effect.FINISHING_MOVE_4) or
        player:hasStatusEffect(tpz.effect.FINISHING_MOVE_5) or
		player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
		return 0,0
    end
end

function onUseAbility(player, target, ability)
    local crits
	
	if (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_1)) then
		if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
            player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_1)
			crits = 1
		end
	elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_2)) then
		if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
            player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_2)
			crits = 2
		end
	elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_3)) then
		if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
            player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_3)
			crits = 3
		end
    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_4)) then
		if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
            player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_4)
			crits = 4
		end
    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_5)) then
		if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
            player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_5)
			crits = 5
		end
	end
	
	player:setCharVar("ClimacticFlourishCrits", crits)
	
    player:addStatusEffect(tpz.effect.CLIMACTIC_FLOURISH, 1, 0, 60)
end