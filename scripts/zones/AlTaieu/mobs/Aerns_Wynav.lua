-----------------------------------
-- Area: Al'Taieu
--  Mob: Aern's Wynav (Absolute Virtue's pets)
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mobID = mob:getID()
	wyvern = GetMobByID(mobID)
	-- Absolujte Virtue's pet HP are modified in the database
	if (mobID == 16912877 or mobID == 16912878 or mobID == 16912879) then
		printf("Aerns_Wynav.lua onMobSpawn DERP")
		wyvern:setMobLevel(115)
		wyvern:addMod(tpz.mod.ATT, 500)
		wyvern:addMod(tpz.mod.DEF, 500)
		wyvern:addMod(tpz.mod.ACC, 500)
		wyvern:addMod(tpz.mod.EVA, 400)
		wyvern:addMod(tpz.mod.MEVA, 250)
		wyvern:setHP(99999)
	end
end

function onMobEngaged(mob, target)
    
end

function onMobDisengage(mob)
    
end

function onMobDeath(mob, player, isKiller)
	
end
