-----------------------------------
-- Area: East Ronfaure [S]
--  Mob: Sandworm
-- Note:  Title Given if Sandworm does not Doomvoid
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobFight(mob, target)
    mob:addListener("SKILLCHAIN_TAKE", "SKILLCHAIN_TAKEN", function(defender, attacker, element, chainLevel, chainCount) -- , resistance, damage)
        if element == 14 or element == 16 then
            mob:setLocalVar("skillchain", mob:getLocalVar("skillchain") + 1)
        end
    end)

    if mob:getLocalVar("skillchain") >= 50 then
        mob:useMobAbility(2192)
        mob:setLocalVar("skillchain", 0)
    end
end

function onMobDisengage(mob)
    mob:setLocalVar("skillchain", 0)
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("SKILLCHAIN_TAKEN")
    mob:removeListener("DOOMVOID_DAMAGE")    
    player:addTitle(tpz.title.SANDWORM_WRANGLER)
end
