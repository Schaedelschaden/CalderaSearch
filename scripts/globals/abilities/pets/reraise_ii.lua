---------------------------------------------
-- Reraise II (Cait Sith Blood Pact)
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
	local animationID = 1689
	target:addStatusEffect(tpz.effect.RERAISE, 2, 0, 3600)
	PlayPetAnimation(pet, target, animationID)
end