-----------------------------------
-- Ability: Animated Flourish
-- Provokes the target. Requires at least one, but uses two Finishing Moves.
-- Obtained: Dancer Level 20
-- Finishing Moves Used: 1-2
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
		player:hasStatusEffect(tpz.effect.GRAND_PAS))
    then
        return 0,0
    else
        return tpz.msg.basic.NO_FINISHINGMOVES,0
    end
end

function onUseAbility(player, target, ability)
    if (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_1)) then
        if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
			player:delStatusEffect(tpz.effect.FINISHING_MOVE_1)
		end

    --Add extra enmity if 2 finishing moves are used
    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_2)) then
		if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
			player:delStatusEffect(tpz.effect.FINISHING_MOVE_2)
		end
        target:addEnmity(player, 0, 500)
		
    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_3)) then
		if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
			player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_3)
			player:addStatusEffect(tpz.effect.FINISHING_MOVE_1, 1, 0, 7200)
		end
        target:addEnmity(player, 0, 500)

    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_4)) then
		if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
			player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_4)
			player:addStatusEffect(tpz.effect.FINISHING_MOVE_2, 1, 0, 7200)
		end
        target:addEnmity(player, 0, 500)

    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_5)) then
		if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
			player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_5)
			player:addStatusEffect(tpz.effect.FINISHING_MOVE_3, 1, 0, 7200)
		end
        target:addEnmity(player, 0, 500)
    end
end