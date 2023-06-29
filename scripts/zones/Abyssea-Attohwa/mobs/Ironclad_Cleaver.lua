-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Ironclad Cleaver
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
    mob:setMod(tpz.mod.FIRERES, 350)
    mob:setMod(tpz.mod.ICERES, 350)
    mob:setMod(tpz.mod.WINDRES, 350)
    mob:setMod(tpz.mod.EARTHRES, 350)
    mob:setMod(tpz.mod.LIGHTRES, 350)
    mob:setMod(tpz.mod.DARKRES, 350)
    mob:setMod(tpz.mod.BINDRES, 90)
    mob:setMod(tpz.mod.GRAVITYRES, 90)
    mob:setMod(tpz.mod.PARALYZERES, 90)
    mob:setMod(tpz.mod.SLOWRES, 90)
    mob:addMod(tpz.mod.MDEF, 30)

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
end

function onMobDeath(mob, player, isKiller)
end
