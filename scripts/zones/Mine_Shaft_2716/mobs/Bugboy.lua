-----------------------------------
--  Mob: Bugboy
-----------------------------------
function onMobSpawn(mob)
    mob:setDropID(3734)

    mob:addMod(tpz.mod.DOUBLE_ATTACK, 25)
	mob:addMod(tpz.mod.TRIPLE_ATTACK, 10)
    mob:addMod(tpz.mod.STUNRES, 35)
    mob:addMod(tpz.mod.BINDRES, 35)
    mob:addMod(tpz.mod.SLOWRES, 35)
    mob:addMod(tpz.mod.ATT, 900)
    mob:addMod(tpz.mod.MACC, 100)
    mob:addMod(tpz.mod.REGEN, 200)
    mob:addMod(tpz.mod.REGAIN, 15)
end

function onMobFight(mob, target)

end


function onMobDespawn(mob)

end

function onMobDeath(mob, player, isKiller)
    local playerName   = player:getName()
	local mobName      = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local KillCounter  = player:getCharVar("KillCounter_"..fixedMobName)

	KillCounter = KillCounter + 1

	player:setCharVar("KillCounter_"..fixedMobName, KillCounter + 1)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
    player:addGil(math.random(150000, 500000))
end
