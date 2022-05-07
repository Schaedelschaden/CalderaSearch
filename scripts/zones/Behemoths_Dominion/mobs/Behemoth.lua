-----------------------------------
-- Area: Behemoth's Dominion
--  HNM: Behemoth
-----------------------------------
local ID = require("scripts/zones/Behemoths_Dominion/IDs")
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
    -- if LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0 then
        -- GetNPCByID(ID.npc.BEHEMOTH_QM):setStatus(tpz.status.DISAPPEAR)
    -- end
    if LandKingSystem_HQ == 0 then
        SetDropRate(270, 3342, 0) -- do not drop savory_shank
    end

    mob:setLocalVar("[rage]timer", 1200) -- 20 minutes
	
	mob:addMod(tpz.mod.PARALYZERES, 50)
    mob:addMod(tpz.mod.STUNRES, 40)
    mob:addMod(tpz.mod.BINDRES, 50)
    mob:addMod(tpz.mod.SLOWRES, 50)
    mob:addMod(tpz.mod.SILENCERES, 80)
    mob:addMod(tpz.mod.SLEEPRES, 100)
    mob:addMod(tpz.mod.LULLABYRES, 100) 
    mob:addMod(tpz.mod.PETRIFYRES, 80)
    mob:addMod(tpz.mod.POISONRES, 30)
	mob:addMod(tpz.mod.ATT, 700)
	mob:addMod(tpz.mod.MATT, 300)
	mob:addMod(tpz.mod.DEF, 600)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 30)
	mob:addMod(tpz.mod.REGEN, 60)	
end

function onSpellPrecast(mob, spell)
    if (spell:getID() == 218) then -- Meteor
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setFlag(tpz.magic.spellFlag.HIT_ALL)
        spell:setRadius(30)
        spell:setAnimation(280) -- AoE Meteor Animation
        spell:setMPCost(1)
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.BEHEMOTHS_BANE)
	
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
    local ToD = GetServerVariable("[POP]King_Behemoth")
    local kills = GetServerVariable("[PH]King_Behemoth")
    local popNow = (math.random(1, 5) == 3 or kills > 6)

    if LandKingSystem_HQ ~= 1 and ToD <= os.time() and popNow then
        -- 0 = timed spawn, 1 = force pop only, 2 = BOTH
        if LandKingSystem_NQ == 0 then
            DisallowRespawn(ID.mob.BEHEMOTH, true)
        end

        DisallowRespawn(ID.mob.KING_BEHEMOTH, false)
        UpdateNMSpawnPoint(ID.mob.KING_BEHEMOTH)
        GetMobByID(ID.mob.KING_BEHEMOTH):setRespawnTime(28800 + math.random(0, 8) * 1800) -- 8-12 hours with half hour windows
    else
        if LandKingSystem_NQ ~= 1 then
            UpdateNMSpawnPoint(ID.mob.BEHEMOTH)
            GetMobByID(ID.mob.BEHEMOTH):setRespawnTime(28800 + math.random(0, 8) * 1800) -- 8-12 hours with half hour windows
            SetServerVariable("[PH]King_Behemoth", kills + 1)
        end
    end
end