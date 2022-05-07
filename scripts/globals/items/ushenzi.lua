-----------------------------------------
-- ID: 21690
-- Item: Ushenzi
-- Additional Effect: Dispel (Current dispel rate is guesstimate)
-----------------------------------------
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 2
	
    if math.random(100) <= chance then
        local effect = target:dispelStatusEffect()
		
        if effect ~= tpz.effect.NONE then
            return tpz.subEffect.DISPEL, tpz.msg.basic.ADD_EFFECT_DISPEL, effect
        end
    end

    return 0, 0, 0
end