-----------------------------------
-- Ability: Earth Maneuver
-- Enhances the effect of earth attachments. Must have animator equipped.
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

    local burden = 15
    if (target:getStat(tpz.mod.VIT) < target:getPet():getStat(tpz.mod.VIT)) then
        burden = 20
    end

    local currentBurden = target:addBurden(tpz.magic.ele.EARTH-1, burden)
	local threshold = 30 + player:getMod(tpz.mod.OVERLOAD_THRESH)
	local overloadDegree = currentBurden - threshold
	local overloadChance = 5 + overloadDegree
	local roll = math.random(1, 100)
	local overloaded = false
	
	if (overloadChance < 0) then
		overloadChance = 0
	end
	
	if (roll < overloadChance) then
		overloaded = true
	end
	-- printf("earth_maneuver.lua onUseAbility PLAYER: [%s]  CURRENT BURDEN: [%i] THRESHOLD: [%i]  OVERLOAD CHANCE: [%i] ROLL: [%i]", player:getName(), currentBurden, threshold, overloadChance, roll)

    if (overloaded == true and
        (player:getMod(tpz.mod.PREVENT_OVERLOAD) > 0 or player:getPet():getMod(tpz.mod.PREVENT_OVERLOAD) > 0) and
        player:delStatusEffectSilent(tpz.effect.WATER_MANEUVER)) then
        overloaded = false
    end

    if (overloaded == true) then
		if (overloadDegree < 1) then
			overloadDegree = 1
		elseif (overloadDegree > 120) then
			overloadDegree = 120
		end
	
        target:removeAllManeuvers()
        target:addStatusEffect(tpz.effect.OVERLOAD, 0, 0, overloadDegree)
		
		ability:setMsg(tpz.msg.basic.OVERLOAD_CHANCE_OVERLOADED)
    else
        local level
        if (target:getMainJob() == tpz.job.PUP) then
            level = target:getMainLvl()
        else
            level = target:getSubLvl()
        end

        local bonus = 1 + (level / 15) + target:getMod(tpz.mod.MANEUVER_BONUS)

        if (target:getActiveManeuvers() == 3) then
            target:removeOldestManeuver()
        end

        local dur = player:getPet():getLocalVar("MANEUVER_DURATION")
        target:addStatusEffect(tpz.effect.EARTH_MANEUVER, bonus, 0, utils.clamp(dur,60,300))

		ability:setMsg(tpz.msg.basic.OVERLOAD_CHANCE)
    end

    return overloadChance
end