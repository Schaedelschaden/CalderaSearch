-----------------------------------
-- Ability: Striking Flourish
-- Allows you to deliver a twofold attack. Requires at least two finishing moves. 
-- Obtained: Dancer Level 89
-- Recast Time: 00:30
-- Duration: 1:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_1)) then
        return tpz.msg.basic.NO_FINISHINGMOVES,0
	elseif (player:hasStatusEffect(tpz.effect.CLIMACTIC_FLOURISH) or 
		player:hasStatusEffect(tpz.effect.TERNARY_FLOURISH) or
		player:hasStatusEffect(tpz.effect.SNEAK_ATTACK)) then
		return tpz.msg.basic.STATUS_PREVENTS,0
	elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_2) or
        player:hasStatusEffect(tpz.effect.FINISHING_MOVE_3) or
        player:hasStatusEffect(tpz.effect.FINISHING_MOVE_4) or
        player:hasStatusEffect(tpz.effect.FINISHING_MOVE_5) or
		player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
		return 0,0
    end
end

function onUseAbility(player, target, ability)
	if (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_2)) then
		if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
            player:delStatusEffect(tpz.effect.FINISHING_MOVE_2)
		end
    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_3)) then
		if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
            player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_3)
            player:addStatusEffect(tpz.effect.FINISHING_MOVE_1, 1, 0, 7200)
		end
    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_4)) then
		if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
            player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_4)
            player:addStatusEffect(tpz.effect.FINISHING_MOVE_2, 1, 0, 7200)
		end
    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_5)) then
		if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
            player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_5)
            player:addStatusEffect(tpz.effect.FINISHING_MOVE_3, 1, 0, 7200)
		end
	end
	
    player:addStatusEffect(tpz.effect.STRIKING_FLOURISH, 1, 0, 60)
end