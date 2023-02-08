-----------------------------------
-- Area: Arrapago Reef
--   NM: Medusa
-- !pos -458 -20 458
-----------------------------------
local ID = require("scripts/zones/Arrapago_Reef/IDs")
require("scripts/globals/titles")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = 738, hpp = 60}, -- uses EES once at 60% HPP.
        },
    })
    mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 35)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.SLOWRES, 35)
    -- mob:setMod(tpz.mod.ATT, 1200)
    mob:setMod(tpz.mod.MATT, 200)
    -- mob:setMod(tpz.mod.ACC, 900)
    mob:setMod(tpz.mod.RACC, 1500)
    -- mob:setMod(tpz.mod.MACC, 500)
    -- mob:setMod(tpz.mod.EVA, 900)
    -- mob:setMod(tpz.mod.DEF, 800)
    -- mob:setMod(tpz.mod.MEVA, 300)
    -- mob:setMod(tpz.mod.MDEF, 300)
    mob:setMod(tpz.mod.DOUBLE_ATTACK, 30)
    mob:setMod(tpz.mod.TRIPLE_SHOT_RATE, 25)
end

function onMobEngaged(mob, target)
    target:showText(mob, ID.text.MEDUSA_ENGAGE)

    if mob:getLocalVar("BUDDIES_SPAWNED") == 0 then
        for i = ID.mob.MEDUSA + 1, ID.mob.MEDUSA + 4 do
            SpawnMob(i):updateEnmity(target)
        end

        mob:setLocalVar("BUDDIES_SPAWNED", 1)
    end
end

function onMobFight(mob, target)
end

function onMobDisengage(mob)
end

function onMobDeath(mob, player, isKiller)
    for i = ID.mob.MEDUSA + 1, ID.mob.MEDUSA + 4 do
        DespawnMob(i)
    end

    player:showText(mob, ID.text.MEDUSA_DEATH)
    player:addTitle(tpz.title.GORGONSTONE_SUNDERER)
end

function onMobDespawn(mob)
end
