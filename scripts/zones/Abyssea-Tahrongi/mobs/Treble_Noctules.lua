-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Treble Noctules
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(tpz.mod.ACC, 50)
	mob:setMod(tpz.mod.CRITHITRATE, 35)
end

function onMobFight(mob)
	local hpp = mob:getHPP()
	
	mob:setMod(tpz.mod.MAIN_DMG_RATING, 50 - (hpp / 2))
end

function onMobDeath(mob, player, isKiller)
	tpz.abyssea.kiOnMobDeath(mob, player)
end