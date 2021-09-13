-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Vetehinen
-----------------------------------

function onMobSpawn(mob)
	mob:speed(100)
	mob:addMod(tpz.mod.REGEN, 100)
	mob:addMod(tpz.mod.REFRESH, 20)
end

function onMobFight(mob)
	local day = VanadielDayOfTheWeek()
	
	if (mob:getLocalVar("FIRESDAY_BUFF") == 0) then
		mob:addMod(tpz.mod.ATT, 500)
		mob:addMod(tpz.mod.MATT, 150)
		mob:addMod(tpz.mod.MACC, 150)
		mob:setLocalVar("FIRESDAY_BUFF", 1)
	elseif (day ~= tpz.day.FIRESDAY and mob:getLocalVar("FIRESDAY_BUFF") == 1) then
		mob:delMod(tpz.mod.ATT, 500)
		mob:delMod(tpz.mod.MATT, 150)
		mob:delMod(tpz.mod.MACC, 150)
		mob:setLocalVar("FIRESDAY_BUFF", 0)
	end
end

function onMobDeath(mob, player, isKiller)
	
end