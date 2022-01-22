-----------------------------------
-- Area: Dragons Aery
--  HNM: Nidhogg
-----------------------------------
local ID = require("scripts/zones/Dragons_Aery/IDs")
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
    -- if LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0 then
        -- GetNPCByID(ID.npc.FAFNIR_QM):setStatus(tpz.status.DISAPPEAR)
    -- end

    mob:setLocalVar("[rage]timer", 1800) -- 30 minutes
	
	mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 100) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison	
	mob:addMod(tpz.mod.ATT, 300)	
	mob:addMod(tpz.mod.DEF, 600)
	mob:addMod(tpz.mod.EVA, 80)
	mob:addMod(tpz.mod.MEVA, 80)
	mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.REGEN, 800)
	mob:addMod(tpz.mod.REFRESH, 200)
	mob:addMod(tpz.mod.REGAIN, 100)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 30)
end

function onMobFight(mob, target)
    local battletime = mob:getBattleTime()
    local twohourTime = mob:getLocalVar("twohourTime")

    if twohourTime == 0 then
        mob:setLocalVar("twohourTime", math.random(30, 90))
    end

    if battletime >= twohourTime then
        mob:useMobAbility(1053) -- Legitimately captured super_buff ID
        mob:setLocalVar("twohourTime", battletime + math.random(60, 120))
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.NIDHOGG_SLAYER)
	
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
    -- -- Set Nidhogg's Window Open Time
    -- if LandKingSystem_HQ ~= 1 then
        -- local wait = 22.1 * 3600
        -- SetServerVariable("[POP]Nidhogg", os.time() + wait) -- 3 days
        -- if LandKingSystem_HQ == 0 then -- Is time spawn only
            -- DisallowRespawn(mob:getID(), true)
        -- end
    -- end

    -- -- Set Fafnir's spawnpoint and respawn time (8-12 hours)
    -- if LandKingSystem_NQ ~= 1 then
        -- SetServerVariable("[PH]Nidhogg", 0)
        -- DisallowRespawn(ID.mob.FAFNIR, false)
        -- UpdateNMSpawnPoint(ID.mob.FAFNIR)
        -- GetMobByID(ID.mob.FAFNIR):setRespawnTime(28800 + math.random(0, 8) * 1800) -- 8-12 hours with half hour windows
    -- end
end