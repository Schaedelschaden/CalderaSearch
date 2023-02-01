-----------------------------------
--  MOB: Morozko
-- !pos 378.482 -11.784 -72.563 5
-----------------------------------
local ID = require("scripts/zones/Uleguerand_Range/IDs")
-----------------------------------

function onMobSpawn(mob)
    mob:setDropID(0)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("ONMOBFIGHT_PAUSE_TIME") then
        --mob:setMod(tpz.mod.REGAIN, 200)
        if mob:getTP() >= 1000 and mob:getLocalVar("ENMITY_RESET_TRIGGERED") == 0 then
            mob:resetEnmity(target)
            mob:setLocalVar("ENMITY_RESET_TRIGGERED", 1)
        end

        if mob:getTP() >= 2000 then
            mob:useMobAbility(1644)
        end

        mob:setLocalVar("ONMOBFIGHT_PAUSE_TIME", os.time() + 1)
    end
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOROZKO_TAKE_DAMAGE")
end

function onMobDespawn(mob)
end
