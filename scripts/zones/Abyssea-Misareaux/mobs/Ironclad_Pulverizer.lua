-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Ironclad Pulverizer
-----------------------------------
mixins =
{
    require("scripts/mixins/families/iron_giant"),
    require("scripts/mixins/abyssea_weakness")
}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.STUNRES, 30)
    mob:addMod(tpz.mod.FASTCAST, 60)
    mob:setUnkillable(true)
end

function onMobFight(mob, target)
    if
        mob:getHPP() <= 5 and
        mob:getLocalVar("HEAD_DETACHED") == 0
    then
        -- Animation changes to pile of mob parts
        -- Mob should effectively be locked but will maintain aggro on its target
        mob:hideName(true)
        mob:untargetable(true)
        mob:SetAutoAttackEnabled(false)
        mob:SetMobAbilityEnabled(false)
        mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
        mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
        mob:AnimationSub(1)
        -- Mob receives an unknown amount of regen, assume 1% of total HP per minute the head is detached
        mob:setMod(tpz.mod.REGEN, (mob:getMaxHP() * 0.01) / 20) -- 1% HP per 60s (20 ticks)
        mob:setLocalVar("HEAD_DETACHED", 1)

        -- Detach (spawn) the head
        mob:timer(4000, function(mobArg)
            local head

            SpawnMob(mobArg:getID() + 1):setPos(mobArg:getXPos(), mobArg:getYPos(), mobArg:getZPos())

            head = GetMobByID(mobArg:getID() + 1)

            if head then
                head:updateEnmity(mobArg:getTarget())
            end
        end)
    end
end

function onMobDespawn(mob)
    -- mob:setMobFlags(5, mob:getID())
end

function onMobDeath(mob, player, isKiller)
end
