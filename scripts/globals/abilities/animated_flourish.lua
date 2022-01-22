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
        target:addEnmity(player, 0, 1500)
		
    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_3)) then
		if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
			player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_3)
			player:addStatusEffect(tpz.effect.FINISHING_MOVE_1, 1, 0, 7200)
		end
        target:addEnmity(player, 0, 1500)

    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_4)) then
		if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
			player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_4)
			player:addStatusEffect(tpz.effect.FINISHING_MOVE_2, 1, 0, 7200)
		end
        target:addEnmity(player, 0, 1500)

    elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_5)) then
		if not (player:hasStatusEffect(tpz.effect.GRAND_PAS)) then
			player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_5)
			player:addStatusEffect(tpz.effect.FINISHING_MOVE_3, 1, 0, 7200)
		end
        target:addEnmity(player, 0, 1500)
    end
	
	if (player:getObjType() == tpz.objType.PC) then
		local enmityList = target:getEnmityList()
		local targName = {}
		local targ
		local currentCE

		for i, v in ipairs(enmityList) do
			local reduceCE = 26
			targName[i] = v.entity:getName()
			
			if (v.entity:isPC()) then
				targ = GetPlayerByName(targName[i])
			else
				targ = v.entity
			end
			
			currentCE = target:getCE(targ)
			
			if (currentCE < 26) then
				reduceCE = currentCE - 1
			end

			if (targ:getName() ~= player:getName()) then
				-- printf("animated_flourish.lua onUseAbility [%s] REDUCING [%s's] ENMITY BY [%i] FROM [%i] TO [%i]", player:getName(), targ:getName(), reduceCE, target:getCE(targ), target:getCE(targ) - reduceCE)
				target:setCE(targ, target:getCE(targ) - reduceCE)
			end
		end
	end
end