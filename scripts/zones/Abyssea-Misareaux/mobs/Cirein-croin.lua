-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Cirein-croin
-----------------------------------
mixins =
{
    require("scripts/mixins/families/orobon"),
    require("scripts/mixins/abyssea_weakness")
}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.SLEEPRES, 100)
    mob:addMod(tpz.mod.LULLABYRES, 100)
end

function onMobFight(mob, target)
    if mob:getHPP() > 50 then
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 889)
    elseif mob:getHPP() <= 50 then
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 890)
    end
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
    local playerName   = player:getName()
	local mobName      = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local shortName    = mobName:sub(1, 18)
	local KillCounter  = player:getCharVar("KillCounter_"..shortName)

	KillCounter = KillCounter + 1

	player:setCharVar("KillCounter_"..shortName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end
