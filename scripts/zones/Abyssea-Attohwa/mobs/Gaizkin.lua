-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Gaizkin
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    local tierAby = 2
    local tierMob = 1

    -- Load default T2 stat increases
    tpz.abyssea.updateBaseStats(mob, tierAby, tierMob)

	mob:setMod(tpz.mod.PARALYZERES, 100)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:setMod(tpz.mod.BINDRES, 100)
	
	mob:addListener("TAKE_DAMAGE", "DAMAGED_ADD_TP", function(mob, damage, attacker, attackType, damageType)
		local isBusy = false
		local act = mob:getCurrentAction()
	
		if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH then
			isBusy = true 
		end
		
		if isBusy == true then
			mob:setTP(3000)
		end
	end)
end

function onMobFight(mob, target)
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("DAMAGED_ADD_TP")

    tpz.abyssea.kiOnMobDeath(mob, player)
end
