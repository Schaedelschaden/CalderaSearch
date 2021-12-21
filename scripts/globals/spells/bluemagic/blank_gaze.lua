-----------------------------------------
-- Spell: Blank Gaze
-- Removes one beneficial magic effect from an enemy
-- Spell cost: 25 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Light)
-- Blue Magic Points: 2
-- Stat Bonus: None
-- Level: 38
-- Casting Time: 3 seconds
-- Recast Time: 10 seconds
-- Magic Bursts on: Transfixion, Fusion, Light
-- Combos: None
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local dINT = (caster:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))
    local params = {}
    params.attribute = tpz.mod.INT
    params.skillType = tpz.skill.BLUE_MAGIC

    local resist = applyResistance(caster, target, spell, params)
    local effect = tpz.effect.NONE

    if (resist > 0.0625) then
        if (target:isFacing(caster)) then
            spell:setMsg(tpz.msg.basic.MAGIC_ERASE)
            effect = target:dispelStatusEffect()
            if (effect == tpz.effect.NONE) then
                spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
            end
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end
	
	if (caster:getObjType() == tpz.objType.PC) then
		local enmityList = target:getEnmityList()
		local targName = {}
		local targ
		local currentCE

		for i, v in ipairs(enmityList) do
			local reduceCE = 100
			targName[i] = v.entity:getName()
			
			if (v.entity:isPC()) then
				targ = GetPlayerByName(targName[i])
			else
				targ = v.entity
			end
			
			currentCE = target:getCE(targ)
			
			if (currentCE < 101) then
				reduceCE = currentCE - 1
			end

			if (targ:getName() ~= caster:getName()) then
				-- printf("blank_gaze.lua onSpellCast [%s] REDUCING [%s's] ENMITY BY [%i] FROM [%i] TO [%i]", caster:getName(), targ:getName(), reduceCE, target:getCE(targ), target:getCE(targ) - reduceCE)
				target:setCE(targ, target:getCE(targ) - reduceCE)
			end
		end
	end

    return effect
end