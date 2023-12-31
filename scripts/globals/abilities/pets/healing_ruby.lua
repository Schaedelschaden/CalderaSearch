---------------------------------------------
-- Healing Ruby (Carbuncle Blood Pact)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	return 0,0
end

function onPetAbility(target, pet, skill)
--	printf("Healing Ruby PET onUseAbility\n")
    local base = 14 + target:getMainLvl() + pet:getTP() / 12
	
    if (pet:getMainLvl()>30) then
        base = 44 + 3 * (pet:getMainLvl() - 30) + pet:getTP() / 12 * (pet:getMainLvl() * 0.075 - 1)
    end

    if (target:getHP() + base > target:getMaxHP()) then
        base = target:getMaxHP() - target:getHP() --cap it
    end
	
    skill:setMsg(tpz.msg.basic.SELF_HEAL_SECONDARY)
    target:addHP(base)
	
    return base
end