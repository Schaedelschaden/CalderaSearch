-----------------------------------
-- Area: Mamook
--  Mob: Gulool Ja Ja
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
local ID = require("scripts/zones/Mamook/IDs")

-----------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 35)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.SLOWRES, 35)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 17)
    mob:setMod(tpz.mod.ATT, 1200)
    mob:setMod(tpz.mod.MATT, 170)
    -- mob:setMod(tpz.mod.ACC, 500)
    mob:setMod(tpz.mod.MACC, 500)
    -- mob:setMod(tpz.mod.EVA, 1000)
    -- mob:setMod(tpz.mod.DEF, 800)
    -- mob:setMod(tpz.mod.MEVA, 200)
    -- mob:setMod(tpz.mod.MDEF, 100)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 40)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 2)
end

function onMobEngaged(mob, target)
    if mob:getLocalVar("BUDDIES_SPAWNED") == 0 then
        for i = ID.mob.GULOOL_JA_JA + 1, ID.mob.GULOOL_JA_JA + 4 do
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

    if (mob:getHPP() <= 35 and isBusy == false and has2Hrd ~= 1) then
        mob:useMobAbility(731) -- Mijin Gakure
        mob:setLocalVar("has2Hrd", 1)
    end
end

function onMobDisengage(mob)
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.SHINING_SCALE_RIFLER)
end

function onMobDespawn(mob)
end
