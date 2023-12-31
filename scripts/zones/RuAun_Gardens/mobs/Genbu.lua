-----------------------------------
-- Area: Ru'Aun Gardens
--   NM: Genbu
-----------------------------------
local ID = require("scripts/zones/RuAun_Gardens/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobs")
require("scripts/globals/keyitems")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
--	mob:addMod(tpz.mod.ACC, 500)
	mob:addMod(tpz.mod.MACC, 500)
	mob:addMod(tpz.mod.MATT, 50)
	mob:addMod(tpz.mod.REFRESH, 25)
end

function onAdditionalEffect(mob, target, damage)
	local damage = 300

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENWATER)
end

function onMobDeath(mob, player, isKiller)
	local KillCounter = player:getCharVar("KillCounter_Genbu")
	local playerName = player:getName()
	local mobName = mob:getName()
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_Genbu", KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)

	player:addKeyItem( tpz.ki.GENBUS_HONOR )
	player:messageSpecial( ID.text.KEYITEM_OBTAINED, tpz.ki.GENBUS_HONOR )
    player:showText(mob, ID.text.SKY_GOD_OFFSET + 6)
end
