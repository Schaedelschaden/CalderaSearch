-----------------------------------
-- Area: Abyssea - La Theine
--   NM: Piasa
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:addMod(tpz.mod.LIGHTRES, 500)
	mob:addMod(tpz.mod.DARKRES, 500)
	mob:addMod(tpz.mod.BINDRES, 100)
	mob:addMod(tpz.mod.GRAVITYRES, 100)
	mob:addMod(tpz.mod.SLEEPRES, 100)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 25)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "HELLDIVE_USED", function(mob, skillID)
		local counter = mob:getLocalVar("HELLDIVE_COUNTER")
		
		if (skillID == 622) then
			counter = counter + 1
			mob:setLocalVar("HELLDIVE_COUNTER", counter)
			mob:setLocalVar("HELLDIVE_RESET", os.time())
			
			if (counter < 3) then
				mob:useMobAbility(622)
			end
		end
    end)
end

function onMobFight(mob)
	if (os.time() - mob:getLocalVar("HELLDIVE_RESET") >= 10) then
		mob:setLocalVar("HELLDIVE_COUNTER", 0)
	end
end

function onAdditionalEffect(mob, target, damage)
	local params = {}
		params.power = 100
		params.chance = 100
	
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENAERO, params)
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("HELLDIVE_USED")
end