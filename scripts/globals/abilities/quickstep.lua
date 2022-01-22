-----------------------------------
-- Ability: Quickstep
-- Lowers target's evasion. If successful, you will earn two Finishing Moves.
-- Obtained: Dancer Level 20
-- TP Required: 10%
-- Recast Time: 00:05
-- Duration: First Step lasts 1 minute, each following Step extends its current duration by 30 seconds.
-----------------------------------
require("scripts/globals/weaponskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if (player:getAnimation() ~= 1) then
        return tpz.msg.basic.REQUIRES_COMBAT,0
    else
        if (player:hasStatusEffect(tpz.effect.TRANCE)) then
            return 0,0
        elseif (player:getTP() < 100) then
            return tpz.msg.basic.NOT_ENOUGH_TP,0
        else
            return 0,0
        end
    end
end

function onUseAbility(player, target, ability, action)
    -- Only remove TP if the player doesn't have Trance.
    if not player:hasStatusEffect(tpz.effect.TRANCE) then
        player:delTP(100 - player:getMod(tpz.mod.STEP_TP_CONSUMED))
    end
	
	local StepACC = player:getMod(tpz.mod.STEP_ACCURACY)
    local hit = 1
	local statusEffect
	local duration
	local tier = 1
	local power
	local finishingMoves = 2

    if math.random() <= player:getHitRate(target, 0, StepACC) then
        hit = 5
        local mjob = player:getMainJob()

        if (mjob == tpz.job.DNC) then -- DNC Main
			if (player:hasStatusEffect(tpz.effect.PRESTO)) then
				if (target:hasStatusEffect(tpz.effect.LETHARGIC_DAZE_1)) then
					statusEffect = target:getStatusEffect(tpz.effect.LETHARGIC_DAZE_1)
					duration = statusEffect:getDuration() + 30
					
					if (statusEffect:getTier() < 10) then
						tier = statusEffect:getTier() + 5
						finishingMoves = 5
					else
						tier = 10
						finishingMoves = 1
					end
					
					target:delStatusEffectSilent(tpz.effect.LETHARGIC_DAZE_1)
				else
					tier = 5
					duration = 60
				end
			else
				if (target:hasStatusEffect(tpz.effect.LETHARGIC_DAZE_1)) then
					statusEffect = target:getStatusEffect(tpz.effect.LETHARGIC_DAZE_1)
					tier = statusEffect:getTier() + 1
					duration = statusEffect:getDuration() + 30
					
					target:delStatusEffectSilent(tpz.effect.LETHARGIC_DAZE_1)
				else
					duration = 60
				end
			end
			
			if (tier > 10) then
				tier = 10
			end
        else -- DNC Sub
			finishingMoves = 1
		
			if (target:hasStatusEffect(tpz.effect.LETHARGIC_DAZE_1)) then
				statusEffect = target:getStatusEffect(tpz.effect.LETHARGIC_DAZE_1)
				tier = statusEffect:getTier() + 1
				duration = statusEffect:getDuration() + 30
				
				target:delStatusEffectSilent(tpz.effect.LETHARGIC_DAZE_1)
			else
				duration = 60
			end
			
			if (tier > 5) then
				tier = 5
			end
        end
		
		power = tier * 8
		
		-- Effect, Power, Tick, Duration, SubID, SubPower, Tier
		target:addStatusEffect(tpz.effect.LETHARGIC_DAZE_1, power, 0, duration, 0, 0, tier)
		
		if (player:hasStatusEffect(tpz.effect.PRESTO) and finishingMoves > 1 and not player:hasStatusEffect(tpz.effect.FINISHING_MOVE_5)) then
			player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_1)
			player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_2)
			player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_3)
			player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_4)
			player:addStatusEffect(tpz.effect.FINISHING_MOVE_5, 1, 0, 7200)
        elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_1)) then
            player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_1)
            player:addStatusEffect(tpz.effect.FINISHING_MOVE_1 + finishingMoves, 1, 0, 7200)
        elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_2)) then
            player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_2)
            player:addStatusEffect(tpz.effect.FINISHING_MOVE_2 + finishingMoves, 1, 0, 7200)
        elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_3)) then
            player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_3)
            if (finishingMoves > 2) then
                finishingMoves = 2
            end
            player:addStatusEffect(tpz.effect.FINISHING_MOVE_3 + finishingMoves, 1, 0, 7200)
        elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_4)) then
            player:delStatusEffectSilent(tpz.effect.FINISHING_MOVE_4)
            player:addStatusEffect(tpz.effect.FINISHING_MOVE_5, 1, 0, 7200)
        elseif (player:hasStatusEffect(tpz.effect.FINISHING_MOVE_5)) then
			
        else
            player:addStatusEffect(tpz.effect.FINISHING_MOVE_1 - 1 + finishingMoves, 1, 0, 7200)
        end

    else
        ability:setMsg(tpz.msg.basic.JA_MISS)
    end

    action:animation(target:getID(), getStepAnimation(player:getWeaponSkillType(tpz.slot.MAIN)))
    action:speceffect(target:getID(), hit)
	
	player:delStatusEffect(tpz.effect.PRESTO)
    
	return tier
end