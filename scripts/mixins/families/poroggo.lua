-- Poroggo family mixin

require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.poroggo = function(mob)
    mob:addListener("WEAPONSKILL_STATE_EXIT", "PROVIDENCE_USED", function(mob, skillID)
		-- Slowga, Blindga, Bindga, Breakga, Graviga, Death
		local spells = {357, 361, 362, 365, 366, 367}
		
		if
            skillID == 1961 and -- Providence
            mob:hasStatusEffect(tpz.effect.PREPARATIONS)
        then
			mob:castSpell(spells[math.random(#spells)])
			mob:delStatusEffect(tpz.effect.PREPARATIONS)
		end
    end)
end

return g_mixins.families.poroggo
