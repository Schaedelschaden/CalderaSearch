---------------------------------------------
-- Healing Ruby II (Carbuncle Blood Pact)
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
--	printf("Healing Ruby II PET onPetAbility\n")
    local base = 28 + pet:getMainLvl()*4

    if (target:getHP()+base > target:getMaxHP()) then
        base = target:getMaxHP() - target:getHP() --cap it
    end
	
	skill:setMsg(tpz.msg.basic.SELF_HEAL_SECONDARY)
    target:addHP(base)
	
    return base
end