-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Rose Garden
-----------------------------------
local ID = require("scripts/zones/Yuhtunga_Jungle/IDs")


function onMobSpawn(mob) -- When mob spawns (either forced or time)
	mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 30) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
	mob:addMod(tpz.mod.ATT, 500) -- Attack Stat (Compare to DEF)
	mob:addMod(tpz.mod.MATT, 100) -- Magic Attack (Compare to MDEF)
	mob:addMod(tpz.mod.EVA, 150) -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.DEF, 700) -- Defense (Compart to ATT)
	mob:addMod(tpz.mod.MEVA, 200) -- Magic Evasion (Compare to MACC)
	mob:addMod(tpz.mod.MDEF, 100) -- Magic Defense (Compare to MATT)
	mob:addMod(tpz.mod.STR, 130)
    mob:addMod(tpz.mod.DEX, 130)
    mob:addMod(tpz.mod.AGI, 130)
    mob:addMod(tpz.mod.VIT, 130)
    mob:addMod(tpz.mod.MND, 130)
    mob:addMod(tpz.mod.CHR, 130)
    mob:addMod(tpz.mod.INT, 130)
end

function onMobDisengage(mob)
    -- mob:setLocalVar("timeToGrow", os.time() + math.random(36000, 37800)) -- 10:00:00 to 10:30:00
end

function onMobRoam(mob)
    -- Rose Garden has been left alone for 10.25 hours
    -- if os.time() >= mob:getLocalVar("timeToGrow") then
        -- DisallowRespawn(ID.mob.ROSE_GARDEN, true)
        -- DespawnMob(ID.mob.ROSE_GARDEN)
        -- DisallowRespawn(ID.mob.VOLUPTUOUS_VILMA, false)
        -- pos = mob:getPos()
        -- SpawnMob(ID.mob.VOLUPTUOUS_VILMA):setPos(pos.x, pos.y, pos.z, pos.rot)
    -- end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    -- if os.time() < mob:getLocalVar("timeToGrow") then
        -- DisallowRespawn(ID.mob.ROSE_GARDEN, true)
        -- DisallowRespawn(ID.mob.ROSE_GARDEN_PH, false)
        -- GetMobByID(ID.mob.ROSE_GARDEN_PH):setRespawnTime(GetMobRespawnTime(ID.mob.ROSE_GARDEN_PH))
    -- end
end
