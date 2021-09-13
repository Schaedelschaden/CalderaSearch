-----------------------------------
-- Area: Abyssea - La Theine
--   NM: Toppling Tuber
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:AnimationSub(0)
	mob:setMobMod(tpz.mobMod.VAR, 0)
	mob:setMod(tpz.mod.MOVE, 100)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 80)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "QUEASYSHROOM_USED", function(mob, skillID)
		if (skillID == 310) then
			-- Use Numbshroom
			mob:useMobAbility(311)
		end
    end)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "NUMBSHROOM_USED", function(mob, skillID)
		if (skillID == 311) then
			-- Use Agaricus
			mob:useMobAbility(2607)
		end
    end)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "AGARICUS_USED", function(mob, skillID)
		if (skillID == 2607) then
			mob:setLocalVar("AGARICUS_USED", os.time())
		end
    end)
end

function onMobFight(mob)
	local mushroomTimer = mob:getLocalVar("AGARICUS_USED")
	
	if (os.time() - mushroomTimer >= 30) then
		mob:AnimationSub(0)
		mob:setMobMod(tpz.mobMod.VAR, 0)
		mob:setLocalVar("AGARICUS_USED", os.time() + 5000)
	elseif (os.time() - mushroomTimer >= 20) then
		mob:AnimationSub(1)
	elseif (os.time() - mushroomTimer >= 10) then
		mob:AnimationSub(2)
	end
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("QUEASYSHROOM_USED")
	mob:removeListener("NUMBSHROOM_USED")
	mob:removeListener("AGARICUS_USED")
end