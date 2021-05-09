-----------------------------------
-- Area: Ru'Aun Gardens
--   NM: Seiryu
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
	mob:addMod(tpz.mod.ACC, 500)
	mob:addMod(tpz.mod.MACC, 500)
	mob:addMod(tpz.mod.MATT, 100)
	mob:addMod(tpz.mod.REFRESH, 25)
end

function onMonsterMagicPrepare(mob, target)
    if not mob:hasStatusEffect(tpz.effect.HUNDRED_FISTS, 0) then
        local rnd = math.random()
        if rnd < 0.5 then
            return 186 -- aeroga 3
        elseif rnd < 0.7 then
            return 157 -- aero 4
        elseif rnd < 0.9 then
            return 208 -- tornado
        else
            return 237 -- choke
        end
    end
    return 0 -- Still need a return, so use 0 when not casting
end

function onAdditionalEffect(mob, target, damage)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENAERO)
end

function onMobDeath(mob, player, isKiller)
	local KillCounter = player:getCharVar("KillCounter_Seiryu")
	local playerName = player:getName()
	local mobName = mob:getName()
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_Seiryu", KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)

	player:addKeyItem(tpz.ki.SEIRYUS_NOBILITY)
	player:messageSpecial( ID.text.KEYITEM_OBTAINED, tpz.ki.SEIRYUS_NOBILITY )
    player:showText(mob, ID.text.SKY_GOD_OFFSET + 10)
end