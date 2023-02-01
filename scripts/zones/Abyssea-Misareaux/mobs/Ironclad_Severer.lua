-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Ironclad Severer
-----------------------------------
mixins = {require("scripts/mixins/families/iron_giant")}
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.GRAVITYRES, 100)
    mob:addMod(tpz.mod.BINDRES, 100)
    mob:addMod(tpz.mod.SLEEPRES, 100)
    mob:speed(90)

    mob:setMobMod(tpz.mobMod.ALWAYS_AGGRO, 1)
    mob:hideName(true)
    mob:untargetable(true)
    mob:setUnkillable(true)
    mob:SetAutoAttackEnabled(false)
    mob:SetMobAbilityEnabled(false)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
    mob:AnimationSub(1)
end

function onMobEngaged(mob, target)
    if mob:AnimationSub() == 1 then
        mob:AnimationSub(0)

        mob:timer(4000, function(mobArg)
            mobArg:hideName(false)
            mobArg:untargetable(false)
            mobArg:setUnkillable(false)
            mobArg:SetAutoAttackEnabled(true)
            mobArg:SetMobAbilityEnabled(true)
            mobArg:setMobMod(tpz.mobMod.NO_MOVE, 0)
            mobArg:setBehaviour(bit.bor(mobArg:getBehaviour(), 0))
        end)
    end
end

function onMobFight(mob, target)
    if mob:getHPP() <= 50 and mob:getLocalVar("REGAIN_LEVEL") == 0 then
        mob:addMod(tpz.mod.REGAIN, 100)
        mob:setLocalVar("REGAIN_LEVEL", 1)
    elseif mob:getHPP() <= 25 and mob:getLocalVar("REGAIN_LEVEL") == 1 then
        mob:addMod(tpz.mod.REGAIN, 100)
        mob:setLocalVar("REGAIN_LEVEL", 2)
    end
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
