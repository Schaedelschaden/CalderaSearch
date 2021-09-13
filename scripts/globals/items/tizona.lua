-----------------------------------------
-- ID: 19006
-- Item: Tizona
-- Additional effect: MP Gain from damage dealt
-----------------------------------------
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------

local weaponID = {19006, 19075, 19095, 19627, 19725, 19834, 19963, 20651, 20652, 20688}
local chance = {10, 15, 20, 25, 25, 30, 30, 30, 30, 30}

function onAdditionalEffect(player, target, damage)
	local mainWeapon = player:getEquipID(tpz.slot.MAIN)
	local effectChance = 0
	
	for i = 1, #weaponID do
		if (mainWeapon == weaponID[i]) then
			effectChance = chance[i]
		end
	end

    if math.random(100) <= effectChance then
        local drain = math.floor(damage * math.random(10, 20) / 100)
        player:addMP(drain)

        return tpz.subEffect.MP_DRAIN, tpz.msg.basic.ADD_EFFECT_MP_DRAIN, drain
    end

    return 0, 0, 0
end