-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Mumor
-----------------------------------
require("scripts/globals/allyassist")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/ability")
local ID = require("scripts/zones/QuBia_Arena/IDs")
-----------------------------------

function onMobSpawn(mob)
    local gore = GetMobByID(17621560)

    mob:timer(60000, function(mobArg)
        mobArg:updateEnmity(gore)
        gore:updateEnmity(mobArg)
        tpz.ally.startAssist(mobArg, tpz.ally.ASSIST_PLAYER)
    end)

end


function onMobFight(mob, target)
    mob:setMobMod(tpz.mobMod.NO_STANDBACK, 1)
    mob:setMod(tpz.mod.FASTCAST, 100)
    mob:setMod(tpz.mod.REGAIN, 100)
    mob:setMod(tpz.mod.CURE_POTENCY, 50)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 50)
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 20)
    mob:setMod(tpz.mod.QUAD_ATTACK, 5)
    mob:setMod(tpz.mod.ACC, 1800)
    mob:setMod(tpz.mod.MACC, 1100)
    mob:setMod(tpz.mod.MATT, 800)

    local gore = GetMobByID(17621560)
    local ally = gore:getTarget()
    local heals = mob:getLocalVar("heals")



    if mob:getHPP() <= 75 and heals == 0 then
        mob:useMobAbility(3638) --miracle waltz
        mob:setLocalVar("heals", 1)
        mob:timer(15000, function(mobArg)
            mobArg:setLocalVar("heals", 0)
        end)
    end

end

function onMobDeath(mob, player, isKiller)

end

function onMobDespawn(mob)

end


