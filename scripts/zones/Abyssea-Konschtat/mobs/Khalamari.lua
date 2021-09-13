-----------------------------------
-- Area: Abyssea - Konschtat
--  Mob: Khalamari
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:setMod(tpz.mod.MOVE, 100)
	mob:setMod(tpz.mod.LULLABYRES, 100)
	mob:setMod(tpz.mod.SLEEPRES, 100)
	mob:setMod(tpz.mod.BINDRES, 100)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
end

function onMobFight(mob)
	if (mob:getHPP() <= 80) then
		mob:setMod(tpz.mod.REGAIN, 50)
	elseif (mob:getHPP() <= 60) then
		mob:setMod(tpz.mod.REGAIN, 100)
	elseif (mob:getHPP() <= 40) then
		mob:setMod(tpz.mod.REGAIN, 150)
	elseif (mob:getHPP() <= 20) then
		mob:setMod(tpz.mod.REGAIN, 200)
	end
end

function onAdditionalEffect(mob, target, damage)
	if (os.time() - mob:getLocalVar("Khalamari_EnwaterTimer") < 60) then
		local params = {}
			params.power = 100
		return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENWATER, {chance = 100})
	elseif (os.time() - mob:getLocalVar("Khalamari_EnblindTimer") < 60) then
		local params = {}
			params.power = 50
		return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.BLIND, {chance = 100})
	end
end

function onMobDeath(mob, player, isKiller)
	
end