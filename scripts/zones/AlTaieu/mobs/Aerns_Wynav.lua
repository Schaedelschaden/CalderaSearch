-----------------------------------
-- Area: Al'Taieu
--  Mob: Aern's Wynav (Absolute Virtue's pets)
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/status")
-----------------------------------

local Firesday = {147, 176} -- Fire IV, Firaga III
local Earthsday = {162, 191} -- Stone IV, Stonega III
local Watersday = {172, 201} -- Water IV, Waterga III
local Windsday = {157, 186} -- Aero IV, Aeroga III
local Iceday = {152, 181} -- Blizzard IV, Blizzaga III
local Lightningday = {167, 196} -- Thunder IV, Thundaga III
local Lightsday = {31, 41} -- Banish IV, Banishga IV
local Darksday = {255, 219} -- Break, Comet

function onMobSpawn(mob)
	mob:setMod(tpz.mod.REFRESH, 50)

    local mobID = mob:getID()
	local wyvern = GetMobByID(mobID)
	-- Absolute Virtue's pet HP are modified in the database
	if (mobID == 16912877 or mobID == 16912878 or mobID == 16912879) then
		wyvern:setMobLevel(115)
		wyvern:addMod(tpz.mod.INT, 75)
		wyvern:addMod(tpz.mod.ATT, 400)
--		wyvern:addMod(tpz.mod.MATT, math.random(50, 100))
		wyvern:addMod(tpz.mod.DEF, 250)
--		wyvern:addMod(tpz.mod.ACC, 250)
		wyvern:addMod(tpz.mod.MACC, 650)
		wyvern:addMod(tpz.mod.EVA, 200)
--		wyvern:addMod(tpz.mod.MEVA, 150)
		wyvern:setMod(tpz.mod.REFRESH, 30)
		wyvern:setHP(99999)
	end
end

function onMobEngaged(mob, target)
    
end

function onMobFight(mob, target)
	mob:setMod(tpz.mod.REFRESH, 30)
	local day = VanadielDayOfTheWeek()
	local mobID = mob:getID()
	
	-- Covers Absolute Virtue's pets only
	if (mobID == 16912877 or mobID == 16912878 or mobID == 16912879) then
		if (mob:getBattleTime() % 45 == 0) then
			if (day == tpz.day.FIRESDAY) then
				mob:castSpell(Firesday[math.random(1, 2)])
			elseif (day == tpz.day.EARTHSDAY) then
				mob:castSpell(Earthsday[math.random(1, 2)])
			elseif (day == tpz.day.WATERSDAY) then
				mob:castSpell(Watersday[math.random(1, 2)])
			elseif (day == tpz.day.WINDSDAY) then
				mob:castSpell(Windsday[math.random(1, 2)])
			elseif (day == tpz.day.ICEDAY) then
				mob:castSpell(Iceday[math.random(1, 2)])
			elseif (day == tpz.day.LIGHTNINGDAY) then
				mob:castSpell(Lightningday[math.random(1, 2)])
			elseif (day == tpz.day.LIGHTSDAY) then
				mob:castSpell(Lightsday[math.random(1, 2)])
			elseif (day == tpz.day.DARKSDAY) then
				mob:castSpell(Darksday[math.random(1, 2)])
			end
		end
	end
end

function onMobDisengage(mob)
    
end

function onMobDeath(mob, player, isKiller)
	
end
