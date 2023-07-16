-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Gieremund
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

	mob:setLocalVar("MOBSKILL_INCREASED_POTENCY", 1)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 30)
	mob:setMod(tpz.mod.CRITHITRATE, 25)
	mob:addMod(tpz.mod.MAIN_DMG_RATING, 50)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "HOWLING_BUFFS", function(mob, skillID)
		if (skillID == 465 and mob:getLocalVar("GieremundHowlingActive") == 0) then
			mob:setLocalVar("GieremundHowlingTimer", os.time())
			mob:setLocalVar("GieremundHowlingActive", 1)
			mob:addMod(tpz.mod.ACC, 200)
			mob:addMod(tpz.mod.CRITHITRATE, 25)
		end
    end)
end

function onMobFight(mob, target)
	if (mob:getLocalVar("GieremundHowlingActive") == 1 and os.time() - mob:getLocalVar("GieremundHowlingTimer") >= 30) then
		mob:setLocalVar("GieremundHowlingActive", 0)
		mob:delMod(tpz.mod.ACC, 200)
		mob:delMod(tpz.mod.CRITHITRATE, 25)
	end
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("HOWLING_BUFFS")

    tpz.abyssea.kiOnMobDeath(mob, player)
end
