require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.avatar = function(mob)
    mob:addListener("SPAWN", "AVATAR_SPAWN", function(mobArg)
        mobArg:setModelId(math.random(791, 798))
        mobArg:hideName(false)
        mobArg:untargetable(true)
        mobArg:setUnkillable(true)
        mobArg:SetAutoAttackEnabled(false)
        mobArg:SetMagicCastingEnabled(false)
    end)

    mob:addListener("TICK", "TIMED_ASTRAL_FLOW", function(mobArg)
        if
            (mobArg:getLocalVar("AstralFlowTimer") == 0 or
             os.time() >= mobArg:getLocalVar("AstralFlowTimer")) and
            mobArg:getLocalVar("AstralFlowUsed") == 0
        then
            local abilityID = nil
            local modelID   = mobArg:getModelId()

            switch (modelID) : caseof
            {
                [791] = function (x) abilityID = 919 end, -- Carbuncle
                [792] = function (x) abilityID = 839 end, -- Fenrir
                [793] = function (x) abilityID = 913 end, -- Ifrit
                [794] = function (x) abilityID = 914 end, -- Titan
                [795] = function (x) abilityID = 915 end, -- Leviathan
                [796] = function (x) abilityID = 916 end, -- Garuda
                [797] = function (x) abilityID = 917 end, -- Shiva
                [798] = function (x) abilityID = 918 end, -- Ramuh
            }

            if abilityID ~= nil then
                mobArg:useMobAbility(abilityID)
                mobArg:setLocalVar("AstralFlowUsed", 1)
            end
        end
    end)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "AVATAR_MOBSKILL_FINISHED", function(mobArg)
        mobArg:setUnkillable(false)
        mobArg:setHP(0)
    end)
end

return g_mixins.families.avatar