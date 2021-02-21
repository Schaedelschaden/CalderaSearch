-----------------------------------
-- Area: Balga's Dais
--  Mob: Opo-opo Monarch
-- BCNM: Royal Succession
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onMobSpawn (mob)
	mob:addMod(tpz.mod.ACC, 800)
	mob:addMod(tpz.mod.ATT, 700)
	mob:addMod(tpz.mod.REGAIN, 100)
end

function onMobFight (mob, target)
    local partner = (mob:getID() + 1)
    if (GetMobByID(partner):isDead() and mob:getLocalVar("buffed") == 0) then
        mob:setLocalVar("buffed", 1)
        mob:addHP(mob:getMaxHP()/2)
        mob:addMod(tpz.mod.ATT, 500)
        if(math.random(2)==2) then
            mob:addMod(tpz.mod.UDMGPHYS, -50)
            mob:addMod(tpz.mod.UDMGRANGE, -50)
        else
            mob:setMod(tpz.mod.UDMGMAGIC, -50)
        end
    end
end

function onMobDeath(mob, player, isKiller)
end