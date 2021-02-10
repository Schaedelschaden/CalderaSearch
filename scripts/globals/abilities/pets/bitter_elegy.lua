---------------------------------------------
-- Bitter Elegy (Siren Blood Pact)
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
	if target:addStatusEffect(tpz.effect.ELEGY, 5000, 0, 180) then
        skill:setMsg(tpz.msg.basic.SKILL_ENFEEB)
    else
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT) -- no effect
    end
	
	PlayPetAnimation(pet, target, 13, 181)
	
    return tpz.effect.ELEGY
end