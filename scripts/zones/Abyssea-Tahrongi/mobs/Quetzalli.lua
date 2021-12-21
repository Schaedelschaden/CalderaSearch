-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Quetzalli
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 50)
	mob:setMobMod(tpz.mobMod.AUTO_SPIKES, 1)
	mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, math.random(40, 60), 0, 0)
    mob:getStatusEffect(tpz.effect.BLAZE_SPIKES):setFlag(tpz.effectFlag.DEATH)
end

function onMobFight(mob, target)
	local hpp = mob:getHPP()
	local benediction = mob:getLocalVar("BENEDICTION")
	
	if (hpp <= 80 and benediction == 0) then
		mob:useMobAbility(689)
		mob:setLocalVar("BENEDICTION", 1)
	elseif (hpp <= 60 and benediction == 1) then
		mob:useMobAbility(689)
		mob:setLocalVar("BENEDICTION", 2)
	elseif (hpp <= 40 and benediction == 2) then
		mob:useMobAbility(689)
		mob:setLocalVar("BENEDICTION", 3)
	elseif (hpp <= 20 and benediction == 3) then
		mob:useMobAbility(689)
		mob:setLocalVar("BENEDICTION", 4)
	end
end

function onMobDeath(mob, player, isKiller)
	
end