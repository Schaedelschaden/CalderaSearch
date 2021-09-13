-----------------------------------
-- Ability: Dark Maneuver
-- Enhances the effect of dark attachments. Must have animator equipped.
-- Obtained: Puppetmaster level 1
-- Recast Time: 10 seconds (shared with all maneuvers)
-- Duration: 1 minute
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getWeaponSubSkillType(tpz.slot.RANGED) == 10 and
        not player:hasStatusEffect(tpz.effect.OVERLOAD) and
        player:getPet()) then
        return 0,0
    else
        return 71,0
    end
end

function onUseAbility(player,target,ability)

    local burden = 10
    if (target:getMP() < target:getPet():getMP()) then
        burden = 15
    end

    local currentBurden = target:addBurden(tpz.magic.ele.DARK-1, burden)
	local threshold = 30 + player:getMod(tpz.mod.OVERLOAD_THRESH)
	local overloadChance = 5 + (currentBurden - threshold)
	local roll = math.random(1, 100)
	local overloaded = false
	
	if (overloadChance < 0) then
		overloadChance = 0
	end
	
	if (roll < overloadChance) then
		overloaded = true
	end
--	printf("dark_maneuver.lua onUseAbility CURRENT BURDEN: [%i] OVERLOAD CHANCE: [%i] ROLL: [%i]", currentBurden, overloadChance, roll)

    if (overloaded == true and
        (player:getMod(tpz.mod.PREVENT_OVERLOAD) > 0 or player:getPet():getMod(tpz.mod.PREVENT_OVERLOAD) > 0) and
        player:delStatusEffectSilent(tpz.effect.WATER_MANEUVER)) then
        overloaded = false
    end

    if (overloaded == true) then
        target:removeAllManeuvers()
        target:addStatusEffect(tpz.effect.OVERLOAD, 0, 0, currentBurden - threshold)
		
		ability:setMsg(tpz.msg.basic.OVERLOAD_CHANCE_OVERLOADED)
    else
        if (target:getActiveManeuvers() == 3) then
            target:removeOldestManeuver()
        end

        local dur = player:getPet():getLocalVar("MANEUVER_DURATION")
        target:addStatusEffect(tpz.effect.DARK_MANEUVER, 0, 0, utils.clamp(dur, 60, 300))
		
		ability:setMsg(tpz.msg.basic.OVERLOAD_CHANCE)
    end

    return overloadChance
end