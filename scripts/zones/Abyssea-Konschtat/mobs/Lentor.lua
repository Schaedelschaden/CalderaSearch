-----------------------------------
-- Area: Abyssea - Konschtat
--   NM: Lentor
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.WATER_ABSORB, 100)
	mob:setMod(tpz.mod.REFRESH, 20)
end

function onMobEngaged(mob)

end

function onMobFight(mob, target)
--	local lastCast = mob:getLocalVar("LAST_CAST")
	
	-- TODO: Casts Water V on itself to restore HP
	-- if (os.time() - lastCast > 45 and mob:getHPP() < 90) then
		-- printf("Lentor.lua onMobFight Attempted to nuke myself")
		-- mob:castSpell(173, mob)
		-- mob:setLocalVar("LAST_CAST", os.time())
    -- end
end

function onMobDisengaged(mob, target)

end

function onMobDeath(mob, player, isKiller)
	
end