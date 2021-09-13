-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Cuelebre
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.MOVE, 100)
	mob:setMod(tpz.mod.REGAIN, 0)
	mob:setMod(tpz.mod.REFRESH, 20)
	mob:setMod(tpz.mod.MAIN_DMG_RATING, -35)
	mob:AnimationSub(1)
	mob:SetMobSkillAttack(731) -- Mob Skill List
	mob:addStatusEffectEx(tpz.effect.TOO_HIGH, 0, 1, 0, 0)
	mob:setLocalVar("MIGHTY_STRIKES", 0)
	
	-- Mighty Strikes exposes Cuelebre to melee damage
	mob:addListener("EFFECT_GAIN", "MIGHTY_STRIKES_GAIN", function(mob, effect)
		if (effect:getType() == tpz.effect.MIGHTY_STRIKES) then
			mob:delStatusEffectSilent(tpz.effect.TOO_HIGH)
		end
    end)
	
	mob:addListener("EFFECT_LOSE", "MIGHTY_STRIKES_LOSE", function(mob, effect)
		if (effect:getType() == tpz.effect.MIGHTY_STRIKES) then
			mob:addStatusEffectEx(tpz.effect.TOO_HIGH, 0, 1, 0, 0)
		end
    end)
end

function onMobFight(mob, target)
	mob:setMod(tpz.mod.REGAIN, 50)
	
	local hpp = mob:getHPP()
	local mightyStrikes = mob:getLocalVar("MIGHTY_STRIKES")
	
	if (hpp <= 80 and mightyStrikes == 0) then
		mob:setTP(0)
		mob:useMobAbility(688)
		mob:useMobAbility(1303)
		mob:setLocalVar("MIGHTY_STRIKES", 1)
	elseif (hpp <= 60 and mightyStrikes == 1) then
		mob:setTP(0)
		mob:useMobAbility(688)
		mob:useMobAbility(1303)
		mob:setLocalVar("MIGHTY_STRIKES", 2)
	elseif (hpp <= 40 and mightyStrikes == 2) then
		mob:setTP(0)
		mob:useMobAbility(688)
		mob:useMobAbility(1303)
		mob:useMobAbility(1303)
		mob:setLocalVar("MIGHTY_STRIKES", 3)
	elseif (hpp <= 30 and mightyStrikes == 3) then
		mob:setTP(0)
		mob:useMobAbility(688)
		mob:useMobAbility(1303)
		mob:useMobAbility(1303)
		mob:setLocalVar("MIGHTY_STRIKES", 4)
	elseif (hpp <= 20 and mightyStrikes == 4) then
		mob:setTP(0)
		mob:useMobAbility(688)
		mob:useMobAbility(1303)
		mob:useMobAbility(1303)
		mob:useMobAbility(1303)
		mob:setLocalVar("MIGHTY_STRIKES", 5)
	elseif (hpp <= 10 and mightyStrikes == 5) then
		mob:setTP(0)
		mob:useMobAbility(688)
		mob:useMobAbility(1303)
		mob:useMobAbility(1303)
		mob:useMobAbility(1303)
		mob:setLocalVar("MIGHTY_STRIKES", 6)
	end
end

function onMobDisengage(mob)
	mob:setMod(tpz.mod.REGAIN, 0)
end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)

	mob:removeListener("MIGHTY_STRIKES_GAIN")
	mob:removeListener("MIGHTY_STRIKES_LOSE")
end