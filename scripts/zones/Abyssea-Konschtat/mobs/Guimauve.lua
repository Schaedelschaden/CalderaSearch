-----------------------------------
-- Area: Abyssea - Konschtat
--   NM: Guimauve
-----------------------------------

function onMobSpawn(mob)
	mob:setSpellList(0)
	mob:setMod(tpz.mod.GRAVITYRES, 85)
	mob:setMod(tpz.mod.MATT, 80)
	mob:setMod(tpz.mod.FASTCAST, 60)
	mob:setMod(tpz.mod.REFRESH, 20)
end

function onMobEngaged(mob)
	-- BLM Spells
	mob:AnimationSub(2)
end

function onMobFight(mob, target)
	local changeTime = mob:getLocalVar("GUIMAUVE_CHANGETIME")
	
	if (os.time() - changeTime > 45 and mob:AnimationSub() == 2) then
		mob:AnimationSub(1) -- WHM Spells
		mob:setLocalVar("GUIMAUVE_CHANGETIME", os.time())
	elseif (os.time() - changeTime > 45 and mob:AnimationSub() == 1) then
		mob:AnimationSub(2) -- BLM Spells
		mob:setLocalVar("GUIMAUVE_CHANGETIME", os.time())
	end
	
	-- Fire V, Blizzard V, Aero V, Stone V, Thunder V, Water V, Sleepga II, Graviga
	local spellsBLM = {148, 153, 158, 163, 168, 173, 274, 366}
	-- Cure IV, Banish IV, Banishga III, Protect V, Shell V, Haste, Paralyga, Slowga
	local spellsWHM = {6, 31, 40, 47, 52, 57, 356, 357}
	
	local lastCast = mob:getLocalVar("LAST_CAST")
	
	local randomSpell = math.random(1,8)
	
	if (os.time() - lastCast > 15) then
		if (mob:AnimationSub() == 2) then
			mob:castSpell(spellsBLM[randomSpell])
		elseif (mob:AnimationSub() == 1) then
			if (randomSpell == 1 or randomSpell == 4 or randomSpell == 5 or randomSpell == 6) then
				mob:castSpell(spellsWHM[randomSpell], mob)
			elseif (randomSpell == 2 or randomSpell == 3 or randomSpell == 7 or randomSpell == 8) then
				mob:castSpell(spellsWHM[randomSpell], target)
			end
		end
		mob:setLocalVar("LAST_CAST", os.time())
    end
end

function onMobDisengaged(mob, target)
	mob:AnimationSub(0)
end

function onMobDeath(mob, player, isKiller)
	
end