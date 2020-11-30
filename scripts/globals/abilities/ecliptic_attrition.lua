-----------------------------------
-- Ability: Ecliptic Attrition
-- Enhances the effects of your luopan.
-- Increases the rate at which your luopan consumes its HP.
-- Obtained: Geomancer Level 25
-- Recast Time: 00:05:00
-- Duration: N/A 
-- Notes: Luopan Potency +25%
-- Base HP drain rate is 24HP/tic. With Ecliptic attrition it is 30HP/tic.
-- Operates on a shared recast timer with Lasting Emanation
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if not (player:hasPet()) or not (player:getPetID() == tpz.pet.id.LUOPAN) then
        return tpz.msg.basic.REQUIRE_LUOPAN, 0
	end
	
	if (player:hasStatusEffect(tpz.effect.BOLSTER)) then
		return tpz.msg.basic.CANNOT_PERFORM
    end
	
    return 0,0
end

function onUseAbility(player, target, ability)
    local luopan = player:getPet()
    local luopanLvl = luopan:getMainLvl()
	local regenDown = math.floor(luopanLvl / 16)
	
    luopan:addStatusEffect(tpz.effect.ECLIPTIC_ATTRITION, regenDown, 0, 0)
end