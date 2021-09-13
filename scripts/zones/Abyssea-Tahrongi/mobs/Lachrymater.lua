-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Lachrymater
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobSpawn(mob)
	tpz.mix.jobSpecial.config(mob, {specials = {{id = tpz.jsa.CHAINSPELL, hpp = math.random(50, 80), cooldown = 180}}})

	mob:setMobMod(tpz.mobMod.MOBMOD_MAGIC_COOL, 45)
	mob:setMod(tpz.mod.MOVE, 100)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:setMod(tpz.mod.BINDRES, 100)
	mob:setMod(tpz.mod.REFRESH, 20)

	local day = VanadielDayOfTheWeek()
	local element = {1, 4, 6, 3, 2, 5, 7, 8}

	mob:setLocalVar("EMPTY_ELEMENT", element[day + 1])

	if (day == 0) then -- Fire
		mob:AnimationSub(2)
		mob:setMod(tpz.mod.FIRE_ABSORB, 100)
		mob:setSpellList(188)
	elseif (day == 1) then -- Earth
		mob:AnimationSub(1)
		mob:setMod(tpz.mod.EARTH_ABSORB, 100)
		mob:setSpellList(190)
	elseif (day == 2) then -- Water
		mob:AnimationSub(1)
		mob:setMod(tpz.mod.WATER_ABSORB, 100)
		mob:setSpellList(192)
	elseif (day == 3) then -- Wind
		mob:AnimationSub(2)
		mob:setMod(tpz.mod.WIND_ABSORB, 100)
		mob:setSpellList(193)
	elseif (day == 4) then -- Ice
		mob:AnimationSub(1)
		mob:setMod(tpz.mod.ICE_ABSORB, 100)
		mob:setSpellList(189)
	elseif (day == 5) then -- Lightning
		mob:AnimationSub(2)
		mob:setMod(tpz.mod.LTNG_ABSORB, 100)
		mob:setSpellList(191)
	elseif (day == 6) then -- Light
		mob:AnimationSub(2)
		mob:setMod(tpz.mod.LIGHT_ABSORB, 100)
		mob:setSpellList(195)
	elseif (day == 7) then -- Dark
		mob:AnimationSub(1)
		mob:setMod(tpz.mod.DARK_ABSORB, 100)
		mob:setSpellList(194)
	end
end

function onMobFight(mob)
	
end

function onMobDeath(mob, player, isKiller)
	
end