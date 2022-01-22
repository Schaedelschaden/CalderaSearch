-----------------------------------------
-- Spell: Flash
-- Temporarily blinds an enemy, greatly lowering its accuracy.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    -- Pull base stats.
    local dINT = (caster:getStat(tpz.mod.MND) - target:getStat(tpz.mod.MND))

    local params = {}
		params.diff = nil
		params.attribute = tpz.mod.INT
		params.skillType = tpz.skill.DIVINE_MAGIC
		params.bonus =  150
		params.effect = nil

    local resist = applyResistance(caster, target, spell, params)
    local duration = 12 * resist

    if (resist > 0.0625) then
        if (target:addStatusEffect(tpz.effect.FLASH, 800, 0, duration)) then
            spell:setMsg(tpz.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(tpz.msg.basic.MAGIC_RESIST)
    end
	
	if (caster:hasStatusEffect(tpz.effect.DIVINE_EMBLEM)) then
		caster:delStatusEffect(tpz.effect.DIVINE_EMBLEM)
	end
	
	if (caster:getObjType() == tpz.objType.PC or caster:getObjType() == tpz.objType.TRUST) then
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
				-- printf("flash.lua onSpellCast [%s] REDUCING [%s's] ENMITY BY [%i] FROM [%i] TO [%i]", caster:getName(), targ:getName(), reduceCE, target:getCE(targ), target:getCE(targ) - reduceCE)
				target:setCE(targ, target:getCE(targ) - reduceCE)
			end
		end
	end
	
    return tpz.effect.FLASH
end