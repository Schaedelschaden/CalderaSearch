-----------------------------------
-- Area: Dynamis - Windurst
--  Mob: Tzee Xicu Idol
-- Note: Mega Boss
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onMobInitialize(mob)
	-- Reset NM respawn time if server restarts
    -- if (GetServerVariable("TZEE_XICU_IDOL_RESPAWN") < os.time()) then
		-- mob:setRespawnTime(GetServerVariable("TZEE_XICU_IDOL_RESPAWN") - os.time())
		-- DespawnMob(mob:getID())
	-- end
end

function onMobSpawn(mob)
	mob:setMod(tpz.mod.PARALYZERES, 100) -- Resistance to Silence
    mob:setMod(tpz.mod.STUNRES, 20) -- Resistance to Stun
    mob:setMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:setMod(tpz.mod.SLOWRES, 100) -- Resistance to Slow
    mob:setMod(tpz.mod.SILENCERES, 100) -- Resistance to Silence
    mob:setMod(tpz.mod.SLEEPRES, 100) -- Resistance to Sleep
    mob:setMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
    mob:setMod(tpz.mod.PETRIFYRES, 100) -- Resistance to Pertrify
    mob:setMod(tpz.mod.POISONRES, 100) -- Resistance to Poison
	mob:addMod(tpz.mod.ATT, 200) -- Attack Stat (Compare to DEF)
	mob:addMod(tpz.mod.MATT, 400) -- Magic Attack (Compare to MDEF)
    mob:addMod(tpz.mod.ACC, 300) -- Accuracy (compare to EVA)
	mob:addMod(tpz.mod.MACC, 100) -- Magic ACC (Compare to MEVA)
	mob:addMod(tpz.mod.EVA, 200) -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.DEF, 700) -- Defense (Compart to ATT)
	-- mob:addMod(tpz.mod.MEVA, 100) -- Magic Evasion (Compare to MACC)
	mob:addMod(tpz.mod.MDEF, 200) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.FASTCAST, 50) -- Fast Cast
	mob:setMod(tpz.mod.DMGPHYS, -50) -- PDT
	mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
	mob:setMobMod(tpz.mobMod.LINK_RADIUS, 6)
	mob:setMobMod(tpz.mobMod.SOUND_RANGE, 6)
	mob:setLocalVar("[rage]timer", 1200) -- 20 minutes
end

function onMobEngaged(mob, target)
    -- local mobId = mob:getID()
    -- for i = mobId + 1, mobId + 2 do
        -- if not GetMobByID(i):isSpawned() then
            -- SpawnMob(i):updateEnmity(target)
        -- end
    -- end
end

function onMobFight(mob, target)
	mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
end

function onMobDeath(mob, player, isKiller)
	-- local respawnTime = math.random(36000, 50400)
	
	-- mob:setRespawnTime(respawnTime)
	-- SetServerVariable("TZEE_XICU_IDOL_RESPAWN", os.time() + respawnTime)

    dynamis.megaBossOnDeath(mob, player, isKiller)

    -- if isKiller then
        -- local mobId = mob:getID()
        -- for i = mobId + 1, mobId + 2 do
            -- if GetMobByID(i):isSpawned() then
                -- DespawnMob(i)
            -- end
        -- end
    -- end
end
