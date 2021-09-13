-----------------------------------
-- Area: Abyssea - Konschtat
--  Mob: Sarcophilus
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:setMod(tpz.mod.TRIPLE_ATTACK, 10)
end

function onMobFight(mob)
	local hp = mob:getHPP()

	if (hp <= 80) then
		mob:setMod(tpz.mod.TRIPLE_ATTACK, 20)
	elseif (hp <= 60) then
		mob:setMod(tpz.mod.TRIPLE_ATTACK, 30)
	elseif (hp <= 40) then
		mob:setMod(tpz.mod.TRIPLE_ATTACK, 40)
	elseif (hp <= 20) then
		mob:setMod(tpz.mod.TRIPLE_ATTACK, 50)
	end
end

function onAdditionalEffect(mob, target, damage)
	local params = {}
		params.chance = 100
		params.power = 50
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.POISON)
end

function onMobDeath(mob, player, isKiller)
	
end