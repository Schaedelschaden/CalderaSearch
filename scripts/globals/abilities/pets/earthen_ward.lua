---------------------------------------------
-- Earthen Ward (Titan Blood Pact)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	return 0,0
end

function onPetAbility(target, pet, skill)
	target:delStatusEffect(tpz.effect.STONESKIN)
	
    local amount = pet:getMainLvl() * 2 + 50
	
	local master = pet:getMaster()
	
	if (master:getEquipID(tpz.slot.MAIN) == 21167) then
		amount = amount * 2
	end
	
    target:addStatusEffect(tpz.effect.STONESKIN, amount, 0, 900, 0, 0, 3)
    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
	
    return tpz.effect.STONESKIN
end