-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Carabosse
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
	mob:setSpellList(0)
	mob:setMod(tpz.mod.REGEN, 100)
	mob:setMod(tpz.mod.REFRESH, 50)
	mob:setLocalVar("2hrHPP", math.random(10, 30))
end

function onMobFight(mob)
	local hpp = mob:getHPP()
	local tp = mob:getTP()
	local has2Hrd = mob:getLocalVar("has2Hrd")
	
	-- Spring Breeze, Summer Breeze, Autumn Breeze, Winter Breeze
	local season = {2195, 2196, 2197, 2198}
	
	if (has2Hrd == 1) then -- Second Phase
		mob:setMod(tpz.mod.DMG, -50)
		
		local currentSeason = mob:getLocalVar("CurrentSeason")
		local lastCast = mob:getLocalVar("LastCast")
		local castDelay = mob:getLocalVar("CastDelay")
		local pickSeason = math.random(#season)
		
		if (os.time() - mob:getLocalVar("SeasonChangeTime") >= 60 or (hpp <= mob:getLocalVar("SeasonChangeHPP") and mob:getLocalVar("SeasonChangeHPP") > 10)) then
			if (pickSeason == 1) then    -- RDM
				mob:setLocalVar("CurrentSeason", 1)
				mob:setLocalVar("CastDelay", 19)
				mob:setMod(tpz.mod.MAGIC_ABSORB, 0)
				mob:setMod(tpz.mod.REGAIN, 0)
				mob:setMod(tpz.mod.FASTCAST, 0)
				mob:setMod(tpz.mod.MATT, 25)
				mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
			elseif(pickSeason == 2) then -- WAR
				mob:setLocalVar("CurrentSeason", 2)
				mob:setMod(tpz.mod.MAGIC_ABSORB, 0)
				mob:setMod(tpz.mod.REGAIN, 75)
				mob:setMod(tpz.mod.FASTCAST, 0)
				mob:setMod(tpz.mod.MATT, 25)
				mob:setMod(tpz.mod.DOUBLE_ATTACK, 40)
			elseif(pickSeason == 3) then -- WHM
				mob:setLocalVar("CurrentSeason", 3)
				mob:setLocalVar("CastDelay", 14)
				mob:setMod(tpz.mod.MAGIC_ABSORB, 100)
				mob:setMod(tpz.mod.REGAIN, 0)
				mob:setMod(tpz.mod.FASTCAST, 0)
				mob:setMod(tpz.mod.MATT, 25)
				mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
			elseif(pickSeason == 4) then -- BLM
				mob:setLocalVar("CurrentSeason", 4)
				mob:setLocalVar("CastDelay", 14)
				mob:setMod(tpz.mod.MAGIC_ABSORB, 0)
				mob:setMod(tpz.mod.REGAIN, 0)
				mob:setMod(tpz.mod.FASTCAST, 75)
				mob:setMod(tpz.mod.MATT, 125)
				mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
			end
			
			mob:setLocalVar("SeasonChangeTime", os.time())
			mob:setLocalVar("SeasonChangeHPP", hpp - 10)
			local currentTP = mob:getTP()
			mob:useMobAbility(season[pickSeason])
			mob:setTP(currentTP)
		end
		
		-- Use mob skills
		if (tp >= 1500 and (currentSeason <= 2)) then
			local abilities = {}
			
			if (currentSeason == 1) then
				-- Zephyr Arrow, Lethe Arrows
				abilities = {2193, 2194}
			elseif (currentSeason == 2) then
				-- Cyclonic Turmoil, Cyclonic Torrent
				abilities = {2199, 2200}
			end
			
			local pickAbility = math.random(#abilities)
			
			mob:setTP(0)
			mob:useMobAbility(abilities[pickAbility])
		end
		
		-- Use spells				
		if (os.time() - lastCast >= castDelay and currentSeason ~= 2) then
			local spells = {}
			local pickSpell
			
			if (currentSeason == 1) then
				-- Protect V, Shell V, Blink, Stoneskin, Haste II, Breakga
				spells = {47, 52, 53, 54, 511, 365}
				pickSpell = math.random(#spells)
				
				if (pickSpell <= 5) then
					mob:castSpell(spells[pickSpell], mob)
				else
					mob:castSpell(spells[pickSpell], target)
				end
			elseif (currentSeason == 3) then
				-- Cure V, Cure VI
				spells = {5, 6}
				pickSpell = math.random(#spells)
				mob:castSpell(spells[pickSpell], mob)
			elseif (currentSeason == 4) then
				-- Aero IV, Aero V, Aeroga III, Tornado, Tornado II
				spells = {157, 158, 186, 208, 209}
				pickSpell = math.random(#spells)
				mob:castSpell(spells[pickSpell], target)
			end
			
			mob:setLocalVar("LastCast", os.time())
		end
	else -- First Phase
		if (hpp <= mob:getLocalVar("2hrHPP") and has2Hrd == 0) then
			-- Benediction
			mob:useMobAbility(1010)
			mob:setLocalVar("has2Hrd", 1)
		end
	
		if (tp >= 1500) then
			mob:setTP(0)
			-- Lethe Arrows
			mob:useMobAbility(2194)
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