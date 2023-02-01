require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.imp = function(mob)

    -- 20% chance to break horn on critical hit
    mob:addListener("CRITICAL_TAKE", "IMP_CRITICAL_TAKE", function(mobArg)
        local chance = 20

        if mobArg:getLocalVar("HORN_BREAK_CHANCE") > 0 then
            chance = mobArg:getLocalVar("HORN_BREAK_CHANCE")
        end

        if
            math.random(100) < chance and
            mobArg:AnimationSub() == 0
        then
            mobArg:AnimationSub(1)
        end
    end)

end

return g_mixins.families.imp
