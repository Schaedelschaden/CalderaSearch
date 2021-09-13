-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Hedetet
-----------------------------------

function onMobSpawn(mob)
	mob:setLocalVar("MIGHTY_STRIKES", 0)

	mob:addListener("EFFECT_GAIN", "MIGHTY_STRIKES_GAIN", function(mob, effect)
		if (effect:getType() == tpz.effect.MIGHTY_STRIKES) then
			mob:setMobMod(tpz.mobMod.SKILL_LIST, 1169)
		end
    end)
	
	mob:addListener("EFFECT_LOSE", "MIGHTY_STRIKES_LOSE", function(mob, effect)
		if (effect:getType() == tpz.effect.MIGHTY_STRIKES) then
			mob:setMobMod(tpz.mobMod.SKILL_LIST, 840)
		end
    end)
end

function onMobFight(mob)
	local hpp = mob:getHPP()
	local mightyStrikes = mob:getLocalVar("MIGHTY_STRIKES")
	
	if (hpp <= 80 and mightyStrikes == 0) then
		mob:useMobAbility(688)
		mob:setLocalVar("MIGHTY_STRIKES", 1)
	elseif (hpp <= 60 and mightyStrikes == 1) then
		mob:useMobAbility(688)
		mob:setLocalVar("MIGHTY_STRIKES", 2)
	elseif (hpp <= 40 and mightyStrikes == 2) then
		mob:useMobAbility(688)
		mob:setLocalVar("MIGHTY_STRIKES", 3)
	elseif (hpp <= 20 and mightyStrikes == 3) then
		mob:useMobAbility(688)
		mob:setLocalVar("MIGHTY_STRIKES", 4)
	end
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("MIGHTY_STRIKES_GAIN")
	mob:removeListener("MIGHTY_STRIKES_LOSE")
	tpz.abyssea.kiOnMobDeath(mob, player)
end