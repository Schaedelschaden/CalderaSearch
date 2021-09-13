-----------------------------------
-- Area: Abyssea - Konschtat
--  Mob: Hadal Satiator
-----------------------------------

local absorbs = {tpz.mod.FIRE_ABSORB, tpz.mod.ICE_ABSORB, tpz.mod.WIND_ABSORB, tpz.mod.EARTH_ABSORB, tpz.mod.LTNG_ABSORB, tpz.mod.WATER_ABSORB}

function onMobSpawn(mob)
	mob:setMod(tpz.mod.REFRESH, 20)
	mob:setLocalVar("maxBabies", 3)
	mob:setLocalVar("UsedFission", 0)
	mob:setLocalVar("CurrentElement", math.random(1, 6))
	mob:setMod(absorbs[mob:getLocalVar("CurrentElement")], 100)
	
	-- Fire, Aero, Thunder
	if (mob:getLocalVar("CurrentElement") == 1 or mob:getLocalVar("CurrentElement") == 4 or mob:getLocalVar("CurrentElement") == 6) then
		mob:AnimationSub(1) -- Light?
	-- Stone, Water, Blizzard
	elseif (mob:getLocalVar("CurrentElement") == 2 or mob:getLocalVar("CurrentElement") == 3 or mob:getLocalVar("CurrentElement") == 5) then
		mob:AnimationSub(2) -- Dark?
	end
end

function onMobRoam(mob)
	local momPos = mob:getPos()

	for babyID = mob:getID() + 1, mob:getID() + mob:getLocalVar("maxBabies") do
		local baby = GetMobByID(babyID)

		if (babyID == mob:getID() + 1) then
			baby:pathThrough({momPos.x + 3, momPos.y, momPos.z + 3})
		elseif (babyID == mob:getID() + 2) then
			baby:pathThrough({momPos.x - 3, momPos.y, momPos.z - 3})
		elseif (babyID == mob:getID() + 3) then
			baby:pathThrough({momPos.x - 3, momPos.y, momPos.z + 3})
		end
    end
end

function onMobEngaged(mob, target)
	for babyID = mob:getID() + 1, mob:getID() + mob:getLocalVar("maxBabies") do
		local baby = GetMobByID(babyID)

		baby:updateEnmity(target)
    end
end

function onMobFight(mob)
	local hpp = mob:getHPP()
	local lastCast = mob:getLocalVar("LAST_CAST")
	
	if (os.time() - lastCast > 35) then
		local nextElement = math.random(1, 6)
		local spells = {
						{options = {148, 177, 233}}, -- Fire V, Firaga IV, Bio IV
						{options = {153, 182, 356}}, -- Blizzard V, Blizzaga IV, Paralyga
						{options = {158, 187, 359}}, -- Aero V, Aeroga IV, Silencega
						{options = {163, 192, 357}}, -- Stone V, Stonega IV, Slowga
						{options = {168, 197, 252}},  -- Thunder V, Thundaga IV, Stun
						{options = {173, 202, 227}}, -- Water V, Waterga IV, Poisonga III
					   }
					   
		local selectSpell = spells[nextElement].options	
	
		mob:castSpell(selectSpell[math.random(1, 3)])
		mob:setLocalVar("LAST_CAST", os.time())
    end
	
	-- Use Fission at 50% HP immediately followed by Quadratic Continuum
	if (hpp <= 50 and mob:getLocalVar("UsedFission") ~= 1) then
		mob:useMobAbility(755)
		mob:useMobAbility(741)
		
		mob:setLocalVar("UsedFission", 1)
	end
end

function onSpellPrecast(mob, spell)
	mob:setLocalVar("LastElement", mob:getLocalVar("CurrentElement"))
	local element = spell:getElement()
	
	-- Bio IV is categorized with Fire instead of Dark
	if (element == 8) then
		element = 1
	end
	
	mob:setLocalVar("CurrentElement", element)
	
	-- Fire, Aero, Thunder
	if (element == 1 or element == 4 or element == 6) then
		mob:AnimationSub(1) -- Light?
	-- Stone, Water, Blizzard
	elseif (element == 2 or element == 3 or element == 5) then
		mob:AnimationSub(2) -- Dark?
	end
	
	mob:setMod(absorbs[mob:getLocalVar("LastElement")], 0)
	mob:setMod(absorbs[mob:getLocalVar("CurrentElement")], 100)
end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)

	for babyID = mob:getID() + 1, mob:getID() + mob:getLocalVar("maxBabies") do
		local baby = GetMobByID(babyID)

		DespawnMob(baby)
    end
end