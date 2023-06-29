-- Monoceros family mixin

require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.monoceros = function(mob)
    mob:SetAutoAttackEnabled(true)
	mob:SetMobSkillAttack(1226) -- Monoceros "normal" attacks

    mob:addListener("CRITICAL_TAKE", "MONOCEROS_CRITICAL_TAKE", function(mobArg, attacker)
        local chance = 10

        if mobArg:getLocalVar("HORN_BREAK_CHANCE") > 0 then
            chance = mobArg:getLocalVar("HORN_BREAK_CHANCE")
        end

        if
            math.random(100) < chance and
            mobArg:AnimationSub() == 0 and
            attacker:isInfront(mobArg, 60)
        then
            mobArg:AnimationSub(2)
        end
    end)
end

return g_mixins.families.monoceros
