-----------------------------------
-- Area: Abyssea - La Theine
--   NM: Brooder
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:setMod(tpz.mod.SLEEPRES, 100)
	mob:setMod(tpz.mod.BINDRES, 100)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 50)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "SPIRIT_ABSORPTION_USED", function(mob, skillID)
		if (skillID == 1246) then
			-- Use Binary Absorption
			mob:useMobAbility(1247)
			mob:setLocalVar("ELEMENT_RESIST", os.time())
			mob:setMod(tpz.mod.FIRERES, 350)
			mob:setMod(tpz.mod.ICERES, 350)
			mob:setMod(tpz.mod.WINDRES, 350)
			mob:setMod(tpz.mod.EARTHRES, 350)
			mob:setMod(tpz.mod.THUNDERRES, 350)
			mob:setMod(tpz.mod.WATERRES, 350)
			mob:setMod(tpz.mod.LIGHTRES, 350)
			mob:setMod(tpz.mod.DARKRES, 350)
		end
    end)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "BINARY_ABSORPTION_USED", function(mob, skillID)
		if (skillID == 1246) then
			-- Use Trinary Absorption
			mob:useMobAbility(1248)
		end
    end)
end

function onMobFight(mob)
	if (os.time() - mob:getLocalVar("ELEMENT_RESIST") > 30) then
		mob:setMod(tpz.mod.FIRERES, 0)
		mob:setMod(tpz.mod.ICERES, 0)
		mob:setMod(tpz.mod.WINDRES, 0)
		mob:setMod(tpz.mod.EARTHRES, 0)
		mob:setMod(tpz.mod.THUNDERRES, 0)
		mob:setMod(tpz.mod.WATERRES, 0)
		mob:setMod(tpz.mod.LIGHTRES, 0)
		mob:setMod(tpz.mod.DARKRES, 0)
	end
end

function onAdditionalEffect(mob, target, damage)
	local params = {}
		params.power = 5
		params.chance = 100
	
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.PLAGUE, params)
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("SPIRIT_ABSORPTION_USED")
	mob:removeListener("BINARY_ABSORPTION_USED")
end