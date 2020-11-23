-----------------------------------------
-- ID: 17988
-- Item: Spark Kris
-- Additional Effect: Lightning damage (Requires Battery/Kilo Battery/Mega Battery to be equipped)
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onAdditionalEffect(player, target, damage)
    local ammoSlot = player:getEquipID(3)
	local dmg = 0
	local message = tpz.msg.basic.ADD_EFFECT_DMG
	
    if (ammoSlot == 18228) then -- Battery
        dmg = math.random(20, 23)
	elseif (ammoSlot == 18229) then -- Kilo Battery
		dmg = math.random(28, 31)
	elseif (ammoSlot == 18230) then -- Mega Battery
		dmg = math.random(36, 39)
    end
	
	-- Check all of the player's inventories for the Battery/Kilo Battery/Mega Battery then consumes one each time the additional effect triggers
	for i = tpz.inv.INVENTORY, tpz.inv.WARDROBE4 do
        if (player:hasItem(ammoSlot, i)) then
            player:delItem(ammoSlot, 1, i)
            break
        end
    end

	if (ammoSlot == 18228) or (ammoSlot == 18229) or (ammoSlot == 18230) then
		local params = {}
			params.bonusmab = 0
			params.includemab = false
		dmg = addBonusesAbility(player, tpz.magic.ele.LIGHTNING, target, dmg, params)
		dmg = dmg * applyResistanceAddEffect(player, target, tpz.magic.ele.LIGHTNING, 0)
		dmg = adjustForTarget(target, dmg, tpz.magic.ele.LIGHTNING)
		dmg = finalMagicNonSpellAdjustments(player, target, tpz.magic.ele.LIGHTNING, dmg)

		if (dmg < 0) then
			message = tpz.msg.basic.ADD_EFFECT_HEAL
		end

		return tpz.subEffect.LIGHTNING_DAMAGE, message, dmg
	else
		return 0
	end
end