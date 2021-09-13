---------------------------------------------
-- Shock Squall (Ramuh Blood Pact)
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
	local resist = math.random()
	printf("shock_squall.lua onPetAbility RESIST: [%f]", resist)
	
    target:addStatusEffect(tpz.effect.STUN, 1, 0, 15 * resist)
	skill:setMsg(tpz.msg.basic.NONE)
	
    return tpz.effect.STUN
end