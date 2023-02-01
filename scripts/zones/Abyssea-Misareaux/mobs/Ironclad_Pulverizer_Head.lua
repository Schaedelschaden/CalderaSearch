-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Ironclad Pulverizer (Head)
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.STUNRES, 30)
    mob:addMod(tpz.mod.FASTCAST, 60)
    mob:AnimationSub(1)
    mob:hideName(false)
    mob:untargetable(false)
    mob:setUnkillable(true)
end

function onMobFight(mob, target)
    if mob:getHPP() <= 5 then
        mob:AnimationSub(0)
        mob:hideName(true)
        mob:untargetable(true)

        mob:timer(3000, function(mobArg)
            DespawnMob(mobArg:getID())
        end)
    end
end

function onMobDespawn(mob)
    mob:setMobFlags(5, mob:getID())

    local body = GetMobByID(mob:getID() - 1)

    if body then
        body:AnimationSub(0)

        body:timer(4000, function(mobArg)
            mobArg:hideName(false)
            mobArg:untargetable(false)
            mobArg:setUnkillable(false)
            mobArg:SetAutoAttackEnabled(true)
            mobArg:SetMobAbilityEnabled(true)
            mobArg:setMobMod(tpz.mobMod.NO_MOVE, 0)
            mobArg:setBehaviour(bit.bor(mobArg:getBehaviour(), 0))
            mobArg:setMod(tpz.mod.REGEN, 0)
            mobArg:setMod(tpz.mod.REGAIN, 250)
        end)
    end
end

function onMobDeath(mob, player, isKiller)
end
