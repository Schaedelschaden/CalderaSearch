-----------------------------------
-- Area: Halvung
--  Mob: Gurfurlur the Menacing
-- !pos -59.000 -23.000 3.000 62
-----------------------------------
local ID = require("scripts/zones/Halvung/IDs")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.SILENCERES, 80)
    mob:setMod(tpz.mod.STUNRES, 100)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.SLOWRES, 70)
    mob:setMod(tpz.mod.ATT, 2000)
    mob:setMod(tpz.mod.MATT, 200)
    mob:addMod(tpz.mod.ACC, 100)
    -- mob:setMod(tpz.mod.MACC, 500)
    -- mob:setMod(tpz.mod.DEF, 1300)
    -- mob:setMod(tpz.mod.MDEF, 1000)
    -- mob:setMod(tpz.mod.EVA, 850)
    -- mob:setMod(tpz.mod.MEVA, 650)
    mob:setMod(tpz.mod.CRITHITRATE, 25)
    mob:setMod(tpz.mod.CRIT_DMG_INCREASE, -10)
    mob:setMod(tpz.mod.COUNTER, 50)
end

function onMobEngaged(mob, target)
    if mob:getLocalVar("BUDDIES_SPAWNED") == 0 then
        for i = ID.mob.GURFURLUR_THE_MENACING + 1, ID.mob.GURFURLUR_THE_MENACING + 4 do
            SpawnMob(i):updateEnmity(target)
        end

        mob:setLocalVar("BUDDIES_SPAWNED", 1)
    end
end

function onMobFight(mob, target)
    local isBusy = false
    local has2Hrd = mob:getLocalVar("has2Hrd")
    local act = mob:getCurrentAction()

    if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH or act == tpz.act.MAGIC_START or act == tpz.act.MAGIC_CASTING or act == tpz.act.MAGIC_START then
        isBusy = true -- Set to true if mob is in any stage of using a mobskill or casting a spell
    end

    if (mob:getHPP() <= 50 and isBusy == false and has2Hrd ~= 1) then
        mob:useMobAbility(690) -- Hundred Fists
        mob:setLocalVar("has2Hrd", 1)
    end
end

function onMobDisengage(mob)
    mob:setLocalVar("has2Hrd", 0)
end

function onMobDeath(mob, player, isKiller)
    for i = ID.mob.GURFURLUR_THE_MENACING + 1, ID.mob.GURFURLUR_THE_MENACING + 4 do
        DespawnMob(i)
    end

    player:addTitle(tpz.title.TROLL_SUBJUGATOR)
end

function onMobDespawn(mob)
end
