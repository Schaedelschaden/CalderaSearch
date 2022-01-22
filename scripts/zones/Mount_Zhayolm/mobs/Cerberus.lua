-----------------------------------
-- Area: Mount Zhayolm
--   NM: Cerberus
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/status")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

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
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 30)
end

function onMobFight(mob, target)
    if mob:getHPP() > 25 then
        mob:setMod(tpz.mod.REGAIN, 100)
    else
        mob:setMod(tpz.mod.REGAIN, 30)
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.CERBERUS_MUZZLER)
end

function onMobDespawn(mob)
    -- mob:setRespawnTime(math.random(48, 72) * 3600) -- 48 - 72 hours with 1 hour windows
end
