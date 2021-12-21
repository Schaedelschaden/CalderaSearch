-----------------------------------
-- Ability: Reverse Flourish
-- Converts remaining finishing moves into TP. Requires at least one Finishing Move.
-- Obtained: Dancer Level 40
-- Finishing Moves Used: 1-5
-- Recast Time: 00:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
	if (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_1) or
        player:hasStatusEffect(tpz.effect.FINISHING_MOVE_2) or
        player:hasStatusEffect(tpz.effect.FINISHING_MOVE_3) or
        player:hasStatusEffect(tpz.effect.FINISHING_MOVE_4) or
        player:hasStatusEffect(tpz.effect.FINISHING_MOVE_5) or
		player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
        return 0,0
    else
        return tpz.msg.basic.NO_FINISHINGMOVES,0
    end
end

function onUseAbility(player, target, ability)

    local TPGain = 0
	local bonus = player:getMod(tpz.mod.REVERSE_FLOURISH_BONUS)
    local STM = 5 + player:getMod(tpz.mod.REVERSE_FLOURISH_EFFECT)

    local Merits = player:getMerit(tpz.merit.REVERSE_FLOURISH_EFFECT)

    if (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_1)) then
        TPGain = (95 + bonus) * 1 + STM * 1 ^ 2 + Merits

    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_2)) then
        TPGain = (95 + bonus) * 2 + STM * 2 ^ 2 + Merits

    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_3)) then
        TPGain = (95 + bonus) * 3 + STM * 3 ^ 2 + Merits

    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_4)) then
        TPGain = (95 + bonus) * 4 + STM * 4 ^ 2 + Merits

    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_5)) then
        TPGain = (95 + bonus) * 5 + STM * 5 ^ 2 + Merits
    end

    player:addTP(TPGain)
	
	if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
		player:delStatusEffect(tpz.effect.FINISHING_MOVE_1)
		player:delStatusEffect(tpz.effect.FINISHING_MOVE_2)
		player:delStatusEffect(tpz.effect.FINISHING_MOVE_3)
		player:delStatusEffect(tpz.effect.FINISHING_MOVE_4)
		player:delStatusEffect(tpz.effect.FINISHING_MOVE_5)
	end

    return TPGain
end