-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Amhuluk
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.SLEEPRES, 100)
    mob:addMod(tpz.mod.SILENCERES, 100)
    mob:addMod(tpz.mod.PETRIFYRES, 100)
    mob:addMod(tpz.mod.BINDRES, 100)
    mob:addMod(tpz.mod.BINDRES, 100)
    mob:addMod(tpz.mod.CURSERES, 100)
    mob:addMod(tpz.mod.GRAVITYRES, 100)
    mob:addMod(tpz.mod.SLOWRES, 100)
    mob:addMod(tpz.mod.STUNRES, 100)
    mob:addMod(tpz.mod.REGAIN, 25)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        local mobSkills = {2431, 2432, 2433, 2642}

        if
            os.time() > mobArg:getLocalVar("SPAM_PROTECTION") and
            math.random(1, 100) <= 60
        then
            mobArg:useMobAbility(math.random(#mobSkills))
            mobArg:setLocalVar("SPAM_PROTECTION", os.time() + 5)

            mobArg:timer(5000, function(mob)
                mob:setLocalVar("SPAM_PROTECTION", 0)
            end)
        end
    end)
end

function onMobFight(mob, target)
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_USED")
end
