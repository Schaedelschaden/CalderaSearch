---------------------------------------------
-- Crimson Howl (Ifrit Blood Pact)
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

function onPetAbility(target, pet, skill, player)
	local bonusTime = utils.clamp(player:getSkillLevel(tpz.skill.SUMMONING_MAGIC) - 300, 0, 200)
	local petLvl = pet:getMainLvl()
--	printf("Crimson Howl PET onPetAbility PET LEVEL: [%i]\n",petLvl)
	local potency = (petLvl / 16) + 4.75
--	printf("Crimson Howl PET onPetAbility POTENCY: [%i]\n",potency)
	local duration = 60 + bonusTime

    target:addStatusEffect(tpz.effect.WARCRY,potency,0,duration)
    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
    return tpz.effect.WARCRY
end