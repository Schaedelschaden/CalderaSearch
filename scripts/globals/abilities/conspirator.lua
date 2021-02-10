-----------------------------------
-- Ability: Conspirator
-- Enhances accuracy and "Subtle Blow" effect for party members within area of effect.
-- Does not affect the party member being targeted by the enemy.
-- Obtained: Thief Level 87
-- Recast Time: 5:00
-- Duration: 1:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(player, target, ability)
	local power = 0
	local subPower = player:getMod(tpz.mod.AUGMENTS_CONSPIRATOR)
    local mob = player:getTarget()
	
    if mob then
        local enmityList = mob:getEnmityList()
        if enmityList and #enmityList > 0 then
            if #enmityList > 1 and #enmityList < 6 then
                power = 4
            elseif #enmityList == 6 then
                power = 5
            else
                power = 6
            end
        end

        -- See if we should apply the effects to the player at the top of the hate list
        if mob:getTarget() == target then
            return
        end
    end

    target:addStatusEffect(tpz.effect.CONSPIRATOR, power, 0, 60, 0, subPower)
end