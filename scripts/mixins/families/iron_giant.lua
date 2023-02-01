-- Iron Giant family mixin

require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.iron_giant = function(mob)
    mob:SetAutoAttackEnabled(true)
	mob:SetMobSkillAttack(1181) -- Ironclad "normal" attacks
end

return g_mixins.families.iron_giant
