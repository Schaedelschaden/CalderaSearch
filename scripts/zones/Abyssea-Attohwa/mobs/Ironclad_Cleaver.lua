-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Ironclad Cleaver
-----------------------------------

function onMobSpawn(mob)
	mob:SetAutoAttackEnabled(true)
	mob:SetMobSkillAttack(1181) -- Ironclad "normal" attacks
	mob:setMod(tpz.mod.FIRERES, 350)
	mob:setMod(tpz.mod.ICERES, 350)
	mob:setMod(tpz.mod.WINDRES, 350)
	mob:setMod(tpz.mod.EARTHRES, 350)
	mob:setMod(tpz.mod.LIGHTRES, 350)
	mob:setMod(tpz.mod.DARKRES, 350)
	mob:setMod(tpz.mod.BINDRES, 90)
	mob:setMod(tpz.mod.GRAVITYRES, 90)
	mob:setMod(tpz.mod.PARALYZERES, 90)
	mob:setMod(tpz.mod.SLOWRES, 90)
	mob:addMod(tpz.mod.MDEF, 30)
end

function onMobFight(mob, target)
	
end

function onMobDeath(mob, player, isKiller)
	
end