-----------------------------------------
-- Spell: Jettatura
-- Enemies within a fan-shaped area originating from the caster are frozen with fear.
-- Spell cost: 37 MP
-- Monster Type: Birds
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 4
-- Stat Bonus: MP+15
-- Level: 48
-- Casting Time: 0.5 seconds
-- Recast Time: 2:00
-- Magic Bursts on: Compression, Gravitation, Darkness
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
    local params = {}
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.BLUE_MAGIC
		params.effect = tpz.effect.TERROR
		
    local resist = applyResistance(caster, target, spell, params)
    local duration = 2 * resist

    if (resist > 0.25) then -- Do it!
        if (target:isFacing(caster)) then
            if (target:addStatusEffect(params.effect, 1, 0, duration)) then
                spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
            else
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
			local reduceCE = 26
			targName[i] = v.entity:getName()
			
			if (v.entity:isPC()) then
				targ = GetPlayerByName(targName[i])
			else
				targ = v.entity
			end
			
			currentCE = target:getCE(targ)
			
			if (currentCE < 26) then
				reduceCE = currentCE - 1
			end

			if (targ:getName() ~= caster:getName()) then
				-- printf("jettatura.lua onSpellCast [%s] REDUCING [%s's] ENMITY BY [%i] FROM [%i] TO [%i]", caster:getName(), targ:getName(), reduceCE, target:getCE(targ), target:getCE(targ) - reduceCE)
				target:setCE(targ, target:getCE(targ) - reduceCE)
			end
		end
	end

    return params.effect
end