---------------------------------------------------
-- Raise II (Cait Sith Blood Pact)
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
--	printf("Raise II Pet onPetAbility\n")
	local animationID = 159
	target:sendRaise(2)
	PlayPetAnimation(pet, target, 13, animationID)
end