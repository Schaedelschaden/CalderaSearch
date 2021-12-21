-----------------------------------------
-- Spell: Foil
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
	local power = 40
	
	if (target:hasStatusEffect(tpz.effect.EMBOLDEN)) then
		power = power * 1.5
		target:delStatusEffect(tpz.effect.EMBOLDEN)
	end

    if target:addStatusEffect(tpz.effect.FOIL, power, 0, 30) then
        spell:setMsg(tpz.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(tpz.msg.basic.MAGIC_NO_EFFECT)
    end
	
	-- local mob = caster:getTarget()
	
	-- if (mob and mob:getObjType() == tpz.objType.MOB) then
		-- local enmityList = mob:getEnmityList()
		-- local targName = {}
		-- local targ
		-- local currentCE

		-- for i, v in ipairs(enmityList) do
			-- local reduceCE = 100
			-- targName[i] = v.entity:getName()
			
			-- if (v.entity:isPC()) then
				-- targ = GetPlayerByName(targName[i])
			-- else
				-- targ = v.entity
			-- end
			
			-- currentCE = mob:getCE(targ)
			
			-- if (currentCE < 101) then
				-- reduceCE = currentCE - 1
			-- end

			-- if (targ:getName() ~= caster:getName()) then
				-- -- printf("foil.lua onSpellCast [%s] REDUCING [%s's] ENMITY BY [%i] FROM [%i] TO [%i]", caster:getName(), targ:getName(), reduceCE, target:getCE(targ), target:getCE(targ) - reduceCE)
				-- target:setCE(targ, target:getCE(targ) - reduceCE)
			-- end
		-- end
	-- end

    return tpz.effect.FOIL
end