-----------------------------------------
-- ID: 17516
-- Item: Hydro Patas
-- Additional Effect: Water damage (Requires Hydro/Kilo/Mega Pump to be equipped)
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onAdditionalEffect(player, target, damage)
    local ammoSlot = player:getEquipID(3)
	local dmg = 0
	local message = tpz.msg.basic.ADD_EFFECT_DMG
	
    if (ammoSlot == 18232) then -- Hydro Pump
        dmg = math.random(20, 25)
	elseif (ammoSlot == 18233) then -- Kilo Pump
		dmg = math.random(30, 35)
	elseif (ammoSlot == 18234) then -- Mega Pump
		dmg = math.random(40, 45)
    end
	
	-- Check all of the player's inventories for the Hydro/Kilo/Mega Pumps then consume one each time the additional effect triggers
	for i = tpz.inv.INVENTORY, tpz.inv.WARDROBE4 do
        if (player:hasItem(ammoSlot, i)) then
            player:delItem(ammoSlot, 1, i)
            break
        end
    end

	if (ammoSlot == 18232) or (ammoSlot == 18233) or (ammoSlot == 18234) then
		local params = {}
			params.bonusmab = 0
			params.includemab = false
		dmg = addBonusesAbility(player, tpz.magic.ele.WATER, target, dmg, params)
		dmg = dmg * applyResistanceAddEffect(player, target, tpz.magic.ele.WATER, 0)
		dmg = adjustForTarget(target, dmg, tpz.magic.ele.WATER)
		dmg = finalMagicNonSpellAdjustments(player, target, tpz.magic.ele.WATER, dmg)

		if (dmg < 0) then
			message = tpz.msg.basic.ADD_EFFECT_HEAL
		end

		return tpz.subEffect.WATER_DAMAGE, message, dmg
	else
		return 0
	end
end