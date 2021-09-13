-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Muscaliet
-----------------------------------

function onMobSpawn(mob)
	mob:addListener("WEAPONSKILL_STATE_EXIT", "HEAT_BREATH_USED", function(mob, skillID)
		local hpp = mob:getHPP()
		local counter = mob:getLocalVar("HEAT_BREATH_COUNTER")
		local maxUses = 2
		
		if (hpp >= 56 and hpp <= 80) then
			maxUses = 3
		elseif (hpp >= 31 and hpp <= 55) then
			maxUses = 4
		elseif (hpp >= 1 and hpp <= 30) then
			maxUses = 5
		end
		
		if (skillID == 800) then
			counter = counter + 1
			mob:setLocalVar("HEAT_BREATH_COUNTER", counter)
			mob:setLocalVar("HEAT_BREATH_RESET", os.time())
			
			if (counter < maxUses) then
				mob:useMobAbility(800)
			end
		end
    end)
end

function onMobFight(mob)
	if (os.time() - mob:getLocalVar("HEAT_BREATH_RESET") >= 10) then
		mob:setLocalVar("HEAT_BREATH_COUNTER", 0)
	end
end

function onMobDeath(mob, player, isKiller)
	mob:setMobFlags(135, mob:getID())
	mob:removeListener("HEAT_BREATH_USED")
	tpz.abyssea.kiOnMobDeath(mob, player)
end