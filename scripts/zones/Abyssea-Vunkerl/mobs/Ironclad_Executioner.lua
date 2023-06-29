-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Ironclad Executioner
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
    mob:addMod(tpz.mod.WATERES, -150)
    mob:addMod(tpz.mod.THUNDERRES, -150)
    mob:addMod(tpz.mod.FIRERES, 150)
    mob:addMod(tpz.mod.ICERES, 150)
    mob:addMod(tpz.mod.WINDRES, 150)
    mob:addMod(tpz.mod.EARTHRES, 150)
    mob:addMod(tpz.mod.LIGHTRES, 150)
    mob:addMod(tpz.mod.DARKRES, 150)

    mob:setMobMod(tpz.mobMod.ALWAYS_AGGRO, 1)
    mob:hideName(true)
    mob:untargetable(true)
    mob:setUnkillable(true)
    mob:SetAutoAttackEnabled(false)
    mob:SetMobAbilityEnabled(false)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
    mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
    mob:AnimationSub(1)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 2622 then -- Arm Cannon
            local target = mobArg:getTarget()

            mobArg:resetEnmity(target)
        end
    end)
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
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
end
