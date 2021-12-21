-----------------------------------
-- Ability: Chivalry
-- Converts TP to MP.
-- Obtained: Paladin Level 75 (Must be Purchased with Merit Points)
-- Recast Time: 0:10:00 (+5% MP granted per additional upgrade)
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    local merits = player:getMerit(tpz.merit.CHIVALRY) - 5
    local tp = target:getTP()
	
	if (merits < 0) then
		merits = 0
	end
	
	if (target:getObjType() == tpz.objType.TRUST and tp < 1000) then
		tp = 1000
	end
	
    -- (TP * .5) + (0.015 * TP * MND) = MP gained
    local amount = ((tp * 0.05) + (0.0015 * tp) * target:getStat(tpz.mod.MND)) * ((100 + merits) / 100)
    target:setTP(0)
    return target:addMP(amount)
end
