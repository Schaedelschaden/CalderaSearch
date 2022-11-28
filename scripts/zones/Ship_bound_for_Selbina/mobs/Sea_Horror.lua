-----------------------------------
-- Area: Ship bound for Selbina
--   NM: Sea Horror
--  MobID: 17678350
-----------------------------------
require("scripts/globals/status")
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
    mob:addMod(tpz.mod.STR, 100)
    mob:addMod(tpz.mod.DEX, 100)
    mob:addMod(tpz.mod.VIT, 100)
    mob:addMod(tpz.mod.AGI, 100)
    mob:addMod(tpz.mod.MND, 100)
    mob:addMod(tpz.mod.INT, 100)
    mob:addMod(tpz.mod.CHR, 100)
    mob:addMod(tpz.mod.DEF, 500)
    mob:addMod(tpz.mod.EVA, -100)
    mob:setMod(tpz.mod.ACC, 580)
end

function onMobFight(mob, target)
    if
        os.time() > mob:getLocalVar("LEVEL_UP_DELAY") and
        mob:getMod(tpz.mod.DMG) > -25
    then
        mob:addMod(tpz.mod.ATT, 75)
        mob:addMod(tpz.mod.DEF, 75)
        mob:addMod(tpz.mod.ACC, 75)
        mob:addMod(tpz.mod.EVA, 15)
        mob:addMod(tpz.mod.MEVA, 15)
        mob:addMod(tpz.mod.MACC, 15)
        mob:addMod(tpz.mod.MATT, 5)
        mob:addMod(tpz.mod.MDEF, 1)
        mob:addMod(tpz.mod.STR, 10)
        mob:addMod(tpz.mod.DEX, 10)
        mob:addMod(tpz.mod.VIT, 10)
        mob:addMod(tpz.mod.AGI, 10)
        mob:addMod(tpz.mod.MND, 10)
        mob:addMod(tpz.mod.INT, 10)
        mob:addMod(tpz.mod.CHR, 10)
        mob:addMod(tpz.mod.HASTE_GEAR, 100)
        mob:addMod(tpz.mod.DOUBLE_ATTACK, 2)
        mob:addMod(tpz.mod.DMG, -1)
        mob:addMod(tpz.mod.REGEN, 30)
        mob:addMod(tpz.mod.ALL_WSDMG_ALL_HITS, 1)
        mob:setLocalVar("LEVEL_UP_DELAY", os.time() + 30)
    end
end

function onMobDeath(mob, player, isKiller)
end
