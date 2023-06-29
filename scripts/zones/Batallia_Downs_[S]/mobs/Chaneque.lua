-----------------------------------
-- Area: Batallia Downs [S]
--   NM: Chaneque
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.HP_DRAIN)
end

function onMobSpawn(mob)
    mob:addStatusEffect(tpz.effect.HASTE, 2, 0, 0)
    mob:addMod(tpz.mod.REGAIN, 200)
    mob:addMod(tpz.mod.COUNTER, 10)
    mob:setMod(tpz.mod.UDMGMAGIC, -100)
    mob:setMod(tpz.mod.UDMGPHYS, -80)
    mob:setMod(tpz.mod.STR, 10)
    mob:setMod(tpz.mod.ATT, 10)
    mob:setMod(tpz.mod.ATTP, -90)
end

function onMobFight(mob, target)
    target:addStatusEffect(tpz.effect.HUNDRED_FISTS, 1, 0, 4 )
end

function onMobDeath(mob, player, isKiller)
    local playerName  = player:getName()
	local mobName     = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)

	KillCounter = KillCounter + 1

	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
    player:PrintToPlayer(string.format("Go speak to the Bestiary bookshelf in the library for a seasonal prize!"), tpz.msg.channel.NS_LINKSHELL3)

    player:setCharVar("Seasonal_Reward", 1)
end

function onMobDespawn(mob)
    
end
