-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Briareus
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
	mob:setMod(tpz.mod.BINDRES, 100)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:setMod(tpz.mod.SLEEPRES, 100)
	mob:setMod(tpz.mod.MOVE, 100)
	mob:addMod(tpz.mod.DEF, 350)
	mob:addMod(tpz.mod.MDEF, 85)
	mob:setLocalVar("MercStrikeCounter", 0)
end

function onMobFight(mob, target)
	-- Power Attack, Grand Slam, Lightning Roar, Impact Roar, Catapult, Mercurial Strike, Trebuchet, Colossal Slam
	local mobSkills = {667, 665, 662, 664, 658, 2576, 1636, 2578}
	local tp = mob:getTP()
	local luckySevens = mob:getLocalVar("LuckySevens")
	
	if (tp >= 1500 and luckySevens == 0) then
		mob:setTP(0)
		local pickSkill = math.random(#mobSkills)
		
		mob:useMobAbility(mobSkills[pickSkill])
		
		if (pickSkill == 6) then
			addEffectMercStrike(mob, target)
		end
	elseif (tp >= 1500 and luckySevens == 1) then
		mob:setTP(0)
		mob:setLocalVar("LuckySevens", 0)
		mob:useMobAbility(mobSkills[6])
	end
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

function addEffectMercStrike(mob, target)
	local counterMercStrike = mob:getLocalVar("MercStrikeCounter")
	
	if (counterMercStrike == 0) then
		mob:useMobAbility(664)  -- Impact Roar
	elseif (counterMercStrike == 1) then
		mob:useMobAbility(665)  -- Grand Slam
	elseif (counterMercStrike == 2) then
		mob:useMobAbility(665)  -- Grand Slam
	elseif (counterMercStrike == 3) then
		mob:useMobAbility(667)  -- Power Attack
	elseif (counterMercStrike == 4) then
		mob:useMobAbility(1636) -- Trebuchet
	elseif (counterMercStrike == 5) then
		mob:useMobAbility(1636) -- Trebuchet
	elseif (counterMercStrike == 6) then
		target:resetRecasts()   -- Reset JA's
		mob:setLocalVar("LuckySevens", 1)
	elseif (counterMercStrike == 7) then
		mob:useMobAbility(2578) -- Colossal Slam
	elseif (counterMercStrike == 8) then
		mob:useMobAbility(2578) -- Colossal Slam
	elseif (counterMercStrike == 9) then
		mob:useMobAbility(730)  -- Meikyo Shisui
		mob:useMobAbility(2578) -- Colossal Slam
		mob:useMobAbility(2578) -- Colossal Slam
		mob:useMobAbility(2578) -- Colossal Slam
	end
end