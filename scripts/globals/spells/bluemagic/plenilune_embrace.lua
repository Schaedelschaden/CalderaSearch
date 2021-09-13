-----------------------------------------
-- Spell: Plenilune Embrace
-- Restores HP for the target party member
-- Spell cost: 106 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Light)
-- Blue Magic Points: 4
-- Stat Bonus: MP+5 STR+2
-- Level: 76
-- Casting Time: 4 seconds
-- Recast Time: 10 seconds
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local minCure = 350
    local divisor = 0.6666
    local constant = 230
    local power = getCurePowerOld(caster)
	
	if (power > 559) then
        divisor = 1.6 -- 2.8333
        constant = 491.2
    elseif (power > 319) then
        divisor =  1
        constant = 310
    end
	
	local basecure = getBaseCureOld(power,divisor,constant)
    local final = getCureFinal(caster,spell,basecure,minCure,true)
    local diff = (target:getMaxHP() - target:getHP())

    final = final + (final * (target:getMod(tpz.mod.CURE_POTENCY_RCVD)/100))

    if (target:getAllegiance() == caster:getAllegiance() and (target:getObjType() == tpz.objType.PC or target:getObjType() == tpz.objType.MOB)) then
        --Applying server mods....
        final = final * CURE_POWER
    end

    if (final > diff) then
        final = diff
    end
	
	-- Check the moon phase and set the buff values
	local moon = VanadielMoonPhase()
	local attValue = 0
	local mattValue = 0

    if moon > 90 then
        attValue = 15 -- Retail value 15% ATTP
		mattValue = 1 -- Retail value 1 MATT
    elseif moon > 75 then
        attValue = 12.25 -- Retail value 12.25% ATTP
		mattValue = 3 -- Retail value 3 MATT
    elseif moon > 60 then
        attValue = 10 -- Retail value 10% ATTP
		mattValue = 5 -- Retail value 5 MATT
    elseif moon > 40 then
        attValue = 7.5 -- Retail value 7.5% ATTP
		mattValue = 7 -- Retail value 7 MATT
    elseif moon > 25 then
        attValue = 5.25 -- Retail value 5.25% ATTP
		mattValue = 10 -- Retail value 10 MATT
    elseif moon > 10 then
        attValue = 4.5 -- Retail value 4.5% ATTP
		mattValue = 12 -- Retail value 12 MATT
    else
        attValue = 1 -- Retail value 1% ATTP
		mattValue = 15 -- Retail value 15 MATT
    end
	
	-- Add the Attack and Magic Attack buffs
	caster:addStatusEffect(tpz.effect.ATTACK_BOOST, attValue, 0, 90)
	caster:addStatusEffect(tpz.effect.MAGIC_ATK_BOOST, mattValue, 0, 90)

	-- Curse II prevents restoring HP
	if not (caster:hasStatusEffect(20)) then
		target:addHP(final)
		target:wakeUp()
		caster:updateEnmityFromCure(target,final)
	end
	
    spell:setMsg(tpz.msg.basic.MAGIC_RECOVERS_HP)

    return final
end