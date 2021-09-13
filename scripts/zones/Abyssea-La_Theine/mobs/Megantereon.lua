-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Megantereon
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:addMod(tpz.mod.TRIPLE_ATTACK, 40)
end

function onMobFight(mob)
	local hp = mob:getHPP()

	if (hp <= 80) then
		mob:setMod(tpz.mod.TRIPLE_ATTACK, 50)
	elseif (hp <= 60) then
		mob:setMod(tpz.mod.TRIPLE_ATTACK, 60)
	elseif (hp <= 40) then
		mob:setMod(tpz.mod.TRIPLE_ATTACK, 70)
	elseif (hp <= 20) then
		mob:setMod(tpz.mod.TRIPLE_ATTACK, 80)
	elseif (hp <= 10) then
		mob:setMod(tpz.mod.TRIPLE_ATTACK, 100)
	end
end

function onAdditionalEffect(mob, target, damage)
	local pickEffect = math.random(1, 100)

	if (pickEffect <= 10) then
		mob:resetEnmity(target)
		return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.DOOM, {chance = 100})
	elseif (pickEffect >= 11 and pickEffect <= 25) then
		return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.STUN, {chance = 100})
	end
	
	return
end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)

	tpz.abyssea.kiOnMobDeath(mob, player)
end