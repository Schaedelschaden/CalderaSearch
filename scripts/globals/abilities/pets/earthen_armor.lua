---------------------------------------------
-- Earthen Armor (Titan Blood Pact)
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
	target:delStatusEffect(tpz.effect.EARTHEN_ARMOR)
	target:addStatusEffect(tpz.effect.EARTHEN_ARMOR, 75, 0, 60)

	skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
	return tpz.effect.EARTHEN_ARMOR
end