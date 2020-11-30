---------------------------------------------
-- Soothing Current (Leviathan Blood Pact)
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
	target:addStatusEffect(tpz.effect.CURING_CONDUIT,15,0,180)
	skill:setMsg(tpz.msg.basic.NONE)
--	printf("Soothing Current PET onUseAbility\n")
end