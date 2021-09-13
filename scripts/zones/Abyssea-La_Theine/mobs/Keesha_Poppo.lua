-----------------------------------
-- Area: Abyssea - La Theine
--   NM: Keesha Poppo
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:setMod(tpz.mod.BINDRES, 100)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:setMod(tpz.mod.SLEEPRES, 100)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 65)
end

function onMobFight(mob, target)
	if (mob:getBattleTime() % 180 == 0) then
		mob:addStatusEffectEx(tpz.effect.HUNDRED_FISTS, 0, 1, 0, 60)
	end
end

function onAdditionalEffect(mob, target, damage)
	if (math.random(1, 100) <= 10) then
		mob:stealStatusEffect(target, tpz.effectFlag.DISPELABLE)
	end
end

function onMobDeath(mob, player, isKiller)
	
end