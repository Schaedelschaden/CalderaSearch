-----------------------------------
-- Area: Al'Taieu
--   NM: Jailer of Justice
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------

function onMobSpawn(mob)
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
end

function onMobFight(mob, target)
    local popTime = mob:getLocalVar("lastPetPop")

    if (os.time() - popTime > 60) then
        local alreadyPopped = false
        for Xzomit = mob:getID()+1, mob:getID()+6 do -- Check this
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