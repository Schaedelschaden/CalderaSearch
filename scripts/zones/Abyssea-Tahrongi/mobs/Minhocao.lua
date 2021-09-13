-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Minhocao
-----------------------------------

function onMobSpawn(mob)
	mob:setBehaviour(bit.band(mob:getBehaviour(), bit.bnot(tpz.behavior.NO_TURN)))
	mob:setMod(tpz.mod.SLOWRES, 100)
	mob:setMod(tpz.mod.BINDRES, 100)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:speed(100)
	mob:setLocalVar("GORGE_BASE_DMG", 1000)
end

function onMobFight(mob)
	local hpp = mob:getHPP()
	
	mob:setLocalVar("GORGE_BASE_DMG", utils.clamp(1000 + ((100 - hpp) * 20.21), 1000, 3000))
end

function onMobDeath(mob, player, isKiller)
	tpz.abyssea.kiOnMobDeath(mob, player)
end