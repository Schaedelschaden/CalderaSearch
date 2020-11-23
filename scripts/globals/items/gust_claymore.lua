-----------------------------------------
-- ID: 18366
-- Item: Gust Claymore
-- Additional Effect: Wind damage (Requires Wind/Kilo/Mega Fan to be equipped)
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onAdditionalEffect(player, target, damage)
    local ammoSlot = player:getEquipID(3)
	local dmg = 0
	local message = tpz.msg.basic.ADD_EFFECT_DMG
	
    if (ammoSlot == 18236) then -- Wind Fan
        dmg = math.random(15, 20)
	elseif (ammoSlot == 18237) then -- Kilo Fan
		dmg = math.random(28, 34)
	elseif (ammoSlot == 18238) then -- Mega Fan
		dmg = math.random(40, 45)
    end
	
	-- Check all of the player's inventories for the Wind/Kilo/Mega Fans then consume one each time the additional effect triggers
	for i = tpz.inv.INVENTORY, tpz.inv.WARDROBE4 do
        if (player:hasItem(ammoSlot, i)) then
            player:delItem(ammoSlot, 1, i)
            break
        end
    end

	if (ammoSlot == 18236) or (ammoSlot == 18237) or (ammoSlot == 18238) then
		local params = {}
			params.bonusmab = 0
			params.includemab = false
		dmg = addBonusesAbility(player, tpz.magic.ele.WIND, target, dmg, params)
		dmg = dmg * applyResistanceAddEffect(player, target, tpz.magic.ele.WIND, 0)
		dmg = adjustForTarget(target, dmg, tpz.magic.ele.WIND)
		dmg = finalMagicNonSpellAdjustments(player, target, tpz.magic.ele.WIND, dmg)

		if (dmg < 0) then
			message = tpz.msg.basic.ADD_EFFECT_HEAL
		end

		return tpz.subEffect.WIND_DAMAGE, message, dmg
	else
		return 0
	end
end