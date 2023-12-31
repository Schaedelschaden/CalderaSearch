---------------------------------------------
-- Spring Water (Leviathan Blood Pact)
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
    local base = 47 + pet:getMainLvl()*3
    local tp = skill:getTP()
	
    if tp < 1000 then
        tp = 1000
    end
	
    base = base * tp / 1000

	-- Curse II prevents restoring HP
	if not (target:hasStatusEffect(20)) then
		if (target:getHP()+base > target:getMaxHP()) then
			base = target:getMaxHP() - target:getHP() --cap it
		end
		
		target:delStatusEffect(tpz.effect.BLINDNESS)
		target:delStatusEffect(tpz.effect.POISON)
		target:delStatusEffect(tpz.effect.PARALYSIS)
		target:delStatusEffect(tpz.effect.DISEASE)
		target:delStatusEffect(tpz.effect.PETRIFICATION)
		target:delStatusEffect(tpz.effect.SILENCE)
		target:wakeUp()
		
		if math.random() > 0.5 then
			target:delStatusEffect(tpz.effect.SLOW)
		end
		
		skill:setMsg(tpz.msg.basic.SELF_HEAL)
		target:addHP(base)
	end
	
    return base
end