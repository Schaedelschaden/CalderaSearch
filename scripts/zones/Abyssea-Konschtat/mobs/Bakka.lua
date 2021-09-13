-----------------------------------
-- Area: Abyssea - Konschtat
--   NM: Bakka
-----------------------------------
mixins = {require("scripts/mixins/families/imp")}
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.SILENCERES, 100)
	mob:addMod(tpz.mod.EVA, 150)
	mob:addMod(tpz.mod.ICE_ABSORB, 100)
end

function onMobFight(mob, target)
	if (mob:getHPP() <= 50) then
		mob:setMod(tpz.mod.FASTCAST, 50)
	end
end

function onMobDeath(mob, player, isKiller)
	
end