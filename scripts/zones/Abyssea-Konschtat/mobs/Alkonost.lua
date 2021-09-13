-----------------------------------
-- Area: Abyssea - Konschtat
--  Mob: Alkonost
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:setMod(tpz.mod.TRIPLE_ATTACK, 10)
	mob:setMod(tpz.mod.BINDRES, 100)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:setMod(tpz.mod.SLEEPRES, 100)
end

function onMobFight(mob)
	local mobSkills = {576, 578, 579, 580, 1330, 2828}
	local hp = mob:getHPP()
	local tp = mob:getTP()
	
	if (tp >= 1000) then
		mob:setTP(0)
		
		local tpMoves = math.random(1, 4)
		
		for i = 1, tpMoves do
			mob:useMobAbility(mobSkills[math.random(1, #mobSkills)])
		end
	end
	
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
		params.power = math.random(40, 90)
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENAERO)
end

function onMobDeath(mob, player, isKiller)
	tpz.abyssea.kiOnMobDeath(mob, player)
end