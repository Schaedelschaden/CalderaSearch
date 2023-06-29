-- Orobon family mixin

require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.orobon = function(mob)
    mob:addListener("CRITICAL_TAKE", "OROBON_CRITICAL_TAKE", function(mobArg)
        if math.random(100) < 20 and mobArg:AnimationSub() == 0 then
            mobArg:AnimationSub(1)
        end
    end)
end

return g_mixins.families.orobon
