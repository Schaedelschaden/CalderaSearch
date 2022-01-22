-----------------------------------
-- Area: King Ranperre's Tomb
--   NM: Vrtra
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/status")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

local offsets = {1, 3, 5, 2, 4, 6}

function onMobSpawn(mob)
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
	mob:addMod(tpz.mod.ATT, 700)	
	mob:addMod(tpz.mod.DEF, 1000)
	mob:addMod(tpz.mod.EVA, 80)
	mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.REGEN, 2000)
	mob:addMod(tpz.mod.REFRESH, 200)
	mob:addMod(tpz.mod.REGAIN, 100)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 30)
end

function onMobEngaged(mob, target)
    mob:resetLocalVars()
end

function onMobFight(mob, target)
    local spawnTime = mob:getLocalVar("spawnTime")
    local twohourTime = mob:getLocalVar("twohourTime")
    local fifteenBlock = mob:getBattleTime() / 15

    if twohourTime == 0 then
        twohourTime = math.random(4, 6)
        mob:setLocalVar("twohourTime", twohourTime)
    end

    if spawnTime == 0 then
        spawnTime = math.random(3, 5)
        mob:setLocalVar("spawnTime", spawnTime)
    end

    if fifteenBlock > twohourTime then
        mob:useMobAbility(710)
        mob:setLocalVar("twohourTime", fifteenBlock + math.random(4, 6))
    elseif fifteenBlock > spawnTime then
        local mobId = mob:getID()

        for i, offset in ipairs(offsets) do
            local pet = GetMobByID(mobId + offset)

            if not pet:isSpawned() then
                pet:spawn(60)
                local pos = mob:getPos()
                pet:setPos(pos.x, pos.y, pos.z)
                pet:updateEnmity(target)
                break
            end
        end
        mob:setLocalVar("spawnTime", fifteenBlock + 4)
    end
end

function onMobDisengage(mob, weather)
    for i, offset in ipairs(offsets) do
        DespawnMob(mob:getID()+offset)
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.VRTRA_VANQUISHER)
	
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
    -- Set Vrtra's spawnpoint and respawn time (20-24 hours)
    -- -- UpdateNMSpawnPoint(mob:getID())
    -- -- mob:setRespawnTime(math.random(72000, 86400))
end
