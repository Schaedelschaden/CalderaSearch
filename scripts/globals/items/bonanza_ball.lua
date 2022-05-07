-----------------------------------------
-- ID: 18468
-- Item: Bonanza Ball
-- Additional Effect: Gil Toss
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/weaponskills")
-----------------------------------

function onItemCheck(target, itemCheck)
	if (itemCheck == 1) then --Equip
		target:PrintToPlayer(string.format("WARNING: THROWING THIS WEAPON WILL ACTIVATE THE GIL TOSS ADDITIONAL EFFECT, USE AT YOUR OWN RISK."),tpz.msg.channel.SYSTEM_1)
	end
end

function onAdditionalEffect(player, target, damage)
	local ammoQty = player:getAmmoQuantity()
	local totalGil = player:getGil()
	local thrownGil = totalGil * (ammoQty / 100)
	local tp = player:getTP()
	local ftp = fTP(tp, 0.1, 0.8, 1.2)
	
	local dmg = (thrownGil / 100) * ftp -- 1m gil per 10k damage
	
	player:delGil(thrownGil)
	
	local message = tpz.msg.basic.ADD_EFFECT_DMG
	
	if (dmg < 0) then
		message = tpz.msg.basic.ADD_EFFECT_HEAL
	end
    
	return tpz.subEffect.LIGHT_DAMAGE, message, dmg
end