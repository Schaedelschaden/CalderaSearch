-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Ophanim
-----------------------------------

function onMobSpawn(mob)
	mob:speed(100)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:setMod(tpz.mod.REFRESH, 20)
end

function onMobEngaged(mob, target)
    mob:setLocalVar("TERROR_GAZE", 0)
end

function onMobFight(mob, target)
	local allianceList = target:getAlliance()
	local playerName = {}
	local targ

	if mob:getBattleTime() % 90 == 0 then
		mob:setLocalVar("TERROR_GAZE", 1)
		mob:setLocalVar("TERROR_GAZE_TIMER", os.time())
	end

	if (os.time() - mob:getLocalVar("TERROR_GAZE_TIMER") >= 30) then
		mob:setLocalVar("TERROR_GAZE", 0)
	end

    for i, v in ipairs(allianceList) do
        if v:isPC() then
            playerName[i] = v:getName()
            targ = GetPlayerByName(playerName[i])

            if mob:getLocalVar("TERROR_GAZE") == 1 and targ:isFacing(mob) and targ:isInfront(mob, 80) then
                targ:addStatusEffectEx(tpz.effect.TERROR, tpz.effect.TERROR, 1, 0, 5)
            end
        elseif v:getObjType() == tpz.objType.TRUST then
            if mob:getLocalVar("TERROR_GAZE") == 1 and v:isFacing(mob) and v:isInfront(mob, 80) then
                v:addStatusEffectEx(tpz.effect.TERROR, tpz.effect.TERROR, 1, 0, 5)
            end
        end
    end
end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)

	tpz.abyssea.kiOnMobDeath(mob, player)
end