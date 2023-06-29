-----------------------------------
-- Area: Escha Ru'Aun
-- Mob: Eschan Euvhi
-----------------------------------
local ID = require("scripts/zones/Escha_RuAun/IDs")
-----------------------------------

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
    mob:addMod(tpz.mod.ATT, 250)
    mob:addMod(tpz.mod.EVA, 175)
    mob:addMod(tpz.mod.DEF, 275)
    mob:addMod(tpz.mod.MEVA, 200)
    mob:addMod(tpz.mod.MDEF, 50)
    mob:addMod(tpz.mod.STR, 110)
    mob:addMod(tpz.mod.DEX, 110)
    mob:addMod(tpz.mod.AGI, 110)
    mob:addMod(tpz.mod.VIT, 110)
    mob:addMod(tpz.mod.MND, 110)
    mob:addMod(tpz.mod.CHR, 110)
    mob:addMod(tpz.mod.INT, 110)
end

function onMobDeath(mob, player, isKiller, noKiller)
    -- 5% chance for any Eschan Euvhi to spawn Warder of Faith
    if GetMobByID(ID.mob.WARDER_OF_FAITH):isDead() and math.random(0, 100) < 5 then
        local pos = mob:getPos()

        SpawnMob(ID.mob.WARDER_OF_FAITH):updateEnmity(player)
        GetMobByID(ID.mob.WARDER_OF_FAITH):setPos(pos.x, pos.y, pos.z, pos.rot)
    end
end
