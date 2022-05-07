-----------------------------------
-- Area: Behemoth's Dominion
--  HNM: King Behemoth
-- MobID: 17297441
-----------------------------------
local ID = require("scripts/zones/Behemoths_Dominion/IDs")
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/magic")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 60)
end

function onMobSpawn(mob)
    -- if LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0 then
        -- GetNPCByID(ID.npc.BEHEMOTH_QM):setStatus(tpz.status.DISAPPEAR)
    -- end

	mob:setLocalVar("[rage]timer", 1200) -- 20 minutes
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
	mob:addMod(tpz.mod.DEF, 400)
	mob:addMod(tpz.mod.EVA, 80)
	-- mob:addMod(tpz.mod.MACC, 300)
	mob:addMod(tpz.mod.REGEN, 300)
	mob:addMod(tpz.mod.REFRESH, 50)
	mob:addMod(tpz.mod.REGAIN, 25)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 10)	
	
end

function onMobFight(mob)
	
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.STUN, {chance = 20, duration = math.random(5, 10)})
end

function onSpellPrecast(mob, spell)
    if spell:getID() == 218 then
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setFlag(tpz.magic.spellFlag.HIT_ALL)
        spell:setRadius(30)
        spell:setAnimation(280)
        spell:setMPCost(1)
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.BEHEMOTH_DETHRONER)
	
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
    -- -- Set King_Behemoth's Window Open Time
    -- if LandKingSystem_HQ ~= 1 then
        -- local wait = 22.7 * 3600
        -- SetServerVariable("[POP]King_Behemoth", os.time() + wait) -- 3 days
        -- if LandKingSystem_HQ == 0 then -- Is time spawn only
            -- DisallowRespawn(mob:getID(), true)
        -- end
    -- end

    -- -- Set Behemoth's spawnpoint and respawn time (21-24 hours)
    -- if LandKingSystem_NQ ~= 1 then
        -- SetServerVariable("[PH]King_Behemoth", 0)
        -- DisallowRespawn(ID.mob.BEHEMOTH, false)
        -- UpdateNMSpawnPoint(ID.mob.BEHEMOTH)
        -- GetMobByID(ID.mob.BEHEMOTH):setRespawnTime(28800 + math.random(0, 8) * 1800) -- 8-12 hours with half hour windows
    -- end
end