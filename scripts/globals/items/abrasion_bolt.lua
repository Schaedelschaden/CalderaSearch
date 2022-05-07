-----------------------------------------
-- ID: 21314
-- Item: Abrasion Bolt
-- Additional Effect: Weakens Defense
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
	printf("abrasion_bolt.lua onAdditionalEffect NAME: [%s]", player:getName())
    local chance = 95
	local targetMLvl = target:getMainLvl()
	local playerMLvl = player:getMainLvl()
	
	if (player:isPC()) then
		playerMLvl = playerMLvl + player:getItemLevel()
	end
	
    if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl())
        chance = utils.clamp(chance, 20, 95)
    end
	
    if (math.random(0, 99) >= chance or applyResistanceAddEffect(player, target, tpz.magic.ele.WIND, 0) <= 0.5) then
        return 0, 0, 0
    else
        target:delStatusEffect(tpz.effect.DEFENSE_BOOST)
        target:addStatusEffect(tpz.effect.DEFENSE_DOWN, 20, 0, 60)
        return tpz.subEffect.DEFENSE_DOWN, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.DEFENSE_DOWN
    end
end