-----------------------------------
-- Area: Western Altepa Desert
--   NM: King Vinegarroon
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/titles")
require("scripts/globals/world")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:setLocalVar("[rage]timer", 1200) -- 20 minutes

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
    mob:setMod(tpz.mod.HASTE_MAGIC, 4375)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, 100)
end

function onMobDrawIn(mob, target)
    -- todo make him use AoE tp move
    mob:addTP(3000)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PETRIFY, {chance = 100})
end

function onMobDisengage(mob, weather)
    -- if weather ~= tpz.weather.DUST_STORM and weather ~= tpz.weather.SAND_STORM then
        -- DespawnMob(mob:getID())
    -- end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.VINEGAR_EVAPORATOR)

    local playerName   = player:getName()
	local mobName      = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local shortName    = mobName:sub(1, 18)
	local KillCounter  = player:getCharVar("KillCounter_"..shortName)

	KillCounter = KillCounter + 1

	player:setCharVar("KillCounter_"..shortName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
    -- UpdateNMSpawnPoint(mob:getID())
    -- mob:setRespawnTime(math.random(75600, 86400)) -- 21 to 24 hours
end
