-----------------------------------
-- Area: Talacca Cove
--  Mob: Angler Orobon
-----------------------------------
local ID = require("scripts/zones/Talacca_Cove/IDs")
require("scripts/globals/status")

function onMobSpawn(mob)
    mob:addMod(tpz.mod.PARALYZERES, 30)
    mob:addMod(tpz.mod.STUNRES, 30)
    mob:addMod(tpz.mod.BINDRES, 30)
    mob:addMod(tpz.mod.SLOWRES, 30)
    mob:addMod(tpz.mod.SILENCERES, 30)
    mob:addMod(tpz.mod.SLEEPRES, 30)
    mob:addMod(tpz.mod.LULLABYRES, 30)
    mob:addMod(tpz.mod.PETRIFYRES, 30)
    mob:addMod(tpz.mod.POISONRES, 30)
    mob:addMod(tpz.mod.STR, 100)
    mob:addMod(tpz.mod.DEX, 100)
    mob:addMod(tpz.mod.VIT, 200)
    mob:addMod(tpz.mod.AGI, 100)
    mob:addMod(tpz.mod.MND, 100)
    mob:addMod(tpz.mod.INT, 100)
    mob:addMod(tpz.mod.CHR, 100)
    mob:addMod(tpz.mod.DEF, 1000)
    mob:addMod(tpz.mod.EVA, 150)
end

function onMobFight(mob, target)
    local battletime = mob:getBattleTime()
    local lampgrow   = mob:getLocalVar("lampgrow")
    local broken     = mob:AnimationSub()

    if lampgrow < battletime and broken == 1 then
        mob:AnimationSub(broken - 1)
        mob:setLocalVar("lampgrow", battletime + 120)
    end
end

function onMobDeath(mob, player, isKiller)
end
