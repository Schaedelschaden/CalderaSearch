-----------------------------------
-- Area: Al'Taieu
--   NM: Jailer of Justice
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------

function onMobSpawn(mob)
	mob:setMobLevel(120)
	mob:addMod(tpz.mod.ATT, math.random(125, 275))
	mob:addMod(tpz.mod.DEF, math.random(475, 650))
	mob:addMod(tpz.mod.MDEF, math.random(75, 125))
	mob:addMod(tpz.mod.EVA, math.random(350, 475))
end

function onMobFight(mob, target)
    local popTime = mob:getLocalVar("lastPetPop")
    -- ffxiclopedia says 30 sec, bgwiki says 1-2 min..
    -- Going with 60 seconds until I see proof of retails timing.
    if (os.time() - popTime > 60) then
        local alreadyPopped = false
        for Xzomit = mob:getID()+1, mob:getID()+6 do
            if (alreadyPopped == true) then
                break
            else
                if (not GetMobByID(Xzomit):isSpawned()) then
                    SpawnMob(Xzomit, 300):updateEnmity(target)
                    mob:setLocalVar("lastPetPop", os.time())
                    alreadyPopped = true
                end
            end
        end
    end
end

function onMobDeath(mob, player, isKiller)
	local KillCounter = player:getCharVar("KillCounter_JailOfJust")
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_JailOfJust", KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end