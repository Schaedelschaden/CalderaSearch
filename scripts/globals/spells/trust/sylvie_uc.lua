-----------------------------------------
-- Trust: Sylvie UC
-----------------------------------------
require("scripts/globals/trust")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
	mob:SetAutoAttackEnabled(false)

	mob:addListener("COMBAT_TICK", "SYLVIE_ACC_CHECK", function(mob, target)
		local master = mob:getMaster()
        local masterACC = master:getACC()
		local enemyEVA = target:getEVA()
		
		if (masterACC - enemyEVA > 100) then
			mob:setLocalVar("SYLVIE_ACC_SPELL_TRIGGER", 1)
		else
			mob:setLocalVar("SYLVIE_ACC_SPELL_TRIGGER", 2)
		end
    end)
end