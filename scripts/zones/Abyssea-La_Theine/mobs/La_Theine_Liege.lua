-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: La Theine Liege
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
	mob:addMod(tpz.mod.DEF, 400)
	mob:addMod(tpz.mod.REFRESH, 20)
	mob:setMod(tpz.mod.TRIPLE_ATTACK, 65)
end

function onMobFight(mob)
	
end

function onSpellPrecast(mob, spell)
	local venom = math.random(1, 5)
	
	for i = 1, venom do
		mob:useMobAbility(660)
	end
end

function onMobDeath(mob, player, isKiller)
	tpz.abyssea.kiOnMobDeath(mob, player)
end